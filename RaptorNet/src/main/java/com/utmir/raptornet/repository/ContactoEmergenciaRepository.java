package com.utmir.raptornet.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.ContactoEmergencia;


public interface ContactoEmergenciaRepository extends JpaRepository<ContactoEmergencia, Long> {

    Optional<ContactoEmergencia> findByAlumno(Alumno alumno);
    
}
