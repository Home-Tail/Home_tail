package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MemberMapper;
import com.sist.vo.Center_reserveVO;
import java.util.*;

@Repository
public class MemberDAO {
	@Autowired
	private MemberMapper mapper;
	
	public int msg_check(String id)	
	{
		return mapper.msg_check(id);
	}
	
	public List<Center_reserveVO> msg_data(String id)
	{
		return mapper.msg_data(id);
	}
}
