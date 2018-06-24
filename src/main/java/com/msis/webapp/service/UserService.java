package com.msis.webapp.service;

import java.util.List;
import java.util.Set;

import com.msis.webapp.model.Competencies;
import com.msis.webapp.model.User;

public interface UserService {
    
    User findById(int id);
     
    User findBySSO(String sso);
     
    void saveUser(User user);
     
    void updateUser(User user);
     
    void deleteUserBySSO(String sso);
 
    List<User> findAllUsers(); 
     
    boolean isUserSSOUnique(Integer id, String sso);

	List<User> findBySeachText(String searchText);

	List<User> findByCompetency(Set<Competencies> set);

	List<User> findByTextandCompetency(String searchText, Set<Competencies> competency);
 
}