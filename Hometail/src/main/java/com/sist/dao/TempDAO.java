package com.sist.dao;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.TempMapper;
import com.sist.vo.ReplyVO;
import com.sist.vo.TempVO;

@Repository
public class TempDAO {
	@Autowired
	private TempMapper mapper;

	public List<TempVO> TempListData(Map map) {
		return mapper.TempListData(map);
	}
	
	public TempVO TempDetailData(int petno) {
		return mapper.TempDetailData(petno);
	}

	public int TempTotalPage() {
		return mapper.TempTotalPage();
	}
	
	public List<TempVO> TempCateData(Map map)
	 {
		 return mapper.TempCateData(map);
	 }
    
    public int TempCateTotalPage(int cate)
    {
 	   return mapper.TempCateTotalPage(cate);
    }
	
	public TempVO TempInsertData(TempVO vo)
	{
		return mapper.TempInsertData(vo);
	}
	
	public TempVO TempUpdateData(TempVO vo)
	{
		return mapper.TempUpdateData(vo);
	}

	public TempVO TempDeleteData(int petno)
	   {
	      return mapper.TempDeleteData(petno);
	   }

	 public ReplyVO TempreplyInsertData(ReplyVO rvo){
    	 return mapper.TempreplyInsertData(rvo);
     }
     
     public List<ReplyVO> TempreplyListData(int petno)
     {
  	   return mapper.TempreplyListData(petno);
     }
     
     public ReplyVO TempreplyDeleteData(int replyno){
    	 return mapper.TempreplyDeleteData(replyno);
     }
     
     public ReplyVO TempreplyUpdateData(ReplyVO rvo){
    	 return mapper.TempreplyUpdateData(rvo);
     }

	public void TempReply_reply_Insert(ReplyVO vo,int root)
	{
		System.out.println("돈다 1");
		ReplyVO tvo = mapper.replyParentData(root);
		System.out.println("돈다 2");
		mapper.replyStepIncrement(tvo);
		System.out.println("돈다 3");
		
		vo.setGroup_id(tvo.getGroup_id());
		vo.setGroup_step(tvo.getGroup_step()+1);
		vo.setGroup_tap(tvo.getGroup_tap()+1);
		vo.setRoot(root);
		
		mapper.TempReply_replyInsert(vo);
		System.out.println("돈다 4");
		mapper.TempReplyDepthUpdate(root);
		System.out.println("돈다 5");
	}



	/* 123
	 * public int tempTotalPage() { return mapper.tempTotalPage(); }
	 */
	/*
	 * public List<TempVO> TempCateData(Map map) { return
	 * mapper.TempCateData(map); }
	 * 
	 * public int TempCateTotalPage(int cate) { return
	 * mapper.TempCateTotalPage(cate); }
	 */
	
	public List<TempVO> tempMainList(Map map) {
		return mapper.tempMainList(map);
	}

}
