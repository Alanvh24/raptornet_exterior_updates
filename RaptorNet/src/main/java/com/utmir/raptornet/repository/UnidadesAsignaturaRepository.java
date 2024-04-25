package com.utmir.raptornet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.UnidadesPorAsignatura;

public interface UnidadesAsignaturaRepository extends JpaRepository<UnidadesPorAsignatura, Long> {

    List<UnidadesPorAsignatura> findByAsignaturas_IdAsignaturas(Long idAsignaturas);

}
