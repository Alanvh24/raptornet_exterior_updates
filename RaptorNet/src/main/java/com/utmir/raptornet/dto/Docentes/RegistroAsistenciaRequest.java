package com.utmir.raptornet.dto.Docentes;

import java.time.LocalDate;

public class RegistroAsistenciaRequest {

    private String matriculaAlumno;
    private Long idAsignatura;
    private Integer tipoAsistencia; // 1=Asistencia, 2=Falta, 3=Justificado, 4=Retardo
    private LocalDate fechaAsistencia;
    private Long idUnidadesAsignatura;
    private Long idGrupo;
    private Long idAsignacionAsignatura;

    public Long getIdAsignacionAsignatura() {
        return idAsignacionAsignatura;
    }

    public void setIdAsignacionAsignatura(Long idAsignacionAsignatura) {
        this.idAsignacionAsignatura = idAsignacionAsignatura;
    }

    public Long getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(Long idGrupo) {
        this.idGrupo = idGrupo;
    }

    public String getMatriculaAlumno() {
        return matriculaAlumno;
    }

    public void setMatriculaAlumno(String matriculaAlumno) {
        this.matriculaAlumno = matriculaAlumno;
    }

    public Long getIdAsignatura() {
        return idAsignatura;
    }

    public void setIdAsignatura(Long idAsignatura) {
        this.idAsignatura = idAsignatura;
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

    public Long getIdUnidadesAsignatura() {
        return idUnidadesAsignatura;
    }

    public void setIdUnidadesAsignatura(Long idUnidadesAsignatura) {
        this.idUnidadesAsignatura = idUnidadesAsignatura;
    }

}
