package com.example.exercise.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.exercise.models.Exercise;

@Repository
public interface ExerciseRepository extends CrudRepository<Exercise, Long> {
	List<Exercise> findAll();
	
//	List<Exercise> findByCategory(Long id);
}
