package com.example.exercise.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.exercise.models.Exercise;
import com.example.exercise.repositories.ExerciseRepository;

@Service
public class ExerciseService {
	
	@Autowired
	private ExerciseRepository exerRepo;
	
	public Exercise addExercise(Exercise newExercise) {
		return exerRepo.save(newExercise);
	}
	
	public List<Exercise> findAll() {
		return exerRepo.findAll();
	}
	
//	public List<Exercise> findByCategory(Long catId) {
//		List<Exercise> exercises = exerRepo.findAll();
//		List<Exercise> newExercises = new ArrayList();
//		for (int i = 0; i < exercises.size(); i++) {
//			System.out.println(exercises.get(i));
//			System.out.println(exercises.get(i).getCategories());
//		}
//		return exercises;
//	}
	
	public Exercise getById(Long id) {
		Optional<Exercise> exercise = exerRepo.findById(id);
		if (exercise.isPresent()) {
			return exercise.get();
		}
		return null;
	}
	
	public Exercise editExercise(Exercise newExercise) {
//		System.out.println("Testing exercise 2: " + newExercise);
		return exerRepo.save(newExercise);
	}
	
	public void destroyExercise(Long id) {
		exerRepo.deleteById(id);
	}


}
