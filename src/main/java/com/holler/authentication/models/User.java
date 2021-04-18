package com.holler.authentication.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

//imports removed for brevity
@Entity
@Table(name="users")
public class User {
	 @Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	 private Long id;
	 @NotNull(message="email must be valid")
	 @Email(message="email must be valid")
	 private String email;
	 @NotNull(message="Password must be greater than 5 characters")
	 @Size(min=5, message="Password must be greater than 5 characters")
	 private String password;
	 @Transient
	 private String passwordConfirmation;
	 @Column(updatable=false)
	 private Date createdAt;
	 private Date updatedAt;
	 
	 public User() {
	 }
	 
	 	public Long getId() {
	 		return id;
	}
	
	
	public void setId(Long id) {
		this.id = id;
	}
	
	
	public String getEmail() {
		return email;
	}
	
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getPassword() {
		return password;
	}
	
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}
	
	
	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}
	
	
	@PrePersist
	 protected void onCreate(){
	     this.createdAt = new Date();
	 }
	 @PreUpdate
	 protected void onUpdate(){
	     this.updatedAt = new Date();
	 }
}

