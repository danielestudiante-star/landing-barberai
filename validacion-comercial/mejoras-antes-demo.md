# Mejoras antes de demo - BarberAI

Fecha de revision documental: 2026-06-15  
Producto: BarberAI

## Hallazgos confirmados

| Hallazgo | Evidencia | Impacto | Estado |
| --- | --- | --- | --- |
| El repositorio tiene estructura de validacion comercial para BarberAI. | Carpeta `validacion-comercial/` | Permite seguimiento comercial ordenado. | Confirmado |
| El ICP de BarberAI esta documentado. | `validacion-comercial/icp-barberai.md` | Sirve para priorizar barberias, salones y estudios con agenda por redes/WhatsApp. | Confirmado |
| Hay 15 prospectos reales de Comayagua, no 20. | `prospectos/prospectos_barberai_comayagua.xlsx` y `validacion-comercial/exports-google-sheet/prospectos-barberai-normalizados.csv` | Faltan 5 prospectos reales para cerrar la meta del dia. | Backlog |
| No hay capturas reales del deploy en el proyecto. | Busqueda local de imagenes: solo existe `assets/img/simplexity-logo.png`. | No se puede marcar el deploy como listo para demo sin evidencia visual. | Backlog |
| El checklist anterior estaba como plantilla. | Version previa de `validacion-comercial/checklist-lunes.md` | Allan no podia validar cierre real del dia. | Corregido |
| La bitacora anterior tenia campos vacios. | Version previa de `validacion-comercial/bitacora-lunes.md` | El avance del dia no quedaba claro. | Corregido |

## Mejoras recomendadas antes de mostrar a cliente

| Mejora | Prioridad | Evidencia requerida | Estado |
| --- | --- | --- | --- |
| Verificar que el deploy publico cargue correctamente. | Alta | `validacion-comercial/evidencia/01-home-deploy.png` | Pendiente de evidencia |
| Confirmar que el boton de WhatsApp abra correctamente. | Alta | `validacion-comercial/evidencia/04-whatsapp.png` | Pendiente de evidencia |
| Confirmar que el chatbot responda preguntas sobre citas, servicios y horarios. | Alta | `validacion-comercial/evidencia/03-chatbot-respuesta.png` | Pendiente de evidencia |
| Confirmar que la vista movil no tape contenido con el chatbot o WhatsApp. | Alta | `validacion-comercial/evidencia/05-vista-movil.png` | Pendiente de evidencia |
| Revisar que no existan links rotos en CTAs y navegacion. | Media | Captura o nota de prueba en checklist. | Pendiente de evidencia |
| Guardar captura de la tabla de prospectos y hoja oficial si existe acceso. | Media | `validacion-comercial/evidencia/06-prospectos-google-sheet.png` | Pendiente de evidencia |

## Pendientes por confirmar con captura

- Pendiente de evidencia: home del deploy cargando en desktop.
- Pendiente de evidencia: chatbot abierto.
- Pendiente de evidencia: respuesta del chatbot a una pregunta real sobre citas, servicios u horarios.
- Pendiente de evidencia: boton de WhatsApp abriendo el chat correcto.
- Pendiente de evidencia: vista movil sin solapamientos ni desbordes.
- Pendiente de evidencia: tabla de prospectos en Google Sheet o archivo exportado.

## Estado

- Documentacion de checklist: Listo.
- Documentacion de bitacora: Listo.
- Evidencia organizada: Listo.
- Pruebas reales del deploy: Pendiente de evidencia.
- Prospectos de Comayagua: 15/20, faltan 5 reales.
