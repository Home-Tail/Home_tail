package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.AdoptVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.adopt_newsVO;
public interface AdoptMapper {
	/*@Select("SELECT adno,cate,kind,sub_kind,punumber,regdate,poster,sex,area,point,num "
	+ "FROM (SELECT adno,cate,kind,sub_kind,punumber,regdate,poster,sex,area,point,rownum as num "
	+ "FROM (SELECT adno,cate,kind,sub_kind,punumber,regdate,poster,sex,area,point "
	+ "FROM adoption ORDER BY adno ASC )) "
	+ "WHERE num BETWEEN #{start} AND #{end}")*/
@Select("SELECT adno,punumber,poster,num "
	+ "FROM (SELECT adno,punumber,poster,rownum as num "
	+ "FROM (SELECT adno,punumber,poster "
	+ "FROM adoption ORDER BY adno DESC )) "
	+ "WHERE num BETWEEN #{start} AND #{end}")
public List<AdoptVO> adoptListData(Map map);
@Select("SELECT CEIL(COUNT(*)/12.0) FROM adoption")
public int adoptTotalPage();

@Select("SELECT * FROM adoption "
	+ "WHERE adno=#{adno}")
public AdoptVO adoptDetailData(int adno);

@Select("SELECT title,poster,link,rownum "
		+ "FROM adopt_news "
		+ "WHERE rownum<=5 AND "
		+ "REGEXP_LIKE(title,#{finddata})")
	public List<adopt_newsVO> adoptnewsData(String finddata);

	@Select("SELECT adno,poster,punumber,cate,rownum "
			+ "FROM adoption "
			+ "WHERE rownum<=10 "
			+ "AND REGEXP_LIKE(cate,'공고중')")
	public List<AdoptVO> adoptCate10();


	
	//댓글
	@Select("INSERT INTO reply(replyno,adno,id,cate,content,regdate) "
			+ "values((SELECT NVL(MAX(replyno+1),1) FROM reply),"
			+ "#{adno},#{id},7,#{content},SYSDATE)")
	public ReplyVO adoptReplyInsert(ReplyVO vo);
		
	@Select("SELECT replyno,id,content,regdate "
			+ "FROM reply "
			+ "WHERE adno=#{adno}")
	public List<ReplyVO> adoptReplyData(int adno);
		
	@Select("DELETE FROM reply "
			+ "WHERE replyno=#{replyno}")
	public ReplyVO adoptReplyDelete(int replyno);
		
	@Select("UPDATE reply set content=#{content},regdate=sysdate "
			+ "WHERE replyno=#{replyno}")
	public ReplyVO adoptReplyUpdate(ReplyVO rvo);	

	//@Select("SELECT cate, count(*) cnt FROM adoption GROUP BY cate")
	}
