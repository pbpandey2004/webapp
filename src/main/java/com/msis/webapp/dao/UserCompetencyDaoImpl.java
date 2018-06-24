package com.msis.webapp.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.msis.webapp.model.Competencies;

@Repository("userCompetencyDao")
public class UserCompetencyDaoImpl extends AbstractDao<Integer, Competencies>implements UserCompetencyDao{
	
    public Competencies findById(int id) {
        return getByKey(id);
    }
 
/*    public Competencies findByCompetency(String competency) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("competency", competency));
        return (Competencies) crit.uniqueResult();
    }*/
    
    public Competencies findByDescription(String description) {
    	
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("description", description));
        return (Competencies) crit.uniqueResult();
    }
     
    @SuppressWarnings("unchecked")
    public List<Competencies> findAll(){
        Criteria crit = createEntityCriteria();
        crit.addOrder(Order.asc("description"));
        return (List<Competencies>)crit.list();
    }

}
