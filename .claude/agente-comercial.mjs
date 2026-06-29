import fs from "node:fs";
import path from "node:path";

const root = path.resolve(process.cwd());
const configPath = path.join(root, ".claude", "configuracion.json");
const config = JSON.parse(fs.readFileSync(configPath, "utf8"));

const args = parseArgs(process.argv.slice(2));
const comando = args.comando || args.c;

if (!comando) {
  exitWithUsage();
}

if (!config.comandos_disponibles.includes(comando)) {
  console.error(`Comando no permitido: ${comando}`);
  console.error(`Disponibles: ${config.comandos_disponibles.join(", ")}`);
  process.exit(1);
}

const now = new Date();
const fechaSeguimiento = args.fecha_seguimiento || nextBusinessDate(now);
const estado = "Pendiente";

const output = runCommand(comando, args, fechaSeguimiento, estado);
console.log(output);

function runCommand(name, input, fecha, status) {
  switch (name) {
    case "preparar-whatsapp":
      requireFields(input, ["prospecto", "ciudad", "prioridad"]);
      return approvalBlock({
        resumen: `Preparar mensaje de WhatsApp para ${input.prospecto} en ${input.ciudad}. Prioridad ${input.prioridad}.`,
        canal: "WhatsApp",
        accion: "Borrador de acercamiento comercial",
        texto: whatsappMessage(input),
        fecha,
        estado: status
      });
    case "preparar-facebook":
      return approvalBlock({
        resumen: "Preparar borrador para Facebook sobre BarberAI.",
        canal: "Facebook",
        accion: "Borrador de publicación o seguimiento",
        texto: facebookMessage(input),
        fecha,
        estado: status
      });
    case "preparar-instagram":
      return approvalBlock({
        resumen: "Preparar caption o historia para Instagram con estilo BarberAI + Simplexity.",
        canal: "Instagram",
        accion: "Borrador visual/comercial",
        texto: instagramMessage(input),
        fecha,
        estado: status
      });
    case "revisar-prospecto":
      requireFields(input, ["prospecto", "ciudad", "canal", "prioridad"]);
      return reviewProspect(input);
    case "generar-reporte":
      return report(input);
    case "modo-aprobacion":
      return config.modo_aprobacion.mensaje_aprobacion;
    default:
      throw new Error(`Comando sin handler: ${name}`);
  }
}

function whatsappMessage(input) {
  const obs = input.observacion ? ` Observación interna: ${input.observacion}` : "";
  return `Hola, buen día. Le escribe Daniel del equipo BarberAI. Estamos preparando una solución para barberías que ayuda a ordenar citas, clientes, servicios y atención por WhatsApp. Me gustaría saber si actualmente manejan sus citas manualmente o con algún sistema.${obs}`;
}

function facebookMessage(input) {
  const objetivo = input.objetivo || "presentar BarberAI a barberías";
  return `Tu barbería también puede atender mejor.\n\nCon BarberAI podés organizar citas, clientes, servicios y seguimiento desde una experiencia más simple y profesional.\n\nBorrador orientado a: ${objetivo}.\n\nBarberAI - tecnología pensada para negocios reales.`;
}

function instagramMessage(input) {
  const formato = input.formato || "caption";
  return `Más orden para tu barbería.\nMás claridad para tus clientes.\nMás control para tu agenda.\n\nBarberAI está pensado para simplificar la atención diaria.\n\nFormato sugerido: ${formato}.`;
}

function reviewProspect(input) {
  const canalVerificado = ["si", "sí", "true", "verificado"].includes(String(input.canal_verificado || "").toLowerCase());
  const estadoProspecto = canalVerificado ? "Pendiente" : "Requiere revisión";
  const riesgo = canalVerificado ? "Bajo: canal marcado como verificado." : "Alto: canal no verificado. No contactar todavía.";
  const accion = canalVerificado ? `Preparar contacto por ${input.canal}.` : "Validar canal antes de preparar contacto.";

  return [
    `Prospecto: ${input.prospecto}`,
    `Ciudad: ${input.ciudad}`,
    `Canal: ${input.canal}`,
    `Prioridad: ${input.prioridad}`,
    `Clasificación: barbería/salón o negocio relacionado por revisar manualmente`,
    `Acción sugerida: ${accion}`,
    `Riesgo: ${riesgo}`,
    `Estado: ${estadoProspecto}`
  ].join("\n");
}

function report(input) {
  return [
    "Reporte operativo BarberAI",
    `Acciones preparadas: ${input.acciones || "No especificadas"}`,
    `Pendientes: ${input.pendientes || "Revisión humana y configuración autorizada"}`,
    `Riesgos: ${input.riesgos || "Evitar mensajes automáticos, spam y uso de credenciales"}`,
    `Siguiente paso: ${input.siguiente_paso || "Revisar borradores y aprobar manualmente"}`
  ].join("\n");
}

function approvalBlock({ resumen, canal, accion, texto, fecha, estado }) {
  return [
    `Resumen: ${resumen}`,
    `Canal: ${canal}`,
    `Acción propuesta: ${accion}`,
    "Texto preparado:",
    texto,
    `Fecha de seguimiento: ${fecha}`,
    `Estado: ${estado}`,
    "",
    config.modo_aprobacion.mensaje_aprobacion
  ].join("\n");
}

function requireFields(input, fields) {
  const missing = fields.filter((field) => !input[field]);
  if (missing.length) {
    console.error(`Faltan campos: ${missing.join(", ")}`);
    process.exit(1);
  }
}

function parseArgs(tokens) {
  const parsed = {};
  for (let i = 0; i < tokens.length; i += 1) {
    const token = tokens[i];
    if (!token.startsWith("--")) continue;
    const key = token.slice(2);
    const next = tokens[i + 1];
    parsed[key] = next && !next.startsWith("--") ? next : true;
    if (parsed[key] === next) i += 1;
  }
  return parsed;
}

function nextBusinessDate(date) {
  const next = new Date(date);
  next.setDate(next.getDate() + 2);
  return next.toISOString().slice(0, 10);
}

function exitWithUsage() {
  console.log("Uso:");
  console.log("node .claude/agente-comercial.mjs --comando preparar-whatsapp --prospecto \"Barbería X\" --ciudad \"Tegucigalpa\" --prioridad A --observacion \"Atiende por WhatsApp\"");
  console.log(`Comandos: ${config.comandos_disponibles.join(", ")}`);
  process.exit(1);
}
