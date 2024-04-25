package com.utmir.raptornet.security.services;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.utmir.raptornet.models.EstadisticaRegistroDiario;
import com.utmir.raptornet.repository.EstadisticaRegistroDiarioRepository;

@Service
public class EstadisticaRegistroDiarioService {

    @Autowired
    EstadisticaRegistroDiarioRepository estadisticaRegistroDiarioRepository;

    public void actualizarEstadisticaRegistro(LocalDate fecha) {
        EstadisticaRegistroDiario estadistica = estadisticaRegistroDiarioRepository.findByFecha(fecha)
                .orElse(new EstadisticaRegistroDiario());

        estadistica.setFecha(fecha);
        estadistica.setCantidadRegistros(
                estadistica.getCantidadRegistros() == null ? 1 : estadistica.getCantidadRegistros() + 1);
        estadisticaRegistroDiarioRepository.save(estadistica);
    }

    public Optional<EstadisticaRegistroDiario> obtenerEstadisticaPorFecha(LocalDate fecha) {
        return estadisticaRegistroDiarioRepository.findByFecha(fecha);
    }

    public List<EstadisticaRegistroDiario> obtenerTodasLasEstadisticas() {
        return estadisticaRegistroDiarioRepository.findAll();
    }

}
