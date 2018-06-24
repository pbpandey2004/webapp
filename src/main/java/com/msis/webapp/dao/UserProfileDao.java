package com.msis.webapp.dao;

import java.util.List;

import com.msis.webapp.model.UserProfile;

public interface UserProfileDao {
	 
    List<UserProfile> findAll();
     
    UserProfile findByType(String type);
     
    UserProfile findById(int id);
}