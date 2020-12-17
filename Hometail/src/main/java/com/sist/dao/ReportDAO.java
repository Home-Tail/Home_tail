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
	 
	 public List<ReportVO> mainBoardList()
     {
    	 return mapper.mainBoardList();
     }
     
	 public List<ReportVO> reportListData(Map map)
     {
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
     public void replyInsertData(ReplyVO rvo){
    	 mapper.replyInsertData(rvo);
     }
     
     public List<ReplyVO> replyListData(int petno)
     {
  	   return mapper.replyListData(petno);
     }
     
     public void replyDeleteData(int replyno, int root){
    	 mapper.replyDeleteData(replyno);
    	 mapper.replyDepthDecrement(root);
     }
     
     public ReplyVO replyUpdateData(ReplyVO rvo){
    	 return mapper.replyUpdateData(rvo);
     }
     
     // 대댓글
     public void replyReplyInsert(ReplyVO vo,int root)
 	{
 		ReplyVO pvo=mapper.replyParentData(root);
 		mapper.replyStepIncrement(pvo);
 		
 		vo.setGroup_id(pvo.getGroup_id());
 		vo.setGroup_step(pvo.getGroup_step()+1);
 		vo.setGroup_tap(pvo.getGroup_tap()+1);
 		vo.setRoot(root);
 		mapper.replyReplyInsert(vo);
 		mapper.replyDepthUpdate(root);
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
