package com.utmir.raptornet.dto.Docentes;

import java.time.LocalDate;

public class AsistenciaAlumnoResponse {

    private String matriculaAlumno;
    private LocalDate fechaAsistencia;
    private Integer tipoAsistencia;

    public String getMatriculaAlumno() {
        return matriculaAlumno;
    }

    public void setMatriculaAlumno(String matriculaAlumno) {
        this.matriculaAlumno = matriculaAlumno;
    }

    public LocalDate getFechaAsistencia() {
        return fechaAsistencia;
    }

    public void setFechaAsistencia(LocalDate fechaAsistencia) {
        this.fechaAsistencia = fechaAsistencia;
    }

    public Integer getTipoAsistencia() {
        return tipoAsistencia;
    }

    public void setTipoAsistencia(Integer tipoAsistencia) {
        this.tipoAsistencia = tipoAsistencia;
    }

    public AsistenciaAlumnoResponse(String matricula, LocalDate fechaAsistencia, Integer tipoAsistencia) {

        this.matriculaAlumno = matricula;
        this.fechaAsistencia = fechaAsistencia;
        this.tipoAsistencia = tipoAsistencia;
    }

}
