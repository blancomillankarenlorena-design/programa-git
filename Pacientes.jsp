<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.aftercare.modelo.Paciente" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aftercare Dental - Gestión de Pacientes</title>
    <link rel="stylesheet" href="css/estilos.css"> <!-- Reemplaza con la ruta de tu CSS si es diferente -->
</head>
<body>

    <h2>Registro de Pacientes</h2>

    <!-- Formulario de Registro -->
    <form action="PacienteServlet" method="POST">
        <div>
            <label for="nombre">Nombre Completo:</label>
            <input type="text" id="nombre" name="nombre" required>
        </div>

        <div>
            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono" required>
        </div>

        <div>
            <label for="area">Área de Tratamiento:</label>
            <input type="text" id="area" name="area" required>
        </div>

        <div>
            <label for="observaciones">Observaciones:</label>
            <textarea id="observaciones" name="observaciones" rows="4"></textarea>
        </div>

        <button type="submit">Guardar Paciente</button>
    </form>

    <hr>

    <h2>Pacientes Registrados</h2>

    <!-- Tabla Dinámica de Pacientes -->
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Teléfono</th>
                <th>Área</th>
                <th>Observaciones</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Paciente> lista = (List<Paciente>) request.getAttribute("listaPacientes");
                if (lista != null && !lista.isEmpty()) {
                    for (Paciente p : lista) {
            %>
                        <tr>
                            <td><%= p.getId() %></td>
                            <td><%= p.getNombre() %></td>
                            <td><%= p.getTelefono() %></td>
                            <td><%= p.getArea() %></td>
                            <td><%= p.getObservaciones() %></td>
                        </tr>
            <% 
                    }
                } else {
            %>
                    <tr>
                        <td colspan="5">No hay pacientes registrados o no se ha cargado la lista.</td>
                    </tr>
            <% 
                } 
            %>
        </tbody>
    </table>

</body>
</html>