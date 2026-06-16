# Bitacora martes 16 - Validacion comercial BarberAI

## Datos del dia

- Fecha: martes 16 de junio de 2026
- Producto: BarberAI
- Responsable: Daniel
- Foco del dia: validacion comercial, prospectos, campaña, agente de WhatsApp y evidencia.
- Deploy publico: https://landing-barberai-production.up.railway.app

## Actividades realizadas

| Actividad | Estado | Evidencia / archivo | Observacion |
|---|---|---|---|
| Revisar prospectos previos | Completado | `validacion-comercial/prospectos-comayagua.csv` | Se reviso la base previa para evitar duplicados exactos. |
| Crear tabla de prospectos martes 16 | Completado | `validacion-comercial/prospectos-martes-16-barberai.csv` | Se agregaron 25 prospectos nuevos. |
| Clasificar mejores 10 prospectos | Completado | `validacion-comercial/mejores-10-prospectos-barberai.md` | Ranking preparado con razon y proximo paso. |
| Preparar campaña de marketing | Completado | `validacion-comercial/campania-marketing-martes-16-barberai.md` | Incluye audiencia, ciudades, presupuesto, anuncios, artes, CTA y metricas. |
| Preparar propuesta de agente WhatsApp | Completado | `validacion-comercial/agente-whatsapp-martes-16-barberai.md` | Flujo comercial documentado; no se desarrollo una nueva funcion. |
| Actualizar checklist | Completado | `validacion-comercial/checklist-martes-16.md` | Incluye estados y pendientes de evidencia. |
| Actualizar reporte para Allan | Completado | `validacion-comercial/reporte-diario-allan-barberai.md` | Se agrego seccion de martes 16. |
| Actualizar README | Completado | `README.txt` | Se agrego avance martes 16. |

## Prospectos

- Prospectos nuevos agregados hoy: 25.
- Rubro: barberias, barber shops, salones y negocios similares.
- Ciudades principales: Tegucigalpa y San Pedro Sula.
- Fuente principal: OpenStreetMap/Overpass/Nominatim.
- Campos no encontrados: marcados como `No encontrado`.
- Nota: no se inventaron telefonos, dueños, redes, reseñas ni conversaciones.

## Mejores 10

Los mejores 10 quedaron documentados en `validacion-comercial/mejores-10-prospectos-barberai.md`.

Resumen del criterio:

- Prioridad mayor para negocios con red social visible, horario publico, nombre comercial claro o encaje directo con BarberAI.
- No se asumio movimiento en redes, reseñas o reservas por WhatsApp si la fuente no lo mostraba.
- Los prospectos sin contacto visible requieren investigacion manual antes de outreach.

## Campaña

La campaña inicial quedo preparada para dueños y encargados de barberias/salones que atienden por WhatsApp.

Incluye:

- Audiencia objetivo.
- Ciudades para pauta inicial.
- Presupuesto recomendado.
- 3 mensajes de anuncio.
- 3 ideas de artes estilo Simplexity/HotelAI.
- CTA recomendado: WhatsApp, demo o reunion.
- Metricas para medir conversaciones, demos y calidad de prospectos.

## Agente de WhatsApp

Se documento un flujo basico de prospeccion:

- Primer mensaje.
- Preguntas de calificacion.
- Criterios para prospecto A/B/C.
- Reglas para escalar a humano.
- Seguimientos de 24 y 72 horas.

No se implemento ningun bot nuevo en el sitio.

## Evidencia pendiente

- Captura real de Google Sheet oficial si Allan habilita acceso.
- Capturas o links de fuentes revisadas, si Allan las solicita.
- Completar +20 prospectos de Choluteca con fuentes manuales adicionales.
- Completar contacto verificable de al menos 10 mejores prospectos antes de outreach.

## Correccion despues de revision Allan

- Se agregaron capturas reales en `validacion-comercial/evidencia/`.
- Se creo `validacion-comercial/prospectos-ciudades-asignadas-martes-16-barberai.csv` con 20 prospectos de Atlantida y 2 prospectos validos de Choluteca encontrados en fuentes publicas.
- Se documento el bloqueo de Choluteca en `validacion-comercial/bloqueos-ciudades-asignadas-martes-16.md`.
- Se actualizo `validacion-comercial/mejores-10-prospectos-barberai.md` con top 10 por ciudades asignadas.
- Se limpio el duplicado de `responderBarberAI` en `index.html`.
- Se documento que el formulario de contacto actual solo muestra un alert y queda como pendiente para cliente real.

## Cierre para Allan

Allan, avance de BarberAI martes 16: se agregaron prospectos, se clasificaron mejores 10, se preparo campaña inicial, se documento el flujo del agente WhatsApp y se subieron capturas reales del deploy. Atlantida quedo con 20 prospectos. Choluteca queda pendiente porque las fuentes publicas consultadas solo devolvieron 2 prospectos validos; no se inventaron datos. Tambien queda pendiente completar contactos verificables de los mejores prospectos antes de outreach.
