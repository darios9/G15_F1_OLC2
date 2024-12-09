const parser = require('./bundle.js');

document.addEventListener('DOMContentLoaded', function() {
    const checkButton = document.getElementById('checkButton');
    const inputPEG = document.getElementById('inputPEG');
    const resultPEG = document.getElementById('resultPEG');

    checkButton.addEventListener('click', function() {
        const inputText = inputPEG.value;
        try {
           const result = parser.parse(inputText);
           console.log(result); 
           resultPEG.value = result; // Muestra el contenido de la entrada en el área de resultado
        } catch (error) {
            console.error(error);
            resultPEG.value = error.message;
            return;
        }
        
        
    });
});