package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.*;
import com.sist.dao.*;
import com.sist.news.Item;
import com.sist.news.NewsManager;
@RestController
@CrossOrigin("http://localhost:3000")
public class ReactController {
	@Autowired
	private BoardDAO dao;
	@Autowired
	private NewsManager mgr;
	@RequestMapping(value="board/news_list.do",produces="text/plain;charset=UTF-8")
	   public String news_list(String page)
	   {
		System.out.println("받은 페이지 "+page);
		if(page==null)
			page="1";
		int curpage = Integer.parseInt(page);
		int rowSize=9;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		String title="";
		String description="";
	         List<Item> list=mgr.newsAllData();
	         String result="";
	         System.out.println("");
	         try
	         {
	            JSONArray js = new JSONArray();
	            if(end>list.size())
	            {
	            	end = list.size();
	            }
//	            for(Item i:list)
	            for(int i=start;i<=end;i++)
	            {
	               list.get(i-1).setDay(new SimpleDateFormat("yyyy-MM-dd").format(new Date(list.get(i-1).getPubDate())));
	               JSONObject news = new JSONObject();
	               
	               try{
	            	   title = list.get(i-1).getTitle().substring(0,20)+"...";
	               }catch (Exception e) {
	            	   title = list.get(i-1).getTitle();
	               }
	               try{
	            	   description = list.get(i-1).getDescription().substring(0,90)+"...";
	               }catch (Exception e) {
	            	   description = list.get(i-1).getDescription();
	               }
	               
	               news.put("title", title);
	               news.put("author", list.get(i-1).getAuthor());
	               news.put("link", list.get(i-1).getLink());
	               
	               news.put("description", description);
	               news.put("day", list.get(i-1).getDay());
	               js.add(news);
	            }
	            result=js.toJSONString();
	         }catch(Exception ex){}
	         return result;
	   } 
	@RequestMapping(value="board/total.do",produces="text/plain;charset=UTF-8")
	public String board_total()
	{
		String total="";
	    
		List<Item> list=mgr.newsAllData();
	    total = String.valueOf(Math.ceil(list.size()/9.0));
	    
	    return total;
	}
	
	
	@RequestMapping(value="center/news_list.do",produces="text/plain;charset=UTF-8")
	   public String center_list(String page)
	   {
		System.out.println("받은 페이지 "+page);
		if(page==null)
			page="1";
		int curpage = Integer.parseInt(page);
		int rowSize=4;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		String title="";
		String description="";
	         List<Item> list=mgr.newsAllData();
	         String result="";
	         System.out.println("");
	         try
	         {
	            JSONArray js = new JSONArray();
	            if(end>list.size())
	            {
	            	end = list.size();
	            }
//	            for(Item i:list)
	            for(int i=start;i<=end;i++)
	            {
	               list.get(i-1).setDay(new SimpleDateFormat("yyyy-MM-dd").format(new Date(list.get(i-1).getPubDate())));
	               JSONObject news = new JSONObject();
	               
	               try{
	            	   title = list.get(i-1).getTitle().substring(0,25)+"...";
	               }catch (Exception e) {
	            	   title = list.get(i-1).getTitle();
	               }
	               try{
	            	   description = list.get(i-1).getDescription().substring(0,90)+"...";
	               }catch (Exception e) {
	            	   description = list.get(i-1).getDescription();
	               }
	               
	               news.put("title", title);
	               news.put("author", list.get(i-1).getAuthor());
	               news.put("link", list.get(i-1).getLink());
	               
	               news.put("description", description);
	               news.put("day", list.get(i-1).getDay());
	               js.add(news);
	            }
	            result=js.toJSONString();
	         }catch(Exception ex){}
	         return result;
	   } 
	@RequestMapping(value="center/total.do",produces="text/plain;charset=UTF-8")
	public String center_total()
	{
		String total="";
	    
		List<Item> list=mgr.newsAllData();
	    total = String.valueOf(Math.ceil(list.size()/4.0));
	    
	    return total;
	}
}