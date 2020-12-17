package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.BoardDAO;
import com.sist.dao.CenterServiceDAO;
import com.sist.dao.ClinicDAO;
import com.sist.dao.MemberDAO;
import com.sist.dao.ReportDAO;
import com.sist.dao.TempDAO;
import com.sist.vo.BoardVO;
import com.sist.vo.CenterVO;
import com.sist.vo.Center_reserveVO;
import com.sist.vo.ClinicVO;
import com.sist.vo.ReportVO;
import com.sist.vo.TempVO;

import java.util.*;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {
	@Autowired
	private CenterServiceDAO dao;
	
	@Autowired
	private BoardDAO bdao;
	
	@Autowired
	private TempDAO tdao;

	@Autowired
	private ClinicDAO cdao;
	
	@Autowired
	private ReportDAO rdao;
	
	@RequestMapping("main/main.do")
	public String main_main(String page, Model model, HttpSession session,Map map) {
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
		
		//각각 사진별 요청 보호소 갯수 구하는 부분
		String arr[] = {"newspaper_marker.png","canned-food_marker.png","meat_marker.png","clothes_marker.png","blanket_marker.png"};
		String poster_count[]={"","","","",""};
		List<CenterVO> count_list = new ArrayList<CenterVO>();
		for(int i=0;i<=4;i++)
		{
			count_list = dao.poster_count(arr[i]);
			poster_count[i]=String.valueOf(count_list.size());
		}
		//==========================
		
		
		// 센터 / 보호소 별 봉사 횟수와 전체 비율
		List<Center_reserveVO> service_shelter_count= dao.reserve_center_count();
		List<Center_reserveVO> service_center_count= dao.reserve_shelter_count();
		//봉사 횟수
		int total_shelter_service = service_shelter_count.size();
		int total_center_service = service_center_count.size();
		// 센터 / 봉사 기관 수
		List<CenterVO> shelter_count = dao.total_shelter_count();
		int total_shelter = shelter_count.size();
		int total_center = dao.total_center_count();
		//============================================
		
		
		// 정희진님 메인
	    List<BoardVO> bList=bdao.mainBoardList();
	    model.addAttribute("bList", bList);
	    //=====================
	    
	    // 윤도님 메인
	    if(session.getAttribute("id")!=null)
	      {
	         String id = String.valueOf(session.getAttribute("id"));
	         count = dao.msg_check(id);
	         System.out.println("값"+count);
	         
	         rlist=dao.msg_data(id);
	      }
	      model.addAttribute("rlist",rlist);
	      model.addAttribute("count",count);
	   // ===========

	    // 임시보호
	      List<TempVO> tList = tdao.tempMainList(map);
	      System.out.println("됩니당");
	      model.addAttribute("tList",tList);
	    // ===========
	      
	    // 수정님 메인
	      Map map2=new HashMap();
	      List<ClinicVO> cntlist=cdao.clinicCntList(map2);
	      model.addAttribute("cntlist",cntlist);
	    // ============
	      
	   // 석주 메인
	      List<ReportVO> rList=rdao.mainBoardList();
	      Collections.shuffle(rlist);
	      model.addAttribute("rList", rList);
	    // ============
	      
		model.addAttribute("total_shelter_service",total_shelter_service);
		model.addAttribute("total_center_service",total_center_service);
		model.addAttribute("total_shelter",total_shelter);
		model.addAttribute("total_center",total_center);
		model.addAttribute("poster_count",poster_count);
		model.addAttribute("rlist",rlist);
		model.addAttribute("count",count);
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
