package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.dao.ReportDAO;
import com.sist.vo.ClinicVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.ReportVO;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		System.out.println("report_deatil.do 실행");
		System.out.println("no: "+no);
		int petno=Integer.parseInt(no);
		ReportVO vo=dao.reportDetailData(petno);
		List<ReplyVO> rList=dao.replyListData(petno);	
		System.out.println("relist: "+rList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("rList", rList);
		return "report/detail";
	}
	
	@RequestMapping("report/around.do")
	public String report_Around()
	{
		return "report/around";
	}
	
	@RequestMapping("report/insert.do")
	public String report_Detail_Insert()
	{
		return "report/insert";
	}
	
	@RequestMapping("report/insert_ok.do")
	public String report_insert_ok(ReportVO vo,HttpServletRequest request,HttpSession session)throws IOException{//String cate?
		
		System.out.println("report/insert_ok.do실행");
		String path="C:\\springDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Hometail\\reportposter";
		String enctype= "UTF-8";
		int size = 1024 * 1024 * 100;
		MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());
		
		String id=(String)session.getAttribute("id");
		
		vo.setId(id);
		vo.setTitle(mr.getParameter("title"));
		vo.setCate(Integer.parseInt(mr.getParameter("cate")));
		vo.setKind(Integer.parseInt(mr.getParameter("kind")));
		vo.setSub_kind(Integer.parseInt(mr.getParameter("sub_kind")));
		vo.setLoc(mr.getParameter("loc"));
		vo.setPoster(mr.getFilesystemName("poster"));
		vo.setPdate(mr.getParameter("pdate"));
		vo.setSex(mr.getParameter("sex"));
		vo.setAge(Integer.parseInt(mr.getParameter("age")));
		vo.setWeight(mr.getParameter("weight"));
		vo.setColor(mr.getParameter("color"));
		vo.setPoint(mr.getParameter("point"));
		vo.setTel(mr.getParameter("tel"));
		vo.setContent(mr.getParameter("content"));
		
		dao.reportInsertData(vo);
		return "redirect:../report/main.do";
	}
	
	@RequestMapping("report/reply_insert.do")
	public String report_reply_insert(int petno,String content,HttpSession session){
		
		System.out.println("reply_insert.do실행");
		
		String id=(String)session.getAttribute("id");
		
		System.out.println("id: "+id);
		System.out.println("petno: "+petno);
		System.out.println("content: "+content);
		
		ReplyVO rvo=new ReplyVO();
		rvo.setId(id);
		rvo.setPetno(petno);
		rvo.setContent(content);
		dao.replyInsertData(rvo);
		return "redirect:../report/detail.do?no="+petno;
	}
	
	@RequestMapping("report/reply_delete.do")
	public String report_reply_delete(String rno,String pno){
		
		System.out.println("reply_delete.do 실행");
		System.out.println("rno,pno: "+rno+","+pno);
		int petno=Integer.parseInt(pno);
		int replyno=Integer.parseInt(rno);
		dao.replyDeleteData(replyno);
		return "redirect:../report/detail.do?no="+petno;
	}
	
	@RequestMapping("report/reply_update.do")
	public String report_reply_update(String rno,String pno,String content){
		
		System.out.println("reply_update.do 실행");
		System.out.println("rno,pno: "+rno+","+pno);
		int petno=Integer.parseInt(pno);
		int replyno=Integer.parseInt(rno);
		ReplyVO rvo=new ReplyVO();
		rvo.setContent(content);
		rvo.setReplyno(replyno);
		dao.replyUpdateData(rvo);
		return "redirect:../report/detail.do?no="+petno;
	}
	
}

