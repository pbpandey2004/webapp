package com.msis.webapp.service;

import java.util.List;

import com.msis.webapp.model.UserProfile;

public interface UserProfileService {
	 
    UserProfile findById(int id);
 
    UserProfile findByType(String type);
     
    List<UserProfile> findAll();
     
}