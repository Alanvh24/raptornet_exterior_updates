package com.utmir.raptornet.security.services;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.utmir.raptornet.models.Carreras;
import com.utmir.raptornet.models.EstadisticaAspirantesCarrera;
import com.utmir.raptornet.repository.AlumnoRepository;
import com.utmir.raptornet.repository.CarrerasRepository;
import com.utmir.raptornet.repository.EstadisticasAspirantesCarreraRepository;

@Service

public class EstadisticaAspirantesCarreraService {
    @Autowired
    private EstadisticasAspirantesCarreraRepository estadisticasAspirantesCarreraRepository;
    @Autowired
    CarrerasRepository carrerasRepository;
    @Autowired
    AlumnoRepository alumnoRepository;

    public void registrarAspiranteCarrera(Long idCarrera) {
        int anioActual = LocalDate.now().getYear();
        Carreras carrera = carrerasRepository.findById(idCarrera)
                .orElseThrow(() -> new RuntimeException("Error: Carrera no encontrada."));
        EstadisticaAspirantesCarrera estadistica = estadisticasAspirantesCarreraRepository.findByCarreraAndAnio(carrera, anioActual)
                .orElse(new EstadisticaAspirantesCarrera());
        estadistica.setCarrera(carrera);
        estadistica.setAnio(anioActual);
        estadistica.setCantidadAspirantes(estadistica.getCantidadAspirantes() + 1);
        estadistica.setCantidadAspirantesNoCompletados(estadistica.getCantidadAspirantesNoCompletados() + 1);

        estadisticasAspirantesCarreraRepository.save(estadistica);
    }

    public void actualizarEstadisticasAspiranteCompleto(Long idCarrera) {
        int anioActual = LocalDate.now().getYear();
        Carreras carrera = carrerasRepository.findById(idCarrera)
                .orElseThrow(() -> new RuntimeException("Error: Carrera no encontrada."));

        EstadisticaAspirantesCarrera estadistica = estadisticasAspirantesCarreraRepository.findByCarreraAndAnio(carrera, anioActual)
                .orElseThrow(() -> new RuntimeException(
                        "Error: Estadística no encontrada para la carrera con ID: " + idCarrera));
        estadistica.setCantidadAspirantesCompletos(estadistica.getCantidadAspirantesCompletos() + 1);
        estadistica.setCantidadAspirantesNoCompletados(Math.max(0, estadistica.getCantidadAspirantesNoCompletados() - 1));

        estadisticasAspirantesCarreraRepository.save(estadistica);
    }

}
