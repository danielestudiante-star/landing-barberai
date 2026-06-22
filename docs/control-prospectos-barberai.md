# Control de prospectos BarberAI

Estado: BORRADOR/PAUSA.

No se ha contactado a ningun prospecto real. Cualquier outreach queda pendiente hasta validacion de Allan.

## Reemplazo del Excel danado

Se elimino y reemplazo el archivo `data/prospectos-barberai-oficial.xlsx` porque Microsoft Excel no podia abrirlo ni repararlo.

El nuevo archivo fue regenerado desde cero como libro `.xlsx` real usando Microsoft Excel en modo local. La validacion local confirmo:

- El archivo existe.
- No pesa 0 KB.
- Se abre como paquete `.xlsx` ZIP/OpenXML.
- Microsoft Excel pudo abrir el libro recien creado durante la validacion.
- Contiene las 10 hojas solicitadas.
- La hoja `Todos los prospectos` contiene 67 IDs.
- No hay IDs duplicados.

Python no estuvo disponible en este entorno para cargar el libro con una libreria externa; la validacion adicional se realizo con PowerShell leyendo el paquete OpenXML.

## Por que se consolido

La informacion de prospectos estaba repetida entre CSV, XLSX, HTML y documentos Markdown. Para evitar conteos contradictorios, rutas duplicadas y riesgo de usar datos viejos, se consolido todo en una sola fuente oficial:

`data/prospectos-barberai-oficial.xlsx`

## Total real de prospectos

Total real consolidado: 67 prospectos.

Este total sale de los archivos existentes del repositorio. No se inventaron prospectos, telefonos, redes sociales ni sitios web.

Resumen validado:

- Total con contacto verificable: 22.
- Total sin contacto verificable: 45.
- Prioridad A: 9.
- Prioridad B: 40.
- Prioridad C: 18.

## Que contiene el Excel oficial

El libro `data/prospectos-barberai-oficial.xlsx` contiene estas hojas:

- `Resumen`
- `Todos los prospectos`
- `Prioridad A`
- `Prioridad B`
- `Prioridad C`
- `Contactos verificables`
- `Pendientes de verificar`
- `Top 10`
- `Acciones siguientes`
- `Bloqueos`

La hoja `Todos los prospectos` usa las columnas oficiales del plan:

- ID
- Negocio
- Ciudad/Depto
- Tipo
- Telefono/WhatsApp
- Facebook
- Instagram
- TikTok
- Web/Menu
- Dueno/Encargado
- Senal de demanda
- Problema probable
- Prioridad
- Fuente
- Estado de contacto
- Fecha proximo paso
- Notas

## Respaldo vigente

El respaldo vigente de prospectos es el Excel oficial `data/prospectos-barberai-oficial.xlsx`.

Los documentos comerciales importantes del plan se mantienen en el repositorio: ICP/buyer persona, calendarios, A/B testing, agente de prospeccion, presupuesto/KPIs, artes piloto, bitacoras y evidencias.

## Verificacion del plan comercial

El repo mantiene documentos o secciones para:

- ICP / cliente ideal: `validacion-comercial/icp-barberai.md` y `docs/buyer-persona-barberai.md`
- Prospectos: `data/prospectos-barberai-oficial.xlsx`
- Top 10: hoja `Top 10` del Excel oficial
- Presupuesto recomendado: `validacion-comercial/presupuesto-kpis-barberai.md`
- Canal recomendado: `validacion-comercial/campania-marketing-martes-16-barberai.md`
- Mensaje al cliente: `validacion-comercial/copies-anuncios-barberai.md` y `docs/comercial/top-10-restaurantes.md`
- Agente IA de prospeccion: `validacion-comercial/agente-prospeccion-whatsapp-barberai.md`
- Acciones del humano despues del interes: `docs/comercial/flujo-whatsapp-prospeccion.md` y `docs/comercial/guion-demo-barberai.md`
- Calendario de contenido: `docs/calendario-15-dias-45-piezas.md` y `validacion-comercial/calendario-contenido-8-semanas-barberai.md`
- A/B testing: `validacion-comercial/ab-testing-barberai.md`
- Artes piloto: `artes/piloto/`
- Evidencia y bitacora: `validacion-comercial/evidencia/`, `docs/evidencia_miercoles_17.md`, `validacion-comercial/bitacora-lunes.md` y `validacion-comercial/bitacora-martes-16.md`

## Archivos eliminados

Se eliminaron archivos duplicados o antiguos relacionados directamente con prospectos BarberAI:

- `data/prospectos_barberai.csv`
- `docs/prospectos-barberai-dashboard.html`
- `docs/prospectos-barberai-dashboard.xlsx`
- `docs/prospectos-barberai-ordenados.md`
- `docs/resumen-prospectos-barberai.md`
- `docs/top_10_barberai.md`
- `docs/contactos_pendientes_barberai.md`
- `docs/conteos_finales_barberai.md`
- `prospectos/prospectos_barberai_comayagua.xlsx`
- `validacion-comercial/prospectos-comayagua.csv`
- `validacion-comercial/prospectos-ciudades-asignadas-martes-16-barberai.csv`
- `validacion-comercial/exports-google-sheet/prospectos-barberai-normalizados.csv`
- `validacion-comercial/contactos-verificables-barberai.md`
- `validacion-comercial/mejores-10-prospectos-barberai.md`
- `validacion-comercial/pendiente-5-prospectos-comayagua.md`
- `validacion-comercial/revision-prospectos-barberai.md`

## Pendiente

- Verificar los 45 prospectos sin contacto publico verificable.
- Validar el Top 10 con Allan.
- Confirmar si existe una hoja oficial externa y si aplica sincronizarla contra este Excel.
- Preparar outreach solo como borrador.
- No contactar prospectos reales hasta aprobacion.
- Escalar nuevos prospectos solo si se solicitan y si tienen fuente publica verificable.

## Bloqueos

- Contactos no encontrados en fuentes publicas disponibles.
- Prospectos sin redes publicas.
- Ciudades con baja informacion publica.
- Hoja oficial externa sin acceso o captura actualizada.
- Aprobacion de Allan pendiente para avanzar a cualquier contacto real.
