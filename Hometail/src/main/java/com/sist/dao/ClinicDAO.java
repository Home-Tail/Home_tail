package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ClinicMapper;
import com.sist.vo.ClinicVO;
import com.sist.vo.ReplyVO;
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
	
}
