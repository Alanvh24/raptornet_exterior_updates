package com.utmir.raptornet.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.Grupo;

public interface GrupoRepository extends JpaRepository<Grupo, Long> {

    Optional<Grupo> findByGrupo(String grupo);
}
