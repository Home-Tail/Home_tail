package com.sist.mapper;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.Center_reserveVO;

public interface MemberMapper {
	@Select("SELECT COUNT(*) FROM center_reserve where id=#{id} and check_msg='N'")
	public int msg_check(String id);
	
}
