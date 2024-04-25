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
@Table(name = "utmir_fecha_unidades")
public class FechasUnidades {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idFechasUnidades;

    @ManyToOne
    @JoinColumn(name = "matricula", referencedColumnName = "matricula")
    private Alumno alumno;

    @ManyToOne
    @JoinColumn(name = "idUnidadesAsignatura", referencedColumnName = "idUnidadesAsignatura")
    private UnidadesPorAsignatura unidadesPorAsignatura;

    @Column(name = "fecha_inicio")
    private LocalDate fechaInicio;

    @Column(name = "fecha_cierre")
    private LocalDate fechaCierre;

    @Column(name = "fechaRemedial")
    private LocalDate fechaRemedial;

    private Boolean status;

    @Column(name = "clases_activas")
    private Integer clasesActivas;

    @ManyToOne
    @JoinColumn(name = "id_grupo", referencedColumnName = "id")
    private Grupo grupo;

    @ManyToOne
    @JoinColumn(name = "idAsignacionAsignatura", referencedColumnName = "idAsignacionAsignatura")
    private AsignacionAsignatura asignacionAsignatura;

    public AsignacionAsignatura getAsignacionAsignatura() {
        return asignacionAsignatura;
    }

    public void setAsignacionAsignatura(AsignacionAsignatura asignacionAsignatura) {
        this.asignacionAsignatura = asignacionAsignatura;
    }

    public Long getIdFechasUnidades() {
        return idFechasUnidades;
    }

    public void setIdFechasUnidades(Long idFechasUnidades) {
        this.idFechasUnidades = idFechasUnidades;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    public UnidadesPorAsignatura getUnidadesPorAsignatura() {
        return unidadesPorAsignatura;
    }

    public void setUnidadesPorAsignatura(UnidadesPorAsignatura unidadesPorAsignatura) {
        this.unidadesPorAsignatura = unidadesPorAsignatura;
    }

    public LocalDate getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(LocalDate fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public LocalDate getFechaCierre() {
        return fechaCierre;
    }

    public void setFechaCierre(LocalDate fechaCierre) {
        this.fechaCierre = fechaCierre;
    }

    public LocalDate getFechaRemedial() {
        return fechaRemedial;
    }

    public void setFechaRemedial(LocalDate fechaRemedial) {
        this.fechaRemedial = fechaRemedial;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getClasesActivas() {
        return clasesActivas;
    }

    public void setClasesActivas(Integer clasesActivas) {
        this.clasesActivas = clasesActivas;
    }

    public Grupo getGrupo() {
        return grupo;
    }

    public void setGrupo(Grupo grupo) {
        this.grupo = grupo;
    }

}
