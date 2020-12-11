package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ClinicMapper;
import com.sist.vo.ClinicVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.ReserveVO;
@Repository
public class ClinicDAO {
	@Autowired
	private ClinicMapper mapper;
	public List<ClinicVO> clinicListData(Map map)
	{
		return mapper.clinicListData(map);
	}
	public int clinicTotalPage()
	{
		return mapper.clinicTotalPage();
	}
	
	//=======디테일
	public ClinicVO clinicDetailData(int clno)
	{
		System.out.println("clinicDetailData 실행");
		return mapper.clinicDetailData(clno);
	}
	//============서울시
	public List<ClinicVO> clinicLocationFindData(String gu)
    {
   	 return mapper.clinicLocationFindData(gu);
    }
	
	//========== 댓글
	public void clinicReplyInsert(ReplyVO vo)
	{
		mapper.clinicReplyInsert(vo);
	}
	public List<ReplyVO> clinicReplyList(int clno)
	{
		return mapper.clinicReplyList(clno);
	}
	public void clinicReplyUpdate(ReplyVO vo)
	{
		mapper.clinicReplyUpdate(vo);
	}
	public void clinicReplyDelete(ReplyVO vo)
	{
		mapper.clinicReplyDelete(vo);
	}
	//============== 대댓글
	public void clinicReply_replyInsert(ReplyVO vo,int replyno)
	{
		System.out.println("clinicReply_replyInsert 실행");
		
		ReplyVO pvo=mapper.replyParentData(replyno);
		mapper.replyStepIncrement(pvo);
		
		vo.setGroup_id(pvo.getGroup_id());
		vo.setGroup_step(pvo.getGroup_step()+1);
		vo.setGroup_tap(pvo.getGroup_tap()+1);
		vo.setRoot(replyno);
		mapper.clinicReply_replyInsert(vo);
		mapper.clinicReplyDepthUpdate(replyno);
		System.out.println("왜안되는지 말이라도 해줬으면 싶다");
	}
	//========예약
	public void clinicReserveInsert(ReserveVO rvo)
	{
		System.out.println("clinicReserveInsert 실행");
		mapper.clinicReserveInsert(rvo);
	}
	public List<ReserveVO> clinicReserveList(int resno)
	{
		return mapper.clinicReserveList(resno);
	}
}
