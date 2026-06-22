# Backlog BarberAI

## Reglas

- Todo lo no terminado al cierre del dia se arrastra al Backlog.
- El Backlog se trabaja antes de tareas nuevas.
- Si el Backlog pasa de 5 tareas, avisar a Allan.
- El viernes no se inicia demo si el Backlog no esta en 0.
- No se inventan prospectos, capturas ni resultados de pruebas.

## Revision S1 antes de producir artes

Fecha de actualizacion: 22 de junio de 2026.  
Objetivo inmediato: validar estilo con 3 artes piloto, no producir las 45 piezas completas.

| Tarea / frente | Estado | Responsable | Evidencia / ruta | Explicacion |
| --- | --- | --- | --- | --- |
| Evidencia tecnica de landing, chatbot, WhatsApp y movil. | Listo | Daniel | `validacion-comercial/evidencia/` | Capturas existentes en repo. |
| Base comercial local sustentada. | Listo | Daniel | `data/prospectos-barberai-oficial.xlsx` | Se trabaja con 67 prospectos reales documentados; no se inventan registros. |
| Top 10 y propuesta piloto. | Listo | Daniel | `data/prospectos-barberai-oficial.xlsx`, `docs/propuesta_piloto_barberai.md` | Material comercial listo para revision previa. |
| Buyer persona final. | Listo | Daniel | `docs/buyer-persona-barberai.md` | Documento creado para orientar mensajes y canales. |
| Calendario 15 dias / 45 piezas. | Pendiente real | Daniel | `docs/calendario-15-dias-45-piezas.md` | Estructura creada en Borrador/Pausa. La produccion completa queda detenida hasta aprobacion. |
| 3 artes piloto. | Listo para validacion | Daniel | `artes/piloto/facebook-piloto-1080x1080.png`, `artes/piloto/instagram-piloto-1080x1080.png`, `artes/piloto/whatsapp-piloto-1080x1920.png` | Artes visuales exportados con marca Simplexity, foto real, mensaje unico y CTA; falta aprobacion Allan antes de producir las 45 piezas. |
| Choluteca incompleto. | Bloqueado externo | Daniel / fuentes externas | `validacion-comercial/bloqueos-ciudades-asignadas-martes-16.md` | Solo hay 2 prospectos validos en evidencia local; completar requiere investigacion manual externa. |
| Contactos verificables faltantes. | Bloqueado externo | Daniel / fuentes externas | `data/prospectos-barberai-oficial.xlsx` | Falta verificar canales publicos antes de outreach; no se agregan telefonos/redes sin fuente. |
| Admin GitHub Allan. | Bloqueado externo | Allan / GitHub | `docs/evidencia_github_allan.md` | No existe evidencia local de invitacion, aceptacion o permiso admin. |
| Hoja oficial. | Bloqueado externo | Responsable con acceso | `data/prospectos-barberai-oficial.xlsx` como respaldo local | Falta acceso o captura actualizada de la hoja oficial. No se declara actualizada sin evidencia. |
| Formulario. | Pendiente real tecnico | Equipo tecnico | Pendiente de integracion | El formulario no queda cerrado hasta conectarlo a WhatsApp, email, Google Sheet, backend o CRM. |
| Contacto real a prospectos. | Pendiente real / Pausa | Allan / Daniel | N/A | No se contacta a prospectos reales hasta recibir aprobacion del estilo por Allan. |

## Tareas

| Tarea | Dia de origen | Prioridad | Estado | Responsable | Fecha limite | Evidencia requerida | Nota |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Completar prospectos reales para llegar a 20 en Comayagua. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | Excel oficial con negocio real, ciudad, tipo y fuente publica. | Excel oficial actualizado hasta B-020. B-018 a B-020 requieren confirmar telefono o red social antes de outreach. |
| Subir captura real de la pagina principal del deploy. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | `validacion-comercial/evidencia/01-home-deploy.png` | Captura real tomada del deploy publico. |
| Subir captura real del chatbot abierto. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | `validacion-comercial/evidencia/02-chatbot-abierto.png` | Captura real tomada del deploy publico. |
| Subir captura real de una respuesta del chatbot. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | `validacion-comercial/evidencia/03-chatbot-respuesta.png` | Pregunta real sobre citas y horarios. |
| Subir captura real del boton de WhatsApp funcionando. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | `validacion-comercial/evidencia/04-whatsapp.png` | Se valido el enlace `https://wa.me/50492157819...` con Playwright. |
| Subir captura real de la vista movil. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | `validacion-comercial/evidencia/05-vista-movil.png` | Captura real en viewport movil. |
| Actualizar checklist cuando las evidencias esten subidas. | Lunes 15 | Alta | Listo | Daniel | 2026-06-16 | `validacion-comercial/checklist-martes-16.md` con rutas reales enlazadas. | Checklist actualizado despues de capturas. |
| Completar +20 prospectos de Atlantida. | Martes 16 | Alta | Listo | Daniel | 2026-06-16 | `data/prospectos-barberai-oficial.xlsx` | 20 prospectos publicos encontrados en La Ceiba/Tela. |
| Completar +20 prospectos de Choluteca. | Martes 16 | Alta | Pendiente externo documentado | Daniel | 2026-06-17 | `validacion-comercial/bloqueos-ciudades-asignadas-martes-16.md` | Reconsulta Overpass/Nominatim para todo Choluteca solo devolvio 2 prospectos validos. No se inventan negocios; completar requiere Google Business/Facebook/Instagram desde sesion manual. No bloquea el cierre documental del viernes. |
| Completar WhatsApp/Facebook/Instagram de al menos 10 mejores prospectos. | Martes 16 | Alta | Listo con limitacion | Daniel | 2026-06-16 | `data/prospectos-barberai-oficial.xlsx` y `data/prospectos-barberai-oficial.xlsx` | Se documentaron 22 contactos verificables en la base completa. Registros sin telefono/red social quedan identificados para verificacion antes de outreach. |
| Documentar limitacion del formulario de contacto. | Martes 16 | Media | Listo | Daniel | 2026-06-16 | Este backlog y reporte diario. | El formulario actual solo muestra un alert; no esta integrado. Para cliente real debe enviar a WhatsApp, email, Google Sheet o backend. |
| Agregar a Allan como admin/colaborador en GitHub. | Lunes 15 | Alta | Pendiente externo documentado | Daniel | 2026-06-17 | Captura de invitacion, aceptacion de Allan o confirmacion en configuracion del repo. | No se encontro evidencia local de invitacion ni aceptacion. Falta confirmar desde GitHub; no se inventa captura. |
| Avisar a Allan para nueva revision. | Lunes 15 | Media | Listo | Daniel | 2026-06-16 | Mensaje de estado final con prospectos y evidencias reales. | Revisado sobre el commit d73b9ad. El supervisor confirmo avance validado, backlog ordenado y pendientes externos documentados. |

## Estado de cierre viernes 19

Fecha de cierre: viernes 19 de junio de 2026.

El backlog interno del repo queda cerrado para el avance semanal comercial/documental. No quedan tareas internas sin clasificar que impidan subir el cierre a `main`.

Lo que quedo cerrado:

- Evidencia tecnica del deploy, chatbot, WhatsApp y vista movil.
- Base comercial sustentada con 67 prospectos reales.
- Top 10 comercial y propuesta piloto.
- Copies, campana documental, presupuesto, KPIs y flujo de prospeccion.
- Guion base de mini-demo y brief de artes.
- Limitaciones documentadas sin inventar evidencia.

Limitaciones que siguen documentadas para seguimiento posterior:

- Completar Choluteca hasta 20 solo con negocios reales verificados.
- Verificar contactos de prospectos sin telefono/red social antes de outreach.
- Confirmar admin GitHub para Allan con evidencia desde GitHub.
- Integrar el formulario de contacto si se abre fase tecnica; hoy queda como limitacion documentada.

Estas limitaciones son externas o requieren validacion manual adicional. No se declaran como entregables completados porque no existe evidencia local suficiente.

## Cierre miercoles 17

Daniel consolido el cierre comercial en:

- `data/prospectos-barberai-oficial.xlsx`
- `data/prospectos-barberai-oficial.xlsx`
- `data/prospectos-barberai-oficial.xlsx`
- `docs/propuesta_piloto_barberai.md`
- `docs/bitacora_miercoles_17_barberai.md`
- `docs/evidencia_miercoles_17.md`

Estado final:

- Base real sustentada: 67 prospectos.
- Meta 80-100: no alcanzada por falta de evidencia suficiente; no se inventaron negocios ni contactos.
- Choluteca: BLOQUEADO JUSTIFICADO con 2 registros validos.
- Contactos faltantes: pendientes de verificacion manual antes de outreach.
- GitHub admin Allan: pendiente por falta de evidencia local.
- Hoja oficial: pendiente si no hay acceso o captura actualizada.
- Formulario: pendiente tecnico mientras no este integrado completamente.


