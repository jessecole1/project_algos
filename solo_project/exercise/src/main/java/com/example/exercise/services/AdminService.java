package com.example.exercise.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.example.exercise.models.Admin;
import com.example.exercise.models.AdminLogin;
import com.example.exercise.repositories.AdminRepository;

@Service
public class AdminService {

	@Autowired
	private AdminRepository adminRepo;
	
	public Admin register(Admin newAdmin, BindingResult result) {
		Optional<Admin> potentialAdmin = adminRepo.findByEmail(newAdmin.getEmail());
		
		if(potentialAdmin.isPresent()) {
			result.rejectValue("email", "Matches", "Email address already used");
		}
		
		if(!newAdmin.getPassword().equals(newAdmin.getConfirm())) {
			result.rejectValue("Confirm", "Matches", "Passwords don't match");
		}
		
		if(result.hasErrors()) {
			return null;
		}
		
		String hashed = BCrypt.hashpw(newAdmin.getPassword(), BCrypt.gensalt());
		newAdmin.setPassword(hashed);
		return adminRepo.save(newAdmin);
	}


	public Admin adminLogin(AdminLogin newLoginAdmin, BindingResult result) {
		Optional<Admin> potentialAdmin = adminRepo.findByEmail(newLoginAdmin.getEmail());
		
		if(!potentialAdmin.isPresent()) {
			result.rejectValue("email","Matches", "Invalid");
			System.out.println("testing admin");
			return null;
		}
		
		Admin admin = potentialAdmin.get();
		
		if (!BCrypt.checkpw(newLoginAdmin.getPassword(), admin.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid");
		}
		
		if (result.hasErrors()) {
			return null;
		}
		
		return admin;
	}
	
	public Admin getById(Long id) {
		Optional<Admin> admin = adminRepo.findById(id);
		if(!admin.isPresent()) {
			return null;
		}
		return admin.get();
	}
	
}
