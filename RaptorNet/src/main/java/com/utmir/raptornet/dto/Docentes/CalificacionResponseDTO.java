package com.utmir.raptornet.dto.Docentes;

public class CalificacionResponseDTO {
    private String matriculaAlumno;
    private Long idAsignacionAsignatura;
    private Long idUnidadesAsignatura;
    private boolean reqAsistencias;
    private Double calificacionOrdinaria;
    private boolean recuperacion;
    private Double calificacionRecuperacion;

    // Getters y setters
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

    public Long getIdUnidadesAsignatura() {
        return idUnidadesAsignatura;
    }

    public void setIdUnidadesAsignatura(Long idUnidadesAsignatura) {
        this.idUnidadesAsignatura = idUnidadesAsignatura;
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
}