package com.utmir.raptornet.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.Cuotas;

public interface CuotasRepository extends JpaRepository <Cuotas, Long> {
    
}
