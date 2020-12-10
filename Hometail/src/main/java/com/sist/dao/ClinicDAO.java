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
	
	public ClinicVO clinicDetailData(int clno)
	{
		return mapper.clinicDetailData(clno);
	}
	
	public List<ClinicVO> clinicLocationFindData(String gu)
    {
   	 return mapper.clinicLocationFindData(gu);
    }
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
	public void clinicReserveInsert(ReserveVO vo)
	{
		mapper.clinicReserveInsert(vo);
	}
	public List<ReserveVO> clinicReserveList(int resno)
	{
		return mapper.clinicReserveList(resno);
	}
}
