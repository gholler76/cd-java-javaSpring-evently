package com.holler.evently.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.holler.evently.models.Comment;

@Repository
public interface CommentRepository extends CrudRepository<Comment, Long> {

}


	

