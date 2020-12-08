package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.dao.TempDAO;
import com.sist.vo.TempVO;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class TempController {
	@Autowired
	private TempDAO dao;
	
	@RequestMapping("temp/main.do")
	public String temp_main()
	{
		return "temp/main";
	}

	@RequestMapping("temp/list.do")
	public String Temp_list(String page, int cate, Model model) {

		System.out.println("list호출");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		
		 //전체보기
		 if(cate==0)
		 {			
			 System.out.println("cate==0");
			Map map = new HashMap();
			int rowSize = 12;
			int start = (rowSize * curpage) - (rowSize - 1);
			int end = rowSize * curpage;
			map.put("start", start);
			map.put("end", end);
			List<TempVO> list = dao.TempListData(map);
			int totalpage = dao.TempTotalPage();
			// �쟾�넚
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
			 List<TempVO> list=dao.TempCateData(map);
			 int totalpage=dao.TempCateTotalPage(cate);
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
		return "temp_list";
	}

	@RequestMapping("temp/detail.do")
	public String Temp_Detail(String no, Model model) {

		TempVO vo = dao.TempDetailData(Integer.parseInt(no));
		model.addAttribute("vo", vo);

		return "temp/detail";

	}

	@RequestMapping("temp/insert.do")
	public String temp_insert() {
		return "temp/insert";
	}

	@RequestMapping("temp/insert_ok.do")
	public String temp_insert_ok(HttpServletRequest request, HttpSession session) throws IOException 
	{
		TempVO vo = new TempVO();
		/*request.setCharacterEncoding("utf-8");*/
		
		String path="C:\\Users\\YOONDO\\springDev\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Hometail\\TempPoster"; 
		String enctype= "UTF-8";  
		
		String id = String.valueOf( session.getAttribute("id"));
		
		int size = 1024 * 1024 * 100;
		MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());
		
	   
	    //아이디
	    vo.setId("id");
	    //제목
	    vo.setTitle(mr.getParameter("title"));
	    //카테
	    vo.setCate(Integer.parseInt(mr.getParameter("cate")));
	    //날짜
	    vo.setDb_pdate(mr.getParameter("db_pdate"));
	    //위치
	    vo.setLoc(mr.getParameter("loc"));
	    //내용
	    vo.setContent(mr.getParameter("content"));
	    //번호
	    vo.setTel(mr.getParameter("tel"));
	    //사진
		vo.setPoster(mr.getFilesystemName("poster"));
		
//		System.out.println("아이디"+vo.getId());
//		System.out.println("제목"+vo.getTitle());
//		System.out.println("카테"+vo.getCate());
//		System.out.println("사진"+vo.getPoster());
//		System.out.println("날짜"+vo.getDb_pdate());
//		System.out.println("위치"+vo.getLoc());
//		System.out.println("텔"+vo.getTel());
//		System.out.println("콘텐츠" + vo.getContent());
		dao.TempInsertData(vo);
		return "redirect:../temp/list.do";
	}
	
	@RequestMapping("temp/update.do")
	public String temp_update(HttpServletRequest request,int petno,Model model)
	   {
		System.out.println("update호출!!");
		System.out.println("petno"+petno);
		TempVO vo = dao.TempDetailData(petno);
		
		model.addAttribute("vo",vo);
		  return "temp/update";
	   }
	
	 @RequestMapping("temp/update_ok.do")
	   public String temp_update_ok(HttpServletRequest request) throws IOException
	   {
		 TempVO vo = new TempVO();
		   try {
				request.setCharacterEncoding("UTF-8");
			   } catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			   }
		   
//		   String path="C:\\Users\\YOONDO\\springDev\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Hometail\\TempPoster"; 
		   String path="C:\\SpringDev\\SpringStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\Hometail"; 
			String enctype= "UTF-8";  
			int size = 1024 * 1024 * 100;
			MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());
			
			System.out.println(mr.getParameter("no"));
			System.out.println(mr.getParameter("db_pdate"));
			System.out.println(mr.getParameter("cate"));
			System.out.println(mr.getParameter("title"));
			System.out.println(mr.getParameter("loc"));
			System.out.println(mr.getParameter("tel"));
			System.out.println(mr.getFilesystemName("poster"));
			System.out.println(mr.getParameter("content"));
			
			String petno=mr.getParameter("no");
			String db_pdate=mr.getParameter("db_pdate");
			String cate=mr.getParameter("cate");
			String title=mr.getParameter("title");
			String loc=mr.getParameter("loc");
			String tel=mr.getParameter("tel");
			String poster=mr.getFilesystemName("poster");
			String content=mr.getParameter("content");
			    
			    vo.setTitle(title);
			    vo.setTel(tel);
			    vo.setLoc(loc);
			    vo.setPoster(poster);
			    vo.setContent(content);
			    vo.setDb_pdate(db_pdate);
			    vo.setCate(Integer.parseInt(cate));
			    vo.setPetno(Integer.parseInt(petno));
		 
		    dao.TempUpdateData(vo);
		   return "redirect:../temp/detail.do?no="+petno;
	   }
	
	   
	   
	   @RequestMapping("temp/delete_ok.do")
	   public String temp_delete_ok(HttpServletRequest request, int petno) throws IOException 
	   {
	      dao.TempDeleteData(petno);
	      return "redirect:../temp/main.do";
	   }


}





