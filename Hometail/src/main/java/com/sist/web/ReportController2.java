package com.sist.web;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.dao.ReportDAO;
import com.sist.vo.ReportVO;

@RestController
public class ReportController2 {
	@Autowired
	private ReportDAO dao;
	
	@RequestMapping(value ="report/around_data.do", produces="text/plain;charset=UTF-8")
	public String report_Around_data(Model model)
	{
		List<ReportVO> list = dao.reportAllData();
		System.out.println("around.do list 사이즈:"+list.size());
		
		JSONObject JSresult = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for(ReportVO vo:list)
		{
			JSONObject json = new JSONObject();
			json.put("no",vo.getPetno());
			json.put("title",vo.getTitle());
			json.put("cate",vo.getCate());
			json.put("kind",vo.getKind());
			json.put("loc",vo.getLoc());
			json.put("map_x",vo.getMap_x());
			json.put("map_y",vo.getMap_y());
			jsonArray.add(json);
		}
		JSresult.put("datas",jsonArray);
		String result=jsonArray.toString();

		return result;
	}
	
}
