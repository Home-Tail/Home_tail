package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.AdoptVO;
//import com.sist.vo.adopt_newsVO;
public interface AdoptMapper {
	/*@Select("SELECT no,cate,kind,sub_kind,punumber,regdate,poster,sex,area,point,num "
			+ "FROM (SELECT no,cate,kind,sub_kind,punumber,regdate,poster,sex,area,point,rownum as num "
			+ "FROM (SELECT no,cate,kind,sub_kind,punumber,regdate,poster,sex,area,point "
			+ "FROM adoption ORDER BY no ASC )) "
			+ "WHERE num BETWEEN #{start} AND #{end}")*/
	@Select("SELECT no,punumber,poster,num "
			+ "FROM (SELECT no,punumber,poster,rownum as num "
			+ "FROM (SELECT no,punumber,poster "
			+ "FROM adoption ORDER BY no DESC )) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<AdoptVO> adoptListData(Map map);
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM adoption")
	public int adoptTotalPage();
	
	@Select("SELECT * FROM adoption "
			+ "WHERE no=#{no}")
	public AdoptVO adoptDetailData(int no);
	
	/*@Select("Select title,poster,link,rownum "
			+ "FROM adopt_news "
			+ "WHERE rownum<=5 AND "
			+ "REGEXP_LIKE(title,#{finddata})")
	public List<adopt_newsVO> adoptnewsData(String finddata);*/
	
	
}
