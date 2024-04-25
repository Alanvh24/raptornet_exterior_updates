package com.utmir.raptornet.controllers;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.utmir.raptornet.dto.DireccionAcademica.AsignaturasAsignadasRequest;
import com.utmir.raptornet.dto.Docentes.AlumnoConCalificacionesResponse;
import com.utmir.raptornet.dto.Docentes.AlumnoRemedialResponse;
import com.utmir.raptornet.dto.Docentes.AsistenciaAlumnoResponse;
import com.utmir.raptornet.dto.Docentes.AsistenciasGeneralResponse;
import com.utmir.raptornet.dto.Docentes.AsistenciasResponse;
import com.utmir.raptornet.dto.Docentes.CalificacionDTO;
import com.utmir.raptornet.dto.Docentes.CalificacionDetalle;
import com.utmir.raptornet.dto.Docentes.CalificacionFinalResponseDTO;
import com.utmir.raptornet.dto.Docentes.CalificacionRemedialDTO;
import com.utmir.raptornet.dto.Docentes.CrearActualizarUnidadRequest;
import com.utmir.raptornet.dto.Docentes.CrearHorarioClaseRequest;
import com.utmir.raptornet.dto.Docentes.CrearObjetivoRequest;
import com.utmir.raptornet.dto.Docentes.CrearProyectoAsignaturaRequest;
import com.utmir.raptornet.dto.Docentes.EvaluacionUnidadRequest;
import com.utmir.raptornet.dto.Docentes.FechasPorUnidad;
import com.utmir.raptornet.dto.Docentes.FirmaCalificacionesDTO;
import com.utmir.raptornet.dto.Docentes.FirmaCalificacionesRemedialDTO;
import com.utmir.raptornet.dto.Docentes.HorariosAsignaturaResponse;
import com.utmir.raptornet.dto.Docentes.ListaAlumnosResponse;
import com.utmir.raptornet.dto.Docentes.ObjetivoAsignaturaResponse;
import com.utmir.raptornet.dto.Docentes.PlaneacionRequest;
import com.utmir.raptornet.dto.Docentes.PlaneacionResponse;
import com.utmir.raptornet.dto.Docentes.ProyectoAsignaturaResponse;
import com.utmir.raptornet.dto.Docentes.RegistroAsistenciaRequest;
import com.utmir.raptornet.dto.Docentes.UnidadAsignaturaDetalle;
import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.AntecedentesAcademicos;
import com.utmir.raptornet.models.AsignacionAsignatura;
import com.utmir.raptornet.models.Asistencias;
import com.utmir.raptornet.models.Calificaciones;
import com.utmir.raptornet.models.CalificacionesUnidad;
import com.utmir.raptornet.models.Carreras;
import com.utmir.raptornet.models.Cuatrimestre;
import com.utmir.raptornet.models.Cuotas;
import com.utmir.raptornet.models.ERole;
import com.utmir.raptornet.models.EvaluacionUnidad;
import com.utmir.raptornet.models.FechasUnidades;
import com.utmir.raptornet.models.Grupo;
import com.utmir.raptornet.models.HorariosClase;
import com.utmir.raptornet.models.InformacionAcademica;
import com.utmir.raptornet.models.ObjetivosAsignatura;
import com.utmir.raptornet.models.Pagos;
import com.utmir.raptornet.models.Planeaciones;
import com.utmir.raptornet.models.ProyectoAsignatura;
import com.utmir.raptornet.models.UnidadesPorAsignatura;
import com.utmir.raptornet.payload.response.ResourceNotFoundException;
import com.utmir.raptornet.repository.AlumnoRepository;
import com.utmir.raptornet.repository.AntecedentesAcademicosRepository;
import com.utmir.raptornet.repository.AsignacionAsignaturaRepository;
import com.utmir.raptornet.repository.AsignaturasRepository;
import com.utmir.raptornet.repository.AsistenciasRepository;
import com.utmir.raptornet.repository.CalificacionesRepository;
import com.utmir.raptornet.repository.CalificacionesUnidadRepository;
import com.utmir.raptornet.repository.CarrerasRepository;
import com.utmir.raptornet.repository.CuatrimestreRepository;
import com.utmir.raptornet.repository.CuotasRepository;
import com.utmir.raptornet.repository.EvaluacionUnidadRepository;
import com.utmir.raptornet.repository.FechasUnidadesRepository;
import com.utmir.raptornet.repository.GrupoRepository;
import com.utmir.raptornet.repository.HorariosClaseRepository;
import com.utmir.raptornet.repository.InformacionAcademicaRepository;
import com.utmir.raptornet.repository.ObjetivosAsignaturaRepository;
import com.utmir.raptornet.repository.PagosRepository;
import com.utmir.raptornet.repository.PlaneacionesRepository;
import com.utmir.raptornet.repository.ProyectoAsignaturaRepository;
import com.utmir.raptornet.repository.UnidadesAsignaturaRepository;
import com.utmir.raptornet.security.services.AsistenciaService;
import com.utmir.raptornet.security.services.CalificacionService;
import com.utmir.raptornet.security.services.LogService;
import com.utmir.raptornet.security.services.UnidadesAsignaturaService;
import com.utmir.raptornet.security.utils.FechaUtils;

import jakarta.transaction.Transactional;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/docentes")
public class DocenteController {

        @Autowired
        AlumnoRepository alumnoRepository;
        @Autowired
        AsignacionAsignaturaRepository asignacionAsignaturaRepository;
        @Autowired
        UnidadesAsignaturaRepository unidadesAsignaturaRepository;
        @Autowired
        FechasUnidadesRepository fechasUnidadesRepository;
        @Autowired
        GrupoRepository grupoRepository;
        @Autowired
        AsignaturasRepository asignaturasRepository;
        @Autowired
        PlaneacionesRepository planeacionesRepository;
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
        private CalificacionService calificacionService;
        @Autowired
        LogService logService;
        @Autowired
        CuotasRepository cuotasRepository;
        @Autowired
        PagosRepository pagosRepository;
        @Autowired
        AntecedentesAcademicosRepository antecedentesAcademicosRepository;
        @Autowired
        CalificacionesRepository calificacionesRepository;

        @GetMapping("/materias-asignadas")
        public ResponseEntity<List<AsignaturasAsignadasRequest>> obtenerMateriasAsignadasDocente() {
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String matricula = authentication.getName();

                Alumno docente = alumnoRepository.findByMatricula(matricula)
                                .orElseThrow(() -> new ResourceNotFoundException(
                                                "Docente no encontrado con matrícula: " + matricula));

                // Encuentra las asignaciones de materias para el docente
                List<AsignacionAsignatura> asignacionMaterias = asignacionAsignaturaRepository
                                .findByAlumnoAndStatus(docente, true);

                if (asignacionMaterias.isEmpty()) {
                        throw new ResourceNotFoundException(
                                        "No se encontraron asignaturas asignadas activas para el docente con matrícula: "
                                                        + matricula);
                }

                List<AsignaturasAsignadasRequest> asignaturasAsignadas = new ArrayList<>();

                for (AsignacionAsignatura asignacion : asignacionMaterias) {

                        AsignaturasAsignadasRequest asignaturaAsignada = new AsignaturasAsignadasRequest();

                        asignaturaAsignada.setMatricula_docente(matricula);
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

        @PostMapping("/crear-actualizar-unidad")
        public ResponseEntity<?> crearActualizarPerfilUnidad(@RequestBody CrearActualizarUnidadRequest request) {
                Alumno docente = alumnoRepository.findByMatricula(request.getMatriculaDocente())
                                .orElseThrow(() -> new ResourceNotFoundException("Docente no encontrado con matrícula: "
                                                + request.getMatriculaDocente()));

                UnidadesPorAsignatura unidad = unidadesAsignaturaRepository.findById(request.getIdUnidadesAsignatura())
                                .orElseThrow(() -> new ResourceNotFoundException(
                                                "Unidad no encontrada con ID: " + request.getIdUnidadesAsignatura()));

                Grupo grupo = grupoRepository.findById(Long.parseLong(request.getGrupo()))
                                .orElseThrow(() -> new ResourceNotFoundException(
                                                "Grupo no encontrado con ID: " + request.getGrupo()));

                Optional<AsignacionAsignatura> asignacionActivaOpt = asignacionAsignaturaRepository
                                .findByAsignaturasAndGrupoAndAlumnoAndStatusIsTrue(unidad.getAsignaturas(), grupo,
                                                docente);

                if (!asignacionActivaOpt.isPresent()) {
                        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                        .body("No existe una asignación activa de asignatura para los parámetros proporcionados.");
                }

                AsignacionAsignatura asignacionActiva = asignacionActivaOpt.get();

                // Verifica si ya existe una FechasUnidades activa específica para la asignación
                // de asignatura activa
                // Utiliza los IDs directamente en la llamada al método del repositorio
                Optional<FechasUnidades> existente = fechasUnidadesRepository
                                .findByAsignacionAsignatura_IdAsignacionAsignaturaAndGrupo_IdAndUnidadesPorAsignatura_IdUnidadesAsignaturaAndStatusIsTrue(
                                                asignacionActiva.getIdAsignacionAsignatura(), grupo.getId(),
                                                unidad.getIdUnidadesAsignatura());

                if (existente.isPresent()) {
                        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                        .body("Error: Ya existe una asignación activa para esta unidad y grupo.");
                } else {
                        FechasUnidades nuevaFechaUnidad = new FechasUnidades();
                        nuevaFechaUnidad.setUnidadesPorAsignatura(unidad);
                        nuevaFechaUnidad.setAlumno(docente);
                        nuevaFechaUnidad.setGrupo(grupo);
                        nuevaFechaUnidad.setAsignacionAsignatura(asignacionActiva);
                        nuevaFechaUnidad.setFechaInicio(request.getFechaInicio());
                        nuevaFechaUnidad.setFechaCierre(request.getFechaCierre());
                        nuevaFechaUnidad.setFechaRemedial(request.getFechaRemedial());
                        nuevaFechaUnidad.setStatus(request.getStatus());
                        nuevaFechaUnidad.setClasesActivas(request.getClasesActivas());
                        fechasUnidadesRepository.save(nuevaFechaUnidad);

                        return ResponseEntity.ok().body("Nuevo perfil de unidad creado con éxito.");
                }
        }

        @PostMapping("/crear-planeacion")
        public ResponseEntity<?> crearPlaneacion(@RequestBody PlaneacionRequest request) {
                Optional<AsignacionAsignatura> asignacionOpt = asignacionAsignaturaRepository
                                .findByAsignaturas_IdAsignaturasAndGrupoIdAndAlumnoMatriculaAndStatusIsTrue(
                                                request.getIdAsignatura(),
                                                request.getIdGrupo(),
                                                request.getMatriculaDocente());

                if (!asignacionOpt.isPresent()) {
                        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                                        .body("Asignación de asignatura activa no encontrada con los datos proporcionados.");
                }

                AsignacionAsignatura asignacion = asignacionOpt.get();

                Planeaciones nuevaPlaneacion = new Planeaciones();
                nuevaPlaneacion.setAsignacionAsignatura(asignacion);
                nuevaPlaneacion.setNoSemana(request.getNoSemana());
                nuevaPlaneacion.setFechaInicio(request.getFechaInicio());
                nuevaPlaneacion.setFechaFin(request.getFechaFin());
                nuevaPlaneacion.setDescripcion(request.getDescripcion());
                planeacionesRepository.save(nuevaPlaneacion);

                return ResponseEntity.ok().body("Planeación creada con éxito.");
        }

        @PostMapping("/crear-objetivo")
        public ResponseEntity<?> crearObjetivo(@RequestBody CrearObjetivoRequest request) {
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String matriculaDocente = authentication.getName();

                // Busca la asignación de asignatura activa usando idAsignatura, idGrupo, la
                // matrícula del docente y que el status sea true
                Optional<AsignacionAsignatura> asignacionOpt = asignacionAsignaturaRepository
                                .findByAsignaturas_IdAsignaturasAndGrupoIdAndAlumnoMatriculaAndStatusIsTrue(
                                                request.getIdAsignatura(),
                                                request.getIdGrupo(),
                                                matriculaDocente);

                if (!asignacionOpt.isPresent()) {
                        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                                        .body("Asignación de asignatura activa no encontrada con los datos proporcionados.");
                }

                AsignacionAsignatura asignacion = asignacionOpt.get();

                // Crea el objetivo asociado a la asignación de asignatura encontrada
                ObjetivosAsignatura objetivo = new ObjetivosAsignatura();
                objetivo.setAsignacionAsignatura(asignacion);
                objetivo.setObjetivo(request.getObjetivo());
                objetivosAsignaturaRepository.save(objetivo);

                return ResponseEntity.ok().body("Objetivo creado con éxito.");
        }

        @PostMapping("/crear-horarios-clase")
        public ResponseEntity<?> crearHorariosClase(@RequestBody CrearHorarioClaseRequest request) {
                // Buscar la asignación de asignatura activa usando idAsignatura, idGrupo y la
                // matrícula del docente
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String matriculaDocente = authentication.getName();
                Optional<AsignacionAsignatura> asignacionOpt = asignacionAsignaturaRepository
                                .findByAsignaturas_IdAsignaturasAndGrupoIdAndAlumnoMatriculaAndStatusIsTrue(
                                                request.getIdAsignatura(),
                                                request.getIdGrupo(),
                                                matriculaDocente);

                if (!asignacionOpt.isPresent()) {
                        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                                        .body("Asignación de asignatura activa no encontrada con los datos proporcionados.");
                }

                AsignacionAsignatura asignacion = asignacionOpt.get();

                // Verificar si ya existe un horario para el día especificado
                Optional<HorariosClase> horarioExistenteOpt = horariosClaseRepository
                                .findByDiaClaseAndAsignacionAsignaturaIdAsignacionAsignatura(request.getDiaClase(),
                                                asignacion.getIdAsignacionAsignatura());
                if (horarioExistenteOpt.isPresent()) {
                        return ResponseEntity.badRequest().body(
                                        "Ya existe un horario para el día especificado con esta asignatura.");
                }

                // Crear el nuevo horario de clase y asignarlo a la asignación encontrada
                HorariosClase nuevoHorario = new HorariosClase();
                nuevoHorario.setDiaClase(request.getDiaClase());
                nuevoHorario.setHoraInicio(request.getHoraInicio());
                nuevoHorario.setHoraFinal(request.getHoraFinal());
                nuevoHorario.setAsignacionAsignatura(asignacion);

                horariosClaseRepository.save(nuevoHorario);

                return ResponseEntity.ok().body("Horario de clase creado con éxito.");
        }

        @PostMapping("/crear-evaluacion-unidad")
        public ResponseEntity<?> crearEvaluacionUnidad(@RequestBody EvaluacionUnidadRequest request) {
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String matriculaDocente = authentication.getName();

                // Buscar la asignación de asignatura usando idAsignatura, idGrupo, matrícula
                // del docente y que el status sea activo
                Optional<AsignacionAsignatura> asignacionOpt = asignacionAsignaturaRepository
                                .findByAsignaturas_IdAsignaturasAndGrupoIdAndAlumnoMatriculaAndStatusIsTrue(
                                                request.getIdAsignatura(), request.getIdGrupo(), matriculaDocente);

                if (!asignacionOpt.isPresent()) {
                        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                                        .body("Asignación de asignatura activa no encontrada con los datos proporcionados.");
                }

                AsignacionAsignatura asignacion = asignacionOpt.get();

                // Verificar si la unidad pertenece a la asignatura de la asignación encontrada
                Optional<UnidadesPorAsignatura> unidadOpt = unidadesAsignaturaRepository
                                .findById(request.getIdUnidadesAsignatura());
                if (!unidadOpt.isPresent() || !unidadOpt.get().getAsignaturas().equals(asignacion.getAsignaturas())) {
                        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                        .body("La unidad especificada no corresponde a la asignatura de la asignación.");
                }

                // Verificar si ya existe una evaluación para la unidad y la asignación de
                // asignatura
                Optional<EvaluacionUnidad> evaluacionExistenteOpt = evaluacionUnidadRepository
                                .findByUnidadesPorAsignaturaIdUnidadesAsignaturaAndAsignacionAsignaturaIdAsignacionAsignatura(
                                                request.getIdUnidadesAsignatura(),
                                                asignacion.getIdAsignacionAsignatura());

                if (evaluacionExistenteOpt.isPresent()) {
                        // Si ya existe, retornar error
                        return ResponseEntity
                                        .status(HttpStatus.BAD_REQUEST)
                                        .body("Error: Ya existe una asignación de Fecha de evaluación para esta unidad y grupo.");
                } else {
                        // Crear la evaluación para la unidad
                        EvaluacionUnidad evaluacionUnidad = new EvaluacionUnidad();
                        evaluacionUnidad.setAsignacionAsignatura(asignacion);
                        evaluacionUnidad.setUnidadesPorAsignatura(unidadOpt.get());
                        evaluacionUnidad.setFechaEvaluacion(request.getFechaEvaluacion());
                        // Aquí puedes añadir más campos a la evaluación si es necesario
                        evaluacionUnidadRepository.save(evaluacionUnidad);

                        return ResponseEntity.ok().body("Evaluación de unidad creada con éxito.");
                }
        }

        @PostMapping("/crear-proyecto-asignatura")
        public ResponseEntity<?> crearProyectoAsignatura(@RequestBody CrearProyectoAsignaturaRequest request) {
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String matriculaDocente = authentication.getName();

                // Cambia este método para que verifique el status de la asignación además de
                // los otros criterios
                Optional<AsignacionAsignatura> asignacionOpt = asignacionAsignaturaRepository
                                .findByAsignaturas_IdAsignaturasAndGrupoIdAndAlumnoMatriculaAndStatusIsTrue(
                                                request.getIdAsignatura(),
                                                request.getIdGrupo(),
                                                matriculaDocente);

                if (!asignacionOpt.isPresent()) {
                        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                                        .body("Asignación de asignatura activa no encontrada con los datos proporcionados.");
                }

                AsignacionAsignatura asignacion = asignacionOpt.get();

                // Continúa con la creación del proyecto
                ProyectoAsignatura proyecto = new ProyectoAsignatura();
                proyecto.setAsignacionAsignatura(asignacion);
                proyecto.setTitulo(request.getTitulo());
                proyecto.setObjetivo(request.getObjetivo());
                proyecto.setFecha(request.getFecha());
                proyectoAsignaturaRepository.save(proyecto);

                return ResponseEntity.ok().body("Proyecto creado con éxito.");
        }

        @GetMapping("/lista-alumnos")
        public ResponseEntity<List<ListaAlumnosResponse>> obtenerAlumnosFiltrados(
                        @RequestParam Long idCarrera,
                        @RequestParam Long idCuatrimestre,
                        @RequestParam Long idGrupo) {
                Carreras carrera = carreraRepository.findById(idCarrera)
                                .orElseThrow(() -> new ResourceNotFoundException("Carrera no encontrada"));
                Cuatrimestre cuatrimestre = cuatrimestreRepository.findById(idCuatrimestre)
                                .orElseThrow(() -> new ResourceNotFoundException("Cuatrimestre no encontrado"));
                Grupo grupo = grupoRepository.findById(idGrupo)
                                .orElseThrow(() -> new ResourceNotFoundException("Grupo no encontrado"));

                List<InformacionAcademica> informacion = informacionAcademicaRepository
                                .findByProgramaEducativoAndCuatrimestreAndGrupo(carrera, cuatrimestre, grupo);

                if (informacion.isEmpty()) {
                        return ResponseEntity.noContent().build();
                }

                List<ListaAlumnosResponse> response = informacion.stream()
                                .filter(info -> info.getAlumno().getAsp_etapa() == null
                                                || !info.getAlumno().getAsp_etapa().equals("6"))
                                .filter(info -> info.getAlumno().getRoles().stream()
                                                .noneMatch(rol -> rol.getName().equals(ERole.ROLE_ASPIRANTE)
                                                                && "6".equals(info.getAlumno().getAsp_etapa())))
                                .map(info -> new ListaAlumnosResponse(
                                                info.getAlumno().getMatricula(),
                                                info.getAlumno().getNombre(),
                                                info.getAlumno().getAp_paterno(),
                                                info.getAlumno().getAp_materno(),
                                                carrera.getCarrera(), // Usa el nombre de la carrera
                                                cuatrimestre.getCuatrimestre(), // Usa el nombre del cuatrimestre
                                                grupo.getGrupo(), // Usa el nombre del grupo
                                                grupo.getId()))
                                .collect(Collectors.toList());

                return ResponseEntity.ok(response);
        }

        @PostMapping("/registrar-asistencia")
        public ResponseEntity<?> registrarAsistencia(@RequestBody RegistroAsistenciaRequest request) {
                try {
                        Alumno alumno = alumnoRepository.findById(request.getMatriculaAlumno())
                                        .orElseThrow(() -> new IllegalArgumentException(
                                                        "Alumno no encontrado con matrícula: "
                                                                        + request.getMatriculaAlumno()));

                        UnidadesPorAsignatura unidadesPorAsignatura = unidadesAsignaturaRepository
                                        .findById(request.getIdUnidadesAsignatura())
                                        .orElseThrow(() -> new IllegalArgumentException(
                                                        "Unidad de Asignatura no encontrada con ID: "
                                                                        + request.getIdUnidadesAsignatura()));

                        Grupo grupo = grupoRepository.findById(request.getIdGrupo())
                                        .orElseThrow(() -> new IllegalArgumentException(
                                                        "Grupo no encontrado con ID: " + request.getIdGrupo()));

                        AsignacionAsignatura asignacionAsignatura = asignacionAsignaturaRepository
                                        .findById(request.getIdAsignacionAsignatura())
                                        .orElseThrow(() -> new IllegalArgumentException(
                                                        "Asignación de Asignatura no encontrada con ID: "
                                                                        + request.getIdAsignacionAsignatura()));

                        Optional<Asistencias> asistenciaExistente = asistenciasRepository
                                        .findByAlumnoMatriculaAndFechaAsistenciaAndUnidadesPorAsignaturaIdUnidadesAsignatura(
                                                        request.getMatriculaAlumno(), request.getFechaAsistencia(),
                                                        request.getIdUnidadesAsignatura());

                        Asistencias asistencia = asistenciaExistente.orElseGet(Asistencias::new);
                        asistencia.setAlumno(alumno);
                        asistencia.setUnidadesPorAsignatura(unidadesPorAsignatura);
                        asistencia.setAsignatura(unidadesPorAsignatura.getAsignaturas());
                        asistencia.setGrupo(grupo);
                        asistencia.setTipoAsistencia(request.getTipoAsistencia());
                        asistencia.setFechaAsistencia(request.getFechaAsistencia());
                        asistencia.setAsignacionAsignatura(asignacionAsignatura);
                        asistenciasRepository.save(asistencia);

                        return ResponseEntity.ok().body("Asistencia registrada con éxito.");
                } catch (Exception e) {
                        return ResponseEntity.badRequest().body("Error al registrar asistencia: " + e.getMessage());
                }
        }

        @GetMapping("/obtener-asistencias")
        public ResponseEntity<List<AsistenciaAlumnoResponse>> obtenerAsistenciasPorUnidadAsignatura(
                        @RequestParam Long idUnidadesAsignatura,
                        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fechaInicio,
                        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fechaFin) {
                List<Asistencias> asistencias;
                if (fechaInicio != null && fechaFin != null) {
                        asistencias = asistenciasRepository
                                        .findByUnidadesPorAsignaturaIdUnidadesAsignaturaAndFechaAsistenciaBetween(
                                                        idUnidadesAsignatura, fechaInicio, fechaFin);
                } else {
                        asistencias = asistenciasRepository
                                        .findByUnidadesPorAsignaturaIdUnidadesAsignatura(idUnidadesAsignatura);
                }

                if (asistencias.isEmpty()) {
                        return ResponseEntity.noContent().build();
                }

                List<AsistenciaAlumnoResponse> response = asistencias.stream()
                                .map(asistencia -> new AsistenciaAlumnoResponse(
                                                asistencia.getAlumno().getMatricula(),
                                                asistencia.getFechaAsistencia(),
                                                asistencia.getTipoAsistencia()))
                                .collect(Collectors.toList());

                return ResponseEntity.ok(response);
        }

        @GetMapping("/lista-asistencias-general")
        public ResponseEntity<List<AsistenciasGeneralResponse>> obtenerAsistenciasPorAsignaturaGrupoYAsignacion(
                        @RequestParam Long idAsignatura,
                        @RequestParam Long idGrupo,
                        @RequestParam Long idAsignacionAsignatura) {

                try {
                        List<Asistencias> asistencias = asistenciasRepository
                                        .findByAsignacionAsignaturaAsignaturasIdAsignaturasAndAsignacionAsignaturaGrupoIdAndAsignacionAsignaturaIdAsignacionAsignatura(
                                                        idAsignatura, idGrupo, idAsignacionAsignatura);

                        List<AsistenciasGeneralResponse> response = asistencias.stream()
                                        .map(asistencia -> new AsistenciasGeneralResponse(
                                                        asistencia.getAlumno().getMatricula(),
                                                        asistencia.getFechaAsistencia(),
                                                        asistencia.getTipoAsistencia(),
                                                        asistencia.getUnidadesPorAsignatura().getNombre_unidad()))
                                        .collect(Collectors.toList());

                        return ResponseEntity.ok(response);
                } catch (Exception e) {
                        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new ArrayList<>());
                }
        }

        @GetMapping("/porcentaje-asistencia")
        public ResponseEntity<List<AsistenciasResponse>> obtenerPorcentajesAsistencia(
                        @RequestParam Long idUnidadesAsignatura, @RequestParam Long idGrupo,
                        @RequestParam Long idAsignacionAsignatura) {
                List<AsistenciasResponse> porcentajesAsistencia = asistenciaService
                                .calcularPorcentajesAsistencias(idUnidadesAsignatura, idGrupo, idAsignacionAsignatura);
                return ResponseEntity.ok(porcentajesAsistencia);
        }

        @GetMapping("/detalle-unidad")
        public ResponseEntity<?> obtenerDetalleUnidadAsignatura(@RequestParam Long idUnidadAsignatura,
                        @RequestParam Long idGrupo, @RequestParam Long idAsignacionAsignatura) {
                try {

                        FechasUnidades fechasUnidades = fechasUnidadesRepository
                                        .findByAsignacionAsignatura_IdAsignacionAsignaturaAndGrupo_IdAndUnidadesPorAsignatura_IdUnidadesAsignatura(
                                                        idAsignacionAsignatura, idGrupo, idUnidadAsignatura)
                                        .orElseThrow(() -> new ResourceNotFoundException(
                                                        "Fechas de unidad no encontradas para la unidad con ID: "
                                                                        + idUnidadAsignatura + ", asignación con ID: "
                                                                        + idAsignacionAsignatura + " y grupo ID: "
                                                                        + idGrupo));

                        List<HorariosClase> horariosClase = horariosClaseRepository
                                        .findByAsignacionAsignatura_IdAsignacionAsignatura(idAsignacionAsignatura);

                        List<String> diasClase = horariosClase.stream()
                                        .map(HorariosClase::getDiaClase)
                                        .distinct()
                                        .collect(Collectors.toList());

                        FechasPorUnidad detalleDTO = new FechasPorUnidad();
                        detalleDTO.setFechaInicio(fechasUnidades.getFechaInicio());
                        detalleDTO.setFechaCierre(fechasUnidades.getFechaCierre());
                        detalleDTO.setClasesActivas(fechasUnidades.getClasesActivas());

                        List<LocalDate> fechasClase = calcularFechasClase(diasClase, fechasUnidades.getFechaInicio(),
                                        fechasUnidades.getFechaCierre());
                        detalleDTO.setFechasClase(fechasClase);

                        return ResponseEntity.ok(detalleDTO);
                } catch (ResourceNotFoundException e) {
                        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
                }
        }

        private List<LocalDate> calcularFechasClase(List<String> diasClase, LocalDate inicio, LocalDate fin) {
                List<LocalDate> fechasClase = new ArrayList<>();
                for (LocalDate fecha = inicio; !fecha.isAfter(fin); fecha = fecha.plusDays(1)) {
                        DayOfWeek dayOfWeek = fecha.getDayOfWeek();
                        String diaClase = diasClase.stream()
                                        .filter(dia -> FechaUtils.convertirADayOfWeek(dia) == dayOfWeek)
                                        .findFirst()
                                        .orElse(null);

                        if (diaClase != null) {
                                fechasClase.add(fecha);
                        }
                }
                return fechasClase;
        }

        @GetMapping("/lista-alumnos-con-calificaciones")
        public ResponseEntity<List<AlumnoConCalificacionesResponse>> obtenerAlumnosConCalificaciones(
                        @RequestParam Long idCarrera,
                        @RequestParam Long idCuatrimestre,
                        @RequestParam Long idGrupo) {

                Carreras carrera = carreraRepository.findById(idCarrera)
                                .orElseThrow(() -> new ResourceNotFoundException("Carrera no encontrada"));
                Cuatrimestre cuatrimestre = cuatrimestreRepository.findById(idCuatrimestre)
                                .orElseThrow(() -> new ResourceNotFoundException("Cuatrimestre no encontrado"));
                Grupo grupo = grupoRepository.findById(idGrupo)
                                .orElseThrow(() -> new ResourceNotFoundException("Grupo no encontrado"));

                List<InformacionAcademica> informacionAcademicas = informacionAcademicaRepository
                                .findByProgramaEducativoAndCuatrimestreAndGrupo(carrera, cuatrimestre, grupo);

                if (informacionAcademicas.isEmpty()) {
                        return ResponseEntity.noContent().build();
                }

                List<AlumnoConCalificacionesResponse> responses = new ArrayList<>();
                for (InformacionAcademica info : informacionAcademicas) {
                        List<CalificacionesUnidad> calificaciones = calificacionesUnidadRepository
                                        .findByAlumnoAndInformacionAcademica(info.getAlumno(), info);

                        List<CalificacionDetalle> detalles = calificaciones.stream().map(calificacion -> {
                                // Obtiene el nombre de la unidad directamente desde la entidad
                                // UnidadesPorAsignatura
                                String nombreUnidad = calificacion.getUnidadesAsignatura().getNombre_unidad();
                                return new CalificacionDetalle(
                                                calificacion.getUnidadesAsignatura().getIdUnidadesAsignatura(),
                                                calificacion.getCalificacionOrdinaria(),
                                                calificacion.isRecuperacion(),
                                                calificacion.getCalificacionRecuperacion(),
                                                calificacion.isReqAsistencias(),
                                                nombreUnidad);
                        }).collect(Collectors.toList());

                        responses.add(new AlumnoConCalificacionesResponse(
                                        info.getAlumno().getMatricula(),
                                        info.getAlumno().getNombre(),
                                        info.getAlumno().getAp_paterno(),
                                        info.getAlumno().getAp_materno(),
                                        carrera.getCarrera(),
                                        cuatrimestre.getCuatrimestre(),
                                        grupo.getGrupo(),
                                        grupo.getId(),
                                        detalles));
                }

                return ResponseEntity.ok(responses);
        }

        @PostMapping("/registrar-calificacion")
        public ResponseEntity<?> registrarCalificacion(@RequestBody CalificacionDTO calificacionDTO) {
                ResponseEntity<?> response = calificacionService.registrarCalificacionCondiciones(calificacionDTO);
                return response;
        }

        @PostMapping("/registrar-calificacion-recuperacion")
        public ResponseEntity<?> registrarCalificacionRecuperacion(@RequestBody CalificacionDTO calificacionDTO) {
                ResponseEntity<?> response = calificacionService.registrarCalificacionRecuperacion(calificacionDTO);
                return response;
        }

        @GetMapping("/por-asignacion")
        public ResponseEntity<List<CalificacionFinalResponseDTO>> obtenerCalificacionesPorAsignacionAsignatura(
                        @RequestParam Long idAsignacionAsignatura) {
                List<CalificacionFinalResponseDTO> calificacionesDTO = calificacionService
                                .obtenerCalificacionesPorAsignacionAsignatura(idAsignacionAsignatura);
                return ResponseEntity.ok(calificacionesDTO);
        }

        @Transactional
        @PutMapping("/cursos/firmarCalificacion/{matricula}")
        public ResponseEntity<?> firmarCalificacion(@PathVariable String matricula) {
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String logeado = authentication.getName();
                Alumno alumno = alumnoRepository.findByMatricula(matricula)
                                .orElseThrow(() -> new ResourceNotFoundException(
                                                "Usuario no encontrado con matrícula: " + matricula));

                Pagos pagos = new Pagos();
                pagos.setAlumno(alumno);

                // Establecer el id_cuota a "40" para cuota de inscripción
                Cuotas cuotas = cuotasRepository.findById(40L)
                                .orElseThrow(() -> new RuntimeException("Error: cuota no encontrada"));
                pagos.setId_cuota(cuotas);

                // Determinar la fecha límite basada en el id_carrera_1
                LocalDate fechaLimite = LocalDate.now(); // Inicializar con un valor por defecto

                AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository
                                .findByAlumno(alumno)
                                .orElse(null);

                if (antecedentesAcademicos != null) {
                        Long idCarrera1 = antecedentesAcademicos.getId_carrera_1().getId_carrera();
                        // Establecer fecha límite según el ID de la carrera
                        if (idCarrera1 == 9 || idCarrera1 == 4) {
                                fechaLimite = LocalDate.of(2024, 8, 27);
                        } else if (idCarrera1 == 1 || idCarrera1 == 5) {
                                fechaLimite = LocalDate.of(2024, 8, 28);
                        } else if (idCarrera1 == 3 || idCarrera1 == 12) {
                                fechaLimite = LocalDate.of(2024, 8, 29);
                        }
                }

                // Lógica para generar la cadena de concatenación
                String ultimosCuatroDigitosMatricula = "";
                if (alumno.getMatricula() != null && alumno.getMatricula().length() >= 4) {
                        ultimosCuatroDigitosMatricula = alumno.getMatricula()
                                        .substring(alumno.getMatricula().length() - 4);
                }

                String formatoNumericoCarrera = antecedentesAcademicos != null
                                && antecedentesAcademicos.getId_carrera_1() != null
                                                ? antecedentesAcademicos.getId_carrera_1().getFormato_numerico()
                                                : "";

                String concatenado = ultimosCuatroDigitosMatricula + formatoNumericoCarrera
                                + cuotas.getFormato_numerico_cuota() + "3"; // Asumiendo que "3" es parte del
                                                                            // concatenado
                pagos.setConcatenado(concatenado);

                pagos.setFecha_generacion(LocalDate.now());
                pagos.setFecha_limite(fechaLimite);

                pagosRepository.save(pagos);

                // Actualizar asp_etapa a 6
                alumno.setAsp_etapa("6");
                alumnoRepository.save(alumno);

                // Registrar el evento
                logService.registrarEvento(logeado, "Firmó la calificación de " + alumno.getMatricula()
                                + " y generó la cuota de inscripción.");

                return ResponseEntity.ok().body(
                                "Calificación firmada y cuota de inscripción generada exitosamente para el alumno con matrícula: "
                                                + matricula);
        }

        // Firmar la calificación final
        @PutMapping("/firmar/calificacion-final/{idCalificacion}")
        public ResponseEntity<?> firmarCalificacionFinal(@PathVariable Long idCalificacion) {
                Calificaciones calificacion = calificacionesRepository.findById(idCalificacion)
                                .orElseThrow(() -> new ResourceNotFoundException(
                                                "Calificación no encontrada con id: " + idCalificacion));
                if (calificacion.getCalificacionOrdinaria() >= 8) {
                        calificacion.setFirmaDocente(true);
                        calificacion.setRemedial(false);
                } else {
                        calificacion.setFirmaDocente(true);
                        calificacion.setRemedial(true);
                }

                Calificaciones calificacionActualizada = calificacionesRepository.save(calificacion);
                FirmaCalificacionesDTO calificacionDTO = new FirmaCalificacionesDTO(
                                calificacionActualizada.getIdCalificaciones(),
                                calificacionActualizada.getCalificacionOrdinaria(),
                                calificacionActualizada.isRemedial(),
                                calificacionActualizada.isFirmaDocente());

                return ResponseEntity.ok(calificacionDTO);
        }

        // Remedial

        @GetMapping("/alumnos-remedial")
        public ResponseEntity<List<AlumnoRemedialResponse>> obtenerAlumnosConRemedialPorAsignacion(
                        @RequestParam Long idAsignacionAsignatura) {
                List<Calificaciones> calificaciones = calificacionesRepository
                                .findByAsignacionAsignatura_IdAsignacionAsignaturaAndRemedialTrueAndFirmaDocenteTrue(
                                                idAsignacionAsignatura);

                if (calificaciones.isEmpty()) {
                        return ResponseEntity.noContent().build();
                }

                List<AlumnoRemedialResponse> responses = calificaciones.stream().map(calificacion -> {
                        Alumno alumno = calificacion.getAlumno();
                        return new AlumnoRemedialResponse(
                                        alumno.getMatricula(),
                                        alumno.getNombre(),
                                        alumno.getAp_paterno(),
                                        alumno.getAp_materno(),
                                        calificacion.getIdCalificaciones(),
                                        calificacion.getCalificacionOrdinaria(),
                                        calificacion.getAsignacionAsignatura().getIdAsignacionAsignatura(),
                                        calificacion.isFirmaRemedial(),
                                        calificacion.getCalificacionRemedial());
                }).collect(Collectors.toList());

                return ResponseEntity.ok(responses);
        }

        @PutMapping("/calificaciones/remedial")
        public ResponseEntity<?> actualizarCalificacionRemedial(@RequestBody CalificacionRemedialDTO calificacionDTO) {
                return calificacionService.registrarCalificacionRemedial(calificacionDTO);
        }

        // Firmar la calificación remedial
        @PutMapping("/firmar/calificacion-remedial/{idCalificacion}")
        public ResponseEntity<?> firmarCalificacionRemedial(@PathVariable Long idCalificacion) {
                Calificaciones calificacion = calificacionesRepository.findById(idCalificacion)
                                .orElseThrow(() -> new ResourceNotFoundException(
                                                "Calificación no encontrada con id: " + idCalificacion));

                if (calificacion.isRemedial()) {
                        calificacion.setFirmaRemedial(true);
                } else {
                        return ResponseEntity.badRequest()
                                        .body("El alumno no se encuentra en proceso de examen remedial");
                }

                Calificaciones calificacionActualizada = calificacionesRepository.save(calificacion);
                FirmaCalificacionesRemedialDTO calificacionDTO = new FirmaCalificacionesRemedialDTO(
                                calificacionActualizada.getIdCalificaciones(),
                                calificacionActualizada.getCalificacionRemedial(),
                                calificacionActualizada.isRemedial(),
                                calificacionActualizada.isFirmaRemedial());

                return ResponseEntity.ok(calificacionDTO);
        }

}
