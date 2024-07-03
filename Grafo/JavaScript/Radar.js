function mostrarGrafo(vertices) {
    var canvas = document.getElementById("miCanvas");
    var context = canvas.getContext('2d');
    // obtener las dimensiones completas del área de dibujo
    let tx = canvas.width;
    let ty = canvas.height;
    let xc = tx / 2;
    let yc = ty / 2;
    // el centro de la forma circular
    let circentro = new Circulo(xc, yc, 5, 'red');
    circentro.draw(context);
    // vamos a generar todos los puntos a lo largo de una circunferencia
    let grados = 0;
    let inc_grados = 360 / vertices.length; // Ajuste automático del incremento de grados
    let hipote = 140;
    let radiocir = 20;
    let trigo2 = new Trigonometria(grados, hipote);
    let uncirculo = new Circulo();
    let radianes = 0;
    // variables para obtener los valores de x y y con respecto a la forma circular 
    let xxc = 0;
    let yyc = 0;
    let circulos = [];
    // Dibujar los vértices y sus líneas al centro
    for (let i = 0; i < vertices.length; i++) {
        grados = i * inc_grados;
        // convertir a radianes
        radianes = (2 * Math.PI * grados) / 360;
        trigo2.angulo = radianes;
        // calcular los catetos
        xxc = xc + trigo2.obtenerAdyacente();
        yyc = yc - trigo2.obtenerOpuesto();
        uncirculo.posiX = xxc;
        uncirculo.posiY = yyc;
        uncirculo.radio = radiocir;
        uncirculo.color = 'green';
        uncirculo.draw(context);
        circulos.push({ x: xxc, y: yyc, radio: radiocir, nombreDato: vertices[i].nombreDato });
        // Cambios
        context.textAlign = "center";
        context.textBaseline = "middle";
        context.font = "14px Candara";
        context.fillText(vertices[i].nombreDato, xxc, yyc);
    }

    // Dibujar las líneas entre todos los vértices
    for (let i = 0; i < circulos.length; i++) {
        for (let j = i + 1; j < circulos.length; j++) {
            let circActual = circulos[i];
            let circSiguiente = circulos[j];

            let angulo = Math.atan2(circSiguiente.y - circActual.y, circSiguiente.x - circActual.x);
            let xBordeActual = circActual.x + Math.cos(angulo) * circActual.radio;
            let yBordeActual = circActual.y + Math.sin(angulo) * circActual.radio;
            let xBordeSiguiente = circSiguiente.x - Math.cos(angulo) * circSiguiente.radio;
            let yBordeSiguiente = circSiguiente.y - Math.sin(angulo) * circSiguiente.radio;

            context.strokeStyle = '#1c646d';
            context.beginPath();
            context.moveTo(xBordeActual, yBordeActual);
            context.lineTo(xBordeSiguiente, yBordeSiguiente);
            context.closePath();
            context.stroke();
        }
    }

    //}
}
