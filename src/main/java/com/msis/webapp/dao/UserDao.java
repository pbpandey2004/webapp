package com.msis.webapp.dao;

import java.util.List;
import java.util.Set;

import com.msis.webapp.model.Competencies;
import com.msis.webapp.model.User;

public interface UserDao {
	 
    User findById(int id);
     
    User findBySSO(String sso);
     
    void save(User user);
     
    void deleteBySSO(String sso);
     
    List<User> findAllUsers();

	List<User> findBySearchText(String firstName);

	List<User> findByCompetency(Set<Competencies> competency);

	List<User> findByTextandCompetency(String searchText, Set<Competencies> competency);
 
}