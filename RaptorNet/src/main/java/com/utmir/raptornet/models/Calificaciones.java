package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_calificaciones")
public class Calificaciones {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idCalificaciones;

    @ManyToOne
    @JoinColumn(name = "idAsignacionAsignatura", referencedColumnName = "idAsignacionAsignatura")
    private AsignacionAsignatura asignacionAsignatura;

    @ManyToOne
    @JoinColumn(name = "matriculaAlumno", referencedColumnName = "matricula")
    private Alumno alumno;

    @ManyToOne
    @JoinColumn(name = "idInformacionAcademica", referencedColumnName = "id")
    private InformacionAcademica informacionAcademica;

    private Integer calificacionOrdinaria;

    private boolean remedial;

    private Integer calificacionRemedial;

    private boolean firmaDocente;

    private boolean firmaRemedial;

    public boolean isFirmaRemedial() {
        return firmaRemedial;
    }

    public void setFirmaRemedial(boolean firmaRemedial) {
        this.firmaRemedial = firmaRemedial;
    }

    public boolean isFirmaDocente() {
        return firmaDocente;
    }

    public void setFirmaDocente(boolean firmaDocente) {
        this.firmaDocente = firmaDocente;
    }

    public Long getIdCalificaciones() {
        return idCalificaciones;
    }

    public void setIdCalificaciones(Long idCalificaciones) {
        this.idCalificaciones = idCalificaciones;
    }

    public AsignacionAsignatura getAsignacionAsignatura() {
        return asignacionAsignatura;
    }

    public void setAsignacionAsignatura(AsignacionAsignatura asignacionAsignatura) {
        this.asignacionAsignatura = asignacionAsignatura;
    }

    public InformacionAcademica getInformacionAcademica() {
        return informacionAcademica;
    }

    public void setInformacionAcademica(InformacionAcademica informacionAcademica) {
        this.informacionAcademica = informacionAcademica;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    public Integer getCalificacionOrdinaria() {
        return calificacionOrdinaria;
    }

    public void setCalificacionOrdinaria(Integer calificacionOrdinaria) {
        this.calificacionOrdinaria = calificacionOrdinaria;
    }

    public boolean isRemedial() {
        return remedial;
    }

    public void setRemedial(boolean remedial) {
        this.remedial = remedial;
    }

    public Integer getCalificacionRemedial() {
        return calificacionRemedial;
    }

    public void setCalificacionRemedial(Integer calificacionRemedial) {
        this.calificacionRemedial = calificacionRemedial;
    }

}
