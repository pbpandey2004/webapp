package com.msis.webapp.service;

import java.util.List;

import com.msis.webapp.model.Competencies;

public interface CompetenciesService {
	
	Competencies findById(int id);
    
/*	Competencies findByCompetency(String type);*/
	
	Competencies findByDescription(String type);
     
    List<Competencies> findAll();
     

}
