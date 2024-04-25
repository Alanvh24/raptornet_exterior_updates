package com.utmir.raptornet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.AsignacionAsignatura;
import com.utmir.raptornet.models.Planeaciones;

public interface PlaneacionesRepository extends JpaRepository<Planeaciones, Long> {

    List<Planeaciones> findByAsignacionAsignatura(AsignacionAsignatura asignacionAsignatura);

}
