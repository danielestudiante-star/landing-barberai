# Guia de llenado de prospectos

Usar esta guia para completar `data/prospectos-barberai-oficial.xlsx` con datos reales. No agregar negocios inventados. Cada fila debe corresponder a un prospecto verificado manualmente.

## Columnas

### ID

Codigo interno del prospecto. Ya esta preparado del B-001 al B-020.

Ejemplo de formato: `B-001`

### Negocio

Nombre real del negocio encontrado.

Ejemplo de texto: `Nombre real de la barberia`

### Ciudad/Depto

Ciudad y departamento donde opera el negocio.

Ejemplo de texto: `Comayagua, Comayagua`

### Tipo

Categoria del negocio.

Ejemplos de texto: `Barberia`, `Salon`, `Estudio`, `Barberia y salon`

### Telefono/WhatsApp

Numero publico de contacto si esta disponible.

Ejemplo de texto: `Numero publicado en Facebook`

### Facebook

Enlace del perfil o pagina de Facebook.

Ejemplo de texto: `URL de Facebook`

### Instagram

Enlace del perfil de Instagram si existe.

Ejemplo de texto: `URL de Instagram`

### TikTok

Enlace del perfil de TikTok si existe.

Ejemplo de texto: `URL de TikTok`

### Web/Menu

Sitio web, pagina de menu, catalogo o enlace relevante.

Ejemplo de texto: `URL de sitio web o catalogo`

### Dueno/Encargado

Nombre del dueno o encargado solo si aparece publicado de forma clara.

Ejemplo de texto: `Nombre publicado del encargado`

### Senal de demanda

Evidencia de que el negocio podria necesitar BarberAI.

Ejemplos de texto: `Publica seguido`, `Recibe preguntas por citas`, `Tiene varios barberos`, `Muestra agenda activa`

### Problema probable

Dolor operativo que BarberAI podria resolver. Debe ser una hipotesis basada en senales visibles, no una afirmacion sin evidencia.

Ejemplos de texto: `Agenda manual`, `Muchos mensajes por WhatsApp`, `Citas sin confirmar`, `Control de varios barberos`

### Prioridad

Nivel de prioridad comercial.

Ejemplos de texto: `Alta`, `Media`, `Baja`

### Fuente

Lugar donde se encontro el prospecto.

Ejemplos de texto: `Facebook`, `Instagram`, `TikTok`, `Google Maps`, `Referencia`

### Estado de contacto

Etapa actual del contacto.

Ejemplos de texto: `No contactado`, `Contactado`, `Respondio`, `Agendar demo`, `Descartado`

### Fecha proximo paso

Fecha en que se debe hacer seguimiento.

Ejemplo de formato: `2026-06-16`

### Notas

Informacion adicional util para venta o seguimiento.

Ejemplos de texto: `Revisar horarios antes de escribir`, `Validar numero`, `Posible contacto por Instagram`

## Reglas de calidad

- No llenar filas con negocios no verificados.
- No inventar telefonos, redes ni nombres de encargados.
- Si un dato no aparece, dejar la celda vacia.
- Registrar la fuente para poder comprobar de donde salio cada prospecto.
- Usar prioridad Alta solo cuando haya senales claras de movimiento, varias sillas, varios barberos o varias sucursales.

