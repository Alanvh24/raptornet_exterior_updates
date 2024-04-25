package com.utmir.raptornet.catalogos;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.utmir.raptornet.dto.DireccionAcademica.DocentesDTO;
import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.Asignaturas;
import com.utmir.raptornet.models.Carreras;
import com.utmir.raptornet.models.Cuatrimestre;
import com.utmir.raptornet.models.Cuotas;
import com.utmir.raptornet.models.ERole;
import com.utmir.raptornet.models.EstadosMexico;
import com.utmir.raptornet.models.Genero;
import com.utmir.raptornet.models.Grupo;
import com.utmir.raptornet.models.Nacionalidad;
import com.utmir.raptornet.models.TipoSangre;
import com.utmir.raptornet.payload.response.ResourceNotFoundException;
import com.utmir.raptornet.repository.AlumnoRepository;
import com.utmir.raptornet.repository.AsignacionAsignaturaRepository;
import com.utmir.raptornet.repository.AsignaturasRepository;
import com.utmir.raptornet.repository.CarrerasRepository;
import com.utmir.raptornet.repository.CuatrimestreRepository;
import com.utmir.raptornet.repository.CuotasRepository;
import com.utmir.raptornet.repository.EstadosMexicoRepository;
import com.utmir.raptornet.repository.GeneroRepository;
import com.utmir.raptornet.repository.GrupoRepository;
import com.utmir.raptornet.repository.NacionalidadRepository;
import com.utmir.raptornet.repository.TipoSangreRepository;
import com.utmir.raptornet.security.services.CargaMateriasService;
import com.utmir.raptornet.security.services.CargaUnidadesAsignaturas;
import com.utmir.raptornet.security.services.LogService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/catalogos")
public class Controllers {

    @Autowired
    GeneroRepository generoRepository;

    @Autowired
    NacionalidadRepository nacionalidadRepository;

    @Autowired
    EstadosMexicoRepository estadosMexicoRepository;

    @Autowired
    TipoSangreRepository tipoSangreRepository;

    @Autowired
    CarrerasRepository carrerasRepository;

    @Autowired
    CuotasRepository cuotasRepository;
    @Autowired
    LogService logService;

    @Autowired
    GrupoRepository grupoRepository;

    @Autowired
    CuatrimestreRepository cuatrimestreRepository;

    @Autowired
    AsignaturasRepository asignaturasRepository;

    @Autowired
    AlumnoRepository alumnoRepository;

    @Autowired
    AsignacionAsignaturaRepository asignacionAsignaturaRepository;

    @GetMapping("/carreras/activas")
    public ResponseEntity<List<Carreras>> getCarrerasActivas() {
        List<Carreras> carrerasActivas = carrerasRepository.findByStatusCarrera("1");
        return ResponseEntity.ok(carrerasActivas);
    }

    @GetMapping("/docentes")
    public ResponseEntity<List<DocentesDTO>> getDocentesMatricula() {
        List<Alumno> docentes = alumnoRepository.findByRole(ERole.ROLE_DOCENTES);

        // Mapea los docentes a DocenteDTO
        List<DocentesDTO> docentesDTO = docentes.stream()
                .map(docente -> {
                    DocentesDTO dto = new DocentesDTO();
                    dto.setMatricula(docente.getMatricula());
                    // Combinación de nombre, apellido paterno y apellido materno
                    String nombreCompleto = docente.getNombre() + " " + docente.getAp_paterno() + " "
                            + docente.getAp_materno();
                    dto.setNombreCompleto(nombreCompleto);
                    return dto;
                })
                .collect(Collectors.toList());

        return ResponseEntity.ok(docentesDTO);
    }

    @GetMapping("/asignaturas/filtrada")
    public ResponseEntity<List<Asignaturas>> obtenerAsignaturasPorCarreraYCuatrimestre(
            @RequestParam Long idCarrera, @RequestParam Long idCuatrimestre) {
        List<Asignaturas> asignaturas = asignaturasRepository.findByCarrerasIdAndCuatrimestreId(idCarrera,
                idCuatrimestre);
        return ResponseEntity.ok(asignaturas);
    }

    @GetMapping("/generos")
    public ResponseEntity<List<Genero>> obtenerTodosLosGeneros() {
        List<Genero> generos = generoRepository.findAll();
        return ResponseEntity.ok(generos);
    }

    @GetMapping("/nacionalidades")
    public ResponseEntity<List<Nacionalidad>> getNacionalidades() {
        List<Nacionalidad> nacionalidades = nacionalidadRepository.findAll();
        return ResponseEntity.ok(nacionalidades);
    }

    @GetMapping("/estados")
    public ResponseEntity<List<EstadosMexico>> getEstados() {
        List<EstadosMexico> estados = estadosMexicoRepository.findAll();
        return ResponseEntity.ok(estados);
    }

    @GetMapping("/tiposangre")
    public ResponseEntity<List<TipoSangre>> getSangre() {
        List<TipoSangre> tipoSangre = tipoSangreRepository.findAll();
        return ResponseEntity.ok(tipoSangre);
    }

    @GetMapping("/carreras")
    public ResponseEntity<List<Carreras>> getCarreras() {
        List<Carreras> carreras = carrerasRepository.findAll();
        return ResponseEntity.ok(carreras);
    }

    @GetMapping("/cuotas")
    public ResponseEntity<List<Cuotas>> getCuotas() {
        List<Cuotas> cuotas = cuotasRepository.findAll();
        return ResponseEntity.ok(cuotas);
    }

    @GetMapping("/grupos")
    public ResponseEntity<List<Grupo>> getGrupo() {
        List<Grupo> grupos = grupoRepository.findAll();
        return ResponseEntity.ok(grupos);
    }

    @GetMapping("/cuatrimestres")
    public ResponseEntity<List<Cuatrimestre>> getCuatrimestre() {
        List<Cuatrimestre> cuatrimestres = cuatrimestreRepository.findAll();
        return ResponseEntity.ok(cuatrimestres);
    }

    @GetMapping("/asignaturas")
    public ResponseEntity<List<Asignaturas>> listarTodasLasAsignaturas() {
        List<Asignaturas> asignaturas = asignaturasRepository.findAll();
        return ResponseEntity.ok(asignaturas);
    }

    @PutMapping("/actualizar/{id}")
    @PreAuthorize("hasRole('ROLE_FINANZAS') or hasRole ('ADMIN')")
    public ResponseEntity<Cuotas> actualizarCosto(@PathVariable(value = "id") Long id_cuota,
            @RequestBody Cuotas detallesCuota) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String logeado = authentication.getName();

        Cuotas cuota = cuotasRepository.findById(id_cuota)
                .orElseThrow(() -> new ResourceNotFoundException("Cuota no encontrada para este id :: " + id_cuota));

        cuota.setCosto(detallesCuota.getCosto());
        final Cuotas cuotaActualizada = cuotasRepository.save(cuota);
        logService.registrarEvento(logeado,
                "Actualizó la cuota " + id_cuota + " a " + cuota.getCosto());
        return ResponseEntity.ok(cuotaActualizada);
    }

    @Autowired
    private CargaMateriasService asignaturaService;

    // carga de materias
    @PostMapping("/cargar-desde-excel")
    public ResponseEntity<String> cargarDesdeExcel(@RequestParam("file") MultipartFile file) {
        try {
            asignaturaService.cargarDatosDesdeExcel(file);
            return ResponseEntity.ok("Datos cargados exitosamente desde el archivo Excel.");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al cargar datos desde el archivo Excel: " + e.getMessage());
        }
    }

    // carga de unidades
    @Autowired
    private CargaUnidadesAsignaturas cargaUnidadesAsignaturas;

    @PostMapping("/cargar-desde-excel/unidades")
    public ResponseEntity<String> cargarDesdeExcelUnidades(@RequestParam("file") MultipartFile file) {
        try {
            cargaUnidadesAsignaturas.cargarDatosDesdeExcel(file);
            return ResponseEntity.ok("Datos cargados exitosamente desde el archivo Excel.");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al cargar datos desde el archivo Excel: " + e.getMessage());
        }
    }

}
