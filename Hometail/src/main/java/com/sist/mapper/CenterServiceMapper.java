package com.sist.mapper;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.MemberVO;
import com.sist.vo.Center_reserveVO;

public interface CenterServiceMapper {

	//로그인기능
	@Select("SELECT COUNT(*) FROM tail_user WHERE id=#{id}")
	public int isLogin(String id);
	
	@Select("SELECT * FROM tail_user WHERE id=#{id}")
	public MemberVO Login_info(String id);
	
	@Select("INSERT INTO center_reserve VALUES("
			+ "(select NVL(max(no+1),1) from center_reserve),"
			+ "#{id},"
			+ "#{name},"
			+ "#{loc},"
			+ "#{tel},"
			+ "#{lotno_addr}," 	
			+ "#{roadno_addr},"
			+ "#{db_reserve_day},"
			+ "SYSDATE,"
			+ "#{time},"
			+ "'N',"
			+ "#{hospital_name})")
	public Center_reserveVO center_reserve(Center_reserveVO vo);
	
}
