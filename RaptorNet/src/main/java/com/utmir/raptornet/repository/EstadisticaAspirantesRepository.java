package com.utmir.raptornet.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.EstadisticaAspirantes;

public interface EstadisticaAspirantesRepository extends JpaRepository <EstadisticaAspirantes, Long>{

    Optional<EstadisticaAspirantes> findByAnio(int anio);
    
}
