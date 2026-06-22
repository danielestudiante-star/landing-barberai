# Tareas S1 BarberAI

Semana 1 de validacion comercial: lunes 15 a viernes 19 de junio de 2026.  
Responsable general: Daniel.

## Estado actualizado previo a validacion de estilo

Fecha de actualizacion: 22 de junio de 2026.

Esta vista reemplaza la lectura de "todo pendiente". Se separa lo cerrado, lo bloqueado por dependencias externas y lo que queda como pendiente real antes de producir artes en masa.

| Frente | Estado | Responsable | Evidencia / ruta | Nota |
| --- | --- | --- | --- | --- |
| Deploy, chatbot, WhatsApp y vista movil documentados. | Listo | Daniel | `validacion-comercial/evidencia/` | Evidencias tecnicas existentes en repo. |
| Base comercial sustentada local. | Listo | Daniel | `data/prospectos-barberai-oficial.xlsx` | Base local consolidada con 67 prospectos; no se agregan negocios sin evidencia. |
| Top 10 y propuesta piloto. | Listo | Daniel | `data/prospectos-barberai-oficial.xlsx`, `docs/propuesta_piloto_barberai.md` | Material comercial listo para revision documental. |
| Buyer persona BarberAI. | Listo | Daniel | `docs/buyer-persona-barberai.md` | Documento final creado para orientar copies y artes piloto. |
| Calendario 15 dias / 45 piezas. | Pendiente real | Daniel | `docs/calendario-15-dias-45-piezas.md` | Queda en Borrador/Pausa. No se producen las 45 piezas hasta aprobacion del supervisor. |
| 3 artes piloto: Facebook, Instagram y WhatsApp. | Listo para validacion | Daniel | `artes/piloto/facebook-piloto-1080x1080.png`, `artes/piloto/instagram-piloto-1080x1080.png`, `artes/piloto/whatsapp-piloto-1080x1920.png` | Artes visuales exportados; falta aprobacion Allan antes de producir las 45 piezas. |
| Choluteca completo. | Bloqueado externo | Daniel / terceros | `validacion-comercial/bloqueos-ciudades-asignadas-martes-16.md` | Solo hay 2 prospectos validos en la evidencia local. Completar requiere busqueda manual externa en Google Business, Facebook, Instagram o referencia local. |
| Contactos verificables faltantes. | Bloqueado externo | Daniel / terceros | `data/prospectos-barberai-oficial.xlsx` | No se inventan telefonos ni redes. Requiere verificacion manual antes de outreach. |
| Admin GitHub Allan. | Bloqueado externo | Allan / acceso GitHub | `docs/evidencia_github_allan.md` | Falta evidencia local de invitacion, aceptacion o permisos. |
| Hoja oficial. | Bloqueado externo | Responsable con acceso a hoja | README y respaldo local `data/prospectos-barberai-oficial.xlsx` | No hay captura o acceso actualizado en el repo. No se declara Google Sheets actualizado sin evidencia. |
| Formulario. | Pendiente real tecnico | Daniel / equipo tecnico | `validacion-comercial/backlog-barberai.md` | Falta integracion real a WhatsApp, email, Google Sheet, backend o CRM. |
| Contacto a prospectos reales. | Pendiente real / Pausa | Allan / Daniel | N/A | No iniciar contacto hasta que Allan apruebe el estilo de las 3 artes piloto. |

## LUNES 15

| Tarea | Estado | Responsable | Evidencia requerida | Nota |
| --- | --- | --- | --- | --- |
| Agregar a Allan como ADMIN en GitHub. | Pendiente externo documentado | Daniel | Captura de invitacion, aceptacion de Allan o confirmacion en configuracion del repo. | No se encontro evidencia local de invitacion ni aceptacion; confirmar desde GitHub. |
| Revisar deploy de BarberAI como cliente. | Listo | Daniel | Capturas desktop/movil del deploy. | Evidencia agregada en `validacion-comercial/evidencia/01-home-deploy.png` y `validacion-comercial/evidencia/05-vista-movil.png`. |
| Llenar checklist de revision. | Listo | Daniel | `validacion-comercial/checklist-lunes.md` completo. | Checklist alineado con la evidencia agregada el martes 16. |
| Escribir lista de mejoras antes de demo. | Listo | Daniel | `validacion-comercial/mejoras-antes-demo.md`. | Hallazgos reales y pendientes de evidencia registrados. |
| Escribir ICP de BarberAI. | Listo | Daniel | `validacion-comercial/icp-barberai.md`. | Actualizado para validacion comercial. |
| Cargar primeros 20 prospectos en Comayagua. | Listo | Daniel | Excel oficial con 20 filas reales. | Excel oficial actualizado hasta B-020. B-018 a B-020 requieren confirmar telefono o red social antes de outreach. |

## MARTES 16

| Tarea | Estado | Responsable | Evidencia requerida | Nota |
| --- | --- | --- | --- | --- |
| Resolver Backlog del lunes. | En revision | Daniel | `validacion-comercial/backlog-barberai.md` actualizado. | Evidencia tecnica resuelta; siguen pendientes Choluteca, Allan admin GitHub y formulario integrado. |
| Agregar +20 prospectos de Choluteca. | Bloqueado justificado | Daniel | 20 prospectos reales con fuente. | Solo hay 2 prospectos validos tras reconsulta OSM/Overpass/Nominatim; requiere busqueda manual en Google Business/Facebook/Instagram. |
| Agregar +20 prospectos de Atlantida. | Listo | Daniel | 20 prospectos reales con fuente. | Documentado en `data/prospectos-barberai-oficial.xlsx`. |
| Iniciar clasificacion A/B/C. | Listo | Daniel | Columna Prioridad en export. | Clasificacion aplicada en CSV y top 10. |
| Conteo parcial por ciudad y tipo. | Listo | Daniel | Revision de prospectos actualizada. | Excel oficial: 2 Choluteca y 20 Atlantida. |
| Bitacora con capturas de fuentes. | Listo con limitacion documentada | Daniel | Carpeta de evidencia/capturas. | Capturas del deploy y tabla local listas; fuentes de Choluteca quedan documentadas como bloqueo externo por baja disponibilidad publica. |

## MIERCOLES 17

| Tarea | Estado | Responsable | Evidencia requerida | Nota |
| --- | --- | --- | --- | --- |
| Resolver Backlog del martes. | Listo con limitaciones | Daniel | Backlog en 0 o justificacion. | Backlog interno ordenado; pendientes externos documentados sin inventar evidencia. |
| Llegar a 80-100 prospectos totales. | Bloqueado justificado | Daniel | Sheet/Excel con 80-100 prospectos reales. | Base sustentada llega a 67 prospectos reales; no se completo 80-100 por falta de evidencia publica suficiente. |
| Hacer analisis de mercado. | Listo | Daniel | Documento con hallazgos por ciudad/tipo. | Consolidado en `data/prospectos-barberai-oficial.xlsx`, `data/prospectos-barberai-oficial.xlsx` y `docs/propuesta_piloto_barberai.md`. |
| Definir Top 10 prospectos. | Listo | Daniel | `data/prospectos-barberai-oficial.xlsx`. | Top 10 actualizado en el Excel oficial. |
| Definir audiencia, geografia y presupuesto piloto. | En progreso | Daniel | `presupuesto-kpis-barberai.md`. | Falta aprobar presupuesto. |
| Escribir 3 copies de anuncio: dolor, solucion y oferta. | Listo | Daniel | `copies-anuncios-barberai.md`. | Listos para revisar. |
| Preparar checkpoint con Allan. | Pendiente | Daniel | Mensaje/resumen para Allan. | Usar reporte diario. |

## JUEVES 18

| Tarea | Estado | Responsable | Evidencia requerida | Nota |
| --- | --- | --- | --- | --- |
| Resolver Backlog del miercoles. | Listo con limitaciones | Daniel | Backlog actualizado. | Pendientes externos quedan documentados; no bloquean el cierre documental de la semana. |
| Preparar 3 artes estilo Simplexity: feed 1080x1080, story 1080x1920 y concepto de video. | Listo | Daniel | Archivos o brief de artes. | Brief y piezas documentadas en `artes/whatsapp/brief-artes-simplexity-barberai.md` y `artes/whatsapp/`. |
| Crear 5 guiones de TikTok para BarberAI. | Reprogramado | Daniel | Documento de guiones. | No hay evidencia de 5 guiones completos; queda fuera del cierre semanal para no inventar entregables. |
| Armar agente de prospeccion WhatsApp para BarberAI. | Listo | Daniel | `agente-prospeccion-whatsapp-barberai.md`. | Listo para prueba manual. |

## VIERNES 19

| Tarea | Estado | Responsable | Evidencia requerida | Nota |
| --- | --- | --- | --- | --- |
| Backlog en 0 antes de seguir. | Cerrado documentalmente | Daniel | `backlog-barberai.md` sin tareas internas abiertas. | Backlog interno del repo queda cerrado; limitaciones externas quedan documentadas para seguimiento posterior. |
| Campana definida documentalmente. | Listo documental / no activada | Daniel | Documento de campana y presupuesto. | Campana definida en `validacion-comercial/campania-marketing-martes-16-barberai.md` y `validacion-comercial/presupuesto-kpis-barberai.md`; no hay captura de Ads Manager/TikTok ni activacion real. |
| Estimar resultados esperados. | Listo | Daniel | `presupuesto-kpis-barberai.md`. | Estimacion inicial. |
| Actualizar README. | Listo | Daniel | `README.txt`. | Seccion IPC agregada. |
| Bitacora completa y carpeta de evidencia ordenada. | Listo con limitacion | Daniel | Bitacora + capturas. | Evidencia tecnica y comercial ordenada; contacto real queda pendiente hasta validacion visual de canales. |
| Preparar mini-demo de 5 a 7 minutos. | Listo documental | Daniel | Guion o checklist de demo. | Guion base documentado en `docs/comercial/guion-demo-barberai.md`; el archivo habla de demo breve y puede adaptarse a 5-7 minutos con flujo de producto, Top 10 y cierre por WhatsApp. |
| Responder las 8 preguntas de revision semanal. | Listo | Daniel | `respuestas-criterios-semana-barberai.md`. | Algunas respuestas quedan pendientes por datos reales. |

## CIERRE VIERNES 19

Fecha de cierre: viernes 19 de junio de 2026.

Resumen de lo realizado:

- Se deja cerrado el avance comercial/documental semanal de BarberAI en el repositorio.
- Se consolida la base real sustentada de 67 prospectos y el Top 10 comercial.
- Se documentan propuesta piloto, presupuesto, KPIs, copies, flujo de WhatsApp, guion de demo y brief de artes.
- Se mantiene la regla de no inventar prospectos, capturas, contactos ni resultados.

Evidencias principales:

- `data/prospectos-barberai-oficial.xlsx`
- `data/prospectos-barberai-oficial.xlsx`
- `data/prospectos-barberai-oficial.xlsx`
- `docs/propuesta_piloto_barberai.md`
- `docs/comercial/guion-demo-barberai.md`
- `docs/comercial/cierre-dia-comercial-barberai.md`
- `validacion-comercial/evidencia/`
- `validacion-comercial/campania-marketing-martes-16-barberai.md`
- `validacion-comercial/presupuesto-kpis-barberai.md`

Estado final:

- Backlog interno del repo: cerrado para el avance semanal.
- Campana: definida documentalmente; no activada porque no hay evidencia local de Ads Manager/TikTok ni aprobacion de pauta.
- Mini-demo: guion documentado; pendiente solo grabacion o ejecucion real si Allan la solicita.
- Contacto comercial real: no iniciado; requiere validacion visual previa de WhatsApp/canales.
- Pendientes externos documentados: Choluteca completa, contactos faltantes, evidencia de Allan como admin en GitHub y formulario real de leads.


