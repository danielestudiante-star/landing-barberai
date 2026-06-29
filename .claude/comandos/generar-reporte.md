---
comando: generar-reporte
tipo: reporte
requiere_aprobacion_humana: false
entrada_requerida:
  - acciones
  - pendientes
  - riesgos
salida:
  - acciones_preparadas
  - pendientes
  - riesgos
  - siguiente_paso
---

Generar resumen operativo de acciones preparadas, pendientes, riesgos y siguiente paso. No marcar nada como enviado o publicado sin confirmación humana.
