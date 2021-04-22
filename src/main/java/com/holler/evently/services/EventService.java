package com.holler.evently.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.holler.evently.models.Event;
import com.holler.evently.repositories.EventRepository;

@Service
public class EventService {
    private final EventRepository eventRepository;
    
    public EventService(EventRepository eventRepository) {
        this.eventRepository = eventRepository;
    }
    
    public Event findEventById(Long id) {
    	Optional<Event> u = eventRepository.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    public Event createEvent(Event event) {
        return eventRepository.save(event);
    }
    
    public void deleteEvent(Long id) {
    	eventRepository.deleteById(id);
    }
    
    public List<Event> allEvents() {
        return eventRepository.findAll();
    }
    
    public Event updateEvent(Event event) {
        return eventRepository.save(event);
    }
    
}


