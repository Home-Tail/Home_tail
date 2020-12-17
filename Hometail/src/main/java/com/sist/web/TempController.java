package com.sist.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.dao.TempDAO;
import com.sist.vo.ReplyVO;
import com.sist.vo.TempVO;

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
			
		   /* for(TempVO vo:List)
			   {
					int count= dao.Reply_count(vo.getPetno());
					//System.out.println("count는"+count);
			   		vo.setReply_count(count);
			   }*/
			
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
		
		List<ReplyVO> trList = dao.TempreplyListData(Integer.parseInt(no));
		System.out.println("사이즈"+trList.size());
		model.addAttribute("trList",trList);
		model.addAttribute("vo", vo);

		return "temp/detail";

	}

	@RequestMapping("temp/insert.do")
	public String temp_insert() {
		return "temp_insert";
	}

	@RequestMapping("temp/insert_ok.do")
	public String temp_insert_ok(HttpServletRequest request, HttpSession session) throws IOException  
   
	{
		TempVO vo = new TempVO();
		/*request.setCharacterEncoding("utf-8");*/
		
		String path="C:\\Users\\YOONDO\\springDev\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Hometail\\TempPoster"; 
		File Folder = new File(path);

		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try{
				Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
			    } 
			catch(Exception e){
			    e.getStackTrace();
			}        
			}else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
			}
		
		
		String enctype= "UTF-8";  
		
		String id = String.valueOf( session.getAttribute("id"));
		
		int size = 1024 * 1024 * 100;
		MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());
		
/*		String str = request.getParameter("str");
		if(str == null || str.trim().equals("")){
		str = "0";
		}*/
		
	    //아이디 
	    vo.setId(id); 
	    //제목
	    vo.setTitle(mr.getParameter("title"));
	    //카테
	    vo.setCate(Integer.parseInt(mr.getParameter("cate")));
	    System.out.println("카테는~!@#@!$@#$%!@"+vo.getCate());
	    
	    /*int cno=Integer.parseInt(cate);*/
	    //날짜
//	    vo.setDb_pdate(mr.getParameter("db_pdate"));
	    vo.setDb_pdate("2020-00-00");
	    //위치
	    vo.setLoc(mr.getParameter("loc"));
	    //내용
	    vo.setContent(mr.getParameter("content"));
	    //번호
	    vo.setTel(mr.getParameter("tel"));
	    //사진
		vo.setPoster(mr.getFilesystemName("poster"));

		vo.setMap_x(mr.getParameter("map_x"));
		System.out.println("x좌표 ~!@#@!$@#$%!@"+vo.getMap_x());
		
		vo.setMap_y(mr.getParameter("map_y"));
		System.out.println("y좌표 ~!@#@!$@#$%!@"+vo.getMap_y());
		
//		System.out.println("아이디"+vo.getId());
//		System.out.println("제목"+vo.getTitle());
//		System.out.println("카테"+vo.getCate());
//		System.out.println("사진"+vo.getPoster());
//		System.out.println("날짜"+vo.getDb_pdate());
//		System.out.println("위치"+vo.getLoc());
//		System.out.println("텔"+vo.getTel());
//		System.out.println("콘텐츠" + vo.getContent());
		dao.TempInsertData(vo);
		return "redirect:../temp/main.do";
	}
	
	@RequestMapping("temp/update.do")
	public String temp_update(HttpServletRequest request,int petno,Model model)
	   {
		System.out.println("update호출!!");
		System.out.println("petno"+petno);
		TempVO vo = dao.TempDetailData(petno);
		System.out.println("vo"+vo.getContent());
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
		   
		   String path="C:\\Users\\YOONDO\\springDev\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Hometail\\TempPoster"; 
//		   String path="C:\\SpringDev\\SpringStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Hometail\\TempPoster"; 
		   File Folder = new File(path);

			// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
			if (!Folder.exists()) {
				try{
					Folder.mkdir(); //폴더 생성합니다.
				    System.out.println("폴더가 생성되었습니다.");
				    } 
				catch(Exception e){
				    e.getStackTrace();
				}        
				}else {
				System.out.println("이미 폴더가 생성되어 있습니다.");
				}
			
			String enctype= "UTF-8";  
			int size = 1024 * 1024 * 100;
			System.out.println("돌아감");
			MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());
			System.out.println("돌아감2");
			
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
			    vo.setMap_x(mr.getParameter("map_x"));
				vo.setMap_y(mr.getParameter("map_y"));
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
	   
	   
	   // 대댓글
	   @RequestMapping("temp/reply_reply_insert.do")
	   public String temp_reply_reply_insert(ReplyVO vo,HttpSession session)
	   {
		   String id= String.valueOf(session.getAttribute("id"));
		   vo.setId(id);
		   
			System.out.println("temp 대댓글");
			System.out.println(vo.getReplyno());
			System.out.println(vo.getPetno());
			System.out.println(vo.getId());
			System.out.println(vo.getContent());
			dao.TempReply_reply_Insert(vo,vo.getReplyno());
			
		   return "redirect:../temp/detail.do?no="+vo.getPetno();
		   
	   }
	   
	   //댓글 입력
	   @RequestMapping("temp/reply_insert.do")
	   public String temp_reply_insert(int petno,String content,HttpServletRequest request)
	   {
		   
		   ReplyVO rvo=new ReplyVO();
		   //vo.setRoot(Integer.parseInt(no));
		  
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		
		   rvo.setId(id);
		   rvo.setPetno(petno);
		   rvo.setContent(content);
		   // DB연동 
		   dao.TempreplyInsertData(rvo);
		   return "redirect:../temp/detail.do?no="+petno;
		   
	   }
	  @RequestMapping("temp/reply_update.do")
	   public String reply_update(int petno, HttpServletRequest request,ReplyVO vo)
	   {
		  
//		   ReplyVO rvo=new ReplyVO();
//		   String id=request.getParameter("id"); 
//		   String bno=request.getParameter("bno");
//		   String msg=request.getParameter("msg");
		   // DB => UPDATE
//		   rvo.setPetno(petno);
//		   rvo.setContent();		   
		  System.out.println("petno  :"+vo.getPetno());
		  System.out.println("replyno:"+vo.getReplyno());
		   dao.TempreplyUpdateData(vo);
		   return "redirect:../temp/detail.do?no="+petno;
	   }
	  
	   @RequestMapping("temp/reply_delete.do")
	   public String reply_delete(ReplyVO vo,HttpServletRequest request)
	   {
		   System.out.println("?? "+vo.getPetno());
		   System.out.println("?? "+vo.getReplyno());
		   System.out.println("?? "+vo.getRoot());
		   dao.TempreplyDeleteData(vo,vo.getRoot());
		   return "redirect:../temp/detail.do?no="+vo.getPetno();
	   }

	  }
