package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.CenterServiceDAO;
import com.sist.dao.MemberDAO;
import com.sist.dao.TempDAO;
import com.sist.vo.Center_reserveVO;
import com.sist.vo.TempVO;

import java.util.*;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {
	@Autowired
	private CenterServiceDAO dao;
	@Autowired
	private TempDAO tdao;
	
	@RequestMapping("main/main.do")
	public String main_main(String page, Model model, HttpSession session, Map map) {
		System.out.println("아이디" + session.getAttribute("id"));
		System.out.println("이름" + session.getAttribute("name"));
		int count=0;
		List<Center_reserveVO> rlist = new ArrayList<Center_reserveVO>();
		

		if(session.getAttribute("id")!=null)
		{
			String id = String.valueOf(session.getAttribute("id"));
			count = dao.msg_check(id);
			System.out.println("값"+count);
			
			rlist=dao.msg_data(id);
		}
		model.addAttribute("rlist",rlist);
		model.addAttribute("count",count);

		// 임시보호
		List<TempVO> tList = tdao.tempMainList(map);
		System.out.println("됩니당");
		model.addAttribute("tList",tList);
		
		return "main";
	}

	@RequestMapping("main/logout.do")
	public String main_logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:main.do";
	}
	
	@RequestMapping("main/msg_check.do")
	public String msg_check(HttpSession session,String no) {
		
		
		Center_reserveVO vo = new Center_reserveVO();
		try{
			
		
		System.out.println("no값은?"+no);
//		System.out.println("호출");
		
		String id = String.valueOf(session.getAttribute("id"));
		vo.setId(id);
		StringTokenizer st = new StringTokenizer(no,",");
		while(st.hasMoreTokens())
		{	
			String temp = String.valueOf(st.nextElement());
			vo.setNo(Integer.parseInt(temp));
			System.out.println("vo값"+vo.getNo());
			System.out.println("id값"+vo.getId());
			dao.check_update(vo);
		}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "redirect:main.do";
	}
}
