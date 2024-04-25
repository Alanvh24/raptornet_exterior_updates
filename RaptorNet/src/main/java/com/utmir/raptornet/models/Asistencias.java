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
@Table(name = "utmir_asistencias")
public class Asistencias {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idAsistencias;

    @ManyToOne
    @JoinColumn(name = "matricula", referencedColumnName = "matricula")
    private Alumno alumno;

    @ManyToOne
    @JoinColumn(name = "idAsignaturas", referencedColumnName = "idAsignaturas")
    private Asignaturas asignatura;

    @Column(name = "tipoAsistencia")
    private Integer tipoAsistencia; // 1=Asistencia, 2=Falta, 3=Justificado, 4=Retardo

    @Column(name = "fechaAsistencia")
    private LocalDate fechaAsistencia;

    @ManyToOne
    @JoinColumn(name = "idUnidadesAsignatura", referencedColumnName = "idUnidadesAsignatura")
    private UnidadesPorAsignatura unidadesPorAsignatura;

    @ManyToOne
    @JoinColumn(name = "idGrupo", referencedColumnName = "id")
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

    public Grupo getGrupo() {
        return grupo;
    }

    public void setGrupo(Grupo grupo) {
        this.grupo = grupo;
    }

    public Long getIdAsistencias() {
        return idAsistencias;
    }

    public void setIdAsistencias(Long idAsistencias) {
        this.idAsistencias = idAsistencias;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    public Asignaturas getAsignatura() {
        return asignatura;
    }

    public void setAsignatura(Asignaturas asignatura) {
        this.asignatura = asignatura;
    }

    public Integer getTipoAsistencia() {
        return tipoAsistencia;
    }

    public void setTipoAsistencia(Integer tipoAsistencia) {
        this.tipoAsistencia = tipoAsistencia;
    }

    public LocalDate getFechaAsistencia() {
        return fechaAsistencia;
    }

    public void setFechaAsistencia(LocalDate fechaAsistencia) {
        this.fechaAsistencia = fechaAsistencia;
    }

    public UnidadesPorAsignatura getUnidadesPorAsignatura() {
        return unidadesPorAsignatura;
    }

    public void setUnidadesPorAsignatura(UnidadesPorAsignatura unidadesPorAsignatura) {
        this.unidadesPorAsignatura = unidadesPorAsignatura;
    }

}
