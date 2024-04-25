package com.utmir.raptornet.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.Carreras;
import com.utmir.raptornet.models.EstadisticaAspirantesCarrera;

public interface EstadisticasAspirantesCarreraRepository extends JpaRepository <EstadisticaAspirantesCarrera, Long> {
    
    Optional<EstadisticaAspirantesCarrera> findByCarreraAndAnio(Carreras carrera, int anio);
    
}
