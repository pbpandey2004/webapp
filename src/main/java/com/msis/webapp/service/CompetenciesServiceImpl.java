package com.msis.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.msis.webapp.dao.UserCompetencyDao;
import com.msis.webapp.model.Competencies;

@Service("competenciesService")
@Transactional
public class CompetenciesServiceImpl implements CompetenciesService {
	
    @Autowired
    UserCompetencyDao dao;
     
    public Competencies findById(int id) {
        return dao.findById(id);
    }
 
/*    public Competencies findByCompetency(String type){
        return dao.findByCompetency(type);
    }*/
    
    public Competencies findByDescription(String type){
        return dao.findByDescription(type);
    }
 
    public List<Competencies> findAll() {
        return dao.findAll();
    }

}
