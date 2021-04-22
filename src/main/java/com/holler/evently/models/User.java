package com.holler.evently.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

//imports removed for brevity
@Entity
@Table(name="users")
public class User {
	 @Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	 private Long id;
	 @Size(min=2, message="First name must be at least 2 characters")
	 private String firstname;
	 @Size(min=2, message="First name must be at least 2 characters")
	 private String lastname;
	 @Size(min=1, message="Email field cannot be empty")
	 @Email(message="Email must be valid")
	 private String email;
	 @Size(min=2, message="City must contain at least 2 characters")
	 private String city;
	 @Size(min=2, message="Must select a state")
	 private String state;
	 @Size(min=5, message="Password must be greater than 5 characters")
	 private String password;
	 @Transient
	 private String passwordConfirmation;
	 @Column(updatable=false)
	 private Date createdAt;
	 private Date updatedAt;
	 
	 @OneToMany(mappedBy="host", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
		private List<Event> hostedevents;
	 
	@ManyToMany
	@JoinTable(
		name = "events_users",
	    joinColumns = @JoinColumn(name = "user_id"),
	    inverseJoinColumns = @JoinColumn(name= "event_id")
	    )
	private List<Event> attendingevents;
	 
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
	private List<Comment> comments; 

	public User() {
	}

	public User(String firstname, String lastname, String email, String city, String state, String password) {
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.city = city;
		this.state= state;
		this.password= password;
		
	}

	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getFirstname() {
		return firstname;
	}



	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}



	public String getLastname() {
		return lastname;
	}



	public void setLastname(String lastname) {
		this.lastname = lastname;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getCity() {
		return city;
	}



	public void setCity(String city) {
		this.city = city;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
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



	public List<Event> getHostedevents() {
		return hostedevents;
	}



	public void setHostedevents(List<Event> hostedevents) {
		this.hostedevents = hostedevents;
	}



	public List<Event> getAttendingevents() {
		return attendingevents;
	}



	public void setAttendingevents(List<Event> attendingevents) {
		this.attendingevents = attendingevents;
	}






	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
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

