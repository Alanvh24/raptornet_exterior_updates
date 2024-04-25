package com.utmir.raptornet.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.AntecedentesAcademicos;

public interface AntecedentesAcademicosRepository extends JpaRepository <AntecedentesAcademicos, Long> {

    Optional <AntecedentesAcademicos> findByAlumno(Alumno alumno);
    
}
