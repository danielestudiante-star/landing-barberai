const modules = [
  {icon:'⌂', title:'Inicio', short:'Resumen general de la barbería', text:'El módulo Inicio muestra una vista rápida del estado de la barbería. Sirve para que el dueño o administrador vea citas del día, ingresos, clientes en cola, reclamos pendientes y stock bajo sin entrar a cada módulo.', bullets:['Resumen de operación diaria','Indicadores de ventas y citas','Alertas importantes para actuar rápido']},
  {icon:'◷', title:'Citas', short:'Agenda y control de reservas', text:'Citas permite organizar reservas por día, cliente, servicio, barbero, hora y estado. Ayuda a reducir olvidos, confirmar atenciones y controlar la agenda de cada barbero.', bullets:['Nueva cita y agenda diaria','Estados como completada, cancelada o no llegó','Control por cliente, servicio y barbero']},
  {icon:'☷', title:'Cola', short:'Turnos walk-in en tiempo real', text:'Cola organiza a los clientes que llegan sin cita. El equipo puede anotar walk-ins, ver quién está esperando, calcular turnos y mantener orden en horas de alta demanda.', bullets:['Registro de clientes sin cita','Orden de atención por posición','Actualización para el equipo de recepción']},
  {icon:'▣', title:'Ventas', short:'Productos, apartados y cobros', text:'Ventas funciona como punto de venta para productos y servicios. Permite seleccionar productos, armar carrito, elegir caja y método de pago para registrar ingresos.', bullets:['Venta de productos de mostrador','Carrito y total de compra','Registro de caja y forma de pago']},
  {icon:'✂', title:'Servicios', short:'Catálogo de cortes y tratamientos', text:'Servicios administra el catálogo de la barbería. Aquí se definen nombres, categorías, códigos, precios, duración y disponibilidad de cada servicio.', bullets:['Corte de cabello, corte y barba, VIP y más','Precio y duración por servicio','Activar o desactivar servicios']},
  {icon:'☻', title:'Barberos', short:'Equipo, horarios y disponibilidad', text:'Barberos permite registrar al equipo de trabajo, sus estados, especialidades, horarios y relación con citas. Sirve para saber quién atiende y cómo se reparte la agenda.', bullets:['Perfil de cada barbero','Estado activo o inactivo','Control de citas asignadas']},
  {icon:'$', title:'Precios por Sucursal', short:'Precios diferentes según ubicación', text:'Este módulo ajusta precios y disponibilidad por sucursal. Es útil cuando una barbería tiene varias sedes o maneja tarifas distintas por zona.', bullets:['Precio efectivo por sucursal','Filtros por servicio y estado','Disponibilidad según ubicación']},
  {icon:'◈', title:'Inventario', short:'Productos, stock y movimientos', text:'Inventario controla productos de barbería como aceites, acondicionadores, geles, ceras y shampoos. Ayuda a detectar stock bajo y registrar movimientos.', bullets:['Listado de productos','Stock y estado OK o bajo','Movimientos y reposición']},
  {icon:'▤', title:'Sucursales', short:'Configuración de sedes', text:'Sucursales administra las ubicaciones de la empresa, datos de contacto, servicios disponibles, zonas de entrega y configuración fiscal.', bullets:['Lista de sucursales','Teléfono y dirección','Estado activo de cada sede']},
  {icon:'♙', title:'Clientes', short:'Relación, historial y lealtad', text:'Clientes centraliza la información de las personas atendidas por la barbería. Permite ver total de clientes, nivel, pedidos e historial para mejorar la relación.', bullets:['Base de clientes','Teléfono y datos principales','Nivel, puntos e historial']},
  {icon:'!', title:'Reclamos', short:'Quejas y seguimiento', text:'Reclamos ayuda a registrar y resolver quejas de clientes. Permite revisar prioridad, estado, fecha de creación y acciones necesarias.', bullets:['Reclamos pendientes o cerrados','Prioridad de atención','Seguimiento para mejorar el servicio']},
  {icon:'▱', title:'Monitor de Chat', short:'Conversaciones del asistente IA', text:'Monitor de Chat permite revisar conversaciones del chatbot de BarberAI. Sirve para ver sesiones, mensajes, canal, sentimiento y control de la conversación.', bullets:['Conversaciones por WhatsApp','Mensajes y estado activo','Sentimiento positivo o negativo']},
  {icon:'🔔', title:'Notificaciones', short:'Mensajes enviados a clientes', text:'Notificaciones muestra mensajes automáticos enviados por BarberAI, como confirmaciones, cancelaciones, avisos de turno y recordatorios.', bullets:['Mensajes por WhatsApp','Estado enviado, pendiente o fallido','Historial de avisos al cliente']},
  {icon:'♡', title:'Alertas de Sentimiento', short:'Detección de mensajes negativos', text:'Alertas de Sentimiento identifica conversaciones donde el cliente puede estar molesto o insatisfecho. Ayuda al equipo a intervenir antes de perder al cliente.', bullets:['Mensajes con sentimiento negativo','Alertas no leídas o resueltas','Mejora de atención al cliente']},
  {icon:'▥', title:'Analíticas', short:'Métricas e informes', text:'Analíticas reúne datos de citas, ingresos, ocupación y clientes. Ayuda al dueño a entender cómo va la barbería y tomar mejores decisiones.', bullets:['Citas del período','Ingresos y ocupación','Gráficas y reportes']},
  {icon:'?', title:'Manual de Usuario', short:'Guía completa del sistema', text:'Manual de Usuario explica cómo usar BarberAI paso a paso. Es la base para capacitar al personal y resolver dudas internas.', bullets:['Introducción al sistema','Explicación por módulo','Preguntas frecuentes']}
];

const moduleGrid = document.getElementById('moduleGrid');
const modal = document.getElementById('moduleModal');
const modalKicker = document.getElementById('modalKicker');
const modalTitle = document.getElementById('modalTitle');
const modalText = document.getElementById('modalText');
const modalBox = document.getElementById('modalBox');

modules.forEach((m, index) => {
  const btn = document.createElement('button');
  btn.className = 'module-btn';
  btn.innerHTML = `<span>${m.icon}</span><strong>${m.title}</strong><small>${m.short}</small>`;
  btn.addEventListener('click', () => openModule(m, index + 1));
  moduleGrid.appendChild(btn);
});

function openModule(module, number){
  modalKicker.textContent = `Módulo ${String(number).padStart(2,'0')} · BarberAI`;
  modalTitle.textContent = module.title;
  modalText.textContent = module.text;
  modalBox.innerHTML = `<ul>${module.bullets.map(b => `<li>${b}</li>`).join('')}</ul>`;
  modal.classList.add('open');
  modal.setAttribute('aria-hidden','false');
}

function closeModal(){
  modal.classList.remove('open');
  modal.setAttribute('aria-hidden','true');
}

document.getElementById('modalClose').addEventListener('click', closeModal);
modal.addEventListener('click', (e) => { if(e.target === modal) closeModal(); });
document.addEventListener('keydown', (e) => { if(e.key === 'Escape') closeModal(); });

const menuToggle = document.getElementById('menuToggle');
const navLinks = document.getElementById('navLinks');
menuToggle.addEventListener('click', () => navLinks.classList.toggle('open'));
navLinks.querySelectorAll('a').forEach(a => a.addEventListener('click', () => navLinks.classList.remove('open')));

const chatButton = document.getElementById('chatButton');
const chatWindow = document.getElementById('chatWindow');
const closeChat = document.getElementById('closeChat');
const chatForm = document.getElementById('chatForm');
const chatInput = document.getElementById('chatInput');
const chatMessages = document.getElementById('chatMessages');

chatButton.addEventListener('click', () => chatWindow.classList.toggle('open'));
closeChat.addEventListener('click', () => chatWindow.classList.remove('open'));

const answers = [
  {keys:['cita','agenda','reserva'], answer:'BarberAI permite organizar citas por día, cliente, servicio, barbero, hora y estado. Ayuda a evitar olvidos y a mantener la agenda ordenada.'},
  {keys:['cola','turno','walk'], answer:'La cola de BarberAI sirve para clientes que llegan sin cita. Registra el turno, el servicio y el estado para atender en orden.'},
  {keys:['venta','cobro','producto','apartado'], answer:'En ventas puedes registrar productos, apartados, carrito, forma de pago y caja. Es útil para controlar ingresos diarios.'},
  {keys:['inventario','stock','producto'], answer:'Inventario controla productos, stock, estado bajo u OK y movimientos. Sirve para saber cuándo reponer productos de barbería.'},
  {keys:['barbero','equipo','horario'], answer:'El módulo de barberos permite gestionar el equipo, estado activo, especialidades y citas asignadas.'},
  {keys:['whatsapp','chat','mensaje','notificacion'], answer:'BarberAI se conecta con atención por WhatsApp mediante chatbot, notificaciones, confirmaciones, avisos de turno y seguimiento de conversaciones.'},
  {keys:['precio','sucursal'], answer:'Precios por Sucursal permite manejar tarifas diferentes según ubicación y disponibilidad de servicios por sede.'},
  {keys:['demo','contacto','precio'], answer:'Para una demo de BarberAI puedes usar el botón de WhatsApp o el formulario de contacto. La idea es revisar primero qué proceso de tu barbería quieres ordenar.'},
  {keys:['empresa','barberai','que es'], answer:'BarberAI es una empresa tecnológica para barberías. Su objetivo es simplificar la operación diaria con citas, cola, ventas, inventario, clientes, reportes y atención inteligente.'}
];

function addMessage(text, type){
  const div = document.createElement('div');
  div.className = type === 'user' ? 'user-msg' : 'bot-msg';
  div.textContent = text;
  chatMessages.appendChild(div);
  chatMessages.scrollTop = chatMessages.scrollHeight;
}

function getAnswer(question){
  const q = question.toLowerCase();
  const found = answers.find(item => item.keys.some(k => q.includes(k)));
  return found ? found.answer : 'BarberAI ayuda a ordenar barberías con módulos de citas, cola, ventas, servicios, barberos, precios por sucursal, inventario, sucursales, clientes, reclamos, chat, notificaciones y analíticas. Puedes preguntarme por cualquiera de esos módulos.';
}

chatForm.addEventListener('submit', (e) => {
  e.preventDefault();
  const value = chatInput.value.trim();
  if(!value) return;
  addMessage(value, 'user');
  chatInput.value = '';
  setTimeout(() => addMessage(getAnswer(value), 'bot'), 250);
});

document.getElementById('contactForm').addEventListener('submit', (e) => {
  e.preventDefault();
  const name = encodeURIComponent(document.getElementById('name').value.trim());
  const company = encodeURIComponent(document.getElementById('company').value.trim());
  const phone = encodeURIComponent(document.getElementById('phone').value.trim());
  const message = encodeURIComponent(document.getElementById('message').value.trim());
  const text = `Hola BarberAI, quiero una demo.%0A%0ANombre: ${name}%0ABarbería/Empresa: ${company}%0ATeléfono: ${phone}%0AMensaje: ${message}`;
  window.open(`https://wa.me/50662207848?text=${text}`, '_blank');
});


document.getElementById('appointmentForm').addEventListener('submit', (e) => {
  e.preventDefault();
  const name = encodeURIComponent(document.getElementById('apptName').value.trim());
  const phone = encodeURIComponent(document.getElementById('apptPhone').value.trim());
  const service = encodeURIComponent(document.getElementById('apptService').value.trim());
  const barber = encodeURIComponent(document.getElementById('apptBarber').value.trim());
  const date = encodeURIComponent(document.getElementById('apptDate').value);
  const time = encodeURIComponent(document.getElementById('apptTime').value);
  const notes = encodeURIComponent(document.getElementById('apptNotes').value.trim());
  const text = `Hola Simplexity, quiero registrar una solicitud de cita.%0A%0ANombre: ${name}%0AWhatsApp: ${phone}%0AServicio: ${service}%0ABarbero preferido: ${barber || 'Sin preferencia'}%0AFecha deseada: ${date}%0AHora deseada: ${time}%0ANotas: ${notes || 'Sin notas adicionales'}`;
  window.open(`https://wa.me/50662207848?text=${text}`, '_blank');
});
