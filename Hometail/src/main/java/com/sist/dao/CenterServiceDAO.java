package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CenterServiceMapper;
import com.sist.vo.Center_reserveVO;

@Repository
public class CenterServiceDAO {
	
	@Autowired
	private CenterServiceMapper mapper;
	
	
	public Center_reserveVO center_reserve(Center_reserveVO vo)
	{
		return mapper.center_reserve(vo);
	}
}
