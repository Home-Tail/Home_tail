package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ClinicMapper;
import com.sist.vo.ClinicVO;
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
}
