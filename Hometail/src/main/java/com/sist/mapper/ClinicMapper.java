package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.ClinicVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.ReserveVO;
public interface ClinicMapper {
@Select("SELECT clno,title,addr,poster,num "
		+ "FROM (SELECT clno,title,addr,poster,rownum as num "
		+ "FROM (SELECT clno,title,addr,poster "
		+ "FROM clinic ORDER BY poster)) "
		+ "WHERE num BETWEEN #{start} AND #{end}")
public List<ClinicVO> clinicListData(Map map);

@Select("SELECT CEIL(COUNT(*)/6.0) FROM clinic")
public int clinicTotalPage();

//------------------------ 리스트 페이징--------------------------

@Select("SELECT clno,title,tel,addr,post,poster FROM clinic WHERE clno=#{clno}")
public ClinicVO clinicDetailData(int clno);

//-------------------------- 디테일 ----------------------------
@Select("SELECT clno,addr,title,rownum "
		 +"FROM clinic "
		 +"WHERE rownum<=6 AND "
		 +"addr LIKE '%'||#{gu}||'%'")	
 public List<ClinicVO> clinicLocationFindData(String gu);

//------------------------ 서울시 지도--------------------------
@Insert("INSERT INTO reply(cate,replyno,clno,id,content,regdate,group_id) VALUES(1,(SELECT NVL(MAX(replyno)+1,1) FROM reply)"
		+ ",#{clno},#{id},#{content},SYSDATE,(SELECT NVL(MAX(group_id)+1,1) FROM reply))")
public void clinicReplyInsert(ReplyVO vo);

@Select("SELECT replyno,clno,id,content,regdate FROM reply WHERE clno=#{clno} ORDER BY group_id DESC,group_step ASC")
public List<ReplyVO> clinicReplyList(int clno);

@Update("UPDATE reply SET content=#{content} WHERE replyno=#{replyno} AND clno=#{clno}")
public void clinicReplyUpdate(ReplyVO vo);

@Delete("DELETE FROM reply WHERE replyno=#{replyno} and cate=1")
public void clinicReplyDelete(ReplyVO vo);

//------------------------ 댓글--------------------------
@Select("SELECT group_id,group_step,group_tap FROM reply WHERE replyno=#{replyno}")
public ReplyVO replyParentData(int root);

@Update("UPDATE reply SET group_step=group_step+1 WHERE group_id=#{group_id} AND group_step>#{group_step}")
public void replyStepIncrement(ReplyVO vo);

@Insert("INSERT INTO reply(cate,replyno,clno,id,regdate,content,group_id,group_step,group_tap,root,depth) "
		+ "VALUES(1,(SELECT NVL(MAX(replyno)+1,1) FROM reply),#{clno},#{id},SYSDATE,#{content},#{group_id},#{group_step},#{group_tap},#{root},0)")
public void clinicReply_replyInsert(ReplyVO vo);

@Update("UPDATE reply SET depth=depth+1 WHERE replyno=#{replyno}")
public void clinicReplyDepthUpdate(int root);

//@Update("UPDATE reply SET depth=depth-1 WHERE replyno=#{replyno}")
//public void clinicReplyDepthDecrement(int root);
//------------------------ 대댓글 --------------------------

@Insert("INSERT INTO reserve(resno,clno,id,resdate,owner,pname,content,time) VALUES((SELECT NVL(MAX(resno)+1,1) FROM reserve),#{clno},#{id},#{resdate},#{owner},#{pname},#{content},#{time})")
public void clinicReserveInsert(ReserveVO rvo);

@Select("SELECT resno,clno,id,resdate,owner,pname,content,name FROM reserve WHERE resno=#{resno}")
public List<ReserveVO> clinicReserveList(int resno);

//------------------------ 예약 --------------------------
}
