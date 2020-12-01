package com.sist.mapper;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.MemberVO;

public interface CenterServiceMapper {

	//로그인기능
	@Select("SELECT COUNT(*) FROM tail_user WHERE id=#{id}")
	public int isLogin(String id);
	
	@Select("SELECT * FROM tail_user WHERE id=#{id}")
	public MemberVO Login_info(String id);
}
