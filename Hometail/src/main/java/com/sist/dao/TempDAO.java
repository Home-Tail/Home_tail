package com.sist.dao;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.TempMapper;
import com.sist.vo.BoardVO;
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
	
	public TempVO TempInsertData(TempVO vo)
	{
		return mapper.TempInsertData(vo);
	}

	/*
	 * public int tempTotalPage() { return mapper.tempTotalPage(); }
	 */
	/*
	 * public List<TempVO> TempCateData(Map map) { return
	 * mapper.TempCateData(map); }
	 * 
	 * public int TempCateTotalPage(int cate) { return
	 * mapper.TempCateTotalPage(cate); }
	 */

}
