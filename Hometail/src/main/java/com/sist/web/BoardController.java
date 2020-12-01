package com.sist.web;


import java.util.List;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	private BoardDAO dao;
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
	public String board_cboard_list(String page,Model model,String no)
	{
		System.out.println("no값은"+no);
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
	   public String board_insert_ok(BoardVO vo, String no)
	   {
			System.out.println("받은 no:"+no);
			int cate=Integer.parseInt(no); 
			System.out.println("cate"+cate);
			if(cate==1)
			{
				dao.freeBoardInsert(vo);
			}
			else if(cate==4)
			{
				dao.qnaBoardInsert(vo);
			}
		   return "redirect:../board/list.do";
	   } 
	@RequestMapping("board/detail.do")
	   public String board_detail(String board_no, Model model)
	   {
		   int bno=Integer.parseInt(board_no);
		   System.out.println("디테일 넘버 : "+bno);
		   //System.out.println("cate번호 "+cate);
		   BoardVO vo=dao.BoardDetailData(bno);
		   //BoardVO vo=dao.BoardDetailData(no);
		   //List<ReplyVO> list=dao.replyListData(3, no, curpage);
		   model.addAttribute("vo", vo);
		   //model.addAttribute("list", list);
		   return "board_detail"; 
	   }
	
	// 삭제 연습 여기부터 해!
	@RequestMapping("board/delete_ok.do")
	   public String board_delete_ok(String no, String id, BoardVO vo)
	   {
			int board_no=Integer.parseInt(no); 
			dao.boardDelete(board_no, id);
		   return "redirect:../board/list.do";
	   } 
}
