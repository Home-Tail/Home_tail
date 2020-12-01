package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.dao.TempDAO;
import com.sist.vo.BoardVO;
import com.sist.vo.TempVO;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class TempController {
	@Autowired
	private TempDAO dao;

	@RequestMapping("temp/list.do")
	public String Temp_list(String page, Model model) {

		System.out.println("호출");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
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
		// model.addAttribute("main_jsp", "../temp/list.jsp");
		return "temp/list";
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
	public String temp_insert_ok(HttpServletRequest request) throws IOException 
	{
		TempVO vo = new TempVO();
		/*request.setCharacterEncoding("utf-8");*/
		
		String path="C:\\Users\\YOONDO\\springDev\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Hometail\\TempPoster"; 
		String enctype= "UTF-8";  
		int size = 1024 * 1024 * 100;
		MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());
		
	   
	    //아이디
	    vo.setId(mr.getParameter("id"));
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

}
