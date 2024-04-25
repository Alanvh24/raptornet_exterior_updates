package com.utmir.raptornet.security.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.repository.AlumnoRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
  @Autowired
  AlumnoRepository userRepository;

  @Override
  @Transactional
  public UserDetails loadUserByUsername(String matricula) throws UsernameNotFoundException {
    Alumno user = userRepository.findByMatricula(matricula)
        .orElseThrow(() -> new UsernameNotFoundException("User Not Found with username: " + matricula));

    return UserDetailsImpl.build(user);
  }

}
