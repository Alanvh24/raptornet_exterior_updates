package com.utmir.raptornet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.utmir.raptornet.models.PeriodoCuatrimestral;

@Repository
public interface PeriodoCuatrimestralRepository extends JpaRepository<PeriodoCuatrimestral, Long> {

    List<PeriodoCuatrimestral> findByStatus(Boolean status);

}
