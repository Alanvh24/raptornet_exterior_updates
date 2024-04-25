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
@Table(name = "utmir_objetivos_asignatura")
public class ObjetivosAsignatura {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idObjetivoAsignatura;
    
    @Column(columnDefinition = "TEXT")
    private String objetivo;

    @Column(name = "fecha_entrega_planeacion")
    private LocalDate fechaEntregaPlaneacion;

    @ManyToOne
    @JoinColumn(name = "idAsignacionAsignatura", referencedColumnName = "idAsignacionAsignatura")
    private AsignacionAsignatura asignacionAsignatura;

    public Long getIdObjetivoAsignatura() {
        return idObjetivoAsignatura;
    }

    public void setIdObjetivoAsignatura(Long idObjetivoAsignatura) {
        this.idObjetivoAsignatura = idObjetivoAsignatura;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public LocalDate getFechaEntregaPlaneacion() {
        return fechaEntregaPlaneacion;
    }

    public void setFechaEntregaPlaneacion(LocalDate fechaEntregaPlaneacion) {
        this.fechaEntregaPlaneacion = fechaEntregaPlaneacion;
    }

    public AsignacionAsignatura getAsignacionAsignatura() {
        return asignacionAsignatura;
    }

    public void setAsignacionAsignatura(AsignacionAsignatura asignacionAsignatura) {
        this.asignacionAsignatura = asignacionAsignatura;
    }

}
