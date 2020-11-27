package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sist.dao.ReportDAO;
import com.sist.vo.ClinicVO;
import com.sist.vo.ReportVO;

import java.util.*;

@Controller
public class ReportController {
	@Autowired
	private ReportDAO dao;
	
	@RequestMapping("report/test.do")
	public String report_test()
	{
		return "report/test";
	}
	
	@RequestMapping("report/main.do")
	public String report_main()
	{
		return "report/main";
	}
	
	
	@RequestMapping("report/list.do")
	public String report_list(String page,int cate,Model model)
	{
		System.out.println("report/list.do 실행");
		 if(page==null)
			  page="1";
		 int curpage=Integer.parseInt(page);
		 
		 //전체보기
		 if(cate==0)
		 {
			 System.out.println("cate==0");
			 Map map=new HashMap();
			 int rowSize=8;
			 int start=(rowSize*curpage)-(rowSize-1);
			 int end=rowSize*curpage;
			 map.put("start", start);
			 map.put("end", end);
			 List<ReportVO> list=dao.reportListData(map);
			 int totalpage=dao.reportTotalPage();
			 int BLOCK=5;
			 int startPage=((curpage-1)/BLOCK*BLOCK)+1;    
			 int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; 
		       		if(endPage>totalpage)
		       			endPage=totalpage;
		       		
       		 model.addAttribute("curpage", curpage);
	   		 model.addAttribute("totalpage", totalpage);
	   		 model.addAttribute("list", list);
	   		 model.addAttribute("startPage", startPage);
	   		 model.addAttribute("endPage", endPage);
	   		 model.addAttribute("BLOCK", BLOCK);			     
		 }
		 
		 //카테고리별 보기
		 if(cate!=0)
		 {
			 System.out.println("cate!=0");
			 Map map=new HashMap();
			 int rowSize=8;
			 int start=(rowSize*curpage)-(rowSize-1);
			 int end=rowSize*curpage;
			 map.put("start", start);
			 map.put("end", end);
			 map.put("cate", cate);
			 List<ReportVO> list=dao.reportCateData(map);
			 int totalpage=dao.reportCateTotalPage(cate);
			 int BLOCK=5;
			 int startPage=((curpage-1)/BLOCK*BLOCK)+1;    
			 int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; 
		       		if(endPage>totalpage)
		       			endPage=totalpage;
		       		
       		 model.addAttribute("curpage", curpage);
	   		 model.addAttribute("totalpage", totalpage);
	   		 model.addAttribute("list", list);
	   		 model.addAttribute("startPage", startPage);
	   		 model.addAttribute("endPage", endPage);
	   		 model.addAttribute("BLOCK", BLOCK);			     
		 }
		 
		  return "report_list";
	}
	
	@RequestMapping("report/detail.do")
	public String report_Detail(String no,Model model)
	{
		
		ReportVO vo=dao.reportDetailData(Integer.parseInt(no));
		model.addAttribute("vo", vo);
		
		return "report/detail";
	}
	
	
}

