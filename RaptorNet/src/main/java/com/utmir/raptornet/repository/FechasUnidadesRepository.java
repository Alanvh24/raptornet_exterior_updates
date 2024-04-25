package com.utmir.raptornet.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.AsignacionAsignatura;
import com.utmir.raptornet.models.FechasUnidades;
import com.utmir.raptornet.models.Grupo;
import com.utmir.raptornet.models.UnidadesPorAsignatura;

public interface FechasUnidadesRepository extends JpaRepository<FechasUnidades, Long> {

        List<FechasUnidades> findByAlumno_Matricula(String matricula);

        List<FechasUnidades> findByUnidadesPorAsignatura_IdUnidadesAsignatura(Long idUnidadesAsignatura);

        List<FechasUnidades> findByUnidadesPorAsignaturaAndGrupo(UnidadesPorAsignatura unidad, Grupo grupo);

        Optional<FechasUnidades> findByUnidadesPorAsignaturaAndGrupoAndStatus(UnidadesPorAsignatura unidad,
                        Grupo grupo, Boolean status);

        Optional<FechasUnidades> findByUnidadesPorAsignaturaIdUnidadesAsignatura(Long idUnidadesAsignatura);

        Optional<FechasUnidades> findByUnidadesPorAsignaturaIdUnidadesAsignaturaAndGrupoId(Long idUnidadesAsignatura,
                        Long idGrupo);

        Optional<FechasUnidades> findByAsignacionAsignatura_IdAsignacionAsignaturaAndGrupo_Id(
                        Long idAsignacionAsignatura, Long idGrupo);

        Optional<FechasUnidades> findByAsignacionAsignatura_IdAsignacionAsignaturaAndGrupo_IdAndUnidadesPorAsignatura_IdUnidadesAsignatura(
                        Long idAsignacionAsignatura, Long idGrupo, Long idUnidadesAsignatura);

        Optional<FechasUnidades> findByAsignacionAsignatura_IdAsignacionAsignaturaAndGrupo_IdAndUnidadesPorAsignatura_IdUnidadesAsignaturaAndStatusIsTrue(
                        Long idAsignacionAsignatura, Long idGrupo, Long idUnidadesAsignatura);

        List<FechasUnidades> findByUnidadesPorAsignaturaIdUnidadesAsignaturaAndGrupoIdAndStatusIsTrue(
                        Long idUnidadesAsignatura, Long idGrupo);

        Optional<FechasUnidades> findByUnidadesPorAsignaturaIdUnidadesAsignaturaAndAsignacionAsignaturaIdAsignacionAsignaturaAndStatusIsTrue(
                        Long idUnidadesAsignatura, Long idAsignacionAsignatura);

        Optional<FechasUnidades> findByUnidadesPorAsignaturaAndAsignacionAsignatura(
                        UnidadesPorAsignatura unidadesPorAsignatura, AsignacionAsignatura asignacionAsignatura);

}
