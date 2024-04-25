package com.utmir.raptornet.security.services;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.Log;
import com.utmir.raptornet.repository.AlumnoRepository;
import com.utmir.raptornet.repository.LogRepository;

@Service
public class LogService {

    @Autowired
    private LogRepository logRepository;

    @Autowired
    private AlumnoRepository alumnoRepository;

    public void registrarEvento(String matricula, String evento) {
        Alumno alumno = alumnoRepository.findById(matricula)
                .orElseThrow(() -> new RuntimeException("Error: Alumno no encontrado."));
        Log log = new Log();
        log.setAlumno(alumno);
        log.setEvento(evento);
        log.setFecha_hora(LocalDateTime.now());
        logRepository.save(log);
    }

}
