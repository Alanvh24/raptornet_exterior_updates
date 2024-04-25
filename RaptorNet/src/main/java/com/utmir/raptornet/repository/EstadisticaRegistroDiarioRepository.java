package com.utmir.raptornet.repository;

import java.time.LocalDate;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.EstadisticaRegistroDiario;

public interface EstadisticaRegistroDiarioRepository extends JpaRepository<EstadisticaRegistroDiario, Long> {
    Optional<EstadisticaRegistroDiario> findByFecha(LocalDate fecha);
}
