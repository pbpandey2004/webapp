package com.msis.webapp.converter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.msis.webapp.model.Competencies;
import com.msis.webapp.service.CompetenciesService;
/**
 * A converter class used in views to map id's to actual competency objects.
 */
@Component
public class SkillToCompetencyConverter implements Converter<Object, Competencies>{
 
    static final Logger logger = LoggerFactory.getLogger(SkillToCompetencyConverter.class);
     
    @Autowired
    CompetenciesService competenciesService;
 
    /**
     * Gets UserProfile by Id
     * @see org.springframework.core.convert.converter.Converter#convert(java.lang.Object)
     */
    public Competencies convert(Object element) {
        Integer id = Integer.parseInt((String)element);
        Competencies competency= competenciesService.findById(id);
        logger.info("Competency : {}",competency);
        return competency;
    }
     
}