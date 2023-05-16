package com.example.exercise.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class AdminLogin {
	
	@NotEmpty(message="Can't verify")
	@Email(message="Can't verify")
	private String email;
	
	@NotEmpty(message="Can't verify")
	@Size(min=8, max=128, message="Can't Verify")
	private String password;
	
	public AdminLogin() {}

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

}
