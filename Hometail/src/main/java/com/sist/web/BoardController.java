package com.sist.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.vo.ReplyVO;
import com.sist.dao.BoardDAO;
import com.sist.news.Item;
import com.sist.news.NewsManager;
import com.sist.vo.BoardVO;

import oracle.jdbc.OracleTypes;

@Controller
public class BoardController {
	@Autowired
	private BoardDAO dao;
	@Autowired
	private NewsManager mgr;
	@RequestMapping("board/list.do")
	public String board_board_list(String page,Model model)
	{
		/*
		if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   
		     Map map=new HashMap();
			 int rowSize=8;
			 int start=(rowSize*curpage)-(rowSize-1);
			 int end=rowSize*curpage;
			 map.put("start", start);
			 map.put("end", end);
			 List<BoardVO> fList=dao.freeBoardListData(curpage);
			 int totalpage=dao.boardTotalPage();
			 int BLOCK=5;
			 int startPage=((curpage-1)/BLOCK*BLOCK)+1;    
			 int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; 
		       		if(endPage>totalpage)
		       			endPage=totalpage;
		   
		   List<BoardVO> list=dao.aReviewBoardListData(curpage);
		   List<BoardVO> qList=dao.qnaBoardListData(curpage);
		   model.addAttribute("list", list);
		   model.addAttribute("fList", fList);
		   model.addAttribute("qList", qList);
		   */
		   return "board/list";
	}
	@RequestMapping("board/cboard_list.do")
	public String board_cboard_list(String page,Model model,String no,String board_no)
	{
		if(no==null)
		{
			System.out.println("no는 null");
			no="1";
		} 


		if(page==null)
			   page="1";
		
		   int curpage=Integer.parseInt(page);
		   int acurpage=Integer.parseInt(page);
		   int qcurpage=Integer.parseInt(page);
		   
			 int BLOCK=5;
			 
			 int fTotalpage=dao.freeboardTotalPage();
			 int aTotalpage=dao.areviewboardTotalPage();
			 int qTotalpage=dao.qnaboardTotalPage();
			 int startPage=((curpage-1)/BLOCK*BLOCK)+1; 
			 int astartPage=((acurpage-1)/BLOCK*BLOCK)+1; 
			 int qstartPage=((qcurpage-1)/BLOCK*BLOCK)+1;    
			 int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; 
			 int aendPage=((acurpage-1)/BLOCK*BLOCK)+BLOCK; 
			 int qendPage=((qcurpage-1)/BLOCK*BLOCK)+BLOCK; 
		       		if(endPage>fTotalpage)
		       			endPage=fTotalpage;
		       		if(aendPage>aTotalpage)
		       			aendPage=aTotalpage;
		       		if(qendPage>qTotalpage)
		       			qendPage=qTotalpage;
		       		
		   List<BoardVO> fList=dao.freeBoardListData(curpage);		       		
		   List<BoardVO> rList=dao.aReviewBoardListData(acurpage); 
		   List<BoardVO> qList=dao.qnaBoardListData(qcurpage);
		   
		   for(BoardVO vo:fList)
		   {
				int count= dao.Reply_count(vo.getBoard_no());
				//System.out.println("count는"+count);
		   		vo.setReply_count(count);
		   }
		   for(BoardVO vo:rList)
		   {
				int count= dao.Reply_count(vo.getBoard_no());
				//System.out.println("count는"+count);
		   		vo.setReply_count(count);
		   }
		   for(BoardVO vo:qList)
		   {
				int count= dao.Reply_count(vo.getBoard_no());
				//System.out.println("count는"+count);
		   		vo.setReply_count(count);
		   }
		   model.addAttribute("no", no);
		   model.addAttribute("rList", rList);
		   model.addAttribute("fList", fList);
		   model.addAttribute("qList", qList);
		   model.addAttribute("curpage", curpage);
		   model.addAttribute("acurpage", acurpage);
		   model.addAttribute("qcurpage", qcurpage);
           model.addAttribute("fTotalpage", fTotalpage);
           model.addAttribute("aTotalpage", aTotalpage);
           model.addAttribute("qTotalpage", qTotalpage);
           model.addAttribute("startPage", startPage);
           model.addAttribute("astartPage", astartPage);
           model.addAttribute("qstartPage", qstartPage);
           model.addAttribute("endPage", endPage);
           model.addAttribute("aendPage", aendPage);
           model.addAttribute("qendPage", qendPage);
           model.addAttribute("BLOCK", BLOCK);     
		   return "cboard_list";
	}
	@RequestMapping("board/board_insert.do")
	public String board_insert(String no, Model model)
	{
		model.addAttribute("no", no);
		return "board_insert";
	}   
	@RequestMapping("board/insert_ok.do")
	   public String board_insert_ok(BoardVO vo, String no, HttpServletRequest request,HttpSession session) throws IOException 
	   {
		// 사진 경로
		String path="C:\\springDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Hometail\\boardPoster"; 
		String enctype= "UTF-8";  
		int size = 1024 * 1024 * 100;
		MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());
		
			System.out.println("받은 no:"+mr.getParameter("no"));
			String id = String.valueOf( session.getAttribute("id"));
			int cate=	Integer.parseInt(mr.getParameter("no"));
			
//			vo.setBoard_no(Integer.parseInt(mr.getParameter("board_no")));
//			vo.setId(mr.getParameter("id"));
			vo.setId(id);
			vo.setTitle(mr.getParameter("title"));
			vo.setContent(mr.getParameter("content"));
			
			if(cate==1)
			{
				dao.freeBoardInsert(vo);
			}
			else if(cate==2)
			{
				vo.setPoster(mr.getFilesystemName("poster"));
				dao.aBoardInsert(vo);
			}
			else if(cate==4)
			{
				dao.qnaBoardInsert(vo);
			}
		   return "redirect:../board/cboard_list.do?no="+cate;
	   } 
	@RequestMapping("board/detail.do")
	   public String board_detail(String board_no, Model model,String cate)
	   {
			
		   int bno=Integer.parseInt(board_no);
		   System.out.println("디테일 넘버 : "+bno);
		   System.out.println("카테고리 넘버:"+cate);
		   BoardVO vo=dao.BoardDetailData(bno);
		   model.addAttribute("vo", vo);
		   model.addAttribute("cate",cate);
		   // 댓글
		   List<ReplyVO> rlist=dao.boardReplyList(bno);
		   System.out.println("rlist는"+rlist.size());
		   model.addAttribute("rlist",rlist);
		   return "board_detail"; 
	   }
	@RequestMapping("board/delete_ok.do")
	   public String board_delete_ok(BoardVO vo,HttpSession session, int cate)
	   {
		String id= (String) session.getAttribute("id");
		System.out.println("삭제 글번호 : "+vo.getBoard_no());
		System.out.println("삭제 아이디 : "+id);
			int board_no=vo.getBoard_no(); 
			dao.boardDelete(board_no, id);
			//int cno=Integer.parseInt(cate);
		   return "redirect:../board/cboard_list.do?no="+cate;
	   } 
	
	// 수정
	@RequestMapping("board/update.do")
	public String board_update(String board_no, Model model)
	   {
		   int bno=Integer.parseInt(board_no);
		   BoardVO vo=dao.boardUpdateList(bno);
		   model.addAttribute("vo", vo);
		   return "board_update"; 
	   }
	
	@RequestMapping("board/update_ok.do")
	   public String board_update_ok(BoardVO vo,HttpServletRequest request, HttpSession session) throws IOException 
	   {
			System.out.println("update 호출");
			String path="C:\\springDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Hometail\\boardPoster"; 
			String enctype= "UTF-8";  
			int size = 1024 * 1024 * 100;
			MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());
		
			String id = String.valueOf(session.getAttribute("id"));
			int board_no=	Integer.parseInt(mr.getParameter("bno"));
			vo.setContent(mr.getParameter("content"));
			vo.setTitle(mr.getParameter("title"));
			vo.setPoster(mr.getFilesystemName("poster"));
			System.out.println("!!"+vo.getContent());
			System.out.println("!!"+vo.getTitle());
			System.out.println("!!"+board_no);
		   System.out.println("수정넘버 : "+board_no);
		   	System.out.println("사진"+vo.getPoster());
			dao.boardUpdateData(vo,board_no);
		   return "redirect:../board/detail.do?board_no="+board_no;
	   } 
	// 댓글
	@RequestMapping("board/board_reply_insert.do")
	   public String boardReplyInsert(ReplyVO vo, HttpSession session)
	   {
		  System.out.println("호출");
		   vo.setId((String)session.getAttribute("id"));
		   //vo.setName((String)session.getAttribute("name"));
		  // System.out.println("카테고리"+cate);
		   System.out.println("내용:"+vo.getContent());
		   /*int rcate=Integer.parseInt(cate);
		   vo.setCate(rcate);*/
		   
		   dao.boardReplyInsert(vo);
		   return "redirect:detail.do?board_no="+vo.getBoard_no();
	   }
	   @RequestMapping("board/reply_delete.do")
	   public String reply_delete(int replyno, int board_no)
	   {
		   System.out.println("댓글삭제번호 : "+replyno);
		   //int rno=Integer.parseInt(replyno);
		   dao.replyDelete(replyno);
		   return "redirect:detail.do?board_no="+board_no;
	   }
	   @RequestMapping("board/reply_update.do")
	   public String reply_update(int replyno, int board_no, String content)
	   {
		   dao.replyUpdate(replyno, content);
		   return "redirect:detail.do?board_no="+board_no;
	   }
	   
	   // 뉴스
	   @RequestMapping("board/news_list.do")
		public String news_list(Model model)
		{
			
			List<Item> list=mgr.newsAllData();
//			private String title;
//			private String link;
//			private String description;
//			private String pubDate;
//			private String author;
//			private String day;
			
//			JSONObject news_data = new JSONObject();
			JSONArray js = new JSONArray();
			for(Item i:list)
			{
				i.setDay(new SimpleDateFormat("yyyy-MM-dd").format(new Date(i.getPubDate())));
				JSONObject news = new JSONObject();
				news.put("TITLE", i.getTitle());
				news.put("AUTHOR", i.getAuthor());
				news.put("LINK", i.getLink());
				news.put("DESCRIPTION", i.getDescription());
				news.put("DAY", i.getDay());
				js.add(news);
			}
			System.out.println("결과 :"+js);
			
			
			model.addAttribute("list", list);	
			
			return "news_list";
		}
	   
	   
}
