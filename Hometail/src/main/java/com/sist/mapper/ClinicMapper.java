package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.ClinicVO;
import com.sist.vo.ReplyVO;
public interface ClinicMapper {
@Select("SELECT clno,title,addr,poster,num "
		+ "FROM (SELECT clno,title,addr,poster,rownum as num "
		+ "FROM (SELECT clno,title,addr,poster "
		+ "FROM clinic ORDER BY poster)) "
		+ "WHERE num BETWEEN #{start} AND #{end}")
public List<ClinicVO> clinicListData(Map map);

@Select("SELECT CEIL(COUNT(*)/6.0) FROM clinic")
public int clinicTotalPage();

@Select("SELECT clno,title,tel,addr,post,poster FROM clinic WHERE clno=#{clno}")
public ClinicVO clinicDetailData(int clno);

@Insert("INSERT INTO reply(cate,replyno,clno,id,regdate,content,group_id) "
		+ "VALUES 1,(SELECT NVL(MAX(replyno)+1,1) FROM reply),#{clno},#{id},SYSDATE,#{content},"
		+ "(SELECT NVL(MAX(group_id)+1,1) FROM reply)")
public ReplyVO clinicReplyInsert();

@Select("SELECT cate,replyno,clno,id,TO_CHAR(regdate,'YYYY-MM-DD'),content FROM reply "
		+ "WHERE cate=1 AND clno=#{clno} "
		+ "ORDER BY group_id DESC")
public List<ReplyVO> clinicReplyList(int clno);


}



