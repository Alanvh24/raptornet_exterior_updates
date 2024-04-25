package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_calificaciones_unidad")
public class CalificacionesUnidad {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idCalificacionUnidad;

    @ManyToOne
    @JoinColumn(name = "matriculaAlumno", referencedColumnName = "matricula")
    private Alumno alumno;

    @ManyToOne
    @JoinColumn(name = "idAsignacionAsignatura", referencedColumnName = "idAsignacionAsignatura")
    private AsignacionAsignatura asignacionAsignatura;

    @ManyToOne
    @JoinColumn(name = "idUnidadesAsignatura", referencedColumnName = "idUnidadesAsignatura")
    private UnidadesPorAsignatura unidadesAsignatura;

    private boolean reqAsistencias;

    private Double calificacionOrdinaria;

    private boolean recuperacion;

    private Double calificacionRecuperacion;

    private boolean sinDerecho;

    @ManyToOne
    @JoinColumn(name = "idInformacionAcademica", referencedColumnName = "id")
    private InformacionAcademica informacionAcademica;

    public InformacionAcademica getInformacionAcademica() {
        return informacionAcademica;
    }

    public void setInformacionAcademica(InformacionAcademica informacionAcademica) {
        this.informacionAcademica = informacionAcademica;
    }

    public Long getIdCalificacionUnidad() {
        return idCalificacionUnidad;
    }

    public void setIdCalificacionUnidad(Long idCalificacionUnidad) {
        this.idCalificacionUnidad = idCalificacionUnidad;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    public AsignacionAsignatura getAsignacionAsignatura() {
        return asignacionAsignatura;
    }

    public void setAsignacionAsignatura(AsignacionAsignatura asignacionAsignatura) {
        this.asignacionAsignatura = asignacionAsignatura;
    }

    public UnidadesPorAsignatura getUnidadesAsignatura() {
        return unidadesAsignatura;
    }

    public void setUnidadesAsignatura(UnidadesPorAsignatura unidadesAsignatura) {
        this.unidadesAsignatura = unidadesAsignatura;
    }

    public boolean isReqAsistencias() {
        return reqAsistencias;
    }

    public void setReqAsistencias(boolean reqAsistencias) {
        this.reqAsistencias = reqAsistencias;
    }

    public Double getCalificacionOrdinaria() {
        return calificacionOrdinaria;
    }

    public void setCalificacionOrdinaria(Double calificacionOrdinaria) {
        this.calificacionOrdinaria = calificacionOrdinaria;
    }

    public boolean isRecuperacion() {
        return recuperacion;
    }

    public void setRecuperacion(boolean recuperacion) {
        this.recuperacion = recuperacion;
    }

    public Double getCalificacionRecuperacion() {
        return calificacionRecuperacion;
    }

    public void setCalificacionRecuperacion(Double calificacionRecuperacion) {
        this.calificacionRecuperacion = calificacionRecuperacion;
    }

    public boolean isSinDerecho() {
        return sinDerecho;
    }

    public void setSinDerecho(boolean sinDerecho) {
        this.sinDerecho = sinDerecho;
    }

}
