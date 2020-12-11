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
			List<Item> list=mgr.newsAllData();
	//		private String title;
	//		private String link;
	//		private String description;
	//		private String pubDate;
	//		private String author;
	//		private String day;
			
	//		JSONObject news_data = new JSONObject();
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
			return "news_list";
	}
}