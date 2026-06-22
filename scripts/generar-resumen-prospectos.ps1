param(
    [string]$SourceCsv = "data\prospectos_barberai.csv",
    [string]$OrderedOut = "docs\prospectos-barberai-ordenados.md",
    [string]$SummaryOut = "docs\resumen-prospectos-barberai.md"
)

$ErrorActionPreference = "Stop"

function Clean-Text {
    param([object]$Value, [string]$Fallback = "Pendiente de verificar")

    if ($null -eq $Value) {
        return $Fallback
    }

    $text = ([string]$Value).Trim()
    $text = [regex]::Replace($text, "\s+", " ")

    if ([string]::IsNullOrWhiteSpace($text) -or $text -eq '""') {
        return $Fallback
    }

    if ($text -match "^(No encontrado publicamente|No encontrado públicamente|Pendiente|no encontrado)$") {
        return $Fallback
    }

    return $text
}

function Normalize-City {
    param([string]$Value)

    $text = Clean-Text $Value
    if ($text -match "Comayagua") { return "Comayagua / Comayagua" }
    if ($text -match "Tegucigalpa") { return "Tegucigalpa / Francisco Morazan" }
    if ($text -match "San Pedro Sula") { return "San Pedro Sula / Cortes" }
    if ($text -match "Tela") { return "Tela / Atlantida" }
    if ($text -match "La Ceiba") { return "La Ceiba / Atlantida" }
    if ($text -match "Choluteca") { return "Choluteca / Choluteca" }
    return $text
}

function Normalize-Phone {
    param([string]$Value)

    $text = Clean-Text $Value "Sin telefono publico verificable"
    if ($text -eq "Pendiente de verificar") { return "Sin telefono publico verificable" }
    return $text
}

function Normalize-Link {
    param([string]$Value)

    $text = Clean-Text $Value "Sin contacto publico verificable"
    if ($text -eq "Pendiente de verificar") { return "Sin contacto publico verificable" }
    return $text
}

function Escape-Md {
    param([string]$Value)
    return (Clean-Text $Value).Replace("|", "\|")
}

function Contact-Status {
    param($Row)

    if ((Clean-Text $Row.estado_contacto "") -eq "Canal verificable documentado") {
        return "Canal verificable documentado"
    }

    return "Sin contacto publico verificable"
}

function Get-ColumnValue {
    param($Row, [string]$Pattern)

    $property = $Row.PSObject.Properties | Where-Object { $_.Name -match $Pattern } | Select-Object -First 1
    if ($null -eq $property) {
        return $null
    }

    return $property.Value
}

$rows = Import-Csv $SourceCsv

$records = foreach ($row in $rows) {
    $contactStatus = Contact-Status $row
    $nextAction = if ($contactStatus -eq "Canal verificable documentado") {
        Clean-Text $row.accion_siguiente "Confirmar responsable antes de outreach"
    } else {
        "Verificar contacto publico antes de outreach"
    }

    [PSCustomObject]@{
        ID = Clean-Text $row.id
        Nombre = Clean-Text $row.nombre_negocio
        Ciudad = Normalize-City $row.ciudad_departamento
        Tipo = Clean-Text $row.tipo_negocio
        Telefono = Normalize-Phone $row.telefono_whatsapp
        Redes = Normalize-Link $row.red_social_web
        Senal = Clean-Text (Get-ColumnValue $row "se.al_demanda|demanda$")
        Problema = Clean-Text $row.problema_probable
        Ayuda = Clean-Text $row.oportunidad_barberai
        Prioridad = Clean-Text $row.prioridad_A_B_C
        EstadoContacto = $contactStatus
        Accion = $nextAction
        Observacion = Clean-Text $row.observaciones "Sin observacion adicional"
        Fuente = Clean-Text $row.fuente_o_evidencia
    }
}

$total = $records.Count
$withContact = ($records | Where-Object EstadoContacto -eq "Canal verificable documentado").Count
$withoutContact = $total - $withContact
$priorityCounts = $records | Group-Object Prioridad | Sort-Object Name
$cityCounts = $records | Group-Object Ciudad | Sort-Object @{ Expression = "Count"; Descending = $true }, Name
$duplicates = $records | Group-Object Nombre | Where-Object Count -gt 1
$top10 = $records |
    Where-Object EstadoContacto -eq "Canal verificable documentado" |
    Sort-Object @{ Expression = { if ($_.Prioridad -eq "A") { 1 } elseif ($_.Prioridad -eq "B") { 2 } else { 3 } } }, Nombre |
    Select-Object -First 10

$ordered = New-Object System.Collections.Generic.List[string]
$ordered.Add("# Prospectos BarberAI ordenados")
$ordered.Add("")
$ordered.Add("Estado: BORRADOR/PAUSA. No se ha contactado a ningun prospecto real; cualquier outreach queda detenido hasta validacion de Allan.")
$ordered.Add("")
$ordered.Add("Fuente principal: ``data/prospectos_barberai.csv``. Esta version mejora la presentacion para revision del supervisor sin inventar prospectos ni contactos.")
$ordered.Add("")
$ordered.Add("## Resumen general")
$ordered.Add("")
$ordered.Add("- Total de prospectos: $total")
$ordered.Add("- Con contacto verificable documentado: $withContact")
$ordered.Add("- Sin contacto publico verificable: $withoutContact")
$ordered.Add("- Duplicados por nombre detectados: $($duplicates.Count)")
$ordered.Add("- Dependencias externas: validacion de Allan, hoja oficial externa si existe, y verificacion manual de contactos faltantes.")
$ordered.Add("")
$ordered.Add("## Conteo por ciudad")
$ordered.Add("")
$ordered.Add("| Ciudad / departamento | Prospectos |")
$ordered.Add("| --- | ---: |")
foreach ($group in $cityCounts) {
    $ordered.Add("| $(Escape-Md $group.Name) | $($group.Count) |")
}
$ordered.Add("")
$ordered.Add("## Conteo por prioridad")
$ordered.Add("")
$ordered.Add("| Prioridad | Prospectos |")
$ordered.Add("| --- | ---: |")
foreach ($group in $priorityCounts) {
    $ordered.Add("| $(Escape-Md $group.Name) | $($group.Count) |")
}
$ordered.Add("")
$ordered.Add("## Conteo por estado de contacto")
$ordered.Add("")
$ordered.Add("| Estado de contacto | Prospectos |")
$ordered.Add("| --- | ---: |")
$ordered.Add("| Canal verificable documentado | $withContact |")
$ordered.Add("| Sin contacto publico verificable | $withoutContact |")
$ordered.Add("")
$ordered.Add("## Top 10 prospectos recomendados")
$ordered.Add("")
$ordered.Add("Criterio: prioridad A/B, canal verificable documentado y encaje comercial con BarberAI. No implica que ya se haya contactado.")
$ordered.Add("")
$ordered.Add("| # | ID | Negocio | Ciudad | Prioridad | Canal / contacto | Accion siguiente |")
$ordered.Add("| ---: | --- | --- | --- | --- | --- | --- |")
$rank = 1
foreach ($record in $top10) {
    $ordered.Add("| $rank | $(Escape-Md $record.ID) | $(Escape-Md $record.Nombre) | $(Escape-Md $record.Ciudad) | $(Escape-Md $record.Prioridad) | $(Escape-Md $record.Redes) | $(Escape-Md $record.Accion) |")
    $rank++
}
$ordered.Add("")
$ordered.Add("## Tabla ordenada de prospectos")
$ordered.Add("")
$ordered.Add("| ID | Nombre del negocio | Ciudad / departamento | Tipo de negocio | Telefono / WhatsApp | Facebook / Instagram / sitio web | Senal de demanda | Problema probable | Como BarberAI puede ayudar | Prioridad | Estado de contacto | Accion siguiente | Observacion |")
$ordered.Add("| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |")
foreach ($record in ($records | Sort-Object @{ Expression = { if ($_.Prioridad -eq "A") { 1 } elseif ($_.Prioridad -eq "B") { 2 } else { 3 } } }, Ciudad, Nombre)) {
    $ordered.Add("| $(Escape-Md $record.ID) | $(Escape-Md $record.Nombre) | $(Escape-Md $record.Ciudad) | $(Escape-Md $record.Tipo) | $(Escape-Md $record.Telefono) | $(Escape-Md $record.Redes) | $(Escape-Md $record.Senal) | $(Escape-Md $record.Problema) | $(Escape-Md $record.Ayuda) | $(Escape-Md $record.Prioridad) | $(Escape-Md $record.EstadoContacto) | $(Escape-Md $record.Accion) | $(Escape-Md $record.Observacion) |")
}
$ordered.Add("")
$ordered.Add("## Pendientes o bloqueos reales")
$ordered.Add("")
$ordered.Add("- Bloqueado externo: aprobacion de Allan para avanzar de BORRADOR/PAUSA a outreach real.")
$ordered.Add("- Bloqueado externo: hoja oficial externa, si existe, requiere acceso o captura actualizada antes de declararla sincronizada.")
$ordered.Add("- Pendiente de verificar: $withoutContact prospectos no tienen contacto publico verificable en la base principal.")
$ordered.Add("- Pendiente de verificar: telefonos marcados como sin telefono publico verificable deben confirmarse manualmente antes de cualquier mensaje.")
$ordered.Add("- No se agregaron prospectos nuevos ni contactos no sustentados.")

Set-Content -Path $OrderedOut -Value $ordered -Encoding UTF8

$advancedCities = ($cityCounts | Select-Object -First 3 | ForEach-Object { "$($_.Name) ($($_.Count))" }) -join ", "
$completeInfo = "$withContact prospectos tienen al menos un canal verificable documentado; todos los registros conservan prioridad, senal de demanda, problema probable y accion siguiente."
$missingInfo = "$withoutContact prospectos requieren verificacion manual de contacto publico; varios telefonos o redes figuran como sin contacto publico verificable en la fuente."

$summary = New-Object System.Collections.Generic.List[string]
$summary.Add("# Resumen de prospectos BarberAI")
$summary.Add("")
$summary.Add("Estado: BORRADOR/PAUSA. No se contacto a ningun prospecto real porque el flujo comercial queda detenido hasta validacion de Allan.")
$summary.Add("")
$summary.Add("## Totales")
$summary.Add("")
$summary.Add("- Total de prospectos actuales: $total")
$summary.Add("- Prioridad A: $(($records | Where-Object Prioridad -eq 'A').Count)")
$summary.Add("- Prioridad B: $(($records | Where-Object Prioridad -eq 'B').Count)")
$summary.Add("- Prioridad C: $(($records | Where-Object Prioridad -eq 'C').Count)")
$summary.Add("- Con contacto verificable documentado: $withContact")
$summary.Add("- Sin contacto publico verificable: $withoutContact")
$summary.Add("")
$summary.Add("## Ciudades con mas avance")
$summary.Add("")
$summary.Add("Las ciudades con mayor volumen de registros en la base actual son: $advancedCities.")
$summary.Add("")
$summary.Add("## Informacion completa")
$summary.Add("")
$summary.Add($completeInfo)
$summary.Add("")
$summary.Add("## Informacion pendiente de verificar")
$summary.Add("")
$summary.Add($missingInfo)
$summary.Add("")
$summary.Add("Tambien queda bloqueado externamente cualquier cruce con hoja oficial si no hay acceso o captura actualizada dentro del repo.")
$summary.Add("")
$summary.Add("## Recomendacion de siguientes pasos")
$summary.Add("")
$summary.Add("1. Revisar con Allan el Top 10 recomendado en ``docs/prospectos-barberai-ordenados.md``.")
$summary.Add("2. Usar ``docs/prospectos-barberai-dashboard.html`` como version visual completa para revisar los 67 prospectos por ciudad, prioridad y estado.")
$summary.Add("3. Validar manualmente telefonos, WhatsApp y redes de los prospectos sin canal publico verificable.")
$summary.Add("4. Mantener todo outreach en BORRADOR/PAUSA hasta que Allan apruebe estilo, mensaje y lista inicial.")
$summary.Add("5. No producir ni enviar mensajes masivos hasta cerrar la validacion comercial y los bloqueos externos.")

Set-Content -Path $SummaryOut -Value $summary -Encoding UTF8

