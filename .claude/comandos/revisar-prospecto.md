---
comando: revisar-prospecto
tipo: analisis
requiere_aprobacion_humana: false
entrada_requerida:
  - prospecto
  - ciudad
  - canal
  - prioridad
  - observacion
salida:
  - clasificacion
  - accion_sugerida
  - riesgo
  - estado
bloqueos:
  - no_contactar_sin_canal_verificado
---

Revisar prospecto antes de sugerir acción comercial. Si el canal no está verificado, devolver Requiere revisión.
