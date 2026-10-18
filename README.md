# Aftercare Dental

Aplicación web para registrar y consultar pacientes de una clínica odontológica,
desarrollada con Servlets y JSP.

## Tecnologías
- Java (JDK 26), Servlets y JSP (javax.servlet)
- MySQL con JDBC (mysql-connector-j 8.3.0)
- Apache Tomcat 9
- HTML y CSS

## Estructura
- `src/`: código Java (conexion, dao, modelo, servlet)
- `webapp/`: páginas HTML, JSP, CSS y WEB-INF
- `lib/`: librerías (servlet-api y driver de MySQL)

## Flujo de la aplicación
Formulario HTML → POST a `PacienteServlet` → el DAO guarda en MySQL →
redirige al GET → `pacientes.jsp` muestra la lista de pacientes.

## Cómo ejecutarlo
1. Iniciar MySQL y crear la base de datos con la tabla de pacientes.
2. Compilar: `javac -cp "lib/*" -d webapp/WEB-INF/classes <archivos .java>`
3. Copiar `webapp` a `tomcat/webapps/aftercare`.
4. Iniciar Tomcat y abrir `http://localhost:8080/aftercare/pacientes.html`.