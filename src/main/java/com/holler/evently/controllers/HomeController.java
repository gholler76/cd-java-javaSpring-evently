package com.holler.evently.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.holler.evently.models.Event;
import com.holler.evently.models.User;
import com.holler.evently.services.CommentService;
import com.holler.evently.services.EventService;
import com.holler.evently.services.UserService;
import com.holler.evently.validators.UserValidator;

@Controller
public class HomeController {
	
	private final UserService userService;
	private final UserValidator userValidator;
	private final EventService eventService;
	private final CommentService commentService;
 
	public HomeController(UserService userService, UserValidator userValidator, EventService eventService, CommentService commentService ) {
		this.userService = userService;
		this.userValidator = userValidator;
		this.eventService = eventService;
		this.commentService = commentService;
	}
 
//	++++++++++++++++++++++++++++++++++++++
//	LOGIN/LOGOUT
//	++++++++++++++++++++++++++++++++++++++
	@RequestMapping("/")
	public String login() {
		return "index.jsp";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginUser(@Valid @RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session, RedirectAttributes redirect) {
		if (userService.authenticateUser(email, password)) {
			User u = userService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			return "redirect:/dashboard";		
		} else {
			redirect.addFlashAttribute("error", "<p class=\"messages error pl-3 pt-2\">Invalid login credentials</p>");
			return "redirect:/";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

//	++++++++++++++++++++++++++++++++++++++
//	REGISTRATION
//	++++++++++++++++++++++++++++++++++++++
	@RequestMapping("/register")
	public String registerForm(@ModelAttribute("user") User user) {
		return "register.jsp";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		userValidator.validate(user, result);
		if (result.hasErrors()) {
			return "register.jsp";
		} else {
			User u = userService.registerUser(user);
			session.setAttribute("userId", u.getId());
			return "redirect:/dashboard";
	}
	}

//	++++++++++++++++++++++++++++++++++++++
//	ACCESS DASHBOARD
//	++++++++++++++++++++++++++++++++++++++
	@RequestMapping("/dashboard")
		public String dashboard(HttpSession session, Model model) {
			if (session.getAttribute("userId") == null){
				return "redirect/";
			}
					
			Long userId = (Long) session.getAttribute("userId");
			
			model.addAttribute("user", userService.findUserById(userId));
			model.addAttribute("event", new Event());
			model.addAttribute("events", eventService.allEvents());
			
			return "dashboard.jsp";
	}
	 	
//	++++++++++++++++++++++++++++++++++++++
//	EVENT MANAGEMENT
//	++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String createEvent(@Valid @ModelAttribute("event") Event event, @ModelAttribute("user") User user,BindingResult result) {
		if (result.hasErrors()) {
			return "dashboard.jsp";
		} else {
			Event e = eventService.createEvent(event);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping("/event/join/{id}")
	public String joinEvent(@PathVariable("id")Long id, HttpSession session) {
		Event e = eventService.findEventById(id);
		List<User> guests = e.getGuests();
		
		Long guestId = (Long) session.getAttribute("userId");
		User guest = userService.findUserById(guestId);

		guests.add(guest);
		e.setGuests(guests);

		eventService.updateEvent(e);
		return "redirect:/event/{id}";
	}
	
	@RequestMapping("/event/cancel/{id}")
	public String leaveEvent(@PathVariable("id")Long id, HttpSession session) {
		Event e = eventService.findEventById(id);
		List<User> guests = e.getGuests();

		Long guestId = (Long) session.getAttribute("userId");
		User cancel = userService.findUserById(guestId);
		
		guests.remove(cancel);
		e.setGuests(guests);
		
		eventService.updateEvent(e);
		return "redirect:/dashboard";
	}
	

	@RequestMapping("/event/{id}")
	public String viewEvent(
			@PathVariable("id") Long id,
			Model model,
			HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		
		model.addAttribute("event", eventService.findEventById(id));
		model.addAttribute("user", userService.findUserById(userId));
		model.addAttribute("comments", commentService.allComments());
		
		return "event.jsp";
	}
	
	@RequestMapping("/edit/{id}")
	public String editPage(
			@PathVariable("id") Long id,
			Model model,
			HttpSession session,
			RedirectAttributes redirect){ 
//		Event e = eventService.findEventById(id);  
//		User host = e.getHost();
//				
//		if (host.getId() == userId) {
			Long userId = (Long) session.getAttribute("userId");
			model.addAttribute("event", eventService.findEventById(id));
			model.addAttribute("user", userService.findUserById(userId));
			return "edit.jsp";
			
//		} else {
//			redirect.addFlashAttribute("You can only edit events you've created, slick.)");
//			return "redirect:/event/{id}";}
				
	}
	
		
	@RequestMapping(value="/edit/{id}", method=RequestMethod.PUT)
	public String editEvent(
			@Valid
			@ModelAttribute("event") Event event,
			BindingResult result,
			Model model,
			HttpSession session,
			@PathVariable("id") Long id) {
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute(u);
		if (result.hasErrors()) {
			return "edit.jsp";
		} else {
			eventService.updateEvent(event);
			return "redirect:/event/{id}";
		}
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.DELETE)
	public String deleteEvent(
			@RequestParam("id") Long id){
		eventService.deleteEvent(id);
		
		return "redirect:/dashboard";
		}
	
//	++++++++++++++++++++++++++++++++++++++
//	COMMENT MANAGEMENT
//	++++++++++++++++++++++++++++++++++++++

	@RequestMapping(
			value="/event/post/{id}", method=RequestMethod.POST)
	public String postComment(
			@Valid
			@PathVariable("id") Long id,
			@RequestParam("content") String content,
			@RequestParam("event_id") Long event_id,
			@RequestParam("user_id") Long user_id,
			Model model){
		boolean check = content != null;
		if (!check) {
			{model.addAttribute("error", "Your comment cannot be empty");
			return "event.jsp";
		}
		
		} else {
		Event e = eventService.findEventById(event_id);
		User u = userService.findUserById(user_id);
		commentService.createComment(content, e, u);
		
		return "redirect:/event/{id}";
	}
	}
	
	
}

	
	
	