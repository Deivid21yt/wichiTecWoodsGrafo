
//function mostrarGrafo(vertices) {
//    var canvas = document.getElementById("miCanvas");
//    var context = canvas.getContext('2d');
//    context.clearRect(0, 0, canvas.width, canvas.height); // Limpiar el canvas

//    // obtener las dimensiones completas del área de dibujo
//    let tx = canvas.width;
//    let ty = canvas.height;
//    let xc = tx / 2;
//    let yc = ty / 2;

//    // el centro de la forma circular
//    let circentro = new Circulo(xc, yc, 5, 'red');
//    circentro.draw(context);

//    // vamos a generar todos los puntos a lo largo de una circunferencia
//    let grados = 0;
//    let inc_grados = 360 / vertices.length; // Ajuste automático del incremento de grados
//    let hipote = 140;
//    let radiocir = 20;
//    let trigo2 = new Trigonometria(grados, hipote);
//    let uncirculo = new Circulo();
//    let radianes = 0;

//    // variables para obtener los valores de x y y con respecto a la forma circular 
//    let xxc = 0;
//    let yyc = 0;
//    let circulos = [];

//    // Dibujar los vértices y sus líneas al centro
//    for (let i = 0; i < vertices.length; i++) {
//        grados = i * inc_grados;
//        // convertir a radianes
//        radianes = (2 * Math.PI * grados) / 360;
//        trigo2.angulo = radianes;
//        // calcular los catetos
//        xxc = xc + trigo2.obtenerAdyacente();
//        yyc = yc - trigo2.obtenerOpuesto();
//        uncirculo.posiX = xxc;
//        uncirculo.posiY = yyc;
//        uncirculo.radio = radiocir;
//        uncirculo.color = 'green';
//        uncirculo.draw(context);

//        circulos.push({ x: xxc, y: yyc, radio: radiocir, nombreDato: vertices[i].nombreDato, aristas: vertices[i].aristas });

//        // Cambios
//        context.textAlign = "center";
//        context.textBaseline = "middle";
//        context.font = "14px Candara";
//        context.fillText(vertices[i].nombreDato, xxc, yyc);
//    }

//    for (let i = 0; i < circulos.length; i++) {
//        let circActual = circulos[i];
//        for (let j = 0; j < circActual.aristas.length; j++) {
//            let arista = circActual.aristas[j];
//            let circDestino = circulos.find(c => c.nombreDato == arista.nombreDato);
//            if (circDestino) {
//                drawArrow(context, circActual.x, circActual.y, circDestino.x, circDestino.y, circActual.radio, circDestino.radio);
//            }
//        }
//    }
//    // Dibujar las líneas entre los vértices según las aristas


//}

//function drawArrow(context, fromX, fromY, toX, toY, fromRadius, toRadius) {
//    let headLength = 10; // longitud de la cabeza de la flecha
//    let angle = Math.atan2(toY - fromY, toX - fromX);

//    // Calcular los puntos finales de la línea ajustando por los radios
//    let startX = fromX + Math.cos(angle) * fromRadius;
//    let startY = fromY + Math.sin(angle) * fromRadius;
//    let endX = toX - Math.cos(angle) * toRadius;
//    let endY = toY - Math.sin(angle) * toRadius;

//    // Dibujar la línea
//    context.strokeStyle = '#1c646d';
//    context.beginPath();
//    context.moveTo(startX, startY);
//    context.lineTo(endX, endY);
//    context.stroke();

//    // Dibujar la cabeza de la flecha
//    context.beginPath();
//    context.moveTo(endX, endY);
//    context.lineTo(endX - headLength * Math.cos(angle - Math.PI / 6), endY - headLength * Math.sin(angle - Math.PI / 6));
//    context.moveTo(endX, endY);
//    context.lineTo(endX - headLength * Math.cos(angle + Math.PI / 6), endY - headLength * Math.sin(angle + Math.PI / 6));
//    context.stroke();
//}

function mostrarGrafo(vertices) {
    console.log("Datos recibidos:", vertices);

    var canvas = document.getElementById("miCanvas");
    if (!canvas) {
        console.error("No se encontró el elemento canvas.");
        return;
    }

    var context = canvas.getContext('2d');
    if (!context) {
        console.error("No se pudo obtener el contexto del canvas.");
        return;
    }

    context.clearRect(0, 0, canvas.width, canvas.height); // Limpiar el canvas

    let tx = canvas.width;
    let ty = canvas.height;
    let xc = tx / 2;
    let yc = ty / 2;

    // Dibujar el vértice central
    let radiocir = 20;
    let centralVertex = vertices[0];
    let circentro = new Circulo(xc, yc, radiocir, 'green');
    circentro.draw(context);
    context.textAlign = "center";
    context.textBaseline = "middle";
    context.font = "14px Candara";
    context.fillText(centralVertex.nombreDato, xc, yc);

    // Generar todos los puntos a lo largo de una circunferencia para los demás vértices
    let grados = 0;
    let inc_grados = 360 / (vertices.length - 1); // Ajuste automático del incremento de grados
    let hipote = 140;
    let trigo2 = new Trigonometria(grados, hipote);
    let uncirculo = new Circulo();
    let radianes = 0;

    let xxc = 0;
    let yyc = 0;
    let circulos = [{ x: xc, y: yc, radio: radiocir, nombreDato: centralVertex.nombreDato, aristas: centralVertex.aristas }];

    // Dibujar los vértices y sus líneas al centro
    for (let i = 1; i < vertices.length; i++) {
        grados = (i - 1) * inc_grados;
        radianes = (2 * Math.PI * grados) / 360;
        trigo2.angulo = radianes;
        xxc = xc + trigo2.obtenerAdyacente();
        yyc = yc - trigo2.obtenerOpuesto();
        uncirculo.posiX = xxc;
        uncirculo.posiY = yyc;
        uncirculo.radio = radiocir;
        uncirculo.color = 'green';
        uncirculo.draw(context);

        circulos.push({ x: xxc, y: yyc, radio: radiocir, nombreDato: vertices[i].nombreDato, aristas: vertices[i].aristas });

        context.textAlign = "center";
        context.textBaseline = "middle";
        context.font = "14px Candara";
        context.fillText(vertices[i].nombreDato, xxc, yyc);
    }

    // Dibujar las líneas entre todos los vértices según sus aristas
    for (let i = 0; i < circulos.length; i++) {
        let circActual = circulos[i];
        for (let j = 0; j < circActual.aristas.length; j++) {
            let arista = circActual.aristas[j];
            let circDestino = circulos.find(c => c.nombreDato == arista.nombreDato);
            if (circDestino) {
                drawArrow(context, circActual.x, circActual.y, circDestino.x, circDestino.y, circActual.radio, circDestino.radio, arista.costo);
            }
        }
    }
}

function drawArrow(context, fromX, fromY, toX, toY, fromRadius, toRadius, costo) {
    let headLength = 10; // longitud de la cabeza de la flecha
    let angle = Math.atan2(toY - fromY, toX - fromX);

    // Ajustar la longitud de la línea al costo
    let lineLength = Math.hypot(toX - fromX, toY - fromY) * (costo / 100); // escala el costo

    // Calcular los puntos finales de la línea ajustando por los radios
    let startX = fromX + Math.cos(angle) * fromRadius;
    let startY = fromY + Math.sin(angle) * fromRadius;
    let endX = startX + Math.cos(angle) * lineLength;
    let endY = startY + Math.sin(angle) * lineLength;

    // Dibujar la línea
    context.strokeStyle = '#1c646d';
    context.beginPath();
    context.moveTo(startX, startY);
    context.lineTo(endX, endY);
    context.stroke();

    // Dibujar la cabeza de la flecha
    context.beginPath();
    context.moveTo(endX, endY);
    context.lineTo(endX - headLength * Math.cos(angle - Math.PI / 6), endY - headLength * Math.sin(angle - Math.PI / 6));
    context.moveTo(endX, endY);
    context.lineTo(endX - headLength * Math.cos(angle + Math.PI / 6), endY - headLength * Math.sin(angle + Math.PI / 6));
    context.stroke();
}



