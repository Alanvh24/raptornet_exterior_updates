package com.utmir.raptornet.security.services;

import com.utmir.raptornet.repository.AlumnoRepository;
import com.utmir.raptornet.models.Alumno;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Service
public class MatriculaService {

    @Autowired
    private AlumnoRepository alumnoRepository;

    public String generateNextMatricula() {
        Pageable pageable = PageRequest.of(0, 1);
        Page<Alumno> lastAlumnoPage;
        String lastMatricula = "";
        boolean isValidMatricula = false;

        // Expresión regular para validar el formato de la matrícula
        String matriculaRegex = "\\d{2}\\d{2}\\d{3}";

        do {
            lastAlumnoPage = alumnoRepository.findTopByOrderByMatriculaDesc(pageable);
            if (!lastAlumnoPage.hasContent()) {
                lastMatricula = String.format("%02d%02d%03d", LocalDate.now().getYear() % 100, 03, 0);
                break;
            }

            lastMatricula = lastAlumnoPage.getContent().get(0).getMatricula();
            isValidMatricula = lastMatricula.matches(matriculaRegex);

            // Incrementar la página si la matrícula no es válida
            if (!isValidMatricula) {
                pageable = pageable.next();
            }
        } while (!isValidMatricula);

        return generateMatricula(lastMatricula);
    }

    private String generateMatricula(String lastMatricula) {
        int year = LocalDate.now().getYear() % 100;
        int stage = 03;
        int nextNumber = 1;

        if (!lastMatricula.isEmpty() && lastMatricula.matches("\\d{2}\\d{2}\\d{3}")) {
            try {
                int lastYear = Integer.parseInt(lastMatricula.substring(0, 2));
                int lastStage = Integer.parseInt(lastMatricula.substring(2, 4));
                int lastNumber = Integer.parseInt(lastMatricula.substring(4));

                if (year == lastYear && stage == lastStage) {
                    nextNumber = lastNumber + 1;
                    if (nextNumber > 999) {
                        throw new IllegalStateException("Límite de matrículas alcanzado para el año y etapa actual.");
                    }
                }
            } catch (NumberFormatException e) {
                throw new IllegalStateException("Formato de matrícula inválido: " + lastMatricula);
            }
        }

        return String.format("%02d%02d%03d", year, stage, nextNumber);
    }
}
