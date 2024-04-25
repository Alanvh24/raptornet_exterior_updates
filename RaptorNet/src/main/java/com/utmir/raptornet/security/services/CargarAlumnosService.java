package com.utmir.raptornet.security.services;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashSet;
import java.util.Set;

import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.Carreras;
import com.utmir.raptornet.models.Cuatrimestre;
import com.utmir.raptornet.models.ERole;
import com.utmir.raptornet.models.EstadosMexico;
import com.utmir.raptornet.models.Genero;
import com.utmir.raptornet.models.Grupo;
import com.utmir.raptornet.models.InformacionAcademica;
import com.utmir.raptornet.models.Nacionalidad;
import com.utmir.raptornet.models.Role;
import com.utmir.raptornet.models.Status;
import com.utmir.raptornet.repository.AlumnoRepository;
import com.utmir.raptornet.repository.CarrerasRepository;
import com.utmir.raptornet.repository.CuatrimestreRepository;
import com.utmir.raptornet.repository.EstadosMexicoRepository;
import com.utmir.raptornet.repository.GeneroRepository;
import com.utmir.raptornet.repository.GrupoRepository;
import com.utmir.raptornet.repository.InformacionAcademicaRepository;
import com.utmir.raptornet.repository.NacionalidadRepository;
import com.utmir.raptornet.repository.RoleRepository;
import com.utmir.raptornet.repository.StatusRepository;

@Service
public class CargarAlumnosService {

        @Autowired
        private AlumnoRepository alumnoRepository;
        @Autowired
        private CarrerasRepository carrerasRepository;
        @Autowired
        private CuatrimestreRepository cuatrimestreRepository;
        @Autowired
        private GrupoRepository grupoRepository;
        @Autowired
        private StatusRepository statusRepository;
        @Autowired
        private GeneroRepository generoRepository;
        @Autowired
        private NacionalidadRepository nacionalidadRepository;
        @Autowired
        private EstadosMexicoRepository estadosMexicoRepository;
        @Autowired
        private InformacionAcademicaRepository informacionAcademicaRepository;

        @Autowired
        private PasswordEncoder encoder;
        @Autowired
        private RoleRepository roleRepository;

        public void cargarDatosDesdeExcel(MultipartFile file) throws IOException {
                Workbook workbook = new XSSFWorkbook(file.getInputStream());
                Sheet sheet = workbook.getSheetAt(0);
                DataFormatter dataFormatter = new DataFormatter();
                for (Row row : sheet) {
                        if (row.getRowNum() == 0)
                                continue;
                        String matriculaCellValue = dataFormatter.formatCellValue(row.getCell(1));
                        if (matriculaCellValue.isEmpty() || alumnoRepository.existsById(matriculaCellValue)) {
                                continue; // Si la matrícula está vacía o ya existe, ignora esta fila
                        }
                        String nombre = dataFormatter.formatCellValue(row.getCell(2));
                        String apPaterno = dataFormatter.formatCellValue(row.getCell(3));
                        String apMaterno = dataFormatter.formatCellValue(row.getCell(4));
                        String curp = dataFormatter.formatCellValue(row.getCell(5)).trim();
                        if (curp.isEmpty()) {
                                curp = null; // Convertir cadenas vacías en null
                        }

                        String fechaNacimientoStr = dataFormatter.formatCellValue(row.getCell(6));

                        String estadoNacimientoStr = dataFormatter.formatCellValue(row.getCell(7));
                        Long estadoNacimiento = estadoNacimientoStr.isEmpty() ? null
                                        : Long.valueOf(estadoNacimientoStr);

                        String localidadNacimiento = dataFormatter.formatCellValue(row.getCell(8));
                        String municipioNacimiento = dataFormatter.formatCellValue(row.getCell(9));

                        String generoStr = dataFormatter.formatCellValue(row.getCell(10));
                        String nacionalidadStr = dataFormatter.formatCellValue(row.getCell(11));

                        Long carreraId = Long.valueOf(dataFormatter.formatCellValue(row.getCell(12)));
                        Long cuatrimestreId = Long.valueOf(dataFormatter.formatCellValue(row.getCell(13)));
                        Long grupoId = Long.valueOf(dataFormatter.formatCellValue(row.getCell(14)));
                        Long statusId = Long.valueOf(dataFormatter.formatCellValue(row.getCell(15)));
                        String passwordCellValue = dataFormatter.formatCellValue(row.getCell(16));

                        // Cargar y verificar existencia de entidades relacionadas
                        Carreras carrera = carrerasRepository.findById(carreraId).orElseThrow(
                                        () -> new RuntimeException("Carrera no encontrada con ID: " + carreraId));
                        Cuatrimestre cuatrimestre = cuatrimestreRepository.findById(cuatrimestreId)
                                        .orElseThrow(() -> new RuntimeException(
                                                        "Cuatrimestre no encontrado con ID: " + cuatrimestreId));
                        Grupo grupo = grupoRepository.findById(grupoId).orElseThrow(
                                        () -> new RuntimeException("Grupo no encontrado con ID: " + grupoId));
                        Status status = statusRepository.findById(statusId).orElseThrow(
                                        () -> new RuntimeException("Status no encontrado con ID: " + statusId));

                        Genero genero = generoStr.isEmpty() ? null
                                        : generoRepository.findById(Long.valueOf(generoStr))
                                                        .orElseThrow(() -> new RuntimeException(
                                                                        "Genero no encontrado con ID: " + generoStr));
                        Nacionalidad nacionalidad = nacionalidadStr.isEmpty() ? null
                                        : nacionalidadRepository.findById(Long.valueOf(nacionalidadStr)).orElseThrow(
                                                        () -> new RuntimeException("Nacionalidad no encontrada con ID: "
                                                                        + nacionalidadStr));
                        EstadosMexico estado = estadoNacimiento == null ? null
                                        : estadosMexicoRepository.findById(estadoNacimiento).orElseThrow(
                                                        () -> new RuntimeException("Estado no encontrado con ID: "
                                                                        + estadoNacimiento));

                        Alumno alumno = new Alumno();
                        alumno.setMatricula(matriculaCellValue);
                        alumno.setNombre(nombre);
                        alumno.setAp_paterno(apPaterno);
                        alumno.setAp_materno(apMaterno);
                        alumno.setCurp(curp);
                        alumno.setFecha_nacimiento(fechaNacimientoStr);
                        alumno.setMunicipio_nacimiento(municipioNacimiento);
                        alumno.setId_genero(genero);
                        alumno.setId_nacionalidad(nacionalidad);
                        alumno.setId_estado_mexico(estado);
                        alumno.setLocalidad_nacimiento(localidadNacimiento);
                        alumno.setId_status(status);
                        alumno.setFecha_registro(LocalDate.now());
                        String encryptedPassword = encoder.encode(passwordCellValue);
                        alumno.setPassword(encryptedPassword);
                        Set<Role> roles = new HashSet<>();
                        Role alumnoRole = roleRepository.findByName(ERole.ROLE_ALUMNO)
                                        .orElseThrow(() -> new RuntimeException("Error: Role no encontrado."));
                        roles.add(alumnoRole);
                        alumno.setRoles(roles);

                        alumnoRepository.save(alumno);

                        InformacionAcademica informacionAcademica = new InformacionAcademica();
                        informacionAcademica.setAlumno(alumno);
                        informacionAcademica.setProgramaEducativo(carrera);
                        informacionAcademica.setCuatrimestre(cuatrimestre);
                        informacionAcademica.setGrupo(grupo);
                        informacionAcademica.setStatus(status);

                        informacionAcademicaRepository.save(informacionAcademica);
                }

                workbook.close();
        }


        // Carga de datos de años anteriores
        public void cargarDatos2023(MultipartFile file) throws IOException {
                Workbook workbook = new XSSFWorkbook(file.getInputStream());
                Sheet sheet = workbook.getSheetAt(0);
                DataFormatter dataFormatter = new DataFormatter();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                for (Row row : sheet) {
                        if (row.getRowNum() == 0)
                                continue;
                        String matriculaCellValue = dataFormatter.formatCellValue(row.getCell(1));
                        if (matriculaCellValue.isEmpty() || alumnoRepository.existsById(matriculaCellValue)) {
                                continue;
                        }
                        String curp = dataFormatter.formatCellValue(row.getCell(2)).trim();
                        if (curp.isEmpty()) {
                                curp = null; // Convertir cadenas vacías en null
                        }

                        String passwordCellValue = dataFormatter.formatCellValue(row.getCell(3));
                        String fechaRegistroStr = dataFormatter.formatCellValue(row.getCell(4));
                        LocalDate fechaDeRegistro = null;
                        if (!fechaRegistroStr.isEmpty()) {
                                // Parsea la fecha de registro del Excel a un objeto LocalDate
                                fechaDeRegistro = LocalDate.parse(fechaRegistroStr, formatter);
                        }
                        Alumno alumno = new Alumno();
                        alumno.setMatricula(matriculaCellValue);
                        alumno.setCurp(curp);

                        alumno.setFecha_registro(fechaDeRegistro);

                        String encryptedPassword = encoder.encode(passwordCellValue);
                        alumno.setPassword(encryptedPassword);
                        Set<Role> roles = new HashSet<>();
                        Role alumnoRole = roleRepository.findByName(ERole.ROLE_ASPIRANTE)
                                        .orElseThrow(() -> new RuntimeException("Error: Role no encontrado."));
                        roles.add(alumnoRole);
                        alumno.setRoles(roles);

                        alumnoRepository.save(alumno);

                }

                workbook.close();
        }

}
