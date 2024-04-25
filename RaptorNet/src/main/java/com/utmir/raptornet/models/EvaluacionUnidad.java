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
@Table(name = "utmir_evaluacion_unidad")
public class EvaluacionUnidad {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idEvaluacionUnidad;

    @ManyToOne
    @JoinColumn(name = "idAsignacionAsignatura", referencedColumnName = "idAsignacionAsignatura")
    private AsignacionAsignatura asignacionAsignatura;

    @ManyToOne
    @JoinColumn(name = "idUnidadesAsignatura", referencedColumnName = "idUnidadesAsignatura")
    private UnidadesPorAsignatura unidadesPorAsignatura;

    @Column(name = "fecha_evaluacion")
    private LocalDate fechaEvaluacion;

    public Long getIdEvaluacionUnidad() {
        return idEvaluacionUnidad;
    }

    public void setIdEvaluacionUnidad(Long idEvaluacionUnidad) {
        this.idEvaluacionUnidad = idEvaluacionUnidad;
    }

    public AsignacionAsignatura getAsignacionAsignatura() {
        return asignacionAsignatura;
    }

    public void setAsignacionAsignatura(AsignacionAsignatura asignacionAsignatura) {
        this.asignacionAsignatura = asignacionAsignatura;
    }

    public UnidadesPorAsignatura getUnidadesPorAsignatura() {
        return unidadesPorAsignatura;
    }

    public void setUnidadesPorAsignatura(UnidadesPorAsignatura unidadesPorAsignatura) {
        this.unidadesPorAsignatura = unidadesPorAsignatura;
    }

    public LocalDate getFechaEvaluacion() {
        return fechaEvaluacion;
    }

    public void setFechaEvaluacion(LocalDate fechaEvaluacion) {
        this.fechaEvaluacion = fechaEvaluacion;
    }

}
