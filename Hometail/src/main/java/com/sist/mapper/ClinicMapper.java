package com.sist.mapper;
import java.util.*;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.ClinicVO;
public interface ClinicMapper {
@Select("SELECT clno,title,addr,poster,num "
		+ "FROM (SELECT clno,title,addr,poster,rownum as num "
		+ "FROM (SELECT clno,title,addr,poster "
		+ "FROM clinic ORDER BY poster)) "
		+ "WHERE num BETWEEN #{start} AND #{end}")
public List<ClinicVO> clinicListData(Map map);

@Select("SELECT CEIL(COUNT(*)/10.0) FROM clinic")
public int clinicTotalPage();

@Select("SELECT clno,title,tel,addr,post FROM clinic WHERE clno=#{clno}")
public ClinicVO clinicDetailData(int clno);
}

