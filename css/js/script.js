console.log("Aftercare Dental iniciado");

function validarFormulario(event) {

    event.preventDefault();

    alert("Paciente registrado correctamente");

    return false;
}

function contactarPaciente() {

    alert("Recordatorio enviado al paciente.");

}

function guardarConfiguracion() {

    let clinica = document.getElementById("clinica").value;
    let correo = document.getElementById("correoClinica").value;
    let frecuencia = document.getElementById("frecuencia").value;

    if(clinica === "" || correo === "" || frecuencia === "") {

        alert("Por favor complete todos los campos.");
        return false;

    }

    alert("Configuración guardada correctamente.");
    return false;
}
