package com.utmir.raptornet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.ProyectoAsignatura;

public interface ProyectoAsignaturaRepository extends JpaRepository<ProyectoAsignatura, Long> {

    List<ProyectoAsignatura> findByAsignacionAsignatura_IdAsignacionAsignatura(Long idAsignacionAsignatura);
}
