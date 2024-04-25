package com.utmir.raptornet.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.AsignacionAsignatura;
import com.utmir.raptornet.models.Asignaturas;
import com.utmir.raptornet.models.Grupo;

public interface AsignacionAsignaturaRepository extends JpaRepository<AsignacionAsignatura, Long> {

        List<AsignacionAsignatura> findByAlumno(Alumno alumno);

        List<AsignacionAsignatura> findByAlumnoAndStatus(Alumno alumno, Boolean status);

        List<AsignacionAsignatura> findByAlumnoAndAsignaturasAndGrupo(Alumno alumno, Asignaturas asignaturas,
                        Grupo grupo);

        Optional<AsignacionAsignatura> findByAsignaturas_IdAsignaturasAndGrupoIdAndAlumnoMatricula(Long idAsignatura,
                        Long idGrupo,
                        String matriculaDocente);

        Optional<AsignacionAsignatura> findByIdAsignacionAsignaturaAndAlumnoMatricula(Long idAsignacionAsignatura,
                        String matriculaDocente);

        Optional<AsignacionAsignatura> findByAsignaturas_IdAsignaturasAndGrupoIdAndAlumnoMatriculaAndStatusIsTrue(
                        Long idAsignatura, Long idGrupo, String matriculaDocente);

        Optional<AsignacionAsignatura> findByAlumnoAndAsignaturasAndGrupoAndStatusIsTrue(Alumno alumno,
                        Asignaturas asignaturas, Grupo grupo);

        Optional<AsignacionAsignatura> findByAsignaturasAndGrupoAndAlumnoAndStatusIsTrue(Asignaturas asignaturas,
                        Grupo grupo, Alumno alumno);

        List<AsignacionAsignatura> findByAsignaturasAndGrupo(Asignaturas asignatura, Grupo grupo);

        List<AsignacionAsignatura> findByAsignaturasIdAsignaturasAndGrupoId(Long idAsignaturas, Long idGrupo);

        List<AsignacionAsignatura> findAllByStatus(boolean status);

        List<AsignacionAsignatura> findByStatus(Boolean status);

}
