package com.aftercare.dao;

import com.aftercare.conexion.Conexion;
import com.aftercare.modelo.Paciente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PacientesDAO {

    // CREATE - Registrar paciente
    public boolean registrar(Paciente paciente) {

        String sql = "INSERT INTO pacientes (nombre, telefono, area, observaciones) "
                   + "VALUES (?, ?, ?, ?)";

        try (Connection con = Conexion.obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, paciente.getNombre());
            ps.setString(2, paciente.getTelefono());
            ps.setString(3, paciente.getArea());
            ps.setString(4, paciente.getObservaciones());

            ps.executeUpdate();

            System.out.println("Paciente registrado exitosamente.");
            return true;

        } catch (SQLException e) {

            System.out.println("Error al registrar paciente: "
                    + e.getMessage());

            return false;
        }
    }

    // READ - Listar pacientes
    public List<Paciente> listar() {

        List<Paciente> lista = new ArrayList<>();

        String sql = "SELECT * FROM pacientes";

        try (Connection con = Conexion.obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Paciente pacientes = new Paciente();

                pacientes.setId(rs.getInt("id"));
                pacientes.setNombre(rs.getString("nombre"));
                pacientes.setTelefono(rs.getString("telefono"));
                pacientes.setArea(rs.getString("area"));
                pacientes.setObservaciones(rs.getString("observaciones"));

                lista.add(pacientes);
            }

        } catch (SQLException e) {

            System.out.println("Error al listar pacientes: "
                    + e.getMessage());
        }

        return lista;
    }
}