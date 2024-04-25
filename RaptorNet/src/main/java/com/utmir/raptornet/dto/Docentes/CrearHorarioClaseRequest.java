package com.utmir.raptornet.dto.Docentes;

import java.time.LocalTime;

public class CrearHorarioClaseRequest {

    private String diaClase;
    private LocalTime horaInicio;
    private LocalTime horaFinal;
    private Long idAsignatura;
    private Long idGrupo;
    
    public String getDiaClase() {
        return diaClase;
    }
    public void setDiaClase(String diaClase) {
        this.diaClase = diaClase;
    }
    public LocalTime getHoraInicio() {
        return horaInicio;
    }
    public void setHoraInicio(LocalTime horaInicio) {
        this.horaInicio = horaInicio;
    }
    public LocalTime getHoraFinal() {
        return horaFinal;
    }
    public void setHoraFinal(LocalTime horaFinal) {
        this.horaFinal = horaFinal;
    }
    public Long getIdAsignatura() {
        return idAsignatura;
    }
    public void setIdAsignatura(Long idAsignatura) {
        this.idAsignatura = idAsignatura;
    }
    public Long getIdGrupo() {
        return idGrupo;
    }
    public void setIdGrupo(Long idGrupo) {
        this.idGrupo = idGrupo;
    }

}
