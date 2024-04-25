package com.utmir.raptornet.dto.Docentes;

import java.time.LocalDate;

public class ProyectoAsignaturaResponse {
    private Long idProyectoAsignatura;
    private String titulo;
    private String objetivo;
    private LocalDate fecha;

    public ProyectoAsignaturaResponse(String titulo, String objetivo, LocalDate fecha) {
        this.titulo = titulo;
        this.objetivo = objetivo;
        this.fecha = fecha;
    }

    public Long getIdProyectoAsignatura() {
        return idProyectoAsignatura;
    }

    public void setIdProyectoAsignatura(Long idProyectoAsignatura) {
        this.idProyectoAsignatura = idProyectoAsignatura;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }
}
