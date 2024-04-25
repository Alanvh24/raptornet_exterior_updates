package com.utmir.raptornet.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.InformacionMedica;

public interface InformacionMedicaRepository extends JpaRepository <InformacionMedica, Long>{

    Optional<InformacionMedica> findByAlumno(Alumno alumno);
    
}
