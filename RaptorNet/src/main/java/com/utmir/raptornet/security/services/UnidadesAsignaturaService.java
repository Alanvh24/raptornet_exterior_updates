package com.utmir.raptornet.security.services;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.utmir.raptornet.models.FechasUnidades;
import com.utmir.raptornet.models.HorariosClase;
import com.utmir.raptornet.repository.FechasUnidadesRepository;
import com.utmir.raptornet.repository.HorariosClaseRepository;
import com.utmir.raptornet.security.utils.FechaUtils;

@Service
public class UnidadesAsignaturaService {

    @Autowired
    private HorariosClaseRepository horariosClaseRepository;

    @Autowired
    private FechasUnidadesRepository fechasUnidadesRepository;

    public List<LocalDate> calcularFechasDeClaseEfectivas(Long idUnidadesAsignatura) {
        Optional<FechasUnidades> unidadOpt = fechasUnidadesRepository
                .findByUnidadesPorAsignaturaIdUnidadesAsignatura(idUnidadesAsignatura);
        List<HorariosClase> horarios = horariosClaseRepository
                .findByAsignacionAsignatura_IdAsignacionAsignatura(idUnidadesAsignatura); // Ajustar según tu modelo

        if (unidadOpt.isEmpty() || horarios.isEmpty()) {
            return Collections.emptyList();
        }

        FechasUnidades unidad = unidadOpt.get();
        LocalDate inicio = unidad.getFechaInicio();
        LocalDate fin = unidad.getFechaCierre();

        Set<DayOfWeek> diasDeClase = horarios.stream()
                .map(HorariosClase::getDiaClase)
                .map(FechaUtils::convertirADayOfWeek)
                .collect(Collectors.toSet());

        List<LocalDate> fechasDeClase = new ArrayList<>();
        while (!inicio.isAfter(fin)) {
            if (diasDeClase.contains(inicio.getDayOfWeek())) {
                fechasDeClase.add(inicio);
            }
            inicio = inicio.plusDays(1);
        }

        return fechasDeClase;
    }

}
