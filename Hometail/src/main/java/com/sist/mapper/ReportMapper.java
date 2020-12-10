package com.sist.mapper;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Select;
import com.sist.vo.ReportVO;

public interface ReportMapper {
	@Select("SELECT petno,id,title,cate,kind,sub_kind,poster,sex,age,weight,color,pdate,loc,num "
			+ "FROM (SELECT petno,id,title,cate,kind,sub_kind,poster,sex,age,weight,color,pdate,loc,rownum as num "
	  		+ "FROM (SELECT petno,id,title,cate,kind,sub_kind,poster,sex,age,weight,color,pdate,loc "
	  		+ "FROM pet_board WHERE cate BETWEEN 1 AND 3 ORDER BY petno DESC)) "
	  		+"WHERE num BETWEEN #{start} AND #{end}")
	public List<ReportVO> reportListData(Map map);

	@Select("SELECT CEIL(COUNT(*)/8.0) FROM pet_board")
	public int reportTotalPage();
	
	@Select("SELECT petno,id,title,cate,kind,sub_kind,poster,sex,age,weight,color,pdate,loc,num "
			+ "FROM (SELECT petno,id,title,cate,kind,sub_kind,poster,sex,age,weight,color,pdate,loc,rownum as num "
	  		+ "FROM (SELECT petno,id,title,cate,kind,sub_kind,poster,sex,age,weight,color,pdate,loc "
	  		+ "FROM pet_board WHERE cate=#{cate} ORDER BY petno DESC)) "
	  		+"WHERE num BETWEEN #{start} AND #{end}")
	public List<ReportVO> reportCateData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/8.0) FROM pet_board WHERE cate=#{cate}")
	public int reportCateTotalPage(int cate);
	
	@Select("SELECT * FROM pet_board WHERE petno=#{petno}")
	public ReportVO reportDetailData(int petno);
	
	@Select("SELECT * FROM pet_board where cate BETWEEN 1 AND 3")
	public List<ReportVO> reportAllData();
	
	@Select("insert into pet_board(petno,id,cate,kind,sub_kind,loc,poster,regdate,pdate,sex,age,weight,color,point,tel,content) values( "
			+ "(select nvl(max(petno+1),1) FROM pet_board)"
			+ ",#{id}"
			+ ",#{title}"
			+ ",#{cate}"
			+ ",#{kind}"
			+ ",#{sub_kind}"
			+ ",#{loc}"
			+ ",#{poster}"
			+ ",sysdate"
			+ ",#{pdate}"
			+ ",#{sex}"
			+ ",#{age}"
			+ ",#{weight}"
			+ ",#{color}"
			+ ",#{point}"
			+ ",#{tel}"
			+ ",#{content}"
			+ ")")
	public ReportVO reportInsertData(ReportVO vo);
	
}