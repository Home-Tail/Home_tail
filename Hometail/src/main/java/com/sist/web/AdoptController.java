package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.AdoptDAO;
import com.sist.dao.BoardDAO;
import com.sist.vo.AdoptVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.adopt_newsVO;

@Controller
@RequestMapping("adopt/")
public class AdoptController {
	@Autowired
	private AdoptDAO adao;
	@RequestMapping("main.do")
	public String adopt_list() {
		return "adopt/main";
	}
	// GET , POST (form,ajax)
	@RequestMapping("list.do")
	public String adopt_list(String page,Model model) {
		if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   Map map=new HashMap();
		   int rowSize=12;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   map.put("start", start);
		   map.put("end", end);
		   List<AdoptVO> list=adao.adoptListData(map);
		   int totalpage=adao.adoptTotalPage();
		   // 전송 
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
		  //model.addAttribute("main_jsp", "../adopt/list.jsp");
		   return "adopt/list";
	}
	@RequestMapping("process.do")
	public String adopt_process() {
		return "adopt/process";
	}
	@RequestMapping("processRespon.do")
	public String adopt_processRespon(HttpServletRequest request,Model model){
		/*model.adda*/
		return "adopt/adopt_processRespon";
	}
	@RequestMapping("detail.do")
	public String adopt_detail(String no,Model model) {
		int adno=Integer.parseInt(no);
		AdoptVO vo=adao.adoptDetailData(adno);
		
		String punumber=vo.getPunumber();
		// StringTokenizer st=new StringTokenizer(punumber,"-");
		String regex = punumber.split("-")[0];
		
		// String result="";
		List<ReplyVO> rList=adao.adoptReplyData(adno);
		
		List<adopt_newsVO> nlist=adao.adoptnewsData(regex);
		List<AdoptVO> aList=adao.adoptCate10();
		model.addAttribute("aList", aList);
		model.addAttribute("vo", vo);
		model.addAttribute("nlist", nlist);
		model.addAttribute("rList", rList);
		return "adopt/detail";
	}
	// 리플
	@RequestMapping("reply_insert.do")
	   public String reply_insert(int adno,String content,HttpSession session)
	   {
		   String id=(String)session.getAttribute("id");
		   ReplyVO rvo=new ReplyVO();
		   rvo.setAdno(adno);
		   rvo.setContent(content);
		   rvo.setId(id);
		   adao.adoptReplyInsert(rvo);
		   //attr.addFlashAttribute(arg0) : Object(VO,List)
		   return "redirect:../adopt/detail.do?no="+adno;
	   }
	   @RequestMapping("reply_delete.do")
	   public String reply_delete(String reno,String ano)
	   {
		   int replyno=Integer.parseInt(reno);
		   int adno=Integer.parseInt(ano);
		   adao.adoptReplyDelete(replyno);
		   return "redirect:../adopt/detail.do?no="+adno;
	   }
	   @RequestMapping("reply_update.do")
	   public String reply_update(String reno,String ano,String content)
	   {
		   int replyno=Integer.parseInt(reno);
		   int adno=Integer.parseInt(ano);
		   ReplyVO rvo=new ReplyVO();
		   rvo.setContent(content);
		   rvo.setReplyno(replyno);
		   adao.adoptReplyUpdate(rvo);
		   return "redirect:../adopt/detail.do?no="+adno;
	   }
}