package com.utmir.raptornet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.Status;

public interface StatusRepository extends JpaRepository <Status, Long>{ 
    
}
