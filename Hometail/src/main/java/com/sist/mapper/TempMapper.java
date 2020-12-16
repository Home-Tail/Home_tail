package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.ReplyVO;
import com.sist.vo.TempVO;

public interface TempMapper {

	@Select("SELECT petno,id,title,cate,kind,poster,pdate,loc,num "
			+ "FROM (SELECT petno,id,title,cate,kind,poster,pdate,loc,rownum as num "
			+ "FROM (SELECT petno,id,title,cate,kind,poster,pdate,loc "
			+ "FROM pet_board WHERE cate BETWEEN 5 AND 7 ORDER BY petno DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<TempVO> TempListData(Map map);
	
	@Select("SELECT petno,id,title,cate,kind,poster,pdate,loc,num "
			+ "FROM (SELECT petno,id,title,cate,kind,poster,pdate,loc,rownum as num "
			+ "FROM (SELECT petno,id,title,cate,kind,poster,pdate,loc "
	  		+ "FROM pet_board WHERE cate=#{cate} ORDER BY petno DESC)) "
	  		+"WHERE num BETWEEN #{start} AND #{end}")
		public List<TempVO> TempCateData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/8.0) FROM pet_board WHERE cate=#{cate}")
	public int TempCateTotalPage(int cate);

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
	
	@Select("UPDATE pet_board SET "
			+ "cate=#{cate},"
			+ "title=#{title},"
			+ "kind=1,"
			+ "sub_kind=1,"
			+ "poster=#{poster},"
			/*+ "pdate=#{db_pdate},"*/
			+ "pdate=SYSDATE,"
			+ "loc=#{loc},"
			+ "tel=#{tel},"
			+ "content=#{content} "
			+ "WHERE petno=#{petno}")
	public TempVO TempUpdateData(TempVO vo);


	@Select("DELETE FROM pet_board WHERE petno=#{petno}")
	public TempVO TempDeleteData(int petno);
	
	

	@Select("INSERT INTO reply(replyno,petno,id,cate,content,regdate,group_id) VALUES( "
			+ "(SELECT NVL(MAX(replyno+1),1) FROM reply)"
			+ ",#{petno}"
			+ ",#{id}"
			+ ",2"
			+ ",#{content}"
			+ ",sysdate"
			+ ",(SELECT NVL(MAX(group_id)+1,1) FROM reply)"
			+ ")")
	public ReplyVO TempreplyInsertData(ReplyVO vo);
	
	@Select("SELECT replyno,id,content,regdate,group_step,group_tap FROM reply WHERE petno=#{petno} ORDER BY group_id DESC,group_step ASC")
	public List<ReplyVO> TempreplyListData(int petno);
	
	@Select("DELETE FROM reply WHERE replyno=#{replyno}")
	public ReplyVO TempreplyDeleteData(int replyno);
	
	@Select("UPDATE reply SET content=#{content},regdate=sysdate WHERE replyno=#{replyno}")
	public ReplyVO TempreplyUpdateData(ReplyVO rvo);
	
	//대댓
	@Select("SELECT group_id,group_step,group_tap FROM reply where replyno=#{replyno}")
	public ReplyVO replyParentData(int replyno);

	@Update("UPDATE reply SET group_step=group_step+1 WHERE group_id=#{group_id} AND group_step>#{group_step}")
	public void replyStepIncrement(ReplyVO vo);

	@Insert("INSERT INTO reply(cate,replyno,petno,id,regdate,content,group_id,group_step,group_tap,root,depth) "
			+ "VALUES(2,(SELECT NVL(MAX(replyno)+1,1) FROM reply),#{petno},#{id},SYSDATE,#{content},#{group_id},#{group_step},#{group_tap},#{root},0)")
	public void TempReply_replyInsert(ReplyVO vo);
	
	@Update("UPDATE reply SET depth=depth+1 WHERE replyno=#{replyno}")
	public void TempReplyDepthUpdate(int root);
	
	// 메인 출력
	@Select("SELECT * FROM (SELECT * FROM pet_board WHERE cate in(5,6) "
			+"ORDER BY DBMS_RANDOM.RANDOM) WHERE rownum <= 4")
	public List<TempVO> tempMainList(Map map); 
	


}
