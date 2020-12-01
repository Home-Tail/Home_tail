package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.ReportVO;
import com.sist.vo.TempVO;

public interface TempMapper {

	@Select("SELECT petno,id,title,cate,kind,poster,pdate,loc,num "
			+ "FROM (SELECT petno,id,title,cate,kind,poster,pdate,loc,rownum as num "
			+ "FROM (SELECT petno,id,title,cate,kind,poster,pdate,loc "
			+ "FROM pet_board WHERE cate BETWEEN 5 AND 6 ORDER BY petno DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<TempVO> TempListData(Map map);

	@Select("SELECT CEIL(COUNT(*)/8.0) FROM pet_board")
	public int TempTotalPage();

	@Select("SELECT * FROM pet_board WHERE petno=#{petno}") 
	public TempVO TempDetailData(int petno);
	
	@Select("INSERT INTO pet_board(petno,id,title,cate,kind,SUB_KIND,poster,regdate,pdate,loc,tel,content) "
			+ "VALUES("
			+ "(SELECT NVL(MAX(petno+1),1) FROM pet_board)," 	
			+ "#{id}," 
			+ "#{title},"
			+ "#{cate},"
			+ "1,"
			+ "1,"
			+ "#{poster},"
			+ "SYSDATE,"
			+ "SYSDATE,"
			+ "#{loc},"
			+ "#{tel},"
			+ "#{content})")
	public TempVO TempInsertData(TempVO vo);
	
	
	
	/*
	 * @Select("SELECT petno,id,title,cate,kind,poster,pdate,loc,num " +
	 * "FROM (SELECT petno,id,title,cate,kind,poster,pdate,loc,num,rownum as num "
	 * + "FROM (SELECT petno,id,title,cate,kind,poster,pdate,loc,num " +
	 * "FROM pet_board WHERE cate=#{cate} ORDER BY petno DESC)) "
	 * +"WHERE num BETWEEN #{start} AND #{end}") public List<TempVO>
	 * TempCateData(Map map);
	 */

	/*
	 * @Select("SELECT * FROM pet_board WHERE petno=#{petno}") public TempVO
	 * TempDetailData(int petno);
	 */

}
