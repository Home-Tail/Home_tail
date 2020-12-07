package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.AdoptMapper;
import com.sist.vo.AdoptVO;
import com.sist.vo.adopt_newsVO;
@Repository
public class AdoptDAO {
	@Autowired
	private AdoptMapper mapper;
	public List<AdoptVO> adoptListData(Map map) {
		return mapper.adoptListData(map);
	}
	public AdoptVO adoptDetailData(int no) {
		return mapper.adoptDetailData(no);
	}
	public int adoptTotalPage() {
		return mapper.adoptTotalPage();
	}
	public List<adopt_newsVO> adoptnewsData(String finddata) {
		return mapper.adoptnewsData(finddata);
	}
}
