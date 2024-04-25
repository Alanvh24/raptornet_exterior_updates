package com.utmir.raptornet.dto.Docentes;

public class CalificacionRemedialDTO {

    private String matriculaAlumno;
    private Long idAsignacionAsignatura;
    private Integer calificacionRemedial;

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

    public Integer getCalificacionRemedial() {
        return calificacionRemedial;
    }

    public void setCalificacionRemedial(Integer calificacionRemedial) {
        this.calificacionRemedial = calificacionRemedial;
    }

}
