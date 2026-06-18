# Validacion WhatsApp Top 10 BarberAI

Fecha de validacion: 18 de junio de 2026

## Alcance

Se revisaron los telefonos del Top 10 comercial de BarberAI sin enviar mensajes a los negocios. La validacion se hizo con enlaces `wa.me` para confirmar que el enlace click-to-chat responde y redirige a WhatsApp.

Importante: un HTTP 200 en `wa.me` valida que el enlace abre el flujo de WhatsApp, pero no reemplaza la confirmacion visual dentro de WhatsApp antes de escribir. Antes del outreach, abrir cada enlace, verificar que no muestre error de numero invalido y registrar captura si el flujo muestra chat disponible.

## Regla de contacto

- No contactar prospectos marcados como `No encontrado`, `Pendiente de verificar` o sin canal oficial.
- Usar solo prospectos con telefono, WhatsApp, Facebook o Instagram documentado.
- No enviar mensajes hasta completar la confirmacion visual del canal en WhatsApp o red social.
- Si un numero no abre chat o muestra error, reemplazar ese prospecto por otro contacto verificable.

## Resultado tecnico de enlaces `wa.me`

| Numero | Negocio | Enlace probado | Resultado tecnico | Estado para outreach |
|---:|---|---|---|---|
| 1 | E Cavaleiro | `https://wa.me/50492669247` | HTTP 200, redirige a `api.whatsapp.com/send` | Requiere confirmacion visual antes de escribir |
| 2 | NOVO Studio & Barber | `https://wa.me/50431938081` | HTTP 200, redirige a `api.whatsapp.com/send` | Requiere confirmacion visual antes de escribir |
| 3 | Blessing Barber Shop | `https://wa.me/50496441679` | HTTP 200, redirige a `api.whatsapp.com/send` | Requiere confirmacion visual antes de escribir |
| 4 | Douglas Almendares Salon | `https://wa.me/50495734280` | HTTP 200, redirige a `api.whatsapp.com/send` | Requiere confirmacion visual antes de escribir |
| 5 | Allure Day Spa & Salon | `https://wa.me/50499123052` | HTTP 200, redirige a `api.whatsapp.com/send` | Requiere confirmacion visual antes de escribir |
| 5b | Allure Day Spa & Salon | `https://wa.me/50427722122` | HTTP 200, redirige a `api.whatsapp.com/send` | Requiere confirmacion visual antes de escribir |
| 6 | Bella Studio | `https://wa.me/50495992271` | HTTP 200, redirige a `api.whatsapp.com/send` | Requiere confirmacion visual antes de escribir |
| 7 | Pronabelle Sala de Belleza | `https://wa.me/50433480658` | HTTP 200, redirige a `api.whatsapp.com/send` | Requiere confirmacion visual antes de escribir |
| 8 | Ellas Salon | `https://wa.me/50495872546` | HTTP 200, redirige a `api.whatsapp.com/send` | Requiere confirmacion visual antes de escribir |
| 9 | Kary Beauty Salon | `https://wa.me/50488368171` | HTTP 200, redirige a `api.whatsapp.com/send` | Requiere confirmacion visual antes de escribir |
| 10 | AE Nail Studio | `https://wa.me/50499090478` | HTTP 200, redirige a `api.whatsapp.com/send` | Requiere confirmacion visual antes de escribir |

## Pendiente tecnico documentado

El formulario de la landing sigue pendiente si se quieren capturar leads reales desde el sitio. Para fase comercial, queda documentado como pendiente tecnico y no bloquea la prospeccion manual, siempre que los contactos se validen antes de escribir.

## Pendiente GitHub / Allan

No se agrega evidencia de Allan como administrador o colaborador de GitHub porque requiere captura desde la interfaz de GitHub en la seccion de colaboradores o invitaciones. Si sigue siendo requisito de cierre, tomar captura de esa pantalla y guardarla en `evidencias/capturas/`.
