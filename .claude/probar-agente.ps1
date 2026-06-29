$ErrorActionPreference = "Stop"

node .claude/agente-comercial.mjs `
  --comando preparar-whatsapp `
  --prospecto "Barberia Demo" `
  --ciudad "Tegucigalpa" `
  --prioridad "A" `
  --observacion "Prueba local sin envio real"
