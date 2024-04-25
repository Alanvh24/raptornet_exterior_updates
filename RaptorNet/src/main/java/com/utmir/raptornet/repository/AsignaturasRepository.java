package com.utmir.raptornet.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.utmir.raptornet.models.Asignaturas;
import com.utmir.raptornet.models.Carreras;
import com.utmir.raptornet.models.Cuatrimestre;

public interface AsignaturasRepository extends JpaRepository<Asignaturas, Long> {

    @Query("SELECT a FROM Asignaturas a WHERE a.carreras.id_carrera = :id_carrera AND a.cuatrimestre.id = :id_cuatrimestre")
    List<Asignaturas> findByCarrerasIdAndCuatrimestreId(@Param("id_carrera") Long id_carrera,
            @Param("id_cuatrimestre") Long id_cuatrimestre);

    List<Asignaturas> findByCarrerasAndCuatrimestre(Carreras carrera, Cuatrimestre cuatrimestre);

}
