---
comando: preparar-whatsapp
tipo: borrador
canal: WhatsApp
requiere_aprobacion_humana: true
entrada_requerida:
  - prospecto
  - ciudad
  - prioridad
  - observacion
salida:
  - resumen
  - mensaje_preparado
  - fecha_seguimiento
  - estado
bloqueos:
  - no_enviar_automaticamente
  - no_spam
  - no_credenciales
---

Preparar un mensaje de WhatsApp para un prospecto de BarberAI. No enviar nada. Devolver borrador y solicitar APROBAR o EDITAR.
