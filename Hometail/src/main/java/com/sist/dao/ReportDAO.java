package com.sist.dao;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.ReportMapper;
import com.sist.vo.ReplyVO;
import com.sist.vo.ReportVO;

@Repository
public class ReportDAO {
	 @Autowired
     private ReportMapper mapper;
     
	 public List<ReportVO> reportListData(Map map)
     {
		 System.out.println("test");
    	 return mapper.reportListData(map);
     }

     public int reportTotalPage()
     {
    	 return mapper.reportTotalPage();
     }
     
	 public List<ReportVO> reportCateData(Map map)
	 {
		 return mapper.reportCateData(map);
	 }
     
     public int reportCateTotalPage(int cate)
     {
  	   return mapper.reportCateTotalPage(cate);
     }
     
     public ReportVO reportDetailData(int petno)
     {
  	   return mapper.reportDetailData(petno);
     }
     
     public List<ReportVO> reportAllData()
     {
  	   return mapper.reportAllData();
     }
     
     public ReportVO reportInsertData(ReportVO vo){
    	 return mapper.reportInsertData(vo);
     }
     
     public ReportVO reportDeleteData(int petno){
    	 return mapper.reportDeleteData(petno);
     }
     
     public ReportVO reportUpdateData(ReportVO vo){
    	 return mapper.reportUpdateData(vo);
     }
     
     //	댓글
     public ReplyVO replyInsertData(ReplyVO rvo){
    	 return mapper.replyInsertData(rvo);
     }
     
     public List<ReplyVO> replyListData(int petno)
     {
  	   return mapper.replyListData(petno);
     }
     
     public ReplyVO replyDeleteData(int replyno){
    	 return mapper.replyDeleteData(replyno);
     }
     
     public ReplyVO replyUpdateData(ReplyVO rvo){
    	 return mapper.replyUpdateData(rvo);
     }
     
     // 목격 댓글
     public ReplyVO findReplyInsertData(ReplyVO frvo){
    	 return mapper.findReplyInsertData(frvo);
     }
     
     public List<ReplyVO> findReplyListData(int petno)
     {
  	   return mapper.findReplyListData(petno);
     }
     
     public ReplyVO findReplyDeleteData(int replyno){
    	 return mapper.findReplyDeleteData(replyno);
     }
     
     public ReplyVO findReplyUpdateData(ReplyVO frvo){
    	 return mapper.findReplyUpdateData(frvo);
     }
     
}
