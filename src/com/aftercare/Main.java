package com.aftercare;

import com.aftercare.conexion.Conexion;

public class Main {
    public static void main(String[] args) {
        System.out.println("Iniciando pruebas de conexion...");
        Conexion.obtenerConexion();
    }
}
