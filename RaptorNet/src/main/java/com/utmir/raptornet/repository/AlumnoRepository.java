package com.utmir.raptornet.repository;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.ERole;
import com.utmir.raptornet.models.Role;

import jakarta.transaction.Transactional;

@Repository
public interface AlumnoRepository extends JpaRepository<Alumno, String> {
    Optional<Alumno> findByMatricula(String matricula);

    Optional<Alumno> findByMatriculaEndingWith(String matricula);

    Boolean existsByMatricula(String matricula);

    Optional<Alumno> findByCurp(String curp);

    Boolean existsByCurp(String curp);

    Optional<Alumno> findByEmail(String email);

    Boolean existsByEmail(String email);

    @Query(value = "SELECT a FROM Alumno a ORDER BY a.matricula DESC")
    Page<Alumno> findTopByOrderByMatriculaDesc(Pageable pageable);

    default Optional<Alumno> findTopByMatricula() {
        Page<Alumno> alumnoPage = findTopByOrderByMatriculaDesc(PageRequest.of(0, 1));
        if (!alumnoPage.getContent().isEmpty()) {
            return Optional.of(alumnoPage.getContent().get(0));
        }
        return Optional.empty();
    }

    @Query("SELECT a FROM Alumno a INNER JOIN a.roles r WHERE r.name = :roleName")
    List<Alumno> findByRole(@Param("roleName") ERole roleName);

    @Transactional
    @Modifying
    @Query("UPDATE Alumno a SET a.roles = :roles WHERE a.matricula = :matricula")
    void actualizarRol(String matricula, Set<Role> roles);

}
