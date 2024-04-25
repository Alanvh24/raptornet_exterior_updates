package com.utmir.raptornet.controllers;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType0Font;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
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

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.AntecedentesAcademicos;
import com.utmir.raptornet.models.AspiranteCalificaciones;
import com.utmir.raptornet.models.Carreras;
import com.utmir.raptornet.models.Cuatrimestre;
import com.utmir.raptornet.models.Cuotas;
import com.utmir.raptornet.models.ERole;
import com.utmir.raptornet.models.InformacionAcademica;
import com.utmir.raptornet.models.Pagos;
import com.utmir.raptornet.models.Role;
import com.utmir.raptornet.models.Status;
import com.utmir.raptornet.payload.request.AspiranteFinanzas;
import com.utmir.raptornet.payload.request.AspiranteReferencia;
import com.utmir.raptornet.payload.response.MessageResponse;
import com.utmir.raptornet.payload.response.PagosFinanzas;
import com.utmir.raptornet.payload.response.ResourceNotFoundException;
import com.utmir.raptornet.repository.AlumnoRepository;
import com.utmir.raptornet.repository.AntecedentesAcademicosRepository;
import com.utmir.raptornet.repository.AspiranteCalificacionesRepository;
import com.utmir.raptornet.repository.CarrerasRepository;
import com.utmir.raptornet.repository.ContactoEmergenciaRepository;
import com.utmir.raptornet.repository.CuatrimestreRepository;
import com.utmir.raptornet.repository.CuotasRepository;
import com.utmir.raptornet.repository.DatosGeneralesRepository;
import com.utmir.raptornet.repository.InformacionAcademicaRepository;
import com.utmir.raptornet.repository.PagosRepository;
import com.utmir.raptornet.repository.RoleRepository;
import com.utmir.raptornet.repository.StatusRepository;
import com.utmir.raptornet.security.services.EmailService;
import com.utmir.raptornet.security.services.LogService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/finanzas")
public class FinanzasController {

    @Autowired
    AlumnoRepository alumnoRepository;
    @Autowired
    DatosGeneralesRepository datosGeneralesRepository;
    @Autowired
    ContactoEmergenciaRepository contactoEmergenciaRepository;
    @Autowired
    AntecedentesAcademicosRepository antecedentesAcademicosRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    CarrerasRepository carrerasRepository;
    @Autowired
    CuotasRepository cuotasRepository;
    @Autowired
    PagosRepository pagosRepository;
    @Autowired
    AspiranteCalificacionesRepository aspiranteCalificacionesRepository;
    @Autowired
    LogService logService;
    @Autowired
    InformacionAcademicaRepository informacionAcademicaRepository;
    @Autowired
    StatusRepository statusRepository;
    @Autowired
    CuatrimestreRepository cuatrimestreRepository;
    @Autowired
    EmailService emailService;

    // Info Aspirantes
    @GetMapping("/aspirantes")
    @PreAuthorize("hasRole('FINANZAS')")
    public ResponseEntity<List<AspiranteFinanzas>> obtenerTodosLosPerfiles() {
        List<Alumno> todosLosAlumnos = alumnoRepository.findAll();
        List<AspiranteFinanzas> perfiles = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy"); // Formateador de fecha

        for (Alumno alumno : todosLosAlumnos) {
            AspiranteFinanzas perfilResponse = new AspiranteFinanzas();

            // Asignar roles
            Set<Role> rolesDelAlumno = alumno.getRoles();
            List<String> nombresRoles = rolesDelAlumno.stream()
                    .map(role -> role.getName().toString())
                    .collect(Collectors.toList());
            perfilResponse.setRoles(nombresRoles);

            // Asignar matrícula
            if (alumno.getMatricula() != null) {
                perfilResponse.setMatricula(alumno.getMatricula());
                perfilResponse.setNombre(alumno.getNombre());
                perfilResponse.setAp_paterno(alumno.getAp_paterno());
                perfilResponse.setAp_materno(alumno.getAp_materno());
            }

            // Asignar carrera y formato numérico
            AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository.findByAlumno(alumno)
                    .orElse(null);
            if (antecedentesAcademicos != null && antecedentesAcademicos.getId_carrera_1() != null) {
                Carreras carrera = antecedentesAcademicos.getId_carrera_1();
                perfilResponse.setId_carrera_1(carrera.getCarrera());
                perfilResponse.setFormato_numerico(carrera.getFormato_numerico());
            }

            boolean tieneCuotaEspecifica = alumno.getPagos().stream()
                    .anyMatch(pago -> {
                        Cuotas cuota = pago.getId_cuota();
                        if (cuota != null) {
                            return "Examen de ingreso a la educación superior".equals(cuota.getCuota()) ||
                                    "5".equals(cuota.getId_cuota().toString());
                        }
                        return false;
                    });

            if (tieneCuotaEspecifica) {
                // Filtrar y agregar solo los detalles de los pagos que corresponden a la cuota
                // específica
                List<Pagos> pagosEspecificos = alumno.getPagos().stream()
                        .filter(pago -> "5".equals(pago.getId_cuota().getId_cuota().toString()))
                        .collect(Collectors.toList());

                List<String> cuotasAlumno = new ArrayList<>();
                List<String> formatosNumericosCuotasAlumno = new ArrayList<>();
                List<String> costosAlumno = new ArrayList<>();
                List<String> concatenaciones = new ArrayList<>();
                List<String> referenciasAlumno = new ArrayList<>();

                for (Pagos pago : pagosEspecificos) {
                    String cuota = pago.getId_cuota().getCuota();
                    String formatoNumericoCuota = pago.getId_cuota().getFormato_numerico_cuota();
                    String costo = pago.getId_cuota().getCosto();
                    String referencia = pago.getReferencia();
                    String concatenado = pago.getConcatenado();

                    if (!cuotasAlumno.contains(cuota))
                        cuotasAlumno.add(cuota);
                    if (!formatosNumericosCuotasAlumno.contains(formatoNumericoCuota))
                        formatosNumericosCuotasAlumno.add(formatoNumericoCuota);
                    if (!costosAlumno.contains(costo))
                        costosAlumno.add(costo);
                    if (referencia != null && !referenciasAlumno.contains(referencia))
                        referenciasAlumno.add(referencia);
                    if (concatenado != null && !concatenaciones.contains(concatenado))
                        concatenaciones.add(concatenado);
                }

                // Asignar fechas de registro
                LocalDate fechaDeRegistro = alumno.getFecha_registro() != null ? alumno.getFecha_registro()
                        : LocalDate.now();
                LocalDate fechaDeRegistro2 = fechaDeRegistro.plusDays(15);
                String fechaFormateada = fechaDeRegistro.format(formatter);
                String fechaFormateada2 = fechaDeRegistro2.format(formatter);

                perfilResponse.setFecha_registro(fechaFormateada);
                perfilResponse.setFecha_registro2(fechaFormateada2);
                perfilResponse.setCuota(cuotasAlumno);
                perfilResponse.setFormato_numerico_cuota(formatosNumericosCuotasAlumno);
                perfilResponse.setCosto(costosAlumno);
                perfilResponse.setConcatenaciones(concatenaciones);
                perfilResponse.setReferencia(referenciasAlumno);

                // Verificar si alguno de los pagos tiene verificación "si"
                boolean tienePagoVerificadoSi = alumno.getPagos().stream()
                        .anyMatch(pago -> "si".equalsIgnoreCase(pago.getVerificar_pago()));

                if (!tienePagoVerificadoSi) {
                    perfiles.add(perfilResponse);
                }
            }
        }

        return ResponseEntity.ok(perfiles);
    }

    @GetMapping("/aspirantes/validacion")
    @PreAuthorize("hasRole('FINANZAS')")
    public ResponseEntity<List<AspiranteFinanzas>> obtenerPerfilesEtapa1() {
        List<Alumno> todosLosAlumnos = alumnoRepository.findAll();
        List<AspiranteFinanzas> perfiles = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy"); // Formateador de fecha

        for (Alumno alumno : todosLosAlumnos) {

            if (!"1".equals(alumno.getAsp_etapa())) {
                continue; // Si no está en la etapa 1, saltar al siguiente alumno
            }

            AspiranteFinanzas perfilResponse = new AspiranteFinanzas();

            // Asignar roles
            Set<Role> rolesDelAlumno = alumno.getRoles();
            List<String> nombresRoles = rolesDelAlumno.stream()
                    .map(role -> role.getName().toString())
                    .collect(Collectors.toList());
            perfilResponse.setRoles(nombresRoles);

            // Asignar matrícula
            if (alumno.getMatricula() != null) {
                perfilResponse.setMatricula(alumno.getMatricula());
                perfilResponse.setNombre(alumno.getNombre());
                perfilResponse.setAp_paterno(alumno.getAp_paterno());
                perfilResponse.setAp_materno(alumno.getAp_materno());
            }

            // Asignar carrera y formato numérico
            AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository.findByAlumno(alumno)
                    .orElse(null);
            if (antecedentesAcademicos != null && antecedentesAcademicos.getId_carrera_1() != null) {
                Carreras carrera = antecedentesAcademicos.getId_carrera_1();
                perfilResponse.setId_carrera_1(carrera.getCarrera());
                perfilResponse.setFormato_numerico(carrera.getFormato_numerico());
            }

            boolean tieneCuotaEspecifica = alumno.getPagos().stream()
                    .anyMatch(pago -> {
                        Cuotas cuota = pago.getId_cuota();
                        if (cuota != null) {
                            return "Examen de ingreso a la educación superior".equals(cuota.getCuota()) ||
                                    "5".equals(cuota.getId_cuota().toString());
                        }
                        return false;
                    });

            if (tieneCuotaEspecifica) {
                // Filtrar y agregar solo los detalles de los pagos que corresponden a la cuota
                // específica
                List<Pagos> pagosEspecificos = alumno.getPagos().stream()
                        .filter(pago -> "5".equals(pago.getId_cuota().getId_cuota().toString()))
                        .collect(Collectors.toList());

                List<String> cuotasAlumno = new ArrayList<>();
                List<String> formatosNumericosCuotasAlumno = new ArrayList<>();
                List<String> costosAlumno = new ArrayList<>();
                List<String> concatenaciones = new ArrayList<>();
                List<String> referenciasAlumno = new ArrayList<>();

                for (Pagos pago : pagosEspecificos) {
                    String cuota = pago.getId_cuota().getCuota();
                    String formatoNumericoCuota = pago.getId_cuota().getFormato_numerico_cuota();
                    String costo = pago.getId_cuota().getCosto();
                    String referencia = pago.getReferencia();
                    String concatenado = pago.getConcatenado();

                    if (!cuotasAlumno.contains(cuota))
                        cuotasAlumno.add(cuota);
                    if (!formatosNumericosCuotasAlumno.contains(formatoNumericoCuota))
                        formatosNumericosCuotasAlumno.add(formatoNumericoCuota);
                    if (!costosAlumno.contains(costo))
                        costosAlumno.add(costo);
                    if (referencia != null && !referenciasAlumno.contains(referencia))
                        referenciasAlumno.add(referencia);
                    if (concatenado != null && !concatenaciones.contains(concatenado))
                        concatenaciones.add(concatenado);
                }

                // Asignar fechas de registro
                LocalDate fechaDeRegistro = alumno.getFecha_registro() != null ? alumno.getFecha_registro()
                        : LocalDate.now();
                LocalDate fechaDeRegistro2 = fechaDeRegistro.plusDays(15);
                String fechaFormateada = fechaDeRegistro.format(formatter);
                String fechaFormateada2 = fechaDeRegistro2.format(formatter);

                perfilResponse.setFecha_registro(fechaFormateada);
                perfilResponse.setFecha_registro2(fechaFormateada2);
                perfilResponse.setCuota(cuotasAlumno);
                perfilResponse.setFormato_numerico_cuota(formatosNumericosCuotasAlumno);
                perfilResponse.setCosto(costosAlumno);
                perfilResponse.setConcatenaciones(concatenaciones);
                perfilResponse.setReferencia(referenciasAlumno);

                // Verificar si alguno de los pagos tiene verificación "si"
                boolean tienePagoVerificadoSi = alumno.getPagos().stream()
                        .anyMatch(pago -> "si".equalsIgnoreCase(pago.getVerificar_pago()));

                if (!tienePagoVerificadoSi) {
                    perfiles.add(perfilResponse);
                }
            }
        }

        return ResponseEntity.ok(perfiles);
    }

    @PostMapping("/cargarReferencias")
    @PreAuthorize("hasRole('FINANZAS')")
    public ResponseEntity<?> cargarReferencias(@RequestParam("archivo") MultipartFile archivo) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String matricula = authentication.getName(); // Obtenemos la matrícula del usuario autenticado
        try {
            String contentType = archivo.getContentType();
            if (contentType == null || !contentType.equals("text/plain")) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body(new MessageResponse(
                                "Formato de archivo no soportado. Por favor, carga un archivo .txt."));

            }

            List<String> referenciasCompletas = leerReferenciasDelArchivo(archivo);

            for (String referenciaCompleta : referenciasCompletas) {
                String concatenadoCorrespondiente = extraerConcatenado(referenciaCompleta);
                List<Pagos> pagosList = pagosRepository.findByConcatenado(concatenadoCorrespondiente);

                for (Pagos pago : pagosList) {
                    if (pago.getReferencia() == null || pago.getReferencia().isEmpty()) {
                        pago.setReferencia(referenciaCompleta);
                        pagosRepository.save(pago);
                        logService.registrarEvento(matricula,
                                "Cargó referencias de pago al " + pago.getAlumno().getMatricula());
                        // Actualizar asp_etapa del Alumno asociado
                        Alumno alumno = pago.getAlumno();
                        if (alumno != null) {
                            if ("1".equals(alumno.getAsp_etapa())) {
                                alumno.setAsp_etapa("2");
                                alumnoRepository.save(alumno);
                            } else if ("4".equals(alumno.getAsp_etapa())) {
                                alumno.setAsp_etapa("5");
                                alumnoRepository.save(alumno);
                            }

                            // Obtener detalles de la cuota para incluir en el correo
                            Cuotas cuota = pago.getId_cuota();
                            String conceptoDePago = cuota != null ? cuota.getCuota() : "N/D";
                            String costo = cuota != null ? cuota.getCosto() : "N/D";
                            PDDocument document = new PDDocument();
                            try {
                                // Carga la plantilla PDF desde resources
                                PDDocument template = PDDocument.load(
                                        new ClassPathResource("templates/formato_referencias.pdf").getInputStream());
                                document.addPage(template.getPage(0));

                                PDType0Font font = PDType0Font.load(document,
                                        new ClassPathResource("templates/NewJune-Regular.ttf").getInputStream());

                                PDPageContentStream contentStream = new PDPageContentStream(document,
                                        document.getPage(0), PDPageContentStream.AppendMode.APPEND, true, true);

                                contentStream.beginText();
                                contentStream.setFont(font, 20);

                                // Posicionamiento de texto similar al ejemplo JavaScript
                                // Matrícula
                                contentStream.newLineAtOffset(140, 596);
                                contentStream.showText(alumno.getMatricula());
                                contentStream.endText();

                                // Nombre completo
                                contentStream.beginText();
                                contentStream.newLineAtOffset(120, 542);
                                String nombreCompleto = alumno.getNombre() + " " + alumno.getAp_paterno() + " "
                                        + alumno.getAp_materno();
                                contentStream.showText(nombreCompleto);
                                contentStream.endText();

                                // Costo
                                contentStream.beginText();
                                contentStream.newLineAtOffset(190, 428);
                                contentStream.showText("$" + costo);
                                contentStream.endText();

                                // Concepto de Pago
                                contentStream.beginText();
                                contentStream.newLineAtOffset(220, 373);
                                contentStream.showText(conceptoDePago);
                                contentStream.endText();

                                // Referencia
                                contentStream.beginText();
                                contentStream.newLineAtOffset(155, 205);
                                contentStream.showText(referenciaCompleta);
                                contentStream.endText();

                                // Fecha límite
                                contentStream.beginText();
                                contentStream.newLineAtOffset(260, 148);
                                contentStream.showText(pago.getFecha_limite().toString());
                                contentStream.endText();

                                contentStream.close();

                                // Guardar el documento en un ByteArrayOutputStream para adjuntarlo directamente
                                ByteArrayOutputStream out = new ByteArrayOutputStream();
                                document.save(out);
                                document.close();

                                // Enviar el PDF como un adjunto de correo electrónico
                                emailService.sendEmailWithAttachment(alumno.getEmail(), "Referencia de Pago",
                                        "Encuentra adjunto tu referencia de pago.", out.toByteArray(),
                                        "referencia_pago.pdf");
                            } catch (Exception e) {
                                e.printStackTrace();
                                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                        .body(new MessageResponse("Error al generar el PDF: " + e.getMessage()));
                            }

                        }

                        break;
                    }

                }
            }
            return ResponseEntity.ok(new MessageResponse("Referencias cargadas exitosamente."));
        } catch (

        Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new MessageResponse("Error al cargar el archivo: " + e.getMessage()));
        }
    }

    private List<String> leerReferenciasDelArchivo(MultipartFile archivo) throws Exception {
        List<String> referencias = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(archivo.getInputStream(), StandardCharsets.UTF_8))) {
            referencias = reader.lines()
                    .skip(1) // Saltar la cabecera si existe
                    .map(line -> line.split("\t")) // Separar por tabulaciones
                    .map(parts -> parts.length > 3 ? parts[3] : "") // Asumir que la referencia completa está en la
                                                                    // cuarta columna
                    .collect(Collectors.toList());
        }
        return referencias;
    }

    private String extraerConcatenado(String referenciaCompleta) {
        return referenciaCompleta.length() >= 9 ? referenciaCompleta.substring(0, 9) : "";
    }

    // Verificar pago de ficha de examen
    @PutMapping("/pagos/verificar/{matricula}")
    @PreAuthorize("hasRole('FINANZAS')")
    public ResponseEntity<?> actualizarVerificarPago(@PathVariable String matricula,
            @RequestBody String verificarPago) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String logeado = authentication.getName(); // Obtenemos la matrícula del usuario autenticado
        List<Pagos> pagos = pagosRepository.findByAlumnoMatricula(matricula);

        if (pagos.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("No se encontraron pagos para la matrícula proporcionada.");
        }

        for (Pagos pago : pagos) {
            // Verificar si la referencia está vacía
            if (pago.getReferencia() == null || pago.getReferencia().trim().isEmpty() ||
                    (pago.getId_cuota() == null || !pago.getId_cuota().getId_cuota().equals(5L))) {
                continue;
            }

            pago.setVerificar_pago(verificarPago);
            pagosRepository.save(pago);

            // Obtener el alumno asociado al pago y actualizar asp_etapa
            Alumno alumno = pago.getAlumno();
            if (alumno != null) {
                if ("si".equals(verificarPago)) {
                    alumno.setAsp_etapa("3");
                    AspiranteCalificaciones aspiranteCalificaciones = aspiranteCalificacionesRepository
                            .findByAlumno(alumno)
                            .orElseGet(() -> {
                                AspiranteCalificaciones nuevosDatos = new AspiranteCalificaciones();
                                nuevosDatos.setAlumno(alumno);
                                return nuevosDatos;
                            });
                    aspiranteCalificacionesRepository.save(aspiranteCalificaciones);
                    logService.registrarEvento(logeado,
                            "Se verificó el pago de " + alumno.getMatricula() + " del exámen de admisión");
                } else {
                    alumno.setAsp_etapa("2");
                }

                alumnoRepository.save(alumno);
            }
        }

        return ResponseEntity.ok("Verificacion de pagos actualizado correctamente");
    }

    @PostMapping("/cargarPagosExp/fichas")
    // @PreAuthorize("hasRole('FINANZAS')")
    public ResponseEntity<?> cargarPagosExp(@RequestParam("archivo") MultipartFile archivo) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String logeado = authentication.getName(); // Usuario autenticado

        try {
            if (archivo.isEmpty()) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body(new MessageResponse("Archivo vacío. Por favor, carga un archivo .txt."));
            }

            List<String> referenciasBancarias = leerReferenciasDelArchivoExp(archivo);

            for (String referenciaBancaria : referenciasBancarias) {
                List<Pagos> pagosList = pagosRepository.findByReferencia(referenciaBancaria);

                // Si no se encuentran pagos para la referencia, ignora y continúa con la
                // siguiente
                if (pagosList.isEmpty()) {
                    continue;
                }

                for (Pagos pago : pagosList) {
                    actualizarPagoYAlumno(pago, logeado);
                }
            }
            return ResponseEntity.ok(new MessageResponse("Pagos actualizados exitosamente."));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new MessageResponse("Error al cargar el archivo: " + e.getMessage()));
        }
    }

    private List<String> leerReferenciasDelArchivoExp(MultipartFile archivo) throws IOException {
        List<String> referenciasBancarias = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(archivo.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.length() > 10) {
                    // Suponiendo que la referencia bancaria sigue los primeros 10 caracteres
                    String referenciaBancaria = line.substring(10, 27); // Ajustar según la longitud exacta
                    referenciasBancarias.add(referenciaBancaria);
                }
            }
        }
        return referenciasBancarias;
    }

    private void actualizarPagoYAlumno(Pagos pago, String usuarioLogeado) {
        // Suponiendo que "si" es el estado de verificación deseado

        Alumno alumnoVer = pago.getAlumno();
        if (alumnoVer != null && !"4".equals(alumnoVer.getAsp_etapa())) {
            String verificarPago = "si";
            pago.setVerificar_pago(verificarPago);
            pagosRepository.save(pago);

            Alumno alumno = pago.getAlumno();
            if (alumno != null) {
                if ("si".equals(verificarPago)) {
                    alumno.setAsp_etapa("3");
                    AspiranteCalificaciones aspiranteCalificaciones = aspiranteCalificacionesRepository
                            .findByAlumno(alumno)
                            .orElseGet(() -> {
                                AspiranteCalificaciones nuevosDatos = new AspiranteCalificaciones();
                                nuevosDatos.setAlumno(alumno);
                                return nuevosDatos;
                            });
                    aspiranteCalificacionesRepository.save(aspiranteCalificaciones);
                } else {
                    alumno.setAsp_etapa("2");
                }

                alumnoRepository.save(alumno);
            }

            // Registrar evento
            logService.registrarEvento(usuarioLogeado,
                    "Se verificó el pago de " + alumno.getMatricula() + " del exámen de admisión");
        }
    }

    // Verificar pago cursos
    @PutMapping("/pagos/cursosPropedeutico/verificar/{matricula}")
    // @PreAuthorize("hasRole('FINANZAS')")
    public ResponseEntity<?> verificarPagoCursoPropedeutico(@PathVariable String matricula) {
        Alumno alumno = alumnoRepository.findByMatricula(matricula)
                .orElseThrow(() -> new ResourceNotFoundException("Alumno no encontrado con matrícula: " + matricula));

        List<Pagos> pagos = pagosRepository.findByAlumnoMatricula(matricula);

        if (pagos.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("No se encontraron pagos para la matrícula proporcionada.");
        }

        Optional<Pagos> pagoCursoPropedeutico = pagos.stream()
                .filter(pago -> pago.getId_cuota().getId_cuota() == 17)
                .findFirst();

        if (!pagoCursoPropedeutico.isPresent()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("No se ha realizado el pago del curso propedéutico.");
        }

        Pagos pago = pagoCursoPropedeutico.get();
        pago.setVerificar_pago("si");
        pagosRepository.save(pago);

        Optional<InformacionAcademica> infoAcademicaExistente = informacionAcademicaRepository.findByAlumno(alumno);
        InformacionAcademica infoAcademica = infoAcademicaExistente.orElseGet(InformacionAcademica::new);

        infoAcademica.setAlumno(alumno);
        Status status = statusRepository.findById(1L)
                .orElseThrow(() -> new RuntimeException("Error: Status no encontrado."));
        infoAcademica.setStatus(status);

        Cuatrimestre cuatrimestre13 = cuatrimestreRepository.findById(13L)
                .orElseThrow(() -> new RuntimeException("Error: Cuatrimestre 13 no encontrado."));
        infoAcademica.setCuatrimestre(cuatrimestre13);

        // Establece el programa educativo al valor "100", que representa el "curso
        // propedéutico"
        Carreras programaEducativoCursoPropedeutico = carrerasRepository.findById(100L)
                .orElseThrow(
                        () -> new RuntimeException("Error: Programa educativo 'Curso Propedéutico' no encontrado."));
        infoAcademica.setProgramaEducativo(programaEducativoCursoPropedeutico);

        informacionAcademicaRepository.save(infoAcademica);

        return ResponseEntity.ok(new MessageResponse(
                "Pago del curso propedéutico verificado correctamente para la matrícula: " + matricula));
    }

    @PostMapping("/cargarPagosCursosPropedeuticos")
    @PreAuthorize("hasRole('FINANZAS')")
    public ResponseEntity<?> verificarPagosCursosPropedeuticos(@RequestParam("archivo") MultipartFile archivo) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String usuarioLogeado = authentication.getName(); // Usuario autenticado

        try {
            if (archivo.isEmpty()) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body(new MessageResponse("Archivo vacío. Por favor, carga un archivo .txt."));
            }

            List<String> referenciasBancarias = leerReferenciasDelArchivoExp(archivo);

            for (String referenciaBancaria : referenciasBancarias) {
                List<Pagos> pagosList = pagosRepository.findByReferencia(referenciaBancaria);

                if (pagosList.isEmpty()) {
                    continue;
                }

                for (Pagos pago : pagosList) {
                    if (pago.getId_cuota().getId_cuota() == 17) { // Asumiendo que 17 es el ID de la cuota para cursos
                                                                  // propedéuticos
                        actualizarPagoCursoPropedeutico(pago, usuarioLogeado);
                    }
                }
            }
            return ResponseEntity
                    .ok(new MessageResponse("Pagos de cursos propedéuticos verificados y actualizados exitosamente."));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new MessageResponse("Error al cargar el archivo: " + e.getMessage()));
        }
    }

    private void actualizarPagoCursoPropedeutico(Pagos pago, String usuarioLogeado) {
        pago.setVerificar_pago("si");
        pagosRepository.save(pago);

        Alumno alumno = pago.getAlumno();
        if (alumno != null) {
            if ("4".equals(alumno.getAsp_etapa())) {
                alumno.setAsp_etapa("5");
                alumnoRepository.save(alumno);
                // Registrar el cambio de etapa para el alumno
                logService.registrarEvento(usuarioLogeado, String.format(
                        "Asp_etapa actualizado a 5 para el alumno %s debido a la verificación del pago del curso propedéutico.",
                        alumno.getMatricula()));
            }

            // Crear o actualizar la información académica con los valores específicos
            InformacionAcademica infoAcademica = informacionAcademicaRepository.findByAlumno(alumno)
                    .orElse(new InformacionAcademica());
            infoAcademica.setAlumno(alumno);

            // Suponiendo que existe una forma de obtener las instancias de Carreras y
            // Cuatrimestre por ID
            Carreras programaEducativo = carrerasRepository.findById(100L)
                    .orElseThrow(() -> new RuntimeException("Programa educativo no encontrado"));
            infoAcademica.setProgramaEducativo(programaEducativo);

            Cuatrimestre cuatrimestre = cuatrimestreRepository.findById(13L)
                    .orElseThrow(() -> new RuntimeException("Cuatrimestre no encontrado"));
            infoAcademica.setCuatrimestre(cuatrimestre);

            informacionAcademicaRepository.save(infoAcademica);

            // Registrar evento
            logService.registrarEvento(usuarioLogeado,
                    "Se verificó el pago del curso propedéutico y se actualizó la información académica para "
                            + alumno.getMatricula());
        }
    }

    @PutMapping("/pagos/inscripcion/verificar/{matricula}")
    @PreAuthorize("hasRole('FINANZAS')")
    public ResponseEntity<?> cambiarRolAlumno(@PathVariable String matricula) {
        Alumno alumno = alumnoRepository.findByMatricula(matricula)
                .orElseThrow(() -> new ResourceNotFoundException("Alumno no encontrado con matrícula: " + matricula));

        // Obtener los pagos del alumno
        List<Pagos> pagos = pagosRepository.findByAlumnoMatricula(matricula);

        if (pagos.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("No se encontraron pagos para la matrícula proporcionada.");
        }

        // Verificar si existe un pago con id_cuota 40
        Optional<Pagos> pagoInscripcion = pagos.stream()
                .filter(pago -> pago.getId_cuota().getId_cuota() == 40)
                .findFirst();

        if (!pagoInscripcion.isPresent()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("No se ha realizado el pago de inscripción.");
        }

        // Actualizar verificar_pago a "si"
        Pagos pago = pagoInscripcion.get();
        pago.setVerificar_pago("si");
        pagosRepository.save(pago);

        // Encuentra el rol de ALUMNO (asumiendo que ya existe en la base de datos)
        Role rolAlumno = roleRepository.findByName(ERole.ROLE_ALUMNO)
                .orElseThrow(() -> new RuntimeException("Error: Rol no encontrado."));

        // Limpiar roles actuales y asignar ROLE_ALUMNO
        Set<Role> rolesActuales = alumno.getRoles();
        rolesActuales.clear();
        rolesActuales.add(rolAlumno);
        alumno.setRoles(rolesActuales);

        alumnoRepository.save(alumno);

        Optional<AntecedentesAcademicos> antecedentesOpt = antecedentesAcademicosRepository.findByAlumno(alumno);
        if (!antecedentesOpt.isPresent() || antecedentesOpt.get().getId_carrera_1() == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Información de carrera no disponible para el alumno con matrícula: " + matricula);
        }
        Carreras carrera = antecedentesOpt.get().getId_carrera_1();

        Optional<InformacionAcademica> infoAcademicaExistente = informacionAcademicaRepository.findByAlumno(alumno);

        InformacionAcademica infoAcademica;
        if (infoAcademicaExistente.isPresent()) {
            // Si existe, actualiza el registro existente
            infoAcademica = infoAcademicaExistente.get();
        } else {
            infoAcademica = new InformacionAcademica();
            infoAcademica.setAlumno(alumno);
        }
        Status status = statusRepository.findById(1L)
                .orElseThrow(() -> new RuntimeException("Error: Status no encontrado."));
        infoAcademica.setStatus(status);
        infoAcademica.setGrupo(null);

        Cuatrimestre cuatrimestre1 = cuatrimestreRepository.findById(1L)
                .orElseThrow(() -> new RuntimeException("Error: Cuatrimestre 1 no encontrado."));
        infoAcademica.setAlumno(alumno);
        infoAcademica.setProgramaEducativo(carrera);
        Cuatrimestre cuatrimestre2 = cuatrimestreRepository.findById(2L)
                .orElseThrow(() -> new RuntimeException("Error: Cuatrimestre 2 no encontrado."));
        if (carrera.getId_carrera() == 3) {
            infoAcademica.setCuatrimestre(cuatrimestre1);
        } else {
            infoAcademica.setCuatrimestre(cuatrimestre2);
        }
        informacionAcademicaRepository.save(infoAcademica);

        return ResponseEntity
                .ok(new MessageResponse("Rol de alumno actualizado correctamente para la matrícula: " + matricula));
    }

    @PostMapping("/cargarPagosExp/inscripcion")
    @PreAuthorize("hasRole('FINANZAS')")
    public ResponseEntity<?> verificarPagosInscripcion(@RequestParam("archivo") MultipartFile archivo) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String usuarioLogeado = authentication.getName(); // Usuario autenticado

        try {
            if (archivo.isEmpty()) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body(new MessageResponse("Archivo vacío. Por favor, carga un archivo .txt."));
            }

            List<String> referenciasBancarias = leerReferenciasDelArchivoExp(archivo);

            for (String referenciaBancaria : referenciasBancarias) {
                List<Pagos> pagosList = pagosRepository.findByReferencia(referenciaBancaria);

                if (pagosList.isEmpty()) {
                    continue;
                }

                for (Pagos pago : pagosList) {
                    actualizarPagoInscripcionYAlumno(pago, usuarioLogeado);
                }
            }
            return ResponseEntity
                    .ok(new MessageResponse("Pagos de inscripción verificados y actualizados exitosamente."));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new MessageResponse("Error al cargar el archivo: " + e.getMessage()));
        }

    }

    private void actualizarPagoInscripcionYAlumno(Pagos pago, String usuarioLogeado) {

        Alumno alumnoVer = pago.getAlumno();
        if (alumnoVer != null && "6".equals(alumnoVer.getAsp_etapa())) {
            if (pago.getId_cuota().getId_cuota() == 40) {
                // Actualizar verificar_pago a "si"
                pago.setVerificar_pago("si");
                pagosRepository.save(pago);

                Alumno alumno = pago.getAlumno();
                if (alumno != null) {
                    // Encuentra el rol de ALUMNO
                    Role rolAlumno = roleRepository.findByName(ERole.ROLE_ALUMNO)
                            .orElseThrow(() -> new RuntimeException("Error: Rol no encontrado."));
                    Set<Role> rolesActuales = alumno.getRoles();
                    rolesActuales.clear();
                    rolesActuales.add(rolAlumno);
                    alumno.setRoles(rolesActuales);
                    alumnoRepository.save(alumno);

                    // Actualizar información académica
                    actualizarInformacionAcademica(alumno);

                    // Registrar evento
                    logService.registrarEvento(usuarioLogeado,
                            "Se verificó el pago de inscripción de " + alumno.getMatricula());
                }
            }
        }
    }

    private void actualizarInformacionAcademica(Alumno alumno) {
        Optional<AntecedentesAcademicos> antecedentesOpt = antecedentesAcademicosRepository.findByAlumno(alumno);
        if (antecedentesOpt.isPresent() && antecedentesOpt.get().getId_carrera_1() != null) {
            Carreras carrera = antecedentesOpt.get().getId_carrera_1();
            InformacionAcademica infoAcademica = informacionAcademicaRepository.findByAlumno(alumno)
                    .orElse(new InformacionAcademica());
            infoAcademica.setAlumno(alumno);
            infoAcademica.setProgramaEducativo(carrera);
            infoAcademica.setGrupo(null);
            Status status = statusRepository.findById(1L)
                    .orElseThrow(() -> new RuntimeException("Error: Status no encontrado."));
            infoAcademica.setStatus(status);

            Cuatrimestre cuatrimestre1 = cuatrimestreRepository.findById(1L)
                    .orElseThrow(() -> new RuntimeException("Error: Cuatrimestre 1 no encontrado."));
            infoAcademica.setAlumno(alumno);
            infoAcademica.setProgramaEducativo(carrera);
            Cuatrimestre cuatrimestre2 = cuatrimestreRepository.findById(2L)
                    .orElseThrow(() -> new RuntimeException("Error: Cuatrimestre 2 no encontrado."));
            if (carrera.getId_carrera() == 3) {
                infoAcademica.setCuatrimestre(cuatrimestre1);
            } else {
                infoAcademica.setCuatrimestre(cuatrimestre2);
            }

            informacionAcademicaRepository.save(infoAcademica);
        } else {
            throw new RuntimeException(
                    "Información de carrera no disponible para el alumno con matrícula: " + alumno.getMatricula());
        }
    }

    @GetMapping("/aspirante/referencia")
    public AspiranteReferencia obtenerReferenciaAspirante() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String matricula = authentication.getName();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy"); // Formateador de fecha

        Alumno alumno = alumnoRepository.findByMatricula(matricula)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario no encontrado con matrícula: " + matricula));

        // Asignar fechas de registro
        LocalDate fechaDeRegistro = alumno.getFecha_registro() != null ? alumno.getFecha_registro()
                : LocalDate.now();
        LocalDate fecha_limite = fechaDeRegistro.plusDays(15);
        String fechaFormateada = fechaDeRegistro.format(formatter); // Formatea la fecha
        String fecha_pago = fecha_limite.format(formatter); // Formatea la fecha

        // Crear y devolver el DTO
        AspiranteReferencia aspiranteReferencia = new AspiranteReferencia();
        aspiranteReferencia.setMatricula(alumno.getMatricula());
        aspiranteReferencia.setNombre(alumno.getNombre());
        aspiranteReferencia.setAp_paterno(alumno.getAp_paterno());
        aspiranteReferencia.setAp_materno(alumno.getAp_materno());
        aspiranteReferencia.setFecha_registro(fechaFormateada);
        aspiranteReferencia.setFecha_limite(fecha_pago);

        AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository.findByAlumno(alumno)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Detalles de Antecedentes no encontrados para el alumno: " + matricula));
        if (antecedentesAcademicos != null) {
            Carreras carreras = antecedentesAcademicos.getId_carrera_1();
            aspiranteReferencia.setId_carrera_1(carreras != null ? carreras.getCarrera() : null);
        }

        Pagos pago = pagosRepository.findByAlumno(alumno)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Detalles de pago no encontrados para el alumno: " + matricula));

        if (pago != null) {
            Cuotas cuota = pago.getId_cuota();
            aspiranteReferencia.setCuota(cuota != null ? cuota.getCuota() : null);
            aspiranteReferencia.setReferencia(pago.getReferencia());
            aspiranteReferencia.setCosto(cuota != null ? cuota.getCosto() : null);

        }

        return aspiranteReferencia;
    }

    @GetMapping("/aspirante/referencia/inscripcion")
    public AspiranteReferencia obtenerReferenciaAspiranteInscripcion() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String matricula = authentication.getName();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy"); // Formateador de fecha

        Alumno alumno = alumnoRepository.findByMatricula(matricula)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario no encontrado con matrícula: " + matricula));

        AspiranteReferencia aspiranteReferencia = new AspiranteReferencia();
        aspiranteReferencia.setMatricula(alumno.getMatricula());
        aspiranteReferencia.setNombre(alumno.getNombre());
        aspiranteReferencia.setAp_paterno(alumno.getAp_paterno());
        aspiranteReferencia.setAp_materno(alumno.getAp_materno());

        if (alumno.getPagos() != null && !alumno.getPagos().isEmpty()) {
            for (Pagos pago : alumno.getPagos()) {
                Cuotas cuota = pago.getId_cuota();
                if (cuota != null && "40".equals(cuota.getId_cuota().toString())) {
                    if (pago.getFecha_generacion() != null) {
                        aspiranteReferencia.setFecha_registro(pago.getFecha_generacion().format(formatter));
                    }
                    if (pago.getFecha_limite() != null) {
                        aspiranteReferencia.setFecha_limite(pago.getFecha_limite().format(formatter));
                    }
                    AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository
                            .findByAlumno(alumno)
                            .orElseThrow(() -> new ResourceNotFoundException(
                                    "Detalles de Antecedentes no encontrados para el alumno: " + matricula));
                    if (antecedentesAcademicos != null) {
                        Carreras carreras = antecedentesAcademicos.getId_carrera_1();
                        aspiranteReferencia.setId_carrera_1(carreras != null ? carreras.getCarrera() : null);
                    }
                    aspiranteReferencia.setCuota(cuota != null ? cuota.getCuota() : null);
                    aspiranteReferencia.setReferencia(pago.getReferencia());
                    aspiranteReferencia.setCosto(cuota != null ? cuota.getCosto() : null);
                    break;
                }
            }
        }

        return aspiranteReferencia;
    }

    @GetMapping("/aspirante/referencia/curso")
    public AspiranteReferencia obtenerReferenciaAspiranteCursoPropedeutico() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String matricula = authentication.getName();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy"); // Formateador de fecha

        Alumno alumno = alumnoRepository.findByMatricula(matricula)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario no encontrado con matrícula: " + matricula));

        AspiranteReferencia aspiranteReferencia = new AspiranteReferencia();
        aspiranteReferencia.setMatricula(alumno.getMatricula());
        aspiranteReferencia.setNombre(alumno.getNombre());
        aspiranteReferencia.setAp_paterno(alumno.getAp_paterno());
        aspiranteReferencia.setAp_materno(alumno.getAp_materno());

        if (alumno.getPagos() != null && !alumno.getPagos().isEmpty()) {
            for (Pagos pago : alumno.getPagos()) {
                Cuotas cuota = pago.getId_cuota();
                if (cuota != null && "17".equals(cuota.getId_cuota().toString())) {
                    if (pago.getFecha_generacion() != null) {
                        aspiranteReferencia.setFecha_registro(pago.getFecha_generacion().format(formatter));
                    }
                    if (pago.getFecha_limite() != null) {
                        aspiranteReferencia.setFecha_limite(pago.getFecha_limite().format(formatter));
                    }
                    AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository
                            .findByAlumno(alumno)
                            .orElseThrow(() -> new ResourceNotFoundException(
                                    "Detalles de Antecedentes no encontrados para el alumno: " + matricula));
                    if (antecedentesAcademicos != null) {
                        Carreras carreras = antecedentesAcademicos.getId_carrera_1();
                        aspiranteReferencia.setId_carrera_1(carreras != null ? carreras.getCarrera() : null);
                    }
                    aspiranteReferencia.setCuota(cuota != null ? cuota.getCuota() : null);
                    aspiranteReferencia.setReferencia(pago.getReferencia());
                    aspiranteReferencia.setCosto(cuota != null ? cuota.getCosto() : null);
                    break;
                }
            }
        }

        return aspiranteReferencia;
    }

    // @GetMapping("/perfiles/{matricula}")
    // public ResponseEntity<AspiranteFinanzas>
    // obtenerPerfilPorMatricula(@PathVariable String matricula) {
    // Alumno alumno = alumnoRepository.findByMatricula(matricula)
    // .orElseThrow(() -> new ResourceNotFoundException("Usuario no encontrado con
    // matrícula: " + matricula));

    // AspiranteFinanzas perfilResponse = new AspiranteFinanzas();
    // return ResponseEntity.ok(perfilResponse);
    // }

    // Cursos Propedeuticos

    @GetMapping("/aspirantes/cursos")
    public ResponseEntity<List<AspiranteFinanzas>> obtenerPagosCursosPropedeuticos() {
        List<Alumno> todosLosAlumnos = alumnoRepository.findAll();
        List<AspiranteFinanzas> perfiles = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy"); // Formateador de fecha

        for (Alumno alumno : todosLosAlumnos) {
            AspiranteFinanzas perfilResponse = new AspiranteFinanzas();
            // Asignar roles
            Set<Role> rolesDelAlumno = alumno.getRoles();
            List<String> nombresRoles = rolesDelAlumno.stream()
                    .map(role -> role.getName().toString())
                    .collect(Collectors.toList());
            perfilResponse.setRoles(nombresRoles);

            // Asignar matrícula
            if (alumno.getMatricula() != null) {
                perfilResponse.setMatricula(alumno.getMatricula());
            }

            // Asignar carrera y formato numérico
            AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository.findByAlumno(alumno)
                    .orElse(null);
            if (antecedentesAcademicos != null && antecedentesAcademicos.getId_carrera_1() != null) {
                Carreras carrera = antecedentesAcademicos.getId_carrera_1();
                perfilResponse.setId_carrera_1(carrera.getCarrera());
                perfilResponse.setFormato_numerico(carrera.getFormato_numerico());
            }

            boolean tieneCuotaEspecifica = alumno.getPagos().stream()
                    .anyMatch(pago -> {
                        Cuotas cuota = pago.getId_cuota();
                        if (cuota != null) {
                            return "Curso propedéutico"
                                    .equals(cuota.getCuota()) ||
                                    "17".equals(cuota.getId_cuota().toString());
                        }
                        return false;
                    });

            if (tieneCuotaEspecifica) {
                List<Pagos> pagosEspecificos = alumno.getPagos().stream()
                        .filter(pago -> pago.getId_cuota() != null
                                && "17".equals(pago.getId_cuota().getId_cuota().toString())
                                && !"si".equalsIgnoreCase(pago.getVerificar_pago()))
                        .collect(Collectors.toList());

                List<String> cuotasAlumno = new ArrayList<>();
                List<String> formatosNumericosCuotasAlumno = new ArrayList<>();
                List<String> costosAlumno = new ArrayList<>();
                List<String> concatenaciones = new ArrayList<>();
                List<String> referenciasAlumno = new ArrayList<>();

                for (Pagos pago : pagosEspecificos) {
                    String cuota = pago.getId_cuota().getCuota();
                    String formatoNumericoCuota = pago.getId_cuota().getFormato_numerico_cuota();
                    String costo = pago.getId_cuota().getCosto();
                    String referencia = pago.getReferencia();
                    String concatenado = pago.getConcatenado();

                    if (!cuotasAlumno.contains(cuota))
                        cuotasAlumno.add(cuota);
                    if (!formatosNumericosCuotasAlumno.contains(formatoNumericoCuota))
                        formatosNumericosCuotasAlumno.add(formatoNumericoCuota);
                    if (!costosAlumno.contains(costo))
                        costosAlumno.add(costo);
                    if (referencia != null && !referenciasAlumno.contains(referencia))
                        referenciasAlumno.add(referencia);
                    if (concatenado != null && !concatenaciones.contains(concatenado))
                        concatenaciones.add(concatenado);
                }

                if (alumno.getPagos() != null && !alumno.getPagos().isEmpty()) {
                    for (Pagos pago : alumno.getPagos()) {
                        if (pago.getFecha_generacion() != null) {
                            perfilResponse.setFecha_generacion(pago.getFecha_generacion().format(formatter));
                        }
                        if (pago.getFecha_limite() != null) {
                            perfilResponse.setFecha_limite(pago.getFecha_limite().format(formatter));
                        }
                    }
                }

                perfilResponse.setCuota(cuotasAlumno);
                perfilResponse.setFormato_numerico_cuota(formatosNumericosCuotasAlumno);
                perfilResponse.setCosto(costosAlumno);
                perfilResponse.setConcatenaciones(concatenaciones);
                perfilResponse.setReferencia(referenciasAlumno);

                if (!pagosEspecificos.isEmpty()) {
                    perfiles.add(perfilResponse);
                }

            }
        }

        return ResponseEntity.ok(perfiles);
    }

    // Para aspirante inscripcion

    @GetMapping("/aspirantes/inscripcion")
    public ResponseEntity<List<AspiranteFinanzas>> obtenerPerfilesInscripcion() {
        List<Alumno> todosLosAlumnos = alumnoRepository.findAll();
        List<AspiranteFinanzas> perfiles = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy"); // Formateador de fecha

        for (Alumno alumno : todosLosAlumnos) {
            AspiranteFinanzas perfilResponse = new AspiranteFinanzas();
            // Asignar roles
            Set<Role> rolesDelAlumno = alumno.getRoles();
            List<String> nombresRoles = rolesDelAlumno.stream()
                    .map(role -> role.getName().toString())
                    .collect(Collectors.toList());
            perfilResponse.setRoles(nombresRoles);

            // Asignar matrícula
            if (alumno.getMatricula() != null) {
                perfilResponse.setMatricula(alumno.getMatricula());
            }

            // Asignar carrera y formato numérico
            AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository.findByAlumno(alumno)
                    .orElse(null);
            if (antecedentesAcademicos != null && antecedentesAcademicos.getId_carrera_1() != null) {
                Carreras carrera = antecedentesAcademicos.getId_carrera_1();
                perfilResponse.setId_carrera_1(carrera.getCarrera());
                perfilResponse.setFormato_numerico(carrera.getFormato_numerico());
            }

            boolean tieneCuotaEspecifica = alumno.getPagos().stream()
                    .anyMatch(pago -> {
                        Cuotas cuota = pago.getId_cuota();
                        if (cuota != null) {
                            return "Paquete (5) inscripción ( inscripción, seguro, credencial, curso propedéutico"
                                    .equals(cuota.getCuota()) ||
                                    "40".equals(cuota.getId_cuota().toString());
                        }
                        return false;
                    });

            if (tieneCuotaEspecifica) {
                List<Pagos> pagosEspecificos = alumno.getPagos().stream()
                        .filter(pago -> pago.getId_cuota() != null
                                && "40".equals(pago.getId_cuota().getId_cuota().toString())
                                && !"si".equalsIgnoreCase(pago.getVerificar_pago()))
                        .collect(Collectors.toList());

                List<String> cuotasAlumno = new ArrayList<>();
                List<String> formatosNumericosCuotasAlumno = new ArrayList<>();
                List<String> costosAlumno = new ArrayList<>();
                List<String> concatenaciones = new ArrayList<>();
                List<String> referenciasAlumno = new ArrayList<>();

                for (Pagos pago : pagosEspecificos) {
                    String cuota = pago.getId_cuota().getCuota();
                    String formatoNumericoCuota = pago.getId_cuota().getFormato_numerico_cuota();
                    String costo = pago.getId_cuota().getCosto();
                    String referencia = pago.getReferencia();
                    String concatenado = pago.getConcatenado();

                    if (!cuotasAlumno.contains(cuota))
                        cuotasAlumno.add(cuota);
                    if (!formatosNumericosCuotasAlumno.contains(formatoNumericoCuota))
                        formatosNumericosCuotasAlumno.add(formatoNumericoCuota);
                    if (!costosAlumno.contains(costo))
                        costosAlumno.add(costo);
                    if (referencia != null && !referenciasAlumno.contains(referencia))
                        referenciasAlumno.add(referencia);
                    if (concatenado != null && !concatenaciones.contains(concatenado))
                        concatenaciones.add(concatenado);
                }

                if (alumno.getPagos() != null && !alumno.getPagos().isEmpty()) {
                    // Filtrar los pagos por el ID de cuota deseado antes de procesar
                    List<Pagos> pagosFiltrados = alumno.getPagos().stream()
                            .filter(pago -> pago.getId_cuota() != null && pago.getId_cuota().getId_cuota().equals(40L))
                            .collect(Collectors.toList());

                    for (Pagos pago : pagosFiltrados) {
                        // Solo procesar los pagos que cumplen con el criterio de filtrado
                        if (pago.getFecha_generacion() != null) {
                            perfilResponse.setFecha_generacion(pago.getFecha_generacion().format(formatter));
                        }
                        if (pago.getFecha_limite() != null) {
                            perfilResponse.setFecha_limite(pago.getFecha_limite().format(formatter));
                        }
                    }
                }

                perfilResponse.setCuota(cuotasAlumno);
                perfilResponse.setFormato_numerico_cuota(formatosNumericosCuotasAlumno);
                perfilResponse.setCosto(costosAlumno);
                perfilResponse.setConcatenaciones(concatenaciones);
                perfilResponse.setReferencia(referenciasAlumno);

                if (!pagosEspecificos.isEmpty()) {
                    perfiles.add(perfilResponse);
                }

            }
        }

        return ResponseEntity.ok(perfiles);
    }

    @GetMapping("/pagos/historial")
    @PreAuthorize("hasRole('FINANZAS')")
    public ResponseEntity<List<PagosFinanzas>> obtenerHistorialDePagos() {
        List<Pagos> todosLosPagos = pagosRepository.findAll();
        List<PagosFinanzas> historialPagos = new ArrayList<>();

        for (Pagos pago : todosLosPagos) {
            Alumno alumno = pago.getAlumno();
            PagosFinanzas pagoFinanzas = new PagosFinanzas();
            pagoFinanzas.setId(pago.getId_pago());
            pagoFinanzas.setMatricula(alumno.getMatricula());
            pagoFinanzas.setNombre(alumno.getNombre());
            pagoFinanzas.setAp_paterno(alumno.getAp_paterno());
            pagoFinanzas.setAp_materno(alumno.getAp_materno());
            pagoFinanzas.setFolio(pago.getFolio());

            Cuotas cuota = pago.getId_cuota();
            pagoFinanzas.setCuota(cuota != null ? cuota.getCuota() : null);
            pagoFinanzas.setCosto(cuota != null ? cuota.getCosto() : null);

            Optional<InformacionAcademica> infoAcademicaOpt = informacionAcademicaRepository.findByAlumno(alumno);
            if (infoAcademicaOpt.isPresent()) {
                Carreras programaEducativo = infoAcademicaOpt.get().getProgramaEducativo();
                pagoFinanzas.setPrograma_educativo(programaEducativo.getCarrera());

            } else {
                AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository.findByAlumno(alumno)
                        .orElse(null);
                if (antecedentesAcademicos != null && antecedentesAcademicos.getId_carrera_1() != null) {
                    Carreras carrera = antecedentesAcademicos.getId_carrera_1();
                    pagoFinanzas.setPrograma_educativo(carrera.getCarrera());
                }
            }

            pagoFinanzas.setReferencia(pago.getReferencia());
            pagoFinanzas.setVerificarPago(pago.getVerificar_pago());

            historialPagos.add(pagoFinanzas);
        }

        return ResponseEntity.ok(historialPagos);
    }

}
