package com.sist.web;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.dao.ReportDAO;
import com.sist.vo.ReportVO;

@RestController
public class ReportController2 {
	@Autowired
	private ReportDAO dao;
	
	/*
	@RequestMapping("report/insert_ok.do")
	public String report_insert_ok(ReportVO vo,HttpServletRequest request,HttpSession session)throws IOException{//String cate?
		
		System.out.println("report/insert_ok.do실행");
		
		String path="C:\\springDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Hometail\\reportposter";
		String enctype= "UTF-8";
		int size = 1024 * 1024 * 100;
		MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());
		
		String id=(String)session.getAttribute("id");
		
		System.out.println("id"+vo.getId());
		System.out.println("title"+vo.getTitle());
		System.out.println("cate"+vo.getCate());
		System.out.println("kind"+vo.getKind());
		System.out.println("sub_kind"+vo.getSub_kind());
		System.out.println("loc"+vo.getLoc());
		System.out.println("poster"+vo.getPoster());
		System.out.println("pdate"+vo.getPdate());
		System.out.println("sex"+vo.getSex());
		System.out.println("age"+vo.getAge());
		System.out.println("weight"+vo.getWeight());
		System.out.println("color"+vo.getColor());
		System.out.println("point"+vo.getPoint());
		System.out.println("tel"+vo.getTel());
		System.out.println("content" + vo.getContent());
		
//		vo.setId(id);
//		vo.setPoster(mr.getFilesystemName("poster"));
		
		
//		dao.reportInsert(vo);
		return "redirect:../report/list.do";
	}
	
	
	@RequestMapping("report/around_list.do")
	public String report_Around_list()
	{
		System.out.println("report/around_list.do 실행");
		List<ReportVO> list=dao.reportAllData();
		System.out.println(list.size());
		
		return list;
	}
	*/
}
