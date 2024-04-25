package com.utmir.raptornet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.ObjetivosAsignatura;

public interface ObjetivosAsignaturaRepository extends JpaRepository<ObjetivosAsignatura, Long> {

    List<ObjetivosAsignatura> findByAsignacionAsignatura_IdAsignacionAsignatura(Long idAsignacionAsignatura);
}
