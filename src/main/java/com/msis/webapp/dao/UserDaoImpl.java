package com.msis.webapp.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.msis.webapp.model.Competencies;
import com.msis.webapp.model.User;

@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {
 
    static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
     
    public User findById(int id) {
        User user = getByKey(id);
        if(user!=null){
            Hibernate.initialize(user.getUserProfiles());
        }
        return user;
    }
 
    public User findBySSO(String sso) {
        logger.info("SSO : {}", sso);
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("ssoId", sso));
        User user = (User)crit.uniqueResult();
        if(user!=null){
            Hibernate.initialize(user.getUserProfiles());
        }
        return user;
    }
    
    public List<User> findByTextandCompetency(String searchText, Set<Competencies> competency){
    	List<User> users= findBySearchText(searchText);
    	return findByCompetencyOnList(users,competency);
    }
    
    public List<User> findBySearchText(String searchText) {
        logger.info("SSO : {}", searchText);
        List<User> users = findUsingFullText("firstName",searchText);
        if(users.isEmpty())
        	users = findUsingFullText("lastName",searchText);
        if(users.isEmpty())
        	users = findUsingPartialText("firstName",searchText);
        if(users.isEmpty())
        	users = findUsingPartialText("lastName",searchText);
        return users;
    }
    
    public List<User> findByCompetency(Set<Competencies> competency) {
    	Criteria tempCriteria = createEntityCriteria().addOrder(Order.asc("firstName"));
		tempCriteria.setResultTransformer(tempCriteria.DISTINCT_ROOT_ENTITY);
        @SuppressWarnings("unchecked")
		List<User> users = (List<User>) tempCriteria.list();
        return findByCompetencyOnList(users,competency);
    }
    
    
    private List<User> findByCompetencyOnList(List<User> users, Set<Competencies> competency){
    	List<User> finalUserList = new ArrayList<User>();
        for(User tempUser : users) {	
        	boolean present = true;
        	for(Competencies tempCompetency: competency) {
        		if(!tempUser.getUserCompetencies().contains(tempCompetency)) {
        			present=false;
        		}
        	}
        	if(present) {
        		finalUserList.add(tempUser);
        	}
        }
        return finalUserList;    	
    }
    
    @SuppressWarnings("unchecked")
    private List<User> findUsingFullText(String fieldName, String searchText){
		Criteria tempCriteria = createEntityCriteria().addOrder(Order.asc(fieldName));
		tempCriteria.add(Restrictions.eq(fieldName, searchText));
		tempCriteria.setResultTransformer(tempCriteria.DISTINCT_ROOT_ENTITY);
        List<User> users = (List<User>) tempCriteria.list();
        return users;
    }
    
    @SuppressWarnings("unchecked")
    private List<User> findUsingPartialText(String fieldName, String searchText){
    	searchText = "%" + searchText + "%";
		Criteria tempCriteria = createEntityCriteria().addOrder(Order.asc(fieldName));
		tempCriteria.add(Restrictions.like(fieldName, searchText));
		tempCriteria.setResultTransformer(tempCriteria.DISTINCT_ROOT_ENTITY);
        List<User> users = (List<User>) tempCriteria.list();
        return users;
    }
 
    @SuppressWarnings("unchecked")
    public List<User> findAllUsers() {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("firstName"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<User> users = (List<User>) criteria.list();
        
        // No need to fetch userProfiles since we are not showing them on list page. Let them lazy load. 
        // Uncomment below lines for eagerly fetching of userProfiles if you want.
        /*
        for(User user : users){
            Hibernate.initialize(user.getUserProfiles());
        }*/
        return users;
    }
 
    public void save(User user) {
        persist(user);
    }
 
    public void deleteBySSO(String sso) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("ssoId", sso));
        User user = (User)crit.uniqueResult();
        delete(user);
    }
 
}