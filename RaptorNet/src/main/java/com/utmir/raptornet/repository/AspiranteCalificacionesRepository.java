package com.utmir.raptornet.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.AspiranteCalificaciones;

public interface AspiranteCalificacionesRepository extends JpaRepository<AspiranteCalificaciones, Long> {

    Optional<AspiranteCalificaciones> findByAlumno(Alumno alumno);
    
}
