package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.ClinicDAO;
import com.sist.vo.ClinicVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.ReserveVO;

@Controller

public class ClinicController {
@Autowired
private ClinicDAO dao;
@RequestMapping("clinic/main.do")
public String main(Model model)
{
	Map map=new HashMap();
	List<ClinicVO> cntlist=dao.clinicCntList(map);
	model.addAttribute("cntlist",cntlist);
	return "clinic/main";
}

@RequestMapping("clinic/list.do")
public String clinic_list(String page,Model model)
{
	if(page==null)
		page="1";
	int curpage=Integer.parseInt(page);
	
	int rowSize=6;
	int start = (curpage * rowSize) - (rowSize - 1);
	int end = curpage * rowSize;
	
	
	Map map=new HashMap();
	map.put("start", start);
	map.put("end", end);
	
	List<ClinicVO> list=dao.clinicListData(map);
	
	int totalPage=dao.clinicTotalPage();
	int BLOCK=5;
	int startPage=((curpage-1)/BLOCK * BLOCK)+1;
	int endPage=((curpage-1)/BLOCK * BLOCK)+BLOCK;
	if(endPage>totalPage)
	{
		endPage=totalPage;
	}
	
	model.addAttribute("startPage", startPage);
	model.addAttribute("endPage", endPage);
	model.addAttribute("curpage", curpage);
	model.addAttribute("totalpage", totalPage);
	model.addAttribute("BLOCK", BLOCK);
	model.addAttribute("list",list);
	return "list";
}



@RequestMapping("clinic/detail.do")
public String clinic_Detail(String no,Model model)
{
	
	ClinicVO vo=dao.clinicDetailData(Integer.parseInt(no));
	List<ReplyVO> clist=dao.clinicReplyList(Integer.parseInt(no));
	System.out.println(clist.size());
	model.addAttribute("clist", clist);
	model.addAttribute("vo", vo);
	return "clinic/detail";
}

@RequestMapping("clinic/clinic_find.do")
public String ClinicLocationFindData(String no,Model model)
{
	   System.out.println(no);
	   String[] gu= { "전체", "강서구", "양천구", "구로구", "마포구", "영등포구", "금천구",
				      "은평구", "서대문구", "동작구", "관악구", "종로구", "중구", "용산구", "서초구", "강북구",
				      "성북구", "도봉구", "동대문구", "성동구", "강남구", "노원구", "중랑구", "광진구", "송파구",
				      "강동구" };
	   List<ClinicVO> list=new ArrayList<ClinicVO>();
	   if(no!=null)
	   {
		   System.out.println(gu[Integer.parseInt(no)]);
		   list=dao.clinicLocationFindData(gu[Integer.parseInt(no)]);
	   }
	   model.addAttribute("list", list);
	   model.addAttribute("count", list.size());
	   return "clinic_find";
}
@RequestMapping("clinic/clinic_reply.do")
public String ClinicReplyInsert(String clno,ReplyVO vo,HttpSession session)
{
//	System.out.println("test");
	String id=(String)session.getAttribute("id");
	vo.setId(id);
	vo.setClno(Integer.parseInt(clno));
	dao.clinicReplyInsert(vo);
      
   return "redirect:../clinic/detail.do?no="+clno;
}
@RequestMapping("clinic/clinic_reply_update.do")
public String clinicReplyUpdate(ReplyVO vo)
{	
	dao.clinicReplyUpdate(vo);
	return "redirect:../clinic/detail.do?no="+vo.getClno();
}
@RequestMapping("clinic/clinic_reply_delete.do")
public String clinicReplyDelete(ReplyVO vo)
{
	dao.clinicReplyDelete(vo,vo.getRoot());
	return "redirect:../clinic/detail.do?no="+vo.getClno();
}
@RequestMapping("clinic/clinic_reserve_insert.do")
public String clinicReserveInsert(ReserveVO rvo)
{

//	System.out.println(rvo.getClno());
//	System.out.println(rvo.getId());
//	System.out.println(rvo.getResdate());
//	System.out.println(rvo.getOwner());
//	System.out.println(rvo.getPname());
//	System.out.println(rvo.getContent());
//	System.out.println(rvo.getTime());
	dao.clinicReserveInsert(rvo);
	
	return "redirect:../clinic/detail.do?no="+rvo.getClno();
}
@RequestMapping("clinic/clinicReply_replyInsert.do")
public String clinicReply_replyInsert(ReplyVO vo,HttpSession session)
{
	String id = (String)session.getAttribute("id");
	vo.setId(id);
	//cate,replyno,clno,id,regdate,content,group_id,group_step,group_tap,root,depth
	System.out.println("대댓글 돌아");
	System.out.println(vo.getReplyno());
	System.out.println(vo.getClno());
	System.out.println(vo.getId());
	System.out.println(vo.getContent());
	dao.clinicReply_replyInsert(vo,vo.getReplyno());
	return "redirect:../clinic/detail.do?no="+vo.getClno();
}

@RequestMapping("clinic/search.do")
public String clinicSearchList(Model model,String page,String title)
{
	if(page==null)
		page="1";
	int curpage=Integer.parseInt(page);
	
	int rowSize=6;
	int start = (curpage * rowSize) - (rowSize - 1);
	int end = curpage * rowSize;
	
	
	Map map=new HashMap();
	map.put("title",title);
	map.put("start", start);
	map.put("end", end);
	
	List<ClinicVO> slist=dao.clinicSearchList(map);
	
	int totalPage=dao.clinicSearchcnt(map);
	int BLOCK=5;
	int startPage=((curpage-1)/BLOCK * BLOCK)+1;
	int endPage=((curpage-1)/BLOCK * BLOCK)+BLOCK;
	if(endPage>totalPage)
	{
		endPage=totalPage;
	}
	
	model.addAttribute("startPage", startPage);
	model.addAttribute("endPage", endPage);
	model.addAttribute("curpage", curpage);
	model.addAttribute("totalpage", totalPage);
	model.addAttribute("BLOCK", BLOCK);
	model.addAttribute("slist",slist);
	return "search";
}
}
