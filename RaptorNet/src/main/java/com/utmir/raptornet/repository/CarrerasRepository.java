package com.utmir.raptornet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.Carreras;

public interface CarrerasRepository extends JpaRepository<Carreras, Long> {

    List<Carreras> findByStatusCarrera(String statusCarrera);

}
