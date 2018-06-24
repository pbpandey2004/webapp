package com.msis.webapp.dao;

import java.util.List;

import com.msis.webapp.model.Competencies;


public interface UserCompetencyDao {
	
    List<Competencies> findAll();
    
/*    Competencies findByCompetency(String competency);*/
    
    Competencies findByDescription(String description);
     
    Competencies findById(int id);

}
