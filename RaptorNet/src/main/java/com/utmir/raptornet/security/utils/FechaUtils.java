package com.utmir.raptornet.security.utils;

import java.time.DayOfWeek;

public class FechaUtils { // O implementarlo dentro de UnidadesAsignaturaService si prefieres

    public static DayOfWeek convertirADayOfWeek(String dia) {
        switch (dia.toLowerCase()) {
            case "lunes":
                return DayOfWeek.MONDAY;
            case "martes":
                return DayOfWeek.TUESDAY;
            case "miércoles":
                return DayOfWeek.WEDNESDAY;
            case "jueves":
                return DayOfWeek.THURSDAY;
            case "viernes":
                return DayOfWeek.FRIDAY;
            case "sábado":
                return DayOfWeek.SATURDAY;
            case "domingo":
                return DayOfWeek.SUNDAY;
            default:
                throw new IllegalArgumentException("Día de la semana no válido: " + dia);
        }
    }
}
