# Backlog validacion comercial BarberAI

Usar este archivo como vista resumida del backlog comercial. El detalle principal queda en `validacion-comercial/backlog-barberai.md`.

## Criterio de prioridad

- Alta: bloquea una demo o puede afectar la confianza del cliente.
- Media: no bloquea la demo, pero deberia corregirse antes de vender.
- Baja: mejora visual, texto o detalle menor.

## Estados

- Listo
- Listo para validacion
- Bloqueado externo
- Pendiente real
- Pendiente real / Pausa

## Revision S1 antes de produccion masiva

Fecha de actualizacion: 22 de junio de 2026.  
Estado general: 3 artes piloto listas para validacion de estilo. Las 45 piezas quedan en pausa hasta aprobacion del supervisor.

| Frente | Estado | Nota |
| --- | --- | --- |
| Evidencia tecnica del deploy, chatbot, WhatsApp y movil. | Listo | Capturas existentes en `validacion-comercial/evidencia/`. |
| Base comercial local, Top 10 y propuesta piloto. | Listo | Respaldado en `data/prospectos-barberai-oficial.xlsx`, `data/prospectos-barberai-oficial.xlsx` y `docs/propuesta_piloto_barberai.md`. |
| Buyer persona final. | Listo | Creado en `docs/buyer-persona-barberai.md`. |
| Calendario 15 dias / 45 piezas. | Pendiente real / Pausa | Creado como borrador en `docs/calendario-15-dias-45-piezas.md`; no se produce en masa. |
| Artes piloto Facebook, Instagram y WhatsApp. | Listo para validacion | Artes visuales exportados en `artes/piloto/`; falta aprobacion Allan antes de producir las 45 piezas. |
| Choluteca incompleto. | Bloqueado externo | Completar requiere busqueda manual externa; no hay evidencia local suficiente. |
| Contactos verificables faltantes. | Bloqueado externo | No se inventan contactos; requieren verificacion manual. |
| Admin GitHub Allan. | Bloqueado externo | Falta evidencia desde GitHub. |
| Hoja oficial. | Bloqueado externo | Falta acceso o captura actualizada; se usa CSV local como respaldo. |
| Formulario. | Pendiente real | Falta integracion tecnica real. |
| Contacto a prospectos reales. | Pendiente real / Pausa | No iniciar outreach hasta que Allan apruebe el estilo. |

## Tareas pendientes

| Tarea | Dia de origen | Prioridad | Estado | Responsable | Fecha limite | Evidencia requerida | Nota |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Completar prospectos reales para llegar a 20 en Comayagua. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | Excel oficial con fuente publica. | Excel oficial actualizado hasta B-020; validar contacto de B-018 a B-020 antes de outreach. |
| Completar checklist con evidencia real del deploy. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | Capturas y checklist actualizado. | Capturas reales agregadas en `validacion-comercial/evidencia/` y checklist martes actualizado. |
| Agregar capturas reales de revision del deploy. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | Carpeta `validacion-comercial/evidencia/`. | Home, chatbot, respuesta, WhatsApp, movil y tabla local ya tienen captura. |
| Mantener hallazgos reales en mejoras/backlog. | Lunes 15 | Alta | Listo | Daniel | 2026-06-15 | `mejoras-antes-demo.md` y `backlog-barberai.md`. | Ya se documentaron hallazgos confirmados y pendientes con contexto. |
| Completar +20 prospectos de Choluteca. | Martes 16 | Alta | Backlog bloqueado | Daniel | 2026-06-17 | Excel con fuentes publicas reales. | Solo hay 2 prospectos validos de Choluteca tras reconsulta OSM/Overpass/Nominatim; requiere busqueda manual en Facebook, Instagram, Google Business/Maps, TikTok o referencia local. |
| Completar WhatsApp/Facebook/Instagram de al menos 10 mejores prospectos. | Martes 16 | Alta | Listo parcial | Daniel | 2026-06-16 | `data/prospectos-barberai-oficial.xlsx`. | Se documentaron 22 contactos verificables en la base completa; no contactar registros sin canal confirmado. |
| Documentar limitacion del formulario de contacto. | Martes 16 | Media | Listo | Daniel | 2026-06-16 | `validacion-comercial/backlog-barberai.md` y `validacion-comercial/reporte-diario-allan-barberai.md`. | El formulario actual solo muestra `alert`; no esta integrado. Para cliente real debe enviar a WhatsApp, email, Google Sheet o backend. |
| Confirmar Allan como admin/colaborador GitHub. | Lunes 15 | Alta | Backlog | Daniel | 2026-06-17 | Captura de invitacion, aceptacion de Allan o confirmacion dentro del repo. | No se encontro evidencia local de invitacion ni aceptacion. |

## Estado de cierre

Daniel puede cerrar el trabajo de hoy como avance aprobado, pero con backlog comercial pendiente. No es backlog en cero.

## Cierre miercoles 17

Se consolido la base comercial en `data/prospectos-barberai-oficial.xlsx` con 67 prospectos existentes y sustentados en archivos del repo. No se subio a 80-100 porque no hay evidencia publica suficiente para crear registros adicionales sin inventar datos.

Estado actualizado:

- Choluteca: BLOQUEADO JUSTIFICADO. Se mantienen solo 2 prospectos validos con fuente publica; completar 20 requiere investigacion manual adicional.
- Contactos verificables: Pendiente parcial. Hay prospectos con telefono/red/social/web, pero 45 registros siguen sin canal publico encontrado.
- Admin GitHub Allan: Pendiente. No hay evidencia local de invitacion, aceptacion o confirmacion como admin/colaborador.
- Evidencia de cierre: `docs/evidencia_miercoles_17.md`.
- Conteos finales: `data/prospectos-barberai-oficial.xlsx`.
- Top 10: `data/prospectos-barberai-oficial.xlsx`.
- Propuesta piloto: `docs/propuesta_piloto_barberai.md`.


