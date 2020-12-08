package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CenterServiceMapper;
import com.sist.vo.CenterVO;
import com.sist.vo.Center_reserveVO;

@Repository
public class CenterServiceDAO {
	
	@Autowired
	private CenterServiceMapper mapper;
	
	public Center_reserveVO center_reserve(Center_reserveVO vo)
	{
		return mapper.center_reserve(vo);
	}
	public void check_update(Center_reserveVO vo)
	{
		System.out.println("DAO출력"+vo.getNo());
		System.out.println("DAO출력"+vo.getId());
		mapper.check_update(vo);
	}
	
	public int msg_check(String id)	
	{
		return mapper.msg_check(id);
	}
	public List<Center_reserveVO> msg_data(String id)
	{
		return mapper.msg_data(id);
	}
	
	public List<CenterVO> shelter_data()
	{
		return mapper.shelter_data();
	}
}	
