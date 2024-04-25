// package com.utmir.raptornet.security.services;

// import com.utmir.raptornet.repository.AlumnoRepository;
// import com.utmir.raptornet.models.Alumno;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.data.domain.Page;
// import org.springframework.data.domain.PageRequest;
// import org.springframework.data.domain.Pageable;
// import org.springframework.stereotype.Service;

// import java.time.LocalDate;

// @Service
// public class MatriculaService {

//     @Autowired
//     private AlumnoRepository alumnoRepository;

//     public String generateNextMatricula() {

//         Pageable pageable = PageRequest.of(0, 1);
//         Page<Alumno> lastAlumnoPage = alumnoRepository.findTopByOrderByMatriculaDesc(pageable);
//         String lastMatricula = lastAlumnoPage.getContent().isEmpty() ? ""
//                 : lastAlumnoPage.getContent().get(0).getMatricula();

//         return generateMatricula(lastMatricula);
//     }

//     // private String generateMatricula(String lastMatricula) {

//     // int year = LocalDate.now().getYear() % 100;

//     // int stage = 03;

//     // int nextNumber = 1;

//     // if (!lastMatricula.isEmpty()) {
//     // int lastYear = Integer.parseInt(lastMatricula.substring(0, 2));
//     // int lastStage = Integer.parseInt(lastMatricula.substring(2, 4));
//     // int lastNumber = Integer.parseInt(lastMatricula.substring(4));

//     // if (year == lastYear && stage == lastStage) {
//     // nextNumber = lastNumber + 1;
//     // if (nextNumber > 999) {
//     // throw new IllegalStateException("No puede haber mas aspirantes!");
//     // }
//     // }
//     // }
//     // return String.format("%02d%02d%03d", year, stage, nextNumber);
//     // }
//     private String generateMatricula(String lastMatricula) {
//         int year = LocalDate.now().getYear() % 100;
//         int stage = 03;
//         int nextNumber = 1;

//         // Expresión regular para validar el formato de la matrícula
//         String matriculaRegex = "\\d{2}\\d{2}\\d{3}";

//         if (!lastMatricula.isEmpty() && lastMatricula.matches(matriculaRegex)) {
//             try {
//                 int lastYear = Integer.parseInt(lastMatricula.substring(0, 2));
//                 int lastStage = Integer.parseInt(lastMatricula.substring(2, 4));
//                 int lastNumber = Integer.parseInt(lastMatricula.substring(4));

//                 if (year == lastYear && stage == lastStage) {
//                     nextNumber = lastNumber + 1;
//                     if (nextNumber > 999) {
//                         throw new IllegalStateException("Límite de matrículas alcanzado para el año y etapa actual.");
//                     }
//                 }
//             } catch (NumberFormatException e) {
//                 throw new IllegalStateException("Formato de matrícula inválido: " + lastMatricula);
//             }
//         } else if (!lastMatricula.isEmpty()) {
//             // Ignorar o rechazar matrículas que no cumplen con el formato
//             throw new IllegalStateException("Formato de matrícula inválido: " + lastMatricula);
//         }

//         return String.format("%02d%02d%03d", year, stage, nextNumber);
//     }

// }
