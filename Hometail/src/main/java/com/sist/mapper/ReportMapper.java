package com.sist.mapper;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.ReplyVO;
import com.sist.vo.ReportVO;

public interface ReportMapper {
	@Select("SELECT petno,id,title,cate,kind,sub_kind,poster,sex,age,weight,color,pdate,loc,num "
			+ "FROM (SELECT petno,id,title,cate,kind,sub_kind,poster,sex,age,weight,color,pdate,loc,rownum as num "
	  		+ "FROM (SELECT petno,id,title,cate,kind,sub_kind,poster,sex,age,weight,color,pdate,loc "
	  		+ "FROM pet_board WHERE cate BETWEEN 1 AND 3 ORDER BY petno DESC)) "
	  		+"WHERE num BETWEEN #{start} AND #{end}")
	public List<ReportVO> reportListData(Map map);

	@Select("SELECT CEIL(COUNT(*)/8.0) FROM pet_board WHERE cate BETWEEN 1 AND 3")
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
	
	@Select("SELECT * FROM pet_board where cate BETWEEN 1 AND 2")
	public List<ReportVO> reportAllData();
	
	// 디테일
	@Select("insert into pet_board(petno,id,title,cate,kind,sub_kind,loc,map_x,map_y,poster,regdate,pdate,sex,age,weight,color,point,tel,content) values( "
			+ "(select nvl(max(petno+1),1) FROM pet_board)"
			+ ",#{id}"
			+ ",#{title}"
			+ ",#{cate}"
			+ ",#{kind}"
			+ ",#{sub_kind}"
			+ ",#{loc}"
			+ ",#{map_x}"
			+ ",#{map_y}"
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
	
	@Select("delete from pet_board where petno=#{petno}")
	public ReportVO reportDeleteData(int petno);
	
	@Select("update pet_board set "
			+ "title=#{title}"
			+ ",cate=#{cate}"
			+ ",kind=#{kind}"
			+ ",sub_kind=#{sub_kind}"
			+ ",loc=#{loc}"
			+ ",map_x=#{map_x}"
			+ ",map_y=#{map_y}"
			+ ",poster=#{poster}"
			+ ",regdate=sysdate"
			+ ",pdate=#{pdate}"
			+ ",sex=#{sex}"
			+ ",age=#{age}"
			+ ",weight=#{weight}"
			+ ",color=#{color}"
			+ ",point=#{point}"
			+ ",tel=#{tel}"
			+ ",content=#{content} where petno=#{petno}")
	public ReportVO reportUpdateData(ReportVO vo);
	
	
	//	댓글
	@Select("insert into reply(replyno,petno,id,cate,content,regdate) values( "
			+ "(select nvl(max(replyno+1),1) FROM reply)"
			+ ",#{petno}"
			+ ",#{id}"
			+ ",3"
			+ ",#{content}"
			+ ",sysdate"
			+ ")")
	public ReplyVO replyInsertData(ReplyVO vo);
	
	@Select("select replyno,id,content,regdate from reply where petno=#{petno}")
	public List<ReplyVO> replyListData(int petno);
	
	@Select("delete from reply where replyno=#{replyno}")
	public ReplyVO replyDeleteData(int replyno);
	
	@Select("update reply set content=#{content},regdate=sysdate where replyno=#{replyno}")
	public ReplyVO replyUpdateData(ReplyVO rvo);
	
	
	
}