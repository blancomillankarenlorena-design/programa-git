package com.aftercare;

import java.sql.Connection;
import com.aftercare.conexion.Conexion;

public class PruebaConexion {
    public static void main(String[] args) {
        try (Connection conexion = Conexion.obtenerConexion()) {
            if (conexion != null && !conexion.isClosed()) {
                System.out.println("¡Conexión exitosa con MySQL!");
                System.out.println("Base de datos conectada: "
                        + conexion.getCatalog());
            } else {
                System.out.println("No se pudo establecer la conexión.");
            }
        } catch (Exception e) {
            System.out.println("Error al probar la conexión: "
                    + e.getMessage());
            e.printStackTrace();
        }
    }
}
