package com.holler.evently.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.holler.evently.models.Comment;
import com.holler.evently.models.Event;
import com.holler.evently.models.User;
import com.holler.evently.repositories.CommentRepository;

@Service
public class CommentService {
	private final CommentRepository commentRepository;
    
    public CommentService(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }
    
    public Comment createComment(String content, Event e, User u) {
    	Comment c = new Comment();
    	
    	c.setContent(content);
    	c.setEvent(e);
    	c.setUser(u);
    	
    	return commentRepository.save(c);
    }
    
    public void deleteComment(Long id) {
    	commentRepository.deleteById(id);
    }
    
    public Comment findCommentById(Long id) {
    	Optional<Comment> u = commentRepository.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    
    public List<Comment> allComments(){
    	List<Comment> comments = (List<Comment>) commentRepository.findAll();
		return comments;
    	
    }

	
}
