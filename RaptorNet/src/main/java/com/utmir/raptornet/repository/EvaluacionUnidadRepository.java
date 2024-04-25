package com.utmir.raptornet.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.AsignacionAsignatura;
import com.utmir.raptornet.models.EvaluacionUnidad;
import com.utmir.raptornet.models.UnidadesPorAsignatura;

public interface EvaluacionUnidadRepository extends JpaRepository<EvaluacionUnidad, Long> {

        Optional<EvaluacionUnidad> findByUnidadesPorAsignaturaAndAsignacionAsignatura(UnidadesPorAsignatura unidad,
                        AsignacionAsignatura asignacion);

        Optional<EvaluacionUnidad> findByUnidadesPorAsignaturaIdUnidadesAsignaturaAndAsignacionAsignaturaIdAsignacionAsignatura(
                        Long idUnidadesPorAsignatura,
                        Long idAsignacionAsignatura);

}
