package com.sist.dao;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.ReportMapper;
import com.sist.vo.ReportVO;

@Repository
public class ReportDAO {
	 @Autowired
     private ReportMapper mapper;
     
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
}
