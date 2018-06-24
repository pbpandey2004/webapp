package com.msis.webapp.dao;

import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.CriteriaImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.msis.webapp.model.PersistentLogin;

@Repository("tokenRepositoryDao")
@Transactional
public class HibernateTokenRepositoryImpl extends AbstractDao<String, PersistentLogin> 
		implements PersistentTokenRepository{
	
	static final Logger logger = LoggerFactory.getLogger(HibernateTokenRepositoryImpl.class);

	
	public void createNewToken(PersistentRememberMeToken token) {
		logger.info("Creating Token for user : {}", token.getUsername());
		PersistentLogin persistentLogin = new PersistentLogin();
		persistentLogin.setUsername(token.getUsername());
		persistentLogin.setSeries(token.getSeries());
		persistentLogin.setToken(token.getTokenValue());
		persistentLogin.setLast_used(token.getDate());
		persist(persistentLogin);
		
	}
	
	public void updateToken(String series, String tokenValue, Date lastUsed) {
		logger.info("Updating Token for SeriesID : {}", series);
		PersistentLogin persistentLogin = getByKey(series);
		persistentLogin.setToken(tokenValue);
		persistentLogin.setLast_used(lastUsed);
		update(persistentLogin);
	}

	public PersistentRememberMeToken getTokenForSeries(String seriesId) {
		logger.info("Fetch Token if any for Series :{}", seriesId);
		try {
			Criteria crit = createEntityCriteria();
			crit.add(Restrictions.eq("series", seriesId));
			PersistentLogin persistentLogin = (PersistentLogin) crit.uniqueResult();
			return new PersistentRememberMeToken(persistentLogin.getUsername(), persistentLogin.getSeries(), persistentLogin.getToken(), persistentLogin.getLast_used());
		}
		catch(Exception e) {
			logger.info("token not found");
			return null;
		}
	}

	public void removeUserTokens(String username) {
		logger.info("Removing Token if any for User: {}", username);
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("username",username));
		PersistentLogin persistentLogin = (PersistentLogin) crit.uniqueResult();
		if(persistentLogin !=null) {
			logger.info("rememberMe was selected");
			delete(persistentLogin);
		}
		
	}
	
	

}
