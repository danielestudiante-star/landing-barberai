---
comando: modo-aprobacion
tipo: control
requiere_aprobacion_humana: true
mensaje: "Acción lista para revisión. Escriba APROBAR para continuar o EDITAR para corregir."
acciones_permitidas:
  - preparar_borrador
  - marcar_aprobado_para_ejecucion_manual
acciones_bloqueadas:
  - enviar_automaticamente
  - publicar_automaticamente
  - guardar_credenciales
---

Antes de cualquier acción real, mostrar resumen y pedir: "Acción lista para revisión. Escriba APROBAR para continuar o EDITAR para corregir."
