package com.aftercare.servlet;

import com.aftercare.modelo.Paciente;
import com.aftercare.dao.PacientesDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/PacienteServlet")
public class PacientesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private PacientesDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new PacientesDAO();
    }

    // GET - Mostrar pacientes
    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            List<Paciente> listaPacientes = dao.listar();

            request.setAttribute("listaPacientes", listaPacientes);

            request.getRequestDispatcher("/pacientes.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("pacientes.jsp?error=1");
        }
    }

    // POST - Registrar paciente
    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String area = request.getParameter("area");
        String observaciones = request.getParameter("observaciones");

        try {

        Paciente paciente = new Paciente();
paciente.setNombre(nombre);
paciente.setTelefono(telefono);
paciente.setArea(area);
paciente.setObservaciones(observaciones);

            boolean registrado = dao.registrar(paciente);

            if (registrado) {

                response.sendRedirect("PacienteServlet");

            } else {

                response.sendRedirect("pacientes.jsp?error=1");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("pacientes.jsp?error=1");
        }
    }
}