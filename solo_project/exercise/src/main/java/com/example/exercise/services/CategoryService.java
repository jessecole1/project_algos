package com.example.exercise.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.exercise.models.Category;
import com.example.exercise.repositories.CategoryRepository;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryRepository catRepo;
	
	public Category addCategory(Category newCategory) {
		return catRepo.save(newCategory);
	}
	
	public List<Category> findAll() {
		return catRepo.findAll();
	}
	
	public Category getOne(Long catId) {
		Optional<Category> category = catRepo.findById(catId);
		if (category.isPresent()) {
			return category.get();
		}
		return null;
	}

}
