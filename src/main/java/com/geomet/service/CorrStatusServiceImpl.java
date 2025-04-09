package com.geomet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomet.dao.CorrStatusDao;
import com.geomet.domain.CorrStatus;

@Service
public class CorrStatusServiceImpl implements CorrStatusService {

	   @Autowired
	    private CorrStatusDao corrStatusDao;

	   
	}