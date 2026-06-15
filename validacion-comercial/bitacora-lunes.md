# Bitacora lunes - Validacion comercial BarberAI

## Datos del dia

- Fecha: 15 de junio de 2026
- Producto: BarberAI
- Commit revisado: b722695
- Responsable: Daniel
- Objetivo del dia: dejar documentado el estado real de prospectos, evidencia del deploy, chatbot, WhatsApp, vista movil y backlog para nueva revision de Allan.

## Actividades realizadas

| Actividad | Estado | Evidencia | Observacion |
| --- | --- | --- | --- |
| Revisar estructura de validacion comercial | Listo | Carpeta `validacion-comercial/` | Existen archivos de ICP, campana, A/B testing, agente de prospeccion, backlog, reportes y exports. |
| Revisar prospectos locales | Listo | `prospectos/prospectos_barberai_comayagua.xlsx` y `validacion-comercial/exports-google-sheet/prospectos-barberai-normalizados.csv` | El XLSX local tenia 15; el CSV normalizado quedo actualizado a 20 prospectos reales. No se contaron filas vacias. |
| Confirmar si hay 20 prospectos reales | Listo | `validacion-comercial/pendiente-5-prospectos-comayagua.md` | Se agregaron B-016 a B-020 con fuente publica OpenStreetMap/Nominatim. No se inventaron negocios, telefonos ni redes. |
| Actualizar checklist | Listo | `validacion-comercial/checklist-lunes.md` | Se reemplazo la plantilla por tabla con estado, evidencia y observacion. |
| Organizar evidencia requerida | Listo | `validacion-comercial/evidencia-deploy-barberai.md` y `validacion-comercial/evidencia/README-evidencia.md` | Se definieron capturas necesarias y nombres de archivo. |
| Actualizar mejoras/backlog | Listo | `validacion-comercial/mejoras-antes-demo.md` y `validacion-comercial/backlog-barberai.md` | Se registraron hallazgos y pendientes reales sin asumir pruebas no hechas. |

## Revision del deploy

Deploy documentado: https://landing-barberai-production.up.railway.app

| Prueba | Resultado | Evidencia | Nota |
| --- | --- | --- | --- |
| Carga de pagina | Pendiente de evidencia | pendiente | Falta captura real del deploy. |
| Hero / primera impresion | Pendiente de evidencia | pendiente | Falta revisar visualmente el deploy. |
| Botones principales | Pendiente de evidencia | pendiente | Falta probar CTAs. |
| WhatsApp | Pendiente de evidencia | pendiente | README indica que existe boton flotante, pero falta prueba/captura. |
| Chatbot | Pendiente de evidencia | pendiente | README indica que existe chatbot Q&A, pero falta captura de apertura y respuesta. |
| Vista movil | Pendiente de evidencia | pendiente | Falta captura en viewport movil. |
| Links | Pendiente de evidencia | pendiente | Falta validar links internos/externos. |

## Prospectos encontrados

- Prospectos confirmados: 20.
- Meta del dia: 20 prospectos reales de Comayagua.
- Estado: 20/20.
- Faltantes: 0.
- Fuente local confirmada: `prospectos/prospectos_barberai_comayagua.xlsx`.
- Export revisado: `validacion-comercial/exports-google-sheet/prospectos-barberai-normalizados.csv`.
- Observacion: B-016 a B-020 se agregaron desde fuente publica OpenStreetMap/Nominatim; B-018 a B-020 requieren confirmar telefono o red social antes de outreach.

## Estado de checklist

- Checklist actualizado: Listo.
- Pruebas marcadas como listas: solo las respaldadas por archivos locales.
- Pruebas del deploy: Pendiente de evidencia.
- Sitio listo para demo: Pendiente de evidencia.

## Evidencia tomada

- No se encontro ninguna captura real del deploy, chatbot, WhatsApp, vista movil, tabla de prospectos u hoja oficial.
- La carpeta `validacion-comercial/evidencia/` existe para guardar capturas reales cuando Daniel las tome.

## Evidencia documental existente

- Link del deploy en `README.txt`.
- Link del deploy en `validacion-comercial/tareas-s1-barberai.md`.
- CSV normalizado con 20 prospectos reales.
- XLSX con 15 prospectos reales y resumen original.

## Evidencia pendiente

- Pendiente de completar con evidencia real: captura de home desktop.
- Pendiente de completar con evidencia real: captura de chatbot abierto.
- Pendiente de completar con evidencia real: captura de respuesta del chatbot.
- Pendiente de completar con evidencia real: captura de WhatsApp funcionando.
- Pendiente de completar con evidencia real: captura de vista movil.
- Pendiente de completar con evidencia real: captura de tabla de prospectos/Google Sheet.

## Hallazgos reales

| Hallazgo | Tipo | Prioridad | Archivo relacionado | Estado |
| --- | --- | --- | --- | --- |
| El XLSX local tenia 15 prospectos, pero el CSV normalizado ya quedo en 20. | Prospectos | Alta | `validacion-comercial/exports-google-sheet/prospectos-barberai-normalizados.csv` | Listo |
| No hay capturas reales del deploy en el proyecto. | Evidencia | Alta | `validacion-comercial/evidencia-deploy-barberai.md` | Backlog |
| Checklist anterior estaba como plantilla con casillas vacias. | Documentacion | Alta | `validacion-comercial/checklist-lunes.md` | Listo |
| Bitacora anterior tenia campos vacios o pendientes sin contexto. | Documentacion | Alta | `validacion-comercial/bitacora-lunes.md` | Listo |
| Mejoras antes de demo tenia ejemplos pendientes, no hallazgos estructurados. | Documentacion | Media | `validacion-comercial/mejoras-antes-demo.md` | Listo |

## Backlog real

- Listo: completar prospectos reales de Comayagua hasta B-020.
- Pendiente para Backlog de martes: completar checklist con evidencia real del deploy.
- Pendiente para Backlog de martes: agregar capturas reales de revision del deploy, chatbot, WhatsApp y vista movil.
- Pendiente para Backlog de martes: avisar a Allan para nueva revision cuando existan los 20 prospectos o se mantenga documentado el faltante.

## Resumen para Allan

Listo, Allan. Actualice el repo y complete el CSV normalizado hasta 20 prospectos reales de Comayagua con fuentes publicas. No invente negocios, telefonos ni capturas. Quedan pendientes las capturas reales del deploy, chatbot, WhatsApp y vista movil, y validar telefono/red social de B-018 a B-020 antes de outreach.
