package com.utmir.raptornet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.TipoSangre;

public interface TipoSangreRepository extends JpaRepository <TipoSangre, Long> {
    
}
