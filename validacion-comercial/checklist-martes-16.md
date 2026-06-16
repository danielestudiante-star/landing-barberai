# Checklist martes 16 - BarberAI

Fecha: martes 16 de junio de 2026

| Entregable | Estado | Evidencia / archivo | Observacion |
|---|---|---|---|
| Tabla de prospectos actualizada | Completado | `validacion-comercial/prospectos-martes-16-barberai.csv` | Se agrego archivo nuevo para el dia martes 16. |
| 25 prospectos nuevos agregados | Completado | `validacion-comercial/prospectos-martes-16-barberai.csv` | Prospectos nuevos fuera del archivo previo de Comayagua. |
| Mejores 10 clasificados | Completado | `validacion-comercial/mejores-10-prospectos-barberai.md` | Ranking basado en señales publicas disponibles; no se asumieron reseñas ni actividad no verificada. |
| Campaña inicial preparada | Completado | `validacion-comercial/campania-marketing-martes-16-barberai.md` | Incluye audiencia, ciudades, presupuesto, mensajes, artes, CTA y metricas. |
| Propuesta de agente WhatsApp preparada | Completado | `validacion-comercial/agente-whatsapp-martes-16-barberai.md` | Flujo comercial documentado; no se implemento una nueva funcion. |
| Bitacora del martes actualizada | Completado | `validacion-comercial/bitacora-martes-16.md` | Resume actividades, evidencia pendiente y cierre para Allan. |
| Evidencia pendiente si no hay capturas reales | Completado | `validacion-comercial/evidencia/` | Se agregaron capturas reales del deploy, chatbot, WhatsApp, movil y tabla local. |
| Pendientes para completar antes de enviar reporte | En revisión | Este checklist y reporte diario | Confirmar telefonos/redes faltantes, subir capturas reales y revisar con Allan antes de publicar resultados. |
| Deploy publico probado con captura | Completado | `validacion-comercial/evidencia/01-home-deploy.png` | Captura real del deploy publico en desktop. |
| Chatbot abierto con captura | Completado | `validacion-comercial/evidencia/02-chatbot-abierto.png` | Captura real del chatbot abierto. |
| Pregunta y respuesta del chatbot | Completado | `validacion-comercial/evidencia/03-chatbot-respuesta.png` | Captura real con pregunta sobre citas y horarios. |
| Boton de WhatsApp validado | Completado | `validacion-comercial/evidencia/04-whatsapp.png` | Se valido href `https://wa.me/50492157819...` con Playwright y se guardo captura. |
| Vista movil con captura | Completado | `validacion-comercial/evidencia/05-vista-movil.png` | Captura real en viewport movil 390x844. |
| Tabla local de prospectos con captura | Completado | `validacion-comercial/evidencia/06-prospectos-tabla-local.png` | Captura regenerada desde `validacion-comercial/prospectos-ciudades-asignadas-martes-16-barberai.csv`; no es Google Sheet. |
| Prospectos Atlantida asignados | Completado | `validacion-comercial/prospectos-ciudades-asignadas-martes-16-barberai.csv` | 20 prospectos publicos encontrados en La Ceiba/Tela. |
| Prospectos Choluteca asignados | Backlog bloqueado | `validacion-comercial/bloqueos-ciudades-asignadas-martes-16.md` | Solo 2 prospectos validos encontrados en fuentes publicas; no se inventaron 20. Requiere verificacion manual en Google Business/Facebook/Instagram. |
| Completar contactos de mejores 10 | Listo parcial | `validacion-comercial/contactos-verificables-barberai.md` | Se documentaron 19 contactos verificables en la base completa. Siguen pendientes los registros sin telefono/red social antes de outreach. |
| Documentar formulario de contacto | Completado | `validacion-comercial/backlog-barberai.md` | El formulario muestra `alert`; para cliente real debe enviar a WhatsApp, email, Google Sheet o backend. |
| Limpiar duplicado de `responderBarberAI` | Completado | `index.html` | Se elimino la definicion vieja pisada; queda una sola funcion activa. |
| Contacto inicial a prospectos | Backlog | Hoja de seguimiento pendiente | No se contacto a prospectos desde este entorno. |
| Allan admin/colaborador GitHub | Backlog | `validacion-comercial/tareas-s1-barberai.md` | No se encontro evidencia local de invitacion, aceptacion o confirmacion en configuracion del repo. |

## Confirmaciones

- No se agregaron funciones nuevas al sitio; solo se limpio una definicion duplicada del chatbot.
- No se agregaron agenda, base de datos, API ni panel.
- Campos no encontrados quedaron como `No encontrado`.
- La evidencia visual real ya fue agregada en `validacion-comercial/evidencia/`.
- Daniel puede cerrar el trabajo de hoy como avance aprobado, pero con backlog comercial pendiente. No es backlog en cero.
