package com.utmir.raptornet.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.utmir.raptornet.dto.DireccionAcademica.AsignarMateriasRequest;
import com.utmir.raptornet.dto.DireccionAcademica.AsignaturasAsignadasRequest;
import com.utmir.raptornet.dto.Docentes.HorariosAsignaturaResponse;
import com.utmir.raptornet.dto.Docentes.ObjetivoAsignaturaResponse;
import com.utmir.raptornet.dto.Docentes.PlaneacionResponse;
import com.utmir.raptornet.dto.Docentes.ProyectoAsignaturaResponse;
import com.utmir.raptornet.dto.Docentes.UnidadAsignaturaDetalle;
import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.AsignacionAsignatura;
import com.utmir.raptornet.models.Asignaturas;
import com.utmir.raptornet.models.Carreras;
import com.utmir.raptornet.models.Cuatrimestre;
import com.utmir.raptornet.models.FechasUnidades;
import com.utmir.raptornet.models.Grupo;
import com.utmir.raptornet.models.HorariosClase;
import com.utmir.raptornet.models.ObjetivosAsignatura;
import com.utmir.raptornet.models.PeriodoCuatrimestral;
import com.utmir.raptornet.models.Planeaciones;
import com.utmir.raptornet.models.ProyectoAsignatura;
import com.utmir.raptornet.models.UnidadesPorAsignatura;
import com.utmir.raptornet.payload.response.MessageResponse;
import com.utmir.raptornet.payload.response.ResourceNotFoundException;
import com.utmir.raptornet.repository.AlumnoRepository;
import com.utmir.raptornet.repository.AsignacionAsignaturaRepository;
import com.utmir.raptornet.repository.AsignaturasRepository;
import com.utmir.raptornet.repository.AsistenciasRepository;
import com.utmir.raptornet.repository.CalificacionesUnidadRepository;
import com.utmir.raptornet.repository.CarrerasRepository;
import com.utmir.raptornet.repository.CuatrimestreRepository;
import com.utmir.raptornet.repository.EvaluacionUnidadRepository;
import com.utmir.raptornet.repository.FechasUnidadesRepository;
import com.utmir.raptornet.repository.GrupoRepository;
import com.utmir.raptornet.repository.HorariosClaseRepository;
import com.utmir.raptornet.repository.InformacionAcademicaRepository;
import com.utmir.raptornet.repository.ObjetivosAsignaturaRepository;
import com.utmir.raptornet.repository.PeriodoCuatrimestralRepository;
import com.utmir.raptornet.repository.PlaneacionesRepository;
import com.utmir.raptornet.repository.ProyectoAsignaturaRepository;
import com.utmir.raptornet.repository.UnidadesAsignaturaRepository;
import com.utmir.raptornet.security.services.AsistenciaService;
import com.utmir.raptornet.security.services.LogService;
import com.utmir.raptornet.security.services.UnidadesAsignaturaService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/academia")
public class DireccionAcademicaController {

        @Autowired
        AlumnoRepository alumnoRepository;
        @Autowired
        AsignaturasRepository asignaturasRepository;
        @Autowired
        CarrerasRepository carrerasRepository;
        @Autowired
        AsignacionAsignaturaRepository asignacionAsignaturaRepository;
        @Autowired
        GrupoRepository grupoRepository;
        @Autowired
        PlaneacionesRepository planeacionesRepository;
        @Autowired
        UnidadesAsignaturaRepository unidadesAsignaturaRepository;
        @Autowired
        FechasUnidadesRepository fechasUnidadesRepository;
        @Autowired
        ObjetivosAsignaturaRepository objetivosAsignaturaRepository;
        @Autowired
        HorariosClaseRepository horariosClaseRepository;
        @Autowired
        EvaluacionUnidadRepository evaluacionUnidadRepository;
        @Autowired
        ProyectoAsignaturaRepository proyectoAsignaturaRepository;
        @Autowired
        InformacionAcademicaRepository informacionAcademicaRepository;
        @Autowired
        CarrerasRepository carreraRepository;
        @Autowired
        CuatrimestreRepository cuatrimestreRepository;
        @Autowired
        AsistenciasRepository asistenciasRepository;
        @Autowired
        AsistenciaService asistenciaService;
        @Autowired
        UnidadesAsignaturaService unidadesAsignaturaService;
        @Autowired
        CalificacionesUnidadRepository calificacionesUnidadRepository;
        @Autowired
        PeriodoCuatrimestralRepository periodoCuatrimestralRepository;
        @Autowired
        LogService logService;

        // Información individual de cada matricula
        @GetMapping("/docente/{matricula}")
        public ResponseEntity<List<AsignaturasAsignadasRequest>> obtenerPerfilPorMatricula(
                        @PathVariable String matricula) {
                Alumno alumno = alumnoRepository.findByMatricula(matricula)
                                .orElseThrow(() -> new ResourceNotFoundException(
                                                "Usuario no encontrado con matrícula: " + matricula));

                List<AsignacionAsignatura> asignacionMaterias = asignacionAsignaturaRepository.findByAlumno(alumno);

                if (asignacionMaterias.isEmpty()) {
                        throw new ResourceNotFoundException(
                                        "No se encontraron asignaturas para el docente: " + matricula);
                }

                List<AsignaturasAsignadasRequest> asignaturasAsignadas = new ArrayList<>();

                for (AsignacionAsignatura asignacion : asignacionMaterias) {

                        AsignaturasAsignadasRequest asignaturaAsignada = new AsignaturasAsignadasRequest();

                        asignaturaAsignada.setMatricula_docente(matricula);
                        asignaturaAsignada.setAsignaturas(asignacion.getAsignaturas().getNombre_asignatura());

                        Carreras carrera = asignacion.getAsignaturas().getCarreras();
                        asignaturaAsignada.setPrograma_educativo(
                                        carrera != null ? carrera.getCarrera() : "No especificado");

                        Grupo grupo = asignacion.getGrupo();
                        asignaturaAsignada.setGrupo(grupo != null ? grupo.getGrupo() : "No especificado");

                        Cuatrimestre cuatrimestre = asignacion.getAsignaturas().getCuatrimestre();
                        asignaturaAsignada
                                        .setCuatrimestre(cuatrimestre != null ? cuatrimestre.getCuatrimestre()
                                                        : "No especificado");

                        asignaturasAsignadas.add(asignaturaAsignada);
                }

                return ResponseEntity.ok(asignaturasAsignadas);
        }

        @PostMapping("/docente/asignar-materia")
        public ResponseEntity<?> asignarMateria(@RequestBody AsignarMateriasRequest request) {
                List<MessageResponse> responses = new ArrayList<>();

                try {
                        Alumno alumno = alumnoRepository.findByMatricula(request.getMatricula())
                                        .orElseThrow(() -> new IllegalArgumentException(
                                                        "Docente no encontrado con matrícula: "
                                                                        + request.getMatricula()));

                        Grupo grupo = grupoRepository.findById(request.getId_grupo())
                                        .orElseThrow(() -> new IllegalArgumentException(
                                                        "Grupo no encontrado con ID: " + request.getId_grupo()));

                        List<PeriodoCuatrimestral> periodosActivos = periodoCuatrimestralRepository.findByStatus(true);
                        if (periodosActivos.size() != 1) {
                                throw new IllegalArgumentException(
                                                "Periodo no encontrado o hay más de 1 periodo activo");
                        }
                        PeriodoCuatrimestral periodoCuatrimestralActivo = periodosActivos.get(0);

                        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                        String logeado = authentication.getName(); // Obtenemos la matrícula del usuario autenticado

                        for (Long idAsignatura : request.getId_asignatura()) {
                                Asignaturas asignatura = asignaturasRepository.findById(idAsignatura)
                                                .orElseThrow(() -> new IllegalArgumentException(
                                                                "Asignatura no encontrada con ID: " + idAsignatura));

                                List<AsignacionAsignatura> asignacionesExistentes = asignacionAsignaturaRepository
                                                .findByAlumnoAndAsignaturasAndGrupo(alumno, asignatura, grupo);
                                boolean existeAsignacionActiva = asignacionesExistentes.stream()
                                                .anyMatch(AsignacionAsignatura::getStatus);

                                if (asignacionesExistentes.isEmpty() || !existeAsignacionActiva) {
                                        AsignacionAsignatura nuevaAsignacion = new AsignacionAsignatura();
                                        nuevaAsignacion.setAlumno(alumno);
                                        nuevaAsignacion.setAsignaturas(asignatura);
                                        nuevaAsignacion.setGrupo(grupo);
                                        nuevaAsignacion.setPeriodoCuatrimestrales(periodoCuatrimestralActivo);
                                        nuevaAsignacion.setHabilitarCandado(false);
                                        nuevaAsignacion.setStatus(true);
                                        asignacionAsignaturaRepository.save(nuevaAsignacion);
                                        responses.add(new MessageResponse("Nueva asignación creada para la matrícula: "
                                                        + request.getMatricula() + ", asignatura ID: " + idAsignatura
                                                        + ", y grupo ID: " + request.getId_grupo()));

                                        logService.registrarEvento(logeado,
                                                        logeado + " asignó la materia ID: " + idAsignatura
                                                                        + " al docente con matrícula: "
                                                                        + request.getMatricula());

                                } else {
                                        responses.add(new MessageResponse(
                                                        "No se puede crear la asignación. Ya existe una asignación activa para la matrícula: "
                                                                        + request.getMatricula() + ", asignatura ID: "
                                                                        + idAsignatura
                                                                        + ", y grupo ID: " + request.getId_grupo()));
                                }
                        }
                } catch (Exception e) {
                        responses.add(new MessageResponse(e.getMessage()));
                        return ResponseEntity
                                        .badRequest()
                                        .body(responses);
                }

                boolean success = true;
                for (MessageResponse response : responses) {
                        if (response.getMessage().startsWith("No se puede crear la asignación.")) {
                                success = false;
                                break;
                        }
                }

                Map<String, Object> responseBody = new HashMap<>();
                responseBody.put("success", success);
                responseBody.put("messages", responses);

                return ResponseEntity.ok(responseBody);
        }

        @GetMapping("/materias-asignadas/{matriculaDocente}")
        public ResponseEntity<List<AsignaturasAsignadasRequest>> obtenerMateriasAsignadasDocente(
                        @PathVariable String matriculaDocente) {

                Alumno docente = alumnoRepository.findByMatricula(matriculaDocente)
                                .orElseThrow(() -> new ResourceNotFoundException(
                                                "Docente no encontrado con matrícula: " + matriculaDocente));

                List<AsignacionAsignatura> asignacionMaterias = asignacionAsignaturaRepository
                                .findByAlumnoAndStatus(docente, true);

                if (asignacionMaterias.isEmpty()) {
                        throw new ResourceNotFoundException(
                                        "No se encontraron asignaturas asignadas activas para el docente con matrícula: "
                                                        + matriculaDocente);
                }

                List<AsignaturasAsignadasRequest> asignaturasAsignadas = new ArrayList<>();

                for (AsignacionAsignatura asignacion : asignacionMaterias) {

                        AsignaturasAsignadasRequest asignaturaAsignada = new AsignaturasAsignadasRequest();

                        asignaturaAsignada.setMatricula_docente(matriculaDocente);
                        asignaturaAsignada.setIdAsignacionAsignatura(asignacion.getIdAsignacionAsignatura());
                        asignaturaAsignada.setAsignaturas(asignacion.getAsignaturas().getNombre_asignatura());

                        Carreras carrera = asignacion.getAsignaturas().getCarreras();
                        asignaturaAsignada.setPrograma_educativo(
                                        carrera != null ? carrera.getCarrera() : "No especificado");
                        asignaturaAsignada.setIdCarrera(carrera != null ? carrera.getId_carrera() : null);

                        Grupo grupo = asignacion.getGrupo();
                        asignaturaAsignada.setGrupo(grupo != null ? grupo.getGrupo() : "No especificado");

                        Cuatrimestre cuatrimestre = asignacion.getAsignaturas().getCuatrimestre();
                        asignaturaAsignada.setCuatrimestre(cuatrimestre != null ? cuatrimestre.getCuatrimestre()
                                        : "No especificado");
                        asignaturaAsignada.setIdCuatrimestre(cuatrimestre != null ? cuatrimestre.getId() : null);

                        asignaturaAsignada.setIdAsignatura(asignacion.getAsignaturas().getIdAsignaturas());
                        asignaturaAsignada.setIdGrupo(asignacion.getGrupo().getId());

                        List<UnidadesPorAsignatura> unidadesAsignatura = unidadesAsignaturaRepository
                                        .findByAsignaturas_IdAsignaturas(
                                                        asignacion.getAsignaturas().getIdAsignaturas());

                        List<UnidadAsignaturaDetalle> detallesUnidades = unidadesAsignatura.stream().map(unidad -> {
                                UnidadAsignaturaDetalle detalle = new UnidadAsignaturaDetalle();
                                detalle.setIdUnidadesAsignatura(unidad.getIdUnidadesAsignatura());
                                detalle.setNombreUnidad(unidad.getNombre_unidad());
                                detalle.setTotalHorasUnidad(unidad.getTotal_horas_unidad());
                                detalle.setPorcentaje(unidad.getPorcentaje());

                                // Recuperar las fechas para la unidad
                                Optional<FechasUnidades> fechasOpt = fechasUnidadesRepository
                                                .findByAsignacionAsignatura_IdAsignacionAsignaturaAndGrupo_IdAndUnidadesPorAsignatura_IdUnidadesAsignatura(
                                                                asignacion.getIdAsignacionAsignatura(), grupo.getId(),
                                                                unidad.getIdUnidadesAsignatura());
                                if (fechasOpt.isPresent()) {
                                        FechasUnidades fecha = fechasOpt.get();
                                        detalle.setFechaInicio(fecha.getFechaInicio());
                                        detalle.setFechaCierre(fecha.getFechaCierre());
                                        detalle.setFechaRemedial(fecha.getFechaRemedial());
                                        detalle.setStatus(fecha.getStatus());
                                        detalle.setClasesActivas(fecha.getClasesActivas());
                                }

                                // Recuperar la fecha de evaluación para la unidad
                                evaluacionUnidadRepository
                                                .findByUnidadesPorAsignaturaIdUnidadesAsignaturaAndAsignacionAsignaturaIdAsignacionAsignatura(
                                                                unidad.getIdUnidadesAsignatura(),
                                                                asignacion.getIdAsignacionAsignatura())
                                                .ifPresent(evaluacion -> detalle
                                                                .setFechaEvaluacion(evaluacion.getFechaEvaluacion()));

                                return detalle;
                        }).collect(Collectors.toList());

                        List<Planeaciones> planeacionesList = planeacionesRepository
                                        .findByAsignacionAsignatura(asignacion);
                        List<PlaneacionResponse> planeacionResponses = planeacionesList.stream().map(planeacion -> {
                                return new PlaneacionResponse(
                                                planeacion.getIdPlaneacion(),
                                                planeacion.getNoSemana(),
                                                planeacion.getFechaInicio(),
                                                planeacion.getFechaFin(),
                                                planeacion.getDescripcion());
                        }).collect(Collectors.toList());

                        // Obtener los objetivos para la asignación de asignatura actual
                        List<ObjetivosAsignatura> objetivos = objetivosAsignaturaRepository
                                        .findByAsignacionAsignatura_IdAsignacionAsignatura(
                                                        asignacion.getIdAsignacionAsignatura());
                        List<ObjetivoAsignaturaResponse> objetivosResponse = objetivos.stream()
                                        .map(objetivo -> new ObjetivoAsignaturaResponse(
                                                        objetivo.getIdObjetivoAsignatura(),
                                                        objetivo.getObjetivo(),
                                                        objetivo.getFechaEntregaPlaneacion()))
                                        .collect(Collectors.toList());

                        List<HorariosClase> horarios = horariosClaseRepository
                                        .findByAsignacionAsignatura_IdAsignacionAsignatura(
                                                        asignacion.getIdAsignacionAsignatura());

                        List<HorariosAsignaturaResponse> horariosResponse = horarios.stream()
                                        .map(horario -> new HorariosAsignaturaResponse(
                                                        horario.getDiaClase(),
                                                        horario.getHoraInicio(),
                                                        horario.getHoraFinal()))
                                        .collect(Collectors.toList());

                        List<ProyectoAsignatura> proyectoA = proyectoAsignaturaRepository
                                        .findByAsignacionAsignatura_IdAsignacionAsignatura(
                                                        asignacion.getIdAsignacionAsignatura());

                        List<ProyectoAsignaturaResponse> proyectoAsignaturaResponses = proyectoA.stream()
                                        .map(proyecto -> new ProyectoAsignaturaResponse(
                                                        proyecto.getTitulo(),
                                                        proyecto.getObjetivo(),
                                                        proyecto.getFecha()))
                                        .collect(Collectors.toList());

                        // Añade los objetivos al objeto de respuesta
                        asignaturaAsignada.setObjetivos(objetivosResponse);
                        asignaturaAsignada.setPlaneaciones(planeacionResponses);
                        asignaturaAsignada.setUnidades(detallesUnidades);
                        asignaturaAsignada.setHorarios(horariosResponse);
                        asignaturaAsignada.setProyecto(proyectoAsignaturaResponses);
                        asignaturasAsignadas.add(asignaturaAsignada);

                }
                return ResponseEntity.ok(asignaturasAsignadas);
        }

}
