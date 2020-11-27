package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CenterServiceMapper;

@Repository
public class CenterServiceDAO {
	
	@Autowired
	private CenterServiceMapper mapper;
	
	
}
