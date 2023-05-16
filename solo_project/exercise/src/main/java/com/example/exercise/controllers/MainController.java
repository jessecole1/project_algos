package com.example.exercise.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.exercise.models.Admin;
import com.example.exercise.models.LoginUser;
import com.example.exercise.models.User;
import com.example.exercise.services.AdminService;
import com.example.exercise.services.CategoryService;
import com.example.exercise.services.UserService;

@Controller
public class MainController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private AdminService adminServ;
	
	@Autowired
	private CategoryService catServ;
	
	@GetMapping("/")
	public String index(Model model, HttpSession session) {
		
			Long userId = (Long) session.getAttribute("userId");
			
			if (userId == null) {
				Long adminId = (Long) session.getAttribute("adminId");
				if (adminId == null) {
					model.addAttribute("categories", catServ.findAll());
					return "index.jsp";
				}
				Admin theAdmin = adminServ.getById(adminId);
				model.addAttribute("adId", theAdmin.getAdminId());
				model.addAttribute("categories", catServ.findAll());
				return "index.jsp";
			} else {
//				model.addAttribute("user", userServ.getById(userId));
				model.addAttribute("logUser", userServ.getById(userId));
				model.addAttribute("categories", catServ.findAll());
				return "index.jsp";
			}
			
//			if (session.getAttribute("userId") != null) {
//				
//				User theUser = userServ.getById(userId);
//				
//				if (theUser == null) {
//					Admin theAdmin = adminServ.getById(userId);
//					
//					if (theAdmin == null) {
//						model.addAttribute("categories", catServ.findAll());
//						return "index.jsp";
//					} else {
//						model.addAttribute("adId", theAdmin.getAdminId());
//						model.addAttribute("logUser", theAdmin);
//						model.addAttribute("categories", catServ.findAll());
//						return "index.jsp";
//					}
//				}
//				
//				model.addAttribute("userId", theUser.getId());
//				model.addAttribute("logUser", theUser);
//				model.addAttribute("categories", catServ.findAll());
//	
//				return "index.jsp";

//			}
//		model.addAttribute("categories", catServ.findAll());
//		return "index.jsp";
	}
	
	@GetMapping("/account")
	public String account(Model model) {
		
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		
	
	return "loginOrReg.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "loginOrReg.jsp";
		}
		userServ.register(newUser, result);
		
		session.setAttribute("userId", newUser.getId());
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
		User user = userServ.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "loginOrReg.jsp";
		}
		session.setAttribute("userId", user.getId());

		return "redirect:/";
	}
	
//	@GetMapping("/my/user/account/{id}")
//	public String myAccount(Model model, HttpSession session) {
//		Long userId = (Long) session.getAttribute("userId");
//		if (userId == null) {
//			return "redirect:/";
//		}
//		model.addAttribute("user", userServ.getById(userId));
//		return "myAccount.jsp";
//	}
	
	@GetMapping("/account/user/{id}")
	public String userAccount(@PathVariable("id") Long useId, Model model, HttpSession session) {
		model.addAttribute("accountUser", userServ.getById(useId));
		if (session.getAttribute("userId") == null) {
			return "usersAccount.jsp";
		} else {
			Long userId = (Long) session.getAttribute("userId");
			if (userId == null) {
				Admin admin = adminServ.getById(userId);
				model.addAttribute("user", admin);
				return "usersAccount.jsp";
			} else {
				model.addAttribute("user", userServ.getById(userId));
				return "usersAccount.jsp";
			}
		}
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("userId", null);
		session.setAttribute("adminId", null);
		return "redirect:/";
	}
	
	@GetMapping("/calorie/calculator")
	public String calorieCalculator(Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		
		if (userId == null) {
			Long adminId = (Long) session.getAttribute("adminId");
			if (adminId == null) {
				model.addAttribute("categories", catServ.findAll());
				return "calorieCalculator.jsp";
			}
			Admin theAdmin = adminServ.getById(adminId);
			model.addAttribute("adId", theAdmin.getAdminId());
			return "calorieCalculator.jsp";
		} else {
//			model.addAttribute("user", userServ.getById(userId));
			model.addAttribute("logUser", userServ.getById(userId));
			return "calorieCalculator.jsp";
		}
	}

}

