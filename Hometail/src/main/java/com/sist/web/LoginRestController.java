package com.sist.web;

import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.LoginDAO;
import com.sist.vo.MemberVO;

@RestController
public class LoginRestController {
   @Autowired
   private LoginDAO dao;
   @RequestMapping("main/login.do")
   public String main_login(String id,String pwd,HttpSession session)
   {
	   String result="";
	   MemberVO vo = new MemberVO();
	   
	   int count=dao.isLogin(id);
	   System.out.println("아이디 존재 여부"+count);
	   //count가 0이면 NOID
	   if(count==0)
	   {
		   result="1";
	   }
	   else
	   {
		   vo=dao.Login_info(id);
		  //ㅏ아이디 있을때 처리  
		   if(vo.getPassword().equals(pwd))
		   {
			   result="3";
			   
			   System.out.println("비밀번호"+vo.getPassword());
			   System.out.println("이름"+vo.getName());
			   System.out.println("아이디 뭐지"+vo.getId());
			   session.setAttribute("id",vo.getId());
			   session.setAttribute("name", vo.getName());
		   }
		   else
		   {
			   result="2";
		   }
	   }
	   return result;
   }

}




