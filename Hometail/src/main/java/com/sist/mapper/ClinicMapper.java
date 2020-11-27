package com.sist.mapper;
import java.util.*;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.ClinicVO;
public interface ClinicMapper {
@Select("SELECT clno,title,addr,num "
		+ "FROM (SELECT clno,title,addr,rownum as num "
		+ "FROM (SELECT clno,title,addr "
		+ "FROM clinic)) "
		+ "WHERE num BETWEEN #{start} AND #{end}")
public List<ClinicVO> clinicListData(Map map);

@Select("SELECT CEIL(COUNT(*)/14.0) FROM clinic")
public int clinicTotalPage();

@Select("SELECT clno,title,tel,addr,post FROM clinic WHERE clno=#{clno}")
public ClinicVO clinicDetailData(int clno);
}

