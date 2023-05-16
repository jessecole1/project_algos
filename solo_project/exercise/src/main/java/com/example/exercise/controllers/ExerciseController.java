package com.example.exercise.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.example.exercise.models.Admin;
import com.example.exercise.models.Exercise;
import com.example.exercise.models.User;
import com.example.exercise.services.AdminService;
import com.example.exercise.services.CategoryService;
import com.example.exercise.services.ExerciseService;
import com.example.exercise.services.UserService;

@Controller
public class ExerciseController {
	
	@Autowired
	private ExerciseService exerServ;
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private AdminService adminServ;
	
	@Autowired
	private CategoryService catServ;
	
	@GetMapping("/exercise/new")
	public String newExercise(@ModelAttribute("newExercise") Exercise newExercise, BindingResult result, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		User theUser = userServ.getById(userId);
		if (theUser == null) {
			Admin theAdmin = adminServ.getById(userId);
			model.addAttribute("user", theAdmin);
		} else {
			model.addAttribute("user", theUser);
		}
		model.addAttribute("category", catServ.findAll());
		return "newExercise.jsp";
	}
	
	@PostMapping("/exercise/add")
	public String addExercise(Model model, @Valid @ModelAttribute("newExercise") Exercise newExercise, BindingResult result, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		User theUser = userServ.getById(userId);
		if (theUser == null) {
			Admin theAdmin = adminServ.getById(userId);
			model.addAttribute("user", theAdmin);
		} else {
			model.addAttribute("user", theUser);
		}
		if(result.hasErrors()) {
			model.addAttribute("category", catServ.findAll());
			return "newExercise.jsp";
		}
		exerServ.addExercise(newExercise);
		return "redirect:/";
	}
	
	@GetMapping("/exercise/all/{catId}")
	public String getExercises(@PathVariable("catId") Long catId, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		System.out.println(userId);
		if (userId != null) {
			model.addAttribute("category", catServ.getOne(catId));
			User theUser = userServ.getById(userId);
			model.addAttribute("logUser", theUser);
			return "categoriesExercises.jsp";
		} else if ((Long) session.getAttribute("adminId") != null) {
			Long adminId = (Long) session.getAttribute("adminId");
			Admin admin = adminServ.getById(adminId);
			if (adminId != null) {
				model.addAttribute("category", catServ.getOne(catId));
				model.addAttribute("admin", admin);
				return "categoriesExercises.jsp";
			}
		} 
		model.addAttribute("category", catServ.getOne(catId));
		return "categoriesExercises.jsp";
	}
//		
//		User theUser = userServ.getById(userId);
//		if (theUser == null) {
//			Admin theAdmin = adminServ.getById(userId);
//			System.out.println("Testing admin: " + theAdmin);
//			model.addAttribute("user", theAdmin);
//			if (theAdmin == null) {
//				model.addAttribute("category", catServ.getOne(catId));
//				return "categoriesExercises.jsp";
//			}
//		} else {
//			model.addAttribute("logUser", theUser);
//		}
//		model.addAttribute("category", catServ.getOne(catId));
//		return "categoriesExercises.jsp";
	
	@GetMapping("/exercise/edit/{exerciseId}")
	public String editExercise(@PathVariable("exerciseId") Long exId, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		User theUser = userServ.getById(userId);
		if (theUser == null) {
			Admin theAdmin = adminServ.getById(userId);
			model.addAttribute("user", theAdmin);
			if (theAdmin == null) {
				return "redirect:/";
			}
		}
		model.addAttribute("user", theUser);
		Exercise exercise = exerServ.getById(exId);
		model.addAttribute("newExercise", exercise);
		model.addAttribute("category", catServ.findAll());
		return "editExercise.jsp";
	}
	
	@PutMapping("/exercise/{id}/update")
	public String updateExercise(Model model, @Valid @ModelAttribute("newExercise") Exercise newExercise, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			model.addAttribute("category", catServ.findAll());
//			return "editExercise.jsp";
			return "redirect:/exercise/edit/{id}";
		} else {
			exerServ.editExercise(newExercise);		
		}
		return "redirect:/";
	}
	
	@DeleteMapping("/exercise/{exerciseId}/destroy")
	public String destroyExercise(Model model, @PathVariable("exerciseId") Long exerciseId, HttpSession session) {
		if ((Long) session.getAttribute("adminId") != null) {
			Long adminId = (Long) session.getAttribute("adminId");
			Admin admin = adminServ.getById(adminId);
			exerServ.destroyExercise(exerciseId);
			return "redirect:/";
		}
		Long userId = (Long) session.getAttribute("userId");
		User theUser = userServ.getById(userId);
		if (theUser == null) {
			Admin theAdmin = adminServ.getById(userId);
			model.addAttribute("user", theAdmin);
			if (theAdmin == null) {
				return "redirect:/";
			}
		}
		exerServ.destroyExercise(exerciseId);
		return "redirect:/";
	}

}
