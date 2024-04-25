package com.utmir.raptornet.security.services;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.utmir.raptornet.models.EstadisticaAspirantes;
import com.utmir.raptornet.repository.EstadisticaAspirantesRepository;

@Service
public class EstadisticaAspirantesService {
    @Autowired
    private EstadisticaAspirantesRepository estadisticaAspirantesRepository;

    // Método para iniciar o actualizar las estadísticas
    public void actualizarEstadisticaRegistro() {
        int anioActual = LocalDate.now().getYear();
        EstadisticaAspirantes estadistica = estadisticaAspirantesRepository.findByAnio(anioActual)
                .orElse(new EstadisticaAspirantes(anioActual));

        estadistica.setMatriculasGeneradas(estadistica.getMatriculasGeneradas() + 1);
        estadistica.setCantidadAspirantesNoCompletados(estadistica.getCantidadAspirantesNoCompletados() + 1);

        estadisticaAspirantesRepository.save(estadistica);
    }

    public void actualizarPorAspiranteCompleto(String matricula) {
        int anioActual = LocalDate.now().getYear();
        EstadisticaAspirantes estadistica = estadisticaAspirantesRepository.findByAnio(anioActual)
                .orElse(new EstadisticaAspirantes(anioActual));

        estadistica.setCantidadAspirantesNoCompletados(estadistica.getCantidadAspirantesNoCompletados() - 1);
        estadistica.setCantidadAspirantesCompletos(estadistica.getCantidadAspirantesCompletos() + 1);

        estadisticaAspirantesRepository.save(estadistica);
    }

}
