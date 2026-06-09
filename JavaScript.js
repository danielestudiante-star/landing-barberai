// BarberAI - JavaScript principal
// Funciona con el HTML actual y con el CSS de referencia del supervisor.

document.addEventListener("DOMContentLoaded", () => {
    iniciarScrollSuave();
    iniciarContadores();
    iniciarAnimaciones();
    iniciarFormulario();
    crearChatbot();
    marcarSeccionActiva();
});

/* =========================
   SCROLL SUAVE
========================= */

function iniciarScrollSuave() {
    const enlaces = document.querySelectorAll('a[href^="#"]');

    enlaces.forEach(enlace => {
        enlace.addEventListener("click", (evento) => {
            const destino = enlace.getAttribute("href");

            if (!destino || destino === "#") return;

            const seccion = document.querySelector(destino);

            if (seccion) {
                evento.preventDefault();
                seccion.scrollIntoView({
                    behavior: "smooth",
                    block: "start"
                });
            }
        });
    });
}

/* =========================
   CONTADORES AUTOMÁTICOS
========================= */

function iniciarContadores() {
    const contadores = document.querySelectorAll("[data-counter]");

    if (contadores.length === 0) return;

    contadores.forEach(contador => {
        const objetivo = Number(contador.dataset.counter);
        let actual = 0;
        const velocidad = Math.max(1, Math.ceil(objetivo / 60));

        const intervalo = setInterval(() => {
            actual += velocidad;

            if (actual >= objetivo) {
                contador.textContent = objetivo;
                clearInterval(intervalo);
            } else {
                contador.textContent = actual;
            }
        }, 25);
    });
}

/* =========================
   ANIMACIÓN AL BAJAR
========================= */

function iniciarAnimaciones() {
    const elementos = document.querySelectorAll(
        "section, .feature-item, .service-item, .benefit-card, .industry-item, .testimonial-item, .product-card-preview, .problem-card, .solution-card"
    );

    elementos.forEach(elemento => {
        elemento.style.opacity = "0";
        elemento.style.transform = "translateY(25px)";
        elemento.style.transition = "opacity 0.6s ease, transform 0.6s ease";
    });

    const observer = new IntersectionObserver((entradas) => {
        entradas.forEach(entrada => {
            if (entrada.isIntersecting) {
                entrada.target.style.opacity = "1";
                entrada.target.style.transform = "translateY(0)";
                observer.unobserve(entrada.target);
            }
        });
    }, {
        threshold: 0.15
    });

    elementos.forEach(elemento => observer.observe(elemento));
}

/* =========================
   FORMULARIO
========================= */

function iniciarFormulario() {
    const formulario = document.querySelector(".contact-form");

    if (!formulario) return;

    formulario.addEventListener("submit", (evento) => {
        evento.preventDefault();
        procesarFormulario(formulario);
    });

    const boton = formulario.querySelector(".submit-button");

    if (boton) {
        boton.addEventListener("click", () => {
            procesarFormulario(formulario);
        });
    }
}

function procesarFormulario(formulario) {
    const campos = formulario.querySelectorAll("input, textarea");
    let datosCompletos = true;

    campos.forEach(campo => {
        const valor = campo.value.trim();

        if (valor === "") {
            datosCompletos = false;
            campo.style.borderColor = "#dc3545";
            campo.style.boxShadow = "0 0 0 0.2rem rgba(220,53,69,0.18)";
        } else {
            campo.style.borderColor = "#28a745";
            campo.style.boxShadow = "0 0 0 0.2rem rgba(40,167,69,0.18)";
        }
    });

    if (!datosCompletos) {
        mostrarNotificacion("Revisa el formulario. Hay campos pendientes.", "error");
        return;
    }

    mostrarNotificacion("Solicitud registrada correctamente. BarberAI puede preparar la demo.", "ok");
    formulario.reset();

    campos.forEach(campo => {
        campo.style.borderColor = "#ced4da";
        campo.style.boxShadow = "none";
    });
}

function fakeSubmit() {
    const formulario = document.querySelector(".contact-form");

    if (formulario) {
        procesarFormulario(formulario);
    }
}

/* =========================
   NOTIFICACIONES
========================= */

function mostrarNotificacion(mensaje, tipo) {
    let notificacion = document.querySelector(".barberai-notificacion");

    if (!notificacion) {
        notificacion = document.createElement("div");
        notificacion.className = "barberai-notificacion";
        document.body.appendChild(notificacion);
    }

    notificacion.textContent = mensaje;

    notificacion.style.position = "fixed";
    notificacion.style.left = "50%";
    notificacion.style.bottom = "25px";
    notificacion.style.transform = "translateX(-50%)";
    notificacion.style.padding = "0.9rem 1.4rem";
    notificacion.style.borderRadius = "50px";
    notificacion.style.color = "#ffffff";
    notificacion.style.fontFamily = "Montserrat, sans-serif";
    notificacion.style.fontWeight = "700";
    notificacion.style.zIndex = "2000";
    notificacion.style.boxShadow = "0 8px 25px rgba(0,0,0,0.18)";
    notificacion.style.background = tipo === "ok" ? "#28a745" : "#dc3545";

    setTimeout(() => {
        notificacion.remove();
    }, 3500);
}

/* =========================
   CHATBOT AUTOMÁTICO
========================= */

function crearChatbot() {
    const botonExistente = document.querySelector(".whatsapp-fab");

    if (botonExistente) {
        botonExistente.addEventListener("click", (evento) => {
            evento.preventDefault();
            abrirCerrarChat();
        });
    }

    let chat = document.querySelector("#barberai-chat");

    if (!chat) {
        chat = document.createElement("div");
        chat.id = "barberai-chat";
        chat.innerHTML = `
            <div class="chat-panel-header">
                <div>
                    <strong>Asistente BarberAI</strong>
                    <small>Responde sobre el sistema</small>
                </div>
                <button type="button" id="cerrar-chat">×</button>
            </div>

            <div class="chat-panel-body" id="chat-mensajes">
                <p><strong>Bot:</strong> Hola. Puedes preguntarme sobre citas, cola, ventas, inventario, barberos o demo.</p>
            </div>

            <div class="chat-sugerencias">
                <button type="button" data-pregunta="Que hace BarberAI">¿Qué hace?</button>
                <button type="button" data-pregunta="Como funcionan las citas">Citas</button>
                <button type="button" data-pregunta="Tiene inventario">Inventario</button>
            </div>

            <div class="chat-panel-input">
                <input type="text" id="chat-input" placeholder="Escribe tu pregunta...">
                <button type="button" id="enviar-chat">Enviar</button>
            </div>
        `;

        document.body.appendChild(chat);
        aplicarEstilosChat();
    }

    const cerrar = document.querySelector("#cerrar-chat");
    const enviar = document.querySelector("#enviar-chat");
    const input = document.querySelector("#chat-input");
    const sugerencias = document.querySelectorAll(".chat-sugerencias button");

    if (cerrar) {
        cerrar.addEventListener("click", abrirCerrarChat);
    }

    if (enviar) {
        enviar.addEventListener("click", enviarPreguntaChat);
    }

    if (input) {
        input.addEventListener("keydown", (evento) => {
            if (evento.key === "Enter") {
                enviarPreguntaChat();
            }
        });
    }

    sugerencias.forEach(boton => {
        boton.addEventListener("click", () => {
            const pregunta = boton.dataset.pregunta;
            input.value = pregunta;
            enviarPreguntaChat();
        });
    });
}

function aplicarEstilosChat() {
    const chat = document.querySelector("#barberai-chat");

    chat.style.display = "none";
    chat.style.position = "fixed";
    chat.style.right = "25px";
    chat.style.bottom = "95px";
    chat.style.width = "350px";
    chat.style.background = "#ffffff";
    chat.style.borderRadius = "14px";
    chat.style.overflow = "hidden";
    chat.style.boxShadow = "0 8px 30px rgba(0,0,0,0.22)";
    chat.style.zIndex = "2000";
    chat.style.fontFamily = "Open Sans, sans-serif";

    const header = chat.querySelector(".chat-panel-header");
    header.style.background = "linear-gradient(135deg, #0052D4, #4364F7)";
    header.style.color = "#ffffff";
    header.style.padding = "1rem";
    header.style.display = "flex";
    header.style.justifyContent = "space-between";
    header.style.alignItems = "center";

    const small = chat.querySelector(".chat-panel-header small");
    small.style.display = "block";
    small.style.opacity = "0.85";
    small.style.fontSize = "0.8rem";

    const cerrar = chat.querySelector("#cerrar-chat");
    cerrar.style.background = "transparent";
    cerrar.style.border = "none";
    cerrar.style.color = "#ffffff";
    cerrar.style.fontSize = "1.4rem";
    cerrar.style.cursor = "pointer";

    const body = chat.querySelector(".chat-panel-body");
    body.style.height = "230px";
    body.style.overflowY = "auto";
    body.style.padding = "1rem";
    body.style.background = "#f8f9fa";

    const sugerencias = chat.querySelector(".chat-sugerencias");
    sugerencias.style.display = "flex";
    sugerencias.style.gap = "0.4rem";
    sugerencias.style.flexWrap = "wrap";
    sugerencias.style.padding = "0.75rem";
    sugerencias.style.background = "#ffffff";

    chat.querySelectorAll(".chat-sugerencias button").forEach(boton => {
        boton.style.border = "1px solid #0052D4";
        boton.style.background = "#ffffff";
        boton.style.color = "#0052D4";
        boton.style.borderRadius = "20px";
        boton.style.padding = "0.4rem 0.7rem";
        boton.style.cursor = "pointer";
        boton.style.fontWeight = "700";
    });

    const inputArea = chat.querySelector(".chat-panel-input");
    inputArea.style.display = "flex";
    inputArea.style.borderTop = "1px solid #e0e0e0";

    const input = chat.querySelector("#chat-input");
    input.style.flex = "1";
    input.style.border = "none";
    input.style.padding = "0.9rem";
    input.style.outline = "none";

    const enviar = chat.querySelector("#enviar-chat");
    enviar.style.border = "none";
    enviar.style.background = "#0052D4";
    enviar.style.color = "#ffffff";
    enviar.style.padding = "0 1rem";
    enviar.style.fontWeight = "700";
    enviar.style.cursor = "pointer";
}

function abrirCerrarChat() {
    const chat = document.querySelector("#barberai-chat");

    if (!chat) return;

    chat.style.display = chat.style.display === "block" ? "none" : "block";
}

function enviarPreguntaChat() {
    const input = document.querySelector("#chat-input");
    const contenedor = document.querySelector("#chat-mensajes");

    if (!input || !contenedor) return;

    const pregunta = input.value.trim();

    if (pregunta === "") return;

    agregarMensajeChat("Tú", pregunta);

    setTimeout(() => {
        const respuesta = obtenerRespuestaChat(pregunta.toLowerCase());
        agregarMensajeChat("Bot", respuesta);
    }, 450);

    input.value = "";
}

function agregarMensajeChat(nombre, texto) {
    const contenedor = document.querySelector("#chat-mensajes");
    const mensaje = document.createElement("p");

    mensaje.innerHTML = `<strong>${nombre}:</strong> ${texto}`;
    mensaje.style.background = "#ffffff";
    mensaje.style.padding = "0.75rem";
    mensaje.style.borderRadius = "8px";
    mensaje.style.marginBottom = "0.75rem";
    mensaje.style.boxShadow = "0 2px 8px rgba(0,0,0,0.05)";

    contenedor.appendChild(mensaje);
    contenedor.scrollTop = contenedor.scrollHeight;
}

function obtenerRespuestaChat(pregunta) {
    const respuestas = [
        {
            claves: ["que hace", "qué hace", "barberai", "sistema"],
            texto: "BarberAI organiza la operación diaria de una barbería: citas, cola, ventas, inventario, barberos, servicios y sucursales."
        },
        {
            claves: ["cita", "agenda", "reserv"],
            texto: "El módulo de citas permite registrar clientes por fecha, hora, servicio y barbero asignado."
        },
        {
            claves: ["cola", "espera", "turno"],
            texto: "La cola ayuda a ordenar clientes que llegan sin cita, manteniendo un flujo claro de atención."
        },
        {
            claves: ["venta", "cobro", "pago"],
            texto: "Ventas registra servicios realizados, productos vendidos y pagos del día."
        },
        {
            claves: ["inventario", "producto", "stock"],
            texto: "Inventario permite controlar productos, existencias, entradas, salidas y alertas de stock bajo."
        },
        {
            claves: ["barbero", "empleado", "personal"],
            texto: "El módulo de barberos permite revisar disponibilidad, servicios asignados y rendimiento del equipo."
        },
        {
            claves: ["sucursal", "sucursales"],
            texto: "BarberAI puede organizar varias sucursales desde una misma plataforma."
        },
        {
            claves: ["demo", "contacto", "precio"],
            texto: "Puedes solicitar una demostración desde el formulario de contacto de esta página."
        }
    ];

    const encontrada = respuestas.find(item =>
        item.claves.some(clave => pregunta.includes(clave))
    );

    return encontrada
        ? encontrada.texto
        : "Puedo responder sobre citas, cola, ventas, inventario, barberos, sucursales y demostración de BarberAI.";
}

/* =========================
   SECCIÓN ACTIVA
========================= */

function marcarSeccionActiva() {
    const enlaces = document.querySelectorAll('a[href^="#"]');
    const secciones = [...enlaces]
        .map(enlace => document.querySelector(enlace.getAttribute("href")))
        .filter(Boolean);

    window.addEventListener("scroll", () => {
        let actual = "";

        secciones.forEach(seccion => {
            const top = seccion.offsetTop - 120;

            if (window.scrollY >= top) {
                actual = "#" + seccion.id;
            }
        });

        enlaces.forEach(enlace => {
            enlace.classList.remove("active");

            if (enlace.getAttribute("href") === actual) {
                enlace.classList.add("active");
            }
        });
    });
}