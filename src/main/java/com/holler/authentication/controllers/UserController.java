package com.holler.authentication.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.holler.authentication.models.User;
import com.holler.authentication.services.UserService;
import com.holler.authentication.validators.UserValidator;

//imports removed for brevity
@Controller
public class UserController {
	private final UserService userService;
	
	private final UserValidator userValidator;
 
	public UserController(UserService userService, UserValidator userValidator) {
		this.userService = userService;
		this.userValidator = userValidator;
	}
 
	@RequestMapping("/registration")
	public String registerForm(@ModelAttribute("user") User user) {
		return "registrationPage.jsp";
	}
	@RequestMapping(value="/registration", method=RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		userValidator.validate(user, result);
		if (result.hasErrors()) {
			return "registrationPage.jsp";
		} else {
			User u = userService.registerUser(user);
			session.setAttribute("userId", u.getId());
			return "redirect:/home";
	}
	}
	
	@RequestMapping("/login")
	public String login() {
	     return "loginPage.jsp";
	}
		 
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session, RedirectAttributes redirect) {
//	if the user is authenticated, save their user id in session
//	else, add error messages and return the login page
		if (userService.authenticateUser(email, password)) {
			User u = userService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			return "redirect:/home";		
			} else {
				redirect.addFlashAttribute("error", "Invalid login credentials");
				return "redirect:/login";
			}
		}
	 
	@RequestMapping("/home")
	public String home(HttpSession session, Model model) {
//	get user from session, save them in the model and return the home page
		Long id = (Long) session.getAttribute("userId");
		User user = userService.findUserById(id);
		model.addAttribute(user); 
		return "homePage.jsp";
	}
	 	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
 		return "redirect:/login";
	 	}
}
