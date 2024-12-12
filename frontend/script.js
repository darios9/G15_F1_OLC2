import { StartRules, SyntaxError, parse } from './grammar.js'; 

document.getElementById("checkButton").addEventListener("click", function() {
    const input = document.getElementById("inputPEG").value; // Obtener la entrada del primer textarea
    console.log("Entrada del usuario:", input); // Mostrar la entrada en la consola

    try {
        // Parsear la entrada del usuario usando el parser generado
        const result = parse(input); // Usa 'parse' como el nombre correcto
        
        // Mostrar el resultado en el segundo textarea
        document.getElementById("resultPEG").value = "Todo bien";
        //document.getElementById("resultPEG").value = JSON.stringify(result, null, 2); // Convertir el resultado a texto con formato
        console.log("Resultado:", result); // Mostrar el resultado en la consola
    } catch (e) {
        // Manejar errores de parseo
        document.getElementById("resultPEG").value = "Error: " + e.message; // Mostrar error en el segundo textarea
        console.error("Error de parseo:", e.message); // Mostrar error en la consola
    }
});