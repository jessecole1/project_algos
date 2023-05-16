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

import com.example.exercise.models.Admin;
import com.example.exercise.models.AdminLogin;
import com.example.exercise.models.Category;
import com.example.exercise.services.AdminService;
import com.example.exercise.services.CategoryService;
import com.example.exercise.services.ExerciseService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminServ;
	
	@Autowired
	private CategoryService categoryServ;
	
	@Autowired
	private ExerciseService exerServ;
	
	@GetMapping("/admin/login")
	public String adminLogin(Model model) {
		model.addAttribute("newLogin", new AdminLogin());
		model.addAttribute("admin", new Admin());
		System.out.println("test display");
		
	return "adminReg.jsp";
	}
	
	@PostMapping("/admin/register")
	public String adRegister(@Valid @ModelAttribute("admin") Admin newAdmin, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			model.addAttribute("newAdminLogin", new AdminLogin());
			return "adminReg.jsp";
		}
		adminServ.register(newAdmin, result);
		session.setAttribute("adminId", newAdmin.getAdminId());
		return "redirect:/";
	}
	
	@PostMapping("/admin/login")
	public String login(@Valid @ModelAttribute("newLogin") AdminLogin newLoginAdmin, BindingResult result, Model model, HttpSession session) {
		Admin admin = adminServ.adminLogin(newLoginAdmin, result);
		if (result.hasErrors()) {
			model.addAttribute("newAdminLogin", new AdminLogin());
			System.out.println("testing admin 2");
			return "redirect:/admin/login";
		}
		session.setAttribute("adminId", admin.getAdminId());
		return "redirect:/";
	}
	
	@GetMapping("/category/create")
	public String categoryCreation(@ModelAttribute("newCategory") Category newCategory, BindingResult result, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("adminId");
		if(userId == null) {
			return "redirect:/";
		}
		Admin theAdmin = adminServ.getById(userId);
		model.addAttribute("adId", theAdmin);
		return "newCategory.jsp";
	}
	
	@PostMapping("/category/create")
	public String createCategory(@Valid @ModelAttribute("newCategory") Category newCategory, BindingResult result) {
		if(result.hasErrors()) {
			return "newCategory.jsp";
		}
		categoryServ.addCategory(newCategory);
		return "redirect:/";
	}
	
	@DeleteMapping("/admin/delete/{exerciseId}/destroy")
	public String destroyExerciseByAdmin(Model model, @PathVariable("exerciseId") Long exerciseId, HttpSession session) {
		Long adminId = (Long) session.getAttribute("adminId");
		Admin admin = adminServ.getById(adminId);
		if (admin == null) {
			return "redirect:/";
		}
		exerServ.destroyExercise(exerciseId);
		return "redirect:/";
	}
	
}
