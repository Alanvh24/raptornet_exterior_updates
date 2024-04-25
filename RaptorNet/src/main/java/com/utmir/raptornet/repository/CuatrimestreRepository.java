package com.utmir.raptornet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.utmir.raptornet.models.Cuatrimestre;
import java.util.Optional;

public interface CuatrimestreRepository extends JpaRepository<Cuatrimestre, Long> {
    @Query("SELECT MAX(c.id) FROM Cuatrimestre c")
    Long findMaxId();

    Optional<Cuatrimestre> findById(Long id);

}
