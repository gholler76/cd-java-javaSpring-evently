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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
	@Table(name="events")
	public class Event {
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Long id;
		@NotNull
	    @Size(min = 3, message="Name must be at least 3 characters")
	    private String name;
	    @NotNull (message="You must select a date")
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    @Future(message="You can only set an event to a future date")
	    private Date date;
	    @NotNull
	    @Size(min = 2, message="City must be at least 3 characters")
	    private String city;
	    @NotNull
	    @Size(min=2,message="Must select a state")
	    private String state;
	    @Column(updatable=false)
	    private Date createdAt;
	    private Date updatedAt;
	    
	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name="host_id")
	    private User host;
	    
	    @ManyToMany
	    @JoinTable(
	    	name = "events_users",
	    	joinColumns = @JoinColumn(name = "event_id"),
	    	inverseJoinColumns = @JoinColumn(name= "user_id")
	    )
	    private List<User> guests;
	    
	    @OneToMany(mappedBy="event", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
		private List<Comment> comments;   
	    
	    public Event() {
	    }

	    public Event(String name, Date date, String city, String state, User host) {
	    	this.name = name;
	    	this.date= date;
	    	this.city = city;
	    	this.state= state;
	    	this.host = host;
	    }

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public Date getDate() {
			return date;
		}

		public void setDate(Date date) {
			this.date = date;
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

		public User getHost() {
			return host;
		}

		public void setHost(User host) {
			this.host = host;
		}

		public List<User> getGuests() {
			return guests;
		}

		public void setGuests(List<User> guests) {
			this.guests = guests;
		}


		public List<Comment> getComments() {
			return comments;
		}

		public void setComments(List<Comment> comments) {
			this.comments= comments;
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