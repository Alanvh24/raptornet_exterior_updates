package com.utmir.raptornet.security.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.AsignacionAsignatura;
import com.utmir.raptornet.models.Calificaciones;
import com.utmir.raptornet.models.Cuatrimestre;
import com.utmir.raptornet.models.ERole;
import com.utmir.raptornet.models.InformacionAcademica;
import com.utmir.raptornet.models.Role;
import com.utmir.raptornet.models.Status;
import com.utmir.raptornet.repository.AlumnoRepository;
import com.utmir.raptornet.repository.AsignacionAsignaturaRepository;
import com.utmir.raptornet.repository.CalificacionesRepository;
import com.utmir.raptornet.repository.CuatrimestreRepository;
import com.utmir.raptornet.repository.InformacionAcademicaRepository;
import com.utmir.raptornet.repository.RoleRepository;
import com.utmir.raptornet.repository.StatusRepository;

import jakarta.transaction.Transactional;

@Service
public class AvanzarCuatrimestreService {

    @Autowired
    private CalificacionesRepository calificacionesRepository;
    @Autowired
    private AsignacionAsignaturaRepository asignacionAsignaturaRepository;
    @Autowired
    private InformacionAcademicaRepository informacionAcademicaRepository;
    @Autowired
    private CuatrimestreRepository cuatrimestreRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private AlumnoRepository alumnoRepository;
    @Autowired
    private StatusRepository statusRepository;

    Long STATUS_EGRESADO_ID = 0L;

    @Transactional
    public void avanzarCuatrimestre() {

        // Verificar que todas las calificaciones de asignaturas activas estén firmadas
        List<Calificaciones> calificacionesPendientes = calificacionesRepository.findCalificacionesPendientes();
        if (!calificacionesPendientes.isEmpty()) {
            throw new IllegalStateException("Existen calificaciones pendientes de firma.");
        }

        // Obtener todas las asignaciones activas y desactivarlas
        List<AsignacionAsignatura> asignacionesActivas = asignacionAsignaturaRepository.findByStatus(true);
        asignacionesActivas.forEach(asignacion -> {
            asignacion.setStatus(false);
            asignacionAsignaturaRepository.save(asignacion);
        });

        Long ultimoCuatrimestreId = 12L;
        Status statusEgresado = statusRepository.findById(STATUS_EGRESADO_ID)
                .orElseThrow(() -> new RuntimeException("Status de egresado no encontrado"));

        List<InformacionAcademica> estudiantesActivos = informacionAcademicaRepository.findByStatus_IdStatus(1L);
        estudiantesActivos.forEach(informacion -> {
            Long idCuatrimestreActual = informacion.getCuatrimestre().getId();
            if (idCuatrimestreActual < ultimoCuatrimestreId) {
                Cuatrimestre nuevoCuatrimestre = cuatrimestreRepository.findById(idCuatrimestreActual + 1)
                        .orElseThrow(() -> new RuntimeException(
                                "Cuatrimestre no encontrado para el ID: " + (idCuatrimestreActual + 1)));
                informacion.setCuatrimestre(nuevoCuatrimestre);
                informacionAcademicaRepository.save(informacion);
            } else if (idCuatrimestreActual.equals(ultimoCuatrimestreId)) {
                informacion.setStatus(statusEgresado); // Asigna el status de egresado
                informacionAcademicaRepository.save(informacion);
                actualizarRolAlumnoAEgresado(informacion.getAlumno().getMatricula());
            }
        });
    }

    private void actualizarRolAlumnoAEgresado(String matricula) {
        Alumno alumno = alumnoRepository.findByMatricula(matricula)
                .orElseThrow(() -> new RuntimeException("Alumno no encontrado"));
        Role roleEgresado = roleRepository.findByName(ERole.ROLE_EGRESADO_ING_LIC)
                .orElseThrow(() -> new RuntimeException("Rol no encontrado: " + ERole.ROLE_EGRESADO_ING_LIC));
        alumno.getRoles().clear();
        alumno.getRoles().add(roleEgresado);
        alumnoRepository.save(alumno);
    }

}
