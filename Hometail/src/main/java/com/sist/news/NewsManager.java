package com.sist.news;
import java.util.*;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import java.net.*;
import org.springframework.stereotype.Component;
@Component
public class NewsManager {
	public List<Item> newsAllData()
	{
		List<Item> list=new ArrayList<Item>();
		try
		{
			String strUrl="http://newssearch.naver.com/search.naver?where=rss&query="
									+URLEncoder.encode("유기동물", "UTF-8");
			URL url=new URL(strUrl);
			JAXBContext jb=JAXBContext.newInstance(Rss.class);	// 최상위 태그에 넣어야 함
			// XML ==> java class화
			Unmarshaller un=jb.createUnmarshaller();
			Rss rss=(Rss)un.unmarshal(url);
			list=rss.getChannel().getItem();
		}catch(Exception ex){}
		return list;
		
	}
}
