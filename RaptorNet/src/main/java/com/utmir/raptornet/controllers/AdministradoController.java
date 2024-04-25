package com.utmir.raptornet.controllers;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.utmir.raptornet.dto.Administrador.ListaRegistros;
import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.repository.AlumnoRepository;

import org.springframework.web.bind.annotation.GetMapping;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/admin")
public class AdministradoController {

    @Autowired
    private AlumnoRepository alumnoRepository;

    @GetMapping("/registros")
    public ResponseEntity<List<ListaRegistros>> registrosRaptorNet() {
        List<Alumno> registros = alumnoRepository.findAll();

        List<ListaRegistros> perfiles = registros.stream().map(alumno -> {
            ListaRegistros perfilResponse = new ListaRegistros();
            perfilResponse.setMatricula(alumno.getMatricula());
            perfilResponse.setNombre(alumno.getNombre());
            perfilResponse.setAp_paterno(alumno.getAp_paterno());
            perfilResponse.setAp_materno(alumno.getAp_materno());
            perfilResponse.setFechaRegistro(alumno.getFecha_registro());

            // Mapear los roles a una lista de nombres de roles
            List<String> roles = alumno.getRoles().stream()
                    .map(role -> role.getName().name()) // devuelve un enum ERole
                    .collect(Collectors.toList());
            perfilResponse.setRoles(roles);

            return perfilResponse;
        }).collect(Collectors.toList());

        return ResponseEntity.ok(perfiles);
    }

}
