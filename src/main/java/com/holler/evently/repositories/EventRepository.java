package com.holler.evently.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.holler.evently.models.Event;

@Repository
public interface EventRepository extends CrudRepository<Event, Long> {
	
    List<Event> findAll();
    
    Optional<Event> findById(Long id);
  
    void deleteById(Long id);
    
    }