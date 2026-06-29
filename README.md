# BarberAI

Repositorio de landing, materiales comerciales y runner local del agente comercial BarberAI.

## Estado actual

- Landing desplegada y disponible en Railway.
- Agente local funcional en `.claude/agente-comercial.mjs`.
- Ejecucion en modo borrador con aprobacion humana.
- No envia mensajes automaticamente.
- No publica contenido automaticamente.
- No guarda credenciales, tokens, cookies ni sesiones.
- No esta conectado a cuentas reales de WhatsApp, Meta, Facebook o Instagram.

## Runner local

Ejemplo de prueba desde la raiz del repositorio:

```powershell
node .claude/agente-comercial.mjs --comando preparar-whatsapp --prospecto "Barberia Demo" --ciudad "Tegucigalpa" --prioridad A
```

Comandos documentados:

- `preparar-whatsapp`
- `preparar-facebook`
- `preparar-instagram`
- `revisar-prospecto`
- `generar-reporte`
- `modo-aprobacion`

La configuracion del agente esta en `.claude/configuracion.json`. El estado intencional sigue siendo:

- `canales_configurados=false`
- `gateway_activo=false`

Esto significa que el repo puede reportarse como agente local funcional con aprobacion humana, no como agente conectado a cuentas reales.

## Prospectos

- Fuente oficial: `data/prospectos-barberai-oficial.xlsx`.
- Total consolidado: 67 prospectos.
- Estado: borrador/pausa.
- No se ha contactado a ningun prospecto real.
- Cualquier outreach queda pendiente hasta validacion de Allan.

## Artes

Los artes finales exportados estan en `artes/barberai/`.

- 45 piezas planificadas por dia y canal.
- 90 PNG exportados.
- Medidas normalizadas: 45 PNG en 1080x1080 y 45 PNG en 1080x1920.
- Los artes no representan campania activa ni outreach real.

Documentos relacionados:

- `docs/semana-final-barberai/README.md`
- `docs/semana-final-barberai/checklist-entrega-final.md`
- `docs/semana-final-barberai/calendario-15-dias-barberai.md`
- `docs/buyer-persona-barberai.md`

## Formulario de contacto

El formulario sigue documentado como limitacion tecnica. No esta integrado completamente.

Proximo paso recomendado: conectar el formulario a un backend, servicio de correo o base de datos segun alcance definido.
