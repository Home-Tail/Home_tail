package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.AdoptMapper;
import com.sist.vo.AdoptVO;
//import com.sist.vo.adopt_newsVO;
@Repository
public class AdoptDAO {
	@Autowired
	private AdoptMapper mapper1;
	public List<AdoptVO> adoptListData(Map map) {
		return mapper1.adoptListData(map);
	}
	public AdoptVO adoptDetailData(int no) {
		return mapper1.adoptDetailData(no);
	}
	public int adoptTotalPage() {
		return mapper1.adoptTotalPage();
	}
	/*public List<adopt_newsVO> adoptnewsData(String finddata) {
		return mapper.adoptnewsData(finddata);
	}*/
}
