package com.msis.webapp.model;

import java.util.HashSet;
import java.util.Set;

public class userSearch {
	
	private String searchText;
	
	private Set<Competencies> competency = new HashSet();

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public Set<Competencies> getCompetency() {
		return competency;
	}

	public void setCompetency(Set<Competencies> competency) {
		this.competency = competency;
	}

	@Override
	public String toString() {
		return "userSearch [searchText=" + searchText + ", competency=" + competency + "]";
	}
	
}
