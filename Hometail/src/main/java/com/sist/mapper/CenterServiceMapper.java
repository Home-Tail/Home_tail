package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	
	@Select("SELECT COUNT(*) FROM center_reserve where id=#{id} and check_msg='N'")
	public int msg_check(String id);
	
	@Select("SELECT no,id,name,loc,tel,lotno_addr,roadno_addr,reserve_day,TO_CHAR(regdate,'YYYY-MM-DD') as db_reserve_day,time,check_msg,hospital_name"
			+ " FROM center_reserve where id=#{id}")
	public List<Center_reserveVO> msg_data(String id);
	
	@Select("UPDATE center_reserve set check_msg='Y' WHERE id=#{id} AND no=#{no}")
	public void check_update(Center_reserveVO vo);
}
