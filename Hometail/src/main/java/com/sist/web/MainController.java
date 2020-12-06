package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.MemberDAO;

import java.util.*;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {
	@Autowired
	private MemberDAO dao;
	@RequestMapping("main/main.do")
	public String main_main(String page, Model model, HttpSession session) {
		System.out.println("아이디" + session.getAttribute("id"));
		System.out.println("이름" + session.getAttribute("name"));
		int count=0;
		if(session.getAttribute("id")!=null)
		{
			String id = String.valueOf(session.getAttribute("id"));
			count = dao.msg_check(id);
			System.out.println("값"+count);
		}
		model.addAttribute("count",count);
		return "main";
	}

	@RequestMapping("adopt/list.do")
	public String adopt_list() {
		return "adopt/list";
	}

	@RequestMapping("main/logout.do")
	public String main_logout(HttpSession session) {
		session.invalidate();

		return "redirect:main.do";
	}
}
