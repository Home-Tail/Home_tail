package com.sist.web;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.ClinicDAO;
import com.sist.vo.ClinicVO;

@Controller

public class ClinicController {
@Autowired
private ClinicDAO dao;

@RequestMapping("clinic/main.do")
public String main()
{
	return "clinic/main";
}

@RequestMapping("clinic/list.do")
public String clinic_list(String page,Model model)
{
	if(page==null)
		page="1";
	int curpage=Integer.parseInt(page);
	
	int rowSize=10;
	int start = (curpage * rowSize) - (rowSize - 1);
	int end = curpage * rowSize;
	
	
	Map map=new HashMap();
	map.put("start", start);
	map.put("end", end);
	
	List<ClinicVO> list=dao.clinicListData(map);
	int totalPage=dao.clinicTotalPage();
	int BLOCK=5;
	int startPage=((curpage-1)/BLOCK * BLOCK)+1;
	int endPage=((curpage-1)/BLOCK * BLOCK)+BLOCK;
	if(endPage>totalPage)
	{
		endPage=totalPage;
	}
	
	model.addAttribute("startPage", startPage);
	model.addAttribute("endPage", endPage);
	model.addAttribute("curpage", curpage);
	model.addAttribute("totalpage", totalPage);
	model.addAttribute("BLOCK", BLOCK);
	model.addAttribute("list",list);
	return "list";
}

@RequestMapping("clinic/detail.do")
public String clinic_Detail(String no,Model model)
{
	System.out.println("호출");
	ClinicVO vo=dao.clinicDetailData(Integer.parseInt(no));
	model.addAttribute("vo", vo);
	return "clinic/detail";
}
}
