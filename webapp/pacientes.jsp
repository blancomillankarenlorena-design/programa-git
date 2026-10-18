<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.aftercare.modelo.Paciente" %>
<%!
    // Escapa caracteres especiales para que lo escrito por el usuario no se ejecute como HTML
    private String esc(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pacientes registrados - Aftercare Dental</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

    <header>
        <h1>Aftercare Dental</h1>
    </header>

    <nav>
        <ul>
            <li><a href="index.html">Dashboard</a></li>
            <li><a href="pacientes.html" aria-current="page">Pacientes</a></li>
            <li><a href="followup.html">Follow-Up</a></li>
            <li><a href="configuracion.html">Configuración</a></li>
        </ul>
    </nav>

    <main>

        <% if (request.getParameter("error") != null) { %>
            <p class="mensaje-error">No se pudo completar la operación. Intente de nuevo.</p>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
            <p class="mensaje-error">${error}</p>
        <% } %>

        <h2>Registrar paciente</h2>

        <!-- Formulario de registro: envía por POST al servlet -->
        <form action="PacienteServlet" method="post">
            <div>
                <label for="nombre">Nombre del paciente</label>
                <input type="text" id="nombre" name="nombre" required>
            </div>

            <div>
                <label for="telefono">Teléfono</label>
                <input type="tel" id="telefono" name="telefono" required>
            </div>

            <div>
                <label for="area">Área odontológica</label>
                <select id="area" name="area" required>
                    <option value="">Seleccione un área</option>
                    <option value="Ortodoncia">Ortodoncia</option>
                    <option value="Endodoncia">Endodoncia</option>
                    <option value="Rehabilitación">Rehabilitación</option>
                    <option value="Periodoncia">Periodoncia</option>
                </select>
            </div>

            <div>
                <label for="observaciones">Observaciones</label>
                <textarea id="observaciones" name="observaciones" rows="4"></textarea>
            </div>

            <button type="submit">Registrar paciente</button>
        </form>

        <h2>Pacientes registrados</h2>

        <!-- Tabla dinámica: recorre la lista que envía el servlet por GET -->
        <table>
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
                                <td><%= esc(p.getNombre()) %></td>
                                <td><%= esc(p.getTelefono()) %></td>
                                <td><%= esc(p.getArea()) %></td>
                                <td><%= esc(p.getObservaciones()) %></td>
                            </tr>
                <%
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="5">Todavía no hay pacientes registrados. Usa el formulario para agregar el primero.</td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>

    </main>

</body>
</html>