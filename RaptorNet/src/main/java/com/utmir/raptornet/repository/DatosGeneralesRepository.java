package com.utmir.raptornet.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.DatosGenerales;

public interface DatosGeneralesRepository extends JpaRepository<DatosGenerales, Long> {

    Optional<DatosGenerales> findByAlumno(Alumno alumno);
    
}
