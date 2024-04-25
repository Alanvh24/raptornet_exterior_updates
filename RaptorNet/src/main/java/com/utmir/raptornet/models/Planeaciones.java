package com.utmir.raptornet.models;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_planeaciones")
public class Planeaciones {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idPlaneacion;

    private String noSemana;

    private LocalDate fechaInicio;

    private LocalDate fechaFin;

    @Column(columnDefinition = "TEXT")
    private String descripcion;

    @ManyToOne
    @JoinColumn(name = "idAsignacionAsignatura", referencedColumnName = "idAsignacionAsignatura")
    private AsignacionAsignatura asignacionAsignatura;

    public Long getIdPlaneacion() {
        return idPlaneacion;
    }

    public void setIdPlaneacion(Long idPlaneacion) {
        this.idPlaneacion = idPlaneacion;
    }

    public String getNoSemana() {
        return noSemana;
    }

    public void setNoSemana(String noSemana) {
        this.noSemana = noSemana;
    }

    public LocalDate getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(LocalDate fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public LocalDate getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(LocalDate fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public AsignacionAsignatura getAsignacionAsignatura() {
        return asignacionAsignatura;
    }

    public void setAsignacionAsignatura(AsignacionAsignatura asignacionAsignatura) {
        this.asignacionAsignatura = asignacionAsignatura;
    }

}
