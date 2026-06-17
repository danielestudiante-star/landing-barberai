# Backlog BarberAI

## Reglas

- Todo lo no terminado al cierre del dia se arrastra al Backlog.
- El Backlog se trabaja antes de tareas nuevas.
- Si el Backlog pasa de 5 tareas, avisar a Allan.
- El viernes no se inicia demo si el Backlog no esta en 0.
- No se inventan prospectos, capturas ni resultados de pruebas.

## Tareas

| Tarea | Dia de origen | Prioridad | Estado | Responsable | Fecha limite | Evidencia requerida | Nota |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Completar prospectos reales para llegar a 20 en Comayagua. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | CSV/Sheet con negocio real, ciudad, tipo y fuente publica. | CSV normalizado actualizado hasta B-020. B-018 a B-020 requieren confirmar telefono o red social antes de outreach. |
| Subir captura real de la pagina principal del deploy. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | `validacion-comercial/evidencia/01-home-deploy.png` | Captura real tomada del deploy publico. |
| Subir captura real del chatbot abierto. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | `validacion-comercial/evidencia/02-chatbot-abierto.png` | Captura real tomada del deploy publico. |
| Subir captura real de una respuesta del chatbot. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | `validacion-comercial/evidencia/03-chatbot-respuesta.png` | Pregunta real sobre citas y horarios. |
| Subir captura real del boton de WhatsApp funcionando. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | `validacion-comercial/evidencia/04-whatsapp.png` | Se valido el enlace `https://wa.me/50492157819...` con Playwright. |
| Subir captura real de la vista movil. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | `validacion-comercial/evidencia/05-vista-movil.png` | Captura real en viewport movil. |
| Actualizar checklist cuando las evidencias esten subidas. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | `validacion-comercial/checklist-martes-16.md` con rutas reales enlazadas. | Checklist actualizado despues de capturas. |
| Completar +20 prospectos de Atlantida. | Martes 16 | Alta | Listo | Daniel | 2026-06-16 | `validacion-comercial/prospectos-ciudades-asignadas-martes-16-barberai.csv` | 20 prospectos publicos encontrados en La Ceiba/Tela. |
| Completar +20 prospectos de Choluteca. | Martes 16 | Alta | Backlog bloqueado | Daniel | 2026-06-17 | `validacion-comercial/bloqueos-ciudades-asignadas-martes-16.md` | Reconsulta Overpass/Nominatim para todo Choluteca solo devolvio 2 prospectos validos. No se inventan negocios; requiere Google Business/Facebook/Instagram desde sesion manual. |
| Completar WhatsApp/Facebook/Instagram de al menos 10 mejores prospectos. | Martes 16 | Alta | Listo parcial | Daniel | 2026-06-16 | `validacion-comercial/contactos-verificables-barberai.md` | Se documentaron 19 contactos verificables en la base completa. Siguen pendientes los registros sin telefono/red social antes de outreach. |
| Documentar limitacion del formulario de contacto. | Martes 16 | Media | Listo | Daniel | 2026-06-16 | Este backlog y reporte diario. | El formulario actual solo muestra un alert; no esta integrado. Para cliente real debe enviar a WhatsApp, email, Google Sheet o backend. |
| Agregar a Allan como admin/colaborador en GitHub. | Lunes 15 | Alta | Backlog | Daniel | 2026-06-17 | Captura de invitacion, aceptacion de Allan o confirmacion en configuracion del repo. | No se encontro evidencia local de invitacion ni aceptacion. Falta confirmar desde GitHub. |
| Avisar a Allan para nueva revision. | Lunes 15 | Media | En revision | Daniel | 2026-06-16 | Mensaje de estado final con prospectos y evidencias reales. | Daniel puede cerrar el trabajo de hoy como avance aprobado, pero con backlog comercial pendiente. No es backlog en cero. |

## Estado de cierre

Daniel puede cerrar el trabajo de hoy como avance aprobado, pero con backlog comercial pendiente. No es backlog en cero.

Queda abierto para el siguiente bloque:

- Completar Choluteca hasta 20 solo con negocios reales verificados.
- Verificar contactos de los prospectos sin telefono/red social.
- Confirmar admin GitHub para Allan con evidencia.
- Integrar el formulario de contacto; hoy solo esta documentado como limitacion.

## Cierre miercoles 17

Daniel consolido el cierre comercial en:

- `data/prospectos_barberai.csv`
- `docs/conteos_finales_barberai.md`
- `docs/top_10_barberai.md`
- `docs/propuesta_piloto_barberai.md`
- `docs/bitacora_miercoles_17_barberai.md`
- `docs/evidencia_miercoles_17.md`

Estado final:

- Base real sustentada: 67 prospectos.
- Meta 80-100: no alcanzada por falta de evidencia suficiente; no se inventaron negocios ni contactos.
- Choluteca: BLOQUEADO JUSTIFICADO con 2 registros validos.
- Contactos faltantes: pendientes de verificacion manual antes de outreach.
- GitHub admin Allan: pendiente por falta de evidencia local.
