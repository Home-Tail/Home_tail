package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.MemberVO;
import com.sist.vo.CenterVO;
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
			+ " FROM center_reserve where id=#{id} ORDER BY regdate desc")
	public List<Center_reserveVO> msg_data(String id);
	
	@Select("UPDATE center_reserve set check_msg='Y' WHERE id=#{id} AND no=#{no}")
	public void check_update(Center_reserveVO vo);
	
	@Select("SELECT * FROM center")
	public List<CenterVO> shelter_data();
	
	@Select("SELECT * FROM center_hospital")
	public List<CenterVO> center_hospital();
	
	@Select("UPDATE center set poster=#{poster} where name=#{name}")
	public void shelter_icon(CenterVO vo);
	
	@Select("INSERT INTO center VALUES("
			+ "(SELECT NVL(MAX(no+1),1) FROM center),"
			+ "#{city},"
			+ "#{name},"
			+ "#{tel},"
			+ "#{representative},"
			+ "#{capacity},"
			+ "#{reminder},"
			+ "#{post},"
			+ "#{lotno_addr},"
			+ "#{roadno_addr},"
			+ "#{wgs84_y},"
			+ "#{wgs84_x},"
			+ "#{poster})")
	public void shelter_insertdata(CenterVO vo);
	
	@Select("SELECT count(*) FROM center WHERE roadno_addr LIKE '%'||#{city}||'%'")
	public int count_center(String city);
	
	@Select("SELECT count(*) FROM center_hospital WHERE lotno_addr LIKE '%'||#{city}||'%'")
	public int count_center_hospital(String city);
	
	@Select("SELECT count(*) FROM clinic WHERE ADDR LIKE '%'||#{city}||'%'")
	public int count_clinic(String city);
	
	@Select("SELECT DISTINCT name,city from center where poster=#{poster}")
	public List<CenterVO> poster_count(String poster);
	
	// 보호소/센터 중 봉사를 받은 기관 수 
	@Select("SELECT DISTINCT a.loc,a.hospital_name FROM center_reserve a inner join center b on a.hospital_name = b.name")
	public List<Center_reserveVO> reserve_shelter_count();
	
	@Select("SELECT DISTINCT a.loc,a.hospital_name FROM center_reserve a inner join center_hospital b on a.hospital_name = b.name")
	public List<Center_reserveVO> reserve_center_count();
	
	// 보호소의 총 갯수
	@Select("select DISTINCT name,city from center")
	public List<CenterVO> total_shelter_count();
	
	// 센터의 총 갯수
	@Select("select count(*) from center_hospital")
	public int total_center_count();
}
