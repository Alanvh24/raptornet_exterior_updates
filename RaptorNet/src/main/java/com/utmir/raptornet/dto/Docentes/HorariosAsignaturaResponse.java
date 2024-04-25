package com.utmir.raptornet.dto.Docentes;

import java.time.LocalTime;

import com.fasterxml.jackson.annotation.JsonFormat;

public class HorariosAsignaturaResponse {

    private String diaClase;

    @JsonFormat(pattern = "HH:mm")
    private LocalTime horaInicio;

    @JsonFormat(pattern = "HH:mm")
    private LocalTime horaFinal;

    // Constructor, getters y setters

    public HorariosAsignaturaResponse(String diaClase, LocalTime horaInicio, LocalTime horaFinal) {
        this.diaClase = diaClase;
        this.horaInicio = horaInicio;
        this.horaFinal = horaFinal;
    }

    // Getters y setters
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

}
