---
comando: preparar-facebook
tipo: borrador
canal: Facebook
requiere_aprobacion_humana: true
entrada_requerida:
  - objetivo
  - audiencia
  - observacion
salida:
  - resumen
  - texto_preparado
  - estado
bloqueos:
  - no_publicar_automaticamente
  - no_credenciales
  - no_resultados_inventados
---

Preparar publicación o mensaje para Facebook relacionado con BarberAI. No publicar. Devolver borrador y solicitar APROBAR o EDITAR.
