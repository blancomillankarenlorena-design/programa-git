# Aftercare Dental — Módulo Web (Java Servlets + JSP + JDBC)

## 📌 Descripción del Proyecto
Aplicación web desarrollada para la gestión de pacientes y seguimiento odontológico en el sistema **Aftercare Dental**. Implementa el patrón **MVC (Modelo-Vista-Controlador)** conectando la interfaz de usuario web con una base de datos MySQL.

---

## 🛠️ Tecnologías y Estructura del Sistema
- **Lenguaje:** Java EE / Jakarta EE
- **Servidor:** Apache Tomcat
- **Tecnologías Web:** Java Servlets (`@WebServlet`), JSP (JavaServer Pages), HTML5
- **Persistencia:** JDBC con arquitectura DAO (`com.aftercare.conexion`, `com.aftercare.dao`)
- **Control de Versiones:** Git & GitHub

---

## 📁 Estructura del Código Source
- `conexion`: Manejo de conexión a la base de datos MySQL vía JDBC.
- `dao`: Clases de acceso a datos (operaciones CRUD).
- `modelo`: Entidades de datos del sistema (Pacientes, Citas, etc.).
- `servlet`: Controladores HTTP para recibir peticiones `GET` y `POST`.
- Vistas HTML/JSP (`Pacientes.html`, `Pacientes.jsp`, `index.html`, etc.).

---

## 🚀 Instrucciones para Desplegar
1. Clonar el repositorio:
   ```bash
   git clone [https://github.com/blancomillankarenlorena-design/programa-git.git](https://github.com/blancomillankarenlorena-design/programa-git.git)