package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
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
		
		List<ReplyVO> frList=dao.findReplyListData(petno);
		System.out.println("frList: "+frList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("rList", rList);
		model.addAttribute("frList", frList);
		return "report/detail";
	}
	
	@RequestMapping("report/around.do")
	public String report_Around()
	{
		List<ReportVO> list = dao.reportAllData();
		System.out.println("around.do list 사이즈:"+list.size());
		
		JSONObject JSresult = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for(ReportVO vo:list)
		{
			JSONObject json = new JSONObject();
			json.put("no",vo.getPetno());
			if(vo.getCate()==1) json.put("title","[실종] "+vo.getTitle());
			if(vo.getCate()==2) json.put("title","[제보] "+vo.getTitle());
			json.put("cate",vo.getCate());
			json.put("poster",vo.getPoster());
			if(vo.getKind()==0) json.put("kind","기타");
			if(vo.getKind()==1) json.put("kind","개");
			if(vo.getKind()==2) json.put("kind","고양이");
			json.put("sub_kind",vo.getSub_kind());
			json.put("sex",vo.getSex());
			json.put("age",vo.getAge());
			json.put("loc",vo.getLoc());
			json.put("map_x",vo.getMap_x());
			json.put("map_y",vo.getMap_y());
			jsonArray.add(json);
		}
		JSresult.put("datas",jsonArray);
		String result=jsonArray.toString();
		
		File file = new File("C:\\Users\\Home_tail\\Hometail\\src\\main\\webapp\\WEB-INF\\report\\reportJson.json");
		try {
			//파일 객체 생성
            FileWriter fw = new FileWriter(file, true);
            //버퍼
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file.getPath()),"UTF-8"));
            //파일안에 문자쓰기
            bw.write(result);
            bw.close();
            
     } catch(IOException e) {
            e.printStackTrace();
     }
		return "report/around";
	}
	
	@RequestMapping("report/insert.do")
	public String report_insert()
	{
		return "report/insert";
	}
	
	@RequestMapping("report/insert_ok.do")
	public String report_insert_ok(ReportVO vo,HttpServletRequest request,HttpSession session)throws IOException{//String cate?
		
		System.out.println("report/insert_ok.do실행");
		String path="C:\\springDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Hometail\\reportposter";
//		String path="C:\\springDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Hometail\\reportposter";
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
		vo.setMap_x(mr.getParameter("map_x"));
		vo.setMap_y(mr.getParameter("map_y"));
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
	
	@RequestMapping("report/delete.do")
	public String report_delete(String no)
	{
		System.out.println("report/delete.do 실행");
		System.out.println("no: "+no);
		int petno=Integer.parseInt(no);
		dao.reportDeleteData(petno);
		return "redirect:../report/main.do";
	}
	
	@RequestMapping("report/update.do")
	public String report_update(String no,Model model)
	{
		System.out.println("report/update.do 실행");
		System.out.println("no: "+no);
		int petno=Integer.parseInt(no);
		ReportVO vo=dao.reportDetailData(petno);
		model.addAttribute("vo", vo);
		return "report/update";
	}
	
	@RequestMapping("report/update_ok.do")
	public String report_update_ok(ReportVO vo,HttpServletRequest request)throws IOException{
		
		System.out.println("report/update_ok.do 실행");
		
		
		String path="C:\\springDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Hometail\\reportposter";
//		String path="C:\\springDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Hometail\\reportposter";
		String enctype= "UTF-8";
		int size = 1024 * 1024 * 100;
		MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());
		
		int petno=Integer.parseInt(mr.getParameter("petno"));
		vo.setPetno(petno);
		vo.setTitle(mr.getParameter("title"));
		vo.setCate(Integer.parseInt(mr.getParameter("cate")));
		vo.setKind(Integer.parseInt(mr.getParameter("kind")));
		vo.setSub_kind(Integer.parseInt(mr.getParameter("sub_kind")));
		vo.setLoc(mr.getParameter("loc"));
		vo.setMap_x(mr.getParameter("map_x"));
		vo.setMap_y(mr.getParameter("map_y"));
		vo.setPoster(mr.getFilesystemName("poster"));
		vo.setPdate(mr.getParameter("pdate"));
		vo.setSex(mr.getParameter("sex"));
		vo.setAge(Integer.parseInt(mr.getParameter("age")));
		vo.setWeight(mr.getParameter("weight"));
		vo.setColor(mr.getParameter("color"));
		vo.setPoint(mr.getParameter("point"));
		vo.setTel(mr.getParameter("tel"));
		vo.setContent(mr.getParameter("content"));
		
//		System.out.println("title"+vo.getTitle());
//		System.out.println("cate: "+mr.getParameter("cate"));
//		System.out.println("kind: "+mr.getParameter("kind"));
//		System.out.println("sub_kind: "+mr.getParameter("sub_kind"));
//		System.out.println("loc: "+mr.getParameter("loc"));
//		System.out.println("map_x: "+mr.getParameter("map_x"));
//		System.out.println("map_y: "+mr.getParameter("map_y"));
//		System.out.println("poster: "+mr.getFilesystemName("poster"));
//		System.out.println("pdate: "+mr.getParameter("pdate")); 
//		System.out.println("sex: "+mr.getParameter("sex"));
//		System.out.println("age: "+mr.getParameter("age"));
//		System.out.println("weight: "+mr.getParameter("weight"));
//		System.out.println("color: "+mr.getParameter("color"));
//		System.out.println("point: "+mr.getParameter("point"));
//		System.out.println("tel: "+mr.getParameter("tel"));
//		System.out.println("content: " + mr.getParameter("content"));
		
		
		dao.reportUpdateData(vo);
		
		return "redirect:../report/detail.do?no="+petno;
	}
	
	// 댓글
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
	
	
	
		// 목격댓글
		@RequestMapping("report/find_reply_insert.do")
		public String report_find_reply_insert(int petno,String pdate, String content,String loc,String map_x2,String map_y2,HttpSession session){
			
			System.out.println("find_reply_insert.do실행");
			
			String id=(String)session.getAttribute("id");
//			System.out.println("id: "+id);
//			System.out.println("petno: "+petno);
//			System.out.println("content: "+content);
//			System.out.println("pdate: "+pdate);
//			System.out.println("loc: "+loc);
//			System.out.println("map_x: "+map_x2);
//			System.out.println("map_y: "+map_y2);
			
			ReplyVO frvo=new ReplyVO();
			frvo.setId(id);
			frvo.setPetno(petno);
			frvo.setContent(content);
			frvo.setLoc(loc);
			frvo.setMap_x(map_x2);
			frvo.setMap_y(map_y2);
			dao.findReplyInsertData(frvo);
			return "redirect:../report/detail.do?no="+petno;
		}
		
		@RequestMapping("report/find_reply_delete.do")
		public String report_find_reply_delete(String frno,String pno){
			
			System.out.println("find_reply_delete.do 실행");
			System.out.println("frno,pno: "+frno+","+pno);
			int petno=Integer.parseInt(pno);
			int replyno=Integer.parseInt(frno);
			dao.findReplyDeleteData(replyno);
			return "redirect:../report/detail.do?no="+petno;
		}
		
		@RequestMapping("report/find_reply_update.do")
		public String report_find_reply_update(String frno,String pno,String pdate,String content,String loc,String map_x2,String map_y2){
			
			System.out.println("find_reply_update.do 실행");
			System.out.println("frno,pno: "+frno+","+pno);
			int petno=Integer.parseInt(pno);
			int replyno=Integer.parseInt(frno);
			System.out.println("petno: "+petno);
			System.out.println("replyno: "+replyno);
			System.out.println("content: "+content);
			System.out.println("pdate: "+pdate);
			System.out.println("loc: "+loc);
			System.out.println("map_x: "+map_x2);
			System.out.println("map_y: "+map_y2);
			
//			ReplyVO frvo=new ReplyVO();
//			frvo.setContent(content);
//			frvo.setReplyno(replyno);
//			dao.findReplyUpdateData(frvo);
			return "redirect:../report/detail.do?no="+petno;
		}
	
}

