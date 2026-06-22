param(
    [string]$SourceCsv = "data\prospectos_barberai.csv",
    [string]$HtmlOut = "docs\prospectos-barberai-dashboard.html"
)

$ErrorActionPreference = "Stop"

function Clean-Text {
    param([object]$Value, [string]$Fallback = "Pendiente de verificar")

    if ($null -eq $Value) { return $Fallback }
    $text = ([string]$Value).Trim()
    $text = [regex]::Replace($text, "\s+", " ")
    if ([string]::IsNullOrWhiteSpace($text) -or $text -eq '""') { return $Fallback }
    if ($text -match "^(No encontrado publicamente|No encontrado públicamente|Pendiente|no encontrado)$") { return $Fallback }
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

function Escape-Html {
    param([string]$Value)
    return [System.Net.WebUtility]::HtmlEncode((Clean-Text $Value))
}

function Priority-Class {
    param([string]$Value)
    if ($Value -eq "A") { return "priority-a" }
    if ($Value -eq "B") { return "priority-b" }
    return "priority-c"
}

function Contact-Class {
    param([string]$Value)
    if ($Value -eq "Canal verificable documentado") { return "contact-ok" }
    return "contact-pending"
}

function Format-Html-Links {
    param([string]$Value)

    $text = Clean-Text $Value "Sin contacto publico verificable"
    if ($text -eq "Sin contacto publico verificable") {
        return "<span class=""muted"">Sin contacto publico verificable</span>"
    }

    $parts = $text -split "\s*\|\s*"
    $links = foreach ($part in $parts) {
        $clean = $part.Trim()
        if ($clean -match "^https?://") {
            "<a href=""$(Escape-Html $clean)"">$(Escape-Html $clean)</a>"
        } else {
            Escape-Html $clean
        }
    }

    return ($links -join "<br>")
}

function Get-ColumnValue {
    param($Row, [string]$Pattern)

    $property = $Row.PSObject.Properties | Where-Object { $_.Name -match $Pattern } | Select-Object -First 1
    if ($null -eq $property) { return $null }
    return $property.Value
}

$rows = Import-Csv $SourceCsv
$records = foreach ($row in $rows) {
    $estadoContacto = Clean-Text $row.estado_contacto "Sin contacto publico verificable"
    if ($estadoContacto -ne "Canal verificable documentado") {
        $estadoContacto = "Sin contacto publico verificable"
    }

    $telefono = Clean-Text $row.telefono_whatsapp "Sin contacto publico verificable"
    if ($telefono -eq "Pendiente de verificar") { $telefono = "Sin contacto publico verificable" }

    $redes = Clean-Text $row.red_social_web "Sin contacto publico verificable"
    if ($redes -eq "Pendiente de verificar") { $redes = "Sin contacto publico verificable" }

    [PSCustomObject]@{
        ID = Clean-Text $row.id
        Nombre = Clean-Text $row.nombre_negocio
        Ciudad = Normalize-City $row.ciudad_departamento
        Tipo = Clean-Text $row.tipo_negocio
        Telefono = $telefono
        Redes = $redes
        Senal = Clean-Text (Get-ColumnValue $row "se.al_demanda|demanda$")
        Problema = Clean-Text $row.problema_probable
        Ayuda = Clean-Text $row.oportunidad_barberai
        Prioridad = Clean-Text $row.prioridad_A_B_C
        EstadoContacto = $estadoContacto
        Accion = Clean-Text $row.accion_siguiente "Verificar contacto publico antes de outreach"
        Observacion = Clean-Text $row.observaciones "Sin observacion adicional"
    }
}

$total = $records.Count
$withContact = ($records | Where-Object EstadoContacto -eq "Canal verificable documentado").Count
$withoutContact = $total - $withContact
$cityCounts = $records | Group-Object Ciudad | Sort-Object @{ Expression = "Count"; Descending = $true }, Name
$top10 = $records |
    Where-Object EstadoContacto -eq "Canal verificable documentado" |
    Sort-Object @{ Expression = { if ($_.Prioridad -eq "A") { 1 } elseif ($_.Prioridad -eq "B") { 2 } else { 3 } } }, Nombre |
    Select-Object -First 10

$html = New-Object System.Collections.Generic.List[string]
$html.Add("<!doctype html>")
$html.Add("<html lang=""es"">")
$html.Add("<head>")
$html.Add("<meta charset=""utf-8"">")
$html.Add("<meta name=""viewport"" content=""width=device-width, initial-scale=1"">")
$html.Add("<title>Prospectos BarberAI - Dashboard</title>")
$html.Add("<style>")
$html.Add(":root{--ink:#17212b;--muted:#667085;--line:#d9e2ec;--paper:#fff;--soft:#f5f7fb;--brand:#0f766e;--blue:#2563eb;--ok:#027a48;--bad:#b42318;--warn:#b45309}*{box-sizing:border-box}body{margin:0;background:#eef2f6;color:var(--ink);font-family:Inter,Segoe UI,Arial,sans-serif;line-height:1.45}a{color:#1d4ed8;text-decoration:none;word-break:break-word}a:hover{text-decoration:underline}.page{max-width:1280px;margin:0 auto;padding:28px 20px 48px}.hero{background:linear-gradient(135deg,#102033,#0f766e);color:white;border-radius:8px;padding:28px;margin-bottom:18px;box-shadow:0 12px 32px rgba(16,32,51,.18)}.eyebrow{font-size:12px;text-transform:uppercase;letter-spacing:.08em;opacity:.82;font-weight:800}.hero h1{margin:8px 0 10px;font-size:34px;line-height:1.08;letter-spacing:0}.hero p{max-width:900px;margin:0;color:#dbeafe}.status{display:inline-flex;margin-top:18px;padding:8px 10px;border:1px solid rgba(255,255,255,.3);border-radius:999px;background:rgba(255,255,255,.1);font-size:13px;font-weight:800}.metrics{display:grid;grid-template-columns:repeat(5,minmax(0,1fr));gap:12px;margin:18px 0}.metric{background:var(--paper);border:1px solid var(--line);border-radius:8px;padding:16px}.metric .label{color:var(--muted);font-size:12px;text-transform:uppercase;font-weight:800}.metric .value{display:block;margin-top:6px;font-size:30px;font-weight:850}.section{margin-top:22px}.section h2{font-size:22px;margin:0 0 12px}.grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:12px}.city{background:var(--paper);border:1px solid var(--line);border-radius:8px;padding:14px}.city strong{display:block;font-size:16px}.city span{color:var(--muted)}.table-wrap{overflow:auto;border:1px solid var(--line);border-radius:8px;background:var(--paper)}table{width:100%;border-collapse:collapse;min-width:820px}th,td{padding:11px 12px;border-bottom:1px solid var(--line);text-align:left;vertical-align:top}th{background:#f8fafc;font-size:12px;text-transform:uppercase;color:#475467}tr:last-child td{border-bottom:0}.cards{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:14px}.card{background:var(--paper);border:1px solid var(--line);border-radius:8px;padding:16px;display:flex;flex-direction:column;gap:12px}.card-head{display:flex;gap:10px;justify-content:space-between;align-items:flex-start}.name{font-size:18px;font-weight:850}.id{color:var(--muted);font-size:12px;font-weight:800}.meta{display:flex;flex-wrap:wrap;gap:6px}.pill{display:inline-flex;align-items:center;border-radius:999px;padding:4px 8px;font-size:12px;font-weight:800;border:1px solid #d0d5dd;background:#f8fafc;color:#344054}.priority-a{background:#dcfce7;color:#166534;border-color:#bbf7d0}.priority-b{background:#dbeafe;color:#1e40af;border-color:#bfdbfe}.priority-c{background:#fff7ed;color:#9a3412;border-color:#fed7aa}.contact-ok{background:#ecfdf3;color:#027a48;border-color:#abefc6}.contact-pending{background:#fef3f2;color:#b42318;border-color:#fecdca}.field{border-top:1px solid var(--line);padding-top:10px}.field b{display:block;font-size:12px;text-transform:uppercase;color:#475467;margin-bottom:4px}.muted{color:var(--muted)}.block-note{background:#fff7ed;border:1px solid #fed7aa;border-radius:8px;padding:14px;color:#7c2d12}.footer{margin-top:24px;color:var(--muted);font-size:13px}@media(max-width:900px){.metrics{grid-template-columns:repeat(2,minmax(0,1fr))}.grid,.cards{grid-template-columns:1fr}.hero h1{font-size:28px}}")
$html.Add("</style>")
$html.Add("</head>")
$html.Add("<body><main class=""page"">")
$html.Add("<section class=""hero""><div class=""eyebrow"">Revision comercial BarberAI</div><h1>Base completa de prospectos ordenada</h1><p>Presentacion visual de los $total prospectos existentes. No se agregaron prospectos ni contactos nuevos; los registros sin evidencia quedan marcados para verificacion.</p><div class=""status"">BORRADOR/PAUSA - no contactar prospectos reales hasta validacion de Allan</div></section>")
$html.Add("<section class=""metrics""><div class=""metric""><span class=""label"">Total</span><span class=""value"">$total</span></div><div class=""metric""><span class=""label"">Prioridad A</span><span class=""value"">$(($records | Where-Object Prioridad -eq 'A').Count)</span></div><div class=""metric""><span class=""label"">Prioridad B</span><span class=""value"">$(($records | Where-Object Prioridad -eq 'B').Count)</span></div><div class=""metric""><span class=""label"">Prioridad C</span><span class=""value"">$(($records | Where-Object Prioridad -eq 'C').Count)</span></div><div class=""metric""><span class=""label"">Sin contacto</span><span class=""value"">$withoutContact</span></div></section>")
$html.Add("<section class=""section""><h2>Avance por ciudad</h2><div class=""grid"">")
foreach ($group in $cityCounts) {
    $html.Add("<div class=""city""><strong>$(Escape-Html $group.Name)</strong><span>$($group.Count) prospectos</span></div>")
}
$html.Add("</div></section>")
$html.Add("<section class=""section""><h2>Top 10 recomendado</h2><div class=""table-wrap""><table><thead><tr><th>#</th><th>Negocio</th><th>Ciudad</th><th>Prioridad</th><th>Canal</th><th>Accion</th></tr></thead><tbody>")
$rank = 1
foreach ($record in $top10) {
    $html.Add("<tr><td>$rank</td><td><strong>$(Escape-Html $record.Nombre)</strong><br><span class=""muted"">$(Escape-Html $record.ID)</span></td><td>$(Escape-Html $record.Ciudad)</td><td><span class=""pill $(Priority-Class $record.Prioridad)"">$(Escape-Html $record.Prioridad)</span></td><td>$(Format-Html-Links $record.Redes)</td><td>$(Escape-Html $record.Accion)</td></tr>")
    $rank++
}
$html.Add("</tbody></table></div></section>")
$html.Add("<section class=""section""><h2>Todos los prospectos</h2>")
foreach ($cityGroup in ($records | Sort-Object Ciudad, Nombre | Group-Object Ciudad)) {
    $html.Add("<h3>$(Escape-Html $cityGroup.Name) <span class=""muted"">($($cityGroup.Count))</span></h3><div class=""cards"">")
    foreach ($record in ($cityGroup.Group | Sort-Object @{ Expression = { if ($_.Prioridad -eq "A") { 1 } elseif ($_.Prioridad -eq "B") { 2 } else { 3 } } }, Nombre)) {
        $html.Add("<article class=""card""><div class=""card-head""><div><div class=""id"">$(Escape-Html $record.ID)</div><div class=""name"">$(Escape-Html $record.Nombre)</div></div><div class=""meta""><span class=""pill $(Priority-Class $record.Prioridad)"">Prioridad $(Escape-Html $record.Prioridad)</span><span class=""pill $(Contact-Class $record.EstadoContacto)"">$(Escape-Html $record.EstadoContacto)</span></div></div><div class=""meta""><span class=""pill"">$(Escape-Html $record.Tipo)</span><span class=""pill"">$(Escape-Html $record.Ciudad)</span></div><div class=""field""><b>Telefono / WhatsApp</b>$(Escape-Html $record.Telefono)</div><div class=""field""><b>Facebook / Instagram / sitio web</b>$(Format-Html-Links $record.Redes)</div><div class=""field""><b>Senal de demanda</b>$(Escape-Html $record.Senal)</div><div class=""field""><b>Problema probable</b>$(Escape-Html $record.Problema)</div><div class=""field""><b>Como BarberAI puede ayudar</b>$(Escape-Html $record.Ayuda)</div><div class=""field""><b>Accion siguiente</b>$(Escape-Html $record.Accion)</div><div class=""field""><b>Observacion</b>$(Escape-Html $record.Observacion)</div></article>")
    }
    $html.Add("</div>")
}
$html.Add("</section><section class=""section block-note""><strong>Pendientes reales:</strong> aprobacion de Allan, verificacion manual de los $withoutContact prospectos sin contacto publico verificable y acceso/captura de hoja oficial externa si existe. Todo outreach queda en BORRADOR/PAUSA.</section><div class=""footer"">Fuente: data/prospectos_barberai.csv. Generado sin inventar prospectos, telefonos, responsables ni contactos.</div></main></body></html>")

Set-Content -Path $HtmlOut -Value $html -Encoding UTF8
