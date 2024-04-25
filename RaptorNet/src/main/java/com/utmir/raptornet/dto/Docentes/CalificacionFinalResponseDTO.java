package com.utmir.raptornet.dto.Docentes;

public class CalificacionFinalResponseDTO {

    private Long idCalificaciones;
    private String matriculaAlumno;
    private Long idAsignacionAsignatura;
    private Integer calificacionOrdinaria;
    private boolean recuperacion;
    private Integer calificacionRecuperacion;
    private boolean firmaDocente;

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

    public String getMatriculaAlumno() {
        return matriculaAlumno;
    }

    public void setMatriculaAlumno(String matriculaAlumno) {
        this.matriculaAlumno = matriculaAlumno;
    }

    public Long getIdAsignacionAsignatura() {
        return idAsignacionAsignatura;
    }

    public void setIdAsignacionAsignatura(Long idAsignacionAsignatura) {
        this.idAsignacionAsignatura = idAsignacionAsignatura;
    }

    public Integer getCalificacionOrdinaria() {
        return calificacionOrdinaria;
    }

    public void setCalificacionOrdinaria(Integer calificacionOrdinaria) {
        this.calificacionOrdinaria = calificacionOrdinaria;
    }

    public boolean isRecuperacion() {
        return recuperacion;
    }

    public void setRecuperacion(boolean recuperacion) {
        this.recuperacion = recuperacion;
    }

    public Integer getCalificacionRecuperacion() {
        return calificacionRecuperacion;
    }

    public void setCalificacionRecuperacion(Integer calificacionRecuperacion) {
        this.calificacionRecuperacion = calificacionRecuperacion;
    }

}