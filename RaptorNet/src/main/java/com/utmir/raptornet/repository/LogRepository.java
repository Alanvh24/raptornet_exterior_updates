package com.utmir.raptornet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.utmir.raptornet.models.Log;

public interface LogRepository extends JpaRepository<Log, Long> {
}
