package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.AdoptDAO;
import com.sist.vo.AdoptVO;
//import com.sist.vo.adopt_newsVO;

@Controller
@RequestMapping("adopt/")
//14TgnPt3OEfqQoUdJkyU
//ToQcRMWa8c
public class AdoptController {
	@Autowired
	private AdoptDAO adao;
	// GET , POST (form,ajax)
	@GetMapping("list.do")
	public String adopt_list(String page,Model model) {
		if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   Map map=new HashMap();
		   int rowSize=12;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   map.put("start", start);
		   map.put("end", end);
		   List<AdoptVO> list=adao.adoptListData(map);
		   int totalpage=adao.adoptTotalPage();
		   // 전송 
		   int BLOCK = 6;
			int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
			int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
			if (endPage > totalpage)
				endPage = totalpage;
		  model.addAttribute("list", list);
		  model.addAttribute("curpage", curpage);
		  model.addAttribute("totalpage", totalpage);
		  model.addAttribute("BLOCK", BLOCK);
		  model.addAttribute("startPage", startPage);
		  model.addAttribute("endPage", endPage);
		  //model.addAttribute("main_jsp", "../adopt/list.jsp");
		   return "adopt/list";
	}
	@RequestMapping("process.do")
	public String adopt_process() {
		return "adopt/process";
	}
	@RequestMapping("detail.do")
	public String adopt_detail(int no,Model model) {
		AdoptVO vo=adao.adoptDetailData(no);
		
		//String punumber=vo.getPunumber();
		//StringTokenizer st=new StringTokenizer(punumber,"-");
		//String result="";
		//List<adopt_newsVO> list=adao.adoptnewsData(result);
		model.addAttribute("vo", vo);
		//model.addAttribute("list", list);
		return "adopt/detail";
	}
}
