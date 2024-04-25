package com.utmir.raptornet.security.services;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.utmir.raptornet.dto.ServiciosEscolares.HistorialAcademico;
import com.utmir.raptornet.models.AsignacionAsignatura;
import com.utmir.raptornet.models.Asignaturas;
import com.utmir.raptornet.models.Calificaciones;
import com.utmir.raptornet.models.CalificacionesUnidad;
import com.utmir.raptornet.models.Carreras;
import com.utmir.raptornet.models.UnidadesPorAsignatura;
import com.utmir.raptornet.repository.CalificacionesRepository;
import com.utmir.raptornet.repository.CalificacionesUnidadRepository;
import com.utmir.raptornet.repository.UnidadesAsignaturaRepository;

@Service
public class HistorialAcademicoService {

    @Autowired
    private CalificacionesRepository calificacionesRepository;
    @Autowired
    private CalificacionesUnidadRepository calificacionesUnidadRepository;
    @Autowired
    private UnidadesAsignaturaRepository unidadesAsignaturaRepository; // Repositorio para las unidades por asignatura

    public List<HistorialAcademico> obtenerHistorialAcademicoPorMatricula(String matricula) {
        List<Calificaciones> calificaciones = calificacionesRepository.findByAlumno_Matricula(matricula);

        Map<String, HistorialAcademico> historial = new LinkedHashMap<>();

        for (Calificaciones calificacion : calificaciones) {
            AsignacionAsignatura asignacion = calificacion.getAsignacionAsignatura();
            Asignaturas asignatura = asignacion.getAsignaturas();
            Carreras carrera = asignatura.getCarreras();

            List<UnidadesPorAsignatura> unidades = unidadesAsignaturaRepository
                    .findByAsignaturas_IdAsignaturas(asignatura.getIdAsignaturas());
            List<CalificacionesUnidad> calificacionesUnidad = calificacionesUnidadRepository
                    .findByAlumnoMatricula(matricula);

            String claveUnica = asignatura.getIdAsignaturas() + "-" + carrera.getId_carrera();
            HistorialAcademico dto = historial.getOrDefault(claveUnica, new HistorialAcademico());
            dto.setMatricula(matricula);
            dto.setCarrera(carrera.getCarrera());
            dto.setCuatrimestre(asignatura.getCuatrimestre().getCuatrimestre());
            dto.setDocente(asignacion.getAlumno().getNombre());
            dto.setPeriodo(asignacion.getPeriodoCuatrimestrales().getPeriodo());
            dto.setNombreAsignatura(asignatura.getNombre_asignatura());
            dto.setCalificacionOrdinaria(calificacion.getCalificacionOrdinaria());
            dto.setRemedial(calificacion.isRemedial());
            dto.setCalificacionRemedial(calificacion.getCalificacionRemedial());

            // Procesar todas las unidades
            for (UnidadesPorAsignatura unidad : unidades) {
                CalificacionesUnidad calificacionPorUnidad = calificacionesUnidad.stream()
                        .filter(c -> c.getUnidadesAsignatura().equals(unidad))
                        .findFirst()
                        .orElse(null);

                HistorialAcademico.CalificacionUnidadDTO unidadDTO = new HistorialAcademico.CalificacionUnidadDTO();
                unidadDTO.setNombreUnidad(unidad.getNombre_unidad());
                unidadDTO.setCalificacion(
                        calificacionPorUnidad != null ? calificacionPorUnidad.getCalificacionOrdinaria() : null);
                dto.getCalificacionesUnidades().add(unidadDTO);
            }

            historial.put(claveUnica, dto);
        }

        return new ArrayList<>(historial.values());
    }
}
