package com.aftercare.modelo;

public class Paciente {

    private int id;
    private String nombre;
    private String telefono;
    private String area;
    private String observaciones;

    public Paciente() {
    }

    public Paciente(int id, String nombre, String telefono,
                    String area, String observaciones) {
        this.id = id;
        this.nombre = nombre;
        this.telefono = telefono;
        this.area = area;
        this.observaciones = observaciones;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
}