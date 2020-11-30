package com.sist.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.vo.CenterVO;

@Controller
@RequestMapping("center/")
public class CenterServiceController {

	@RequestMapping("service.do")
	public String board_list(Model model, String data,HttpServletRequest request) throws IOException {
		if (data == null) {
			System.out.println("data은 NULL");
		}
		System.out.println("Json" + data);
		//=====================================
		
		System.out.println("========Model 업데이트 부분 ========");
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		} // 한글 디코딩

		String path = "C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Home_fit\\challenge_poster";
		String enctype = "UTF-8"; // 한글파일명을 사용 여부
		int size = 1024 * 1024 * 100;// 파일의 최대크기

		// MultipartRequest : 사용자가 보내준 데이터를 받는다 (request=>파일을 받을 수 없다 , 일반데이터만 받는다)
		MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());


		
		//=====================================
		return "../center/service";
	}

	@RequestMapping("service_map.do")
	public String center_service_map(Model model, CenterVO vo,String strYear,String strMonth,String strDay,String time) {
		System.out.println("위치값" + vo.getLoc());
		System.out.println("위치값" + vo.getTel());
		System.out.println("지번 주소" + vo.getLotno_addr());
		System.out.println("도로명 주소 " + vo.getRoadno_addr());
		System.out.println("년도 "+strYear);
		System.out.println(" 월  "+strMonth);
		System.out.println(" 일  "+strDay);
		System.out.println("시간 "+time);
		
		return "../center/service";
	}

	@RequestMapping("center_date.do")
	public String center_date(Model model,String strYear,String strMonth,String tno)
	{
		System.out.println("=======================");
			  if(tno==null)
				  tno="1";
			  
			  Date date=null;
				try {
					date = new Date();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			  // 2020-10
			  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
			  // MM dd (X)  M d 01 ~ 09 10 11 12   09
			  // 1 2 3 .... 10 11 12
			  String today=sdf.format(date);
			  StringTokenizer st=new StringTokenizer(today,"-");
			  
			  if(strYear==null)
			  {
				  strYear=st.nextToken();// yyyy
			  }
			  
			  if(strMonth==null)
			  {
				  strMonth=st.nextToken();
			  }
			  
			  int day=Integer.parseInt(st.nextToken());// 화면 
			  int year=Integer.parseInt(strYear);
			  int month=Integer.parseInt(strMonth);
			  
			  Calendar cal=Calendar.getInstance();// Calendar클래스 생성 
			  cal.set(Calendar.YEAR,year);
			  cal.set(Calendar.MONTH,month-1);// month=>0~11
			  cal.set(Calendar.DATE,1);
			  
			  // 요일을 구한다
			  int week=cal.get(Calendar.DAY_OF_WEEK);// 1~7 ==> week-1
			  int lastday=cal.getActualMaximum(Calendar.DATE);
			  String[] strWeek={"일","월","화","수","목","금","토"};
			  System.out.println("요일:"+strWeek[week-1]);
			  System.out.println("마지막날:"+lastday);
			  
			  // DB => 예약날짜 읽기
			  System.out.println("tno="+tno);
//			  String rday=MovieDAO.theaterReserveData(Integer.parseInt(tno));
//			  System.out.println("rday="+rday);
			  int[] days=new int[32];
//			  StringTokenizer st2=new StringTokenizer(rday,",");
			  //int i=0;
//			  while(st2.hasMoreTokens())
//			  {
//				  String d=st2.nextToken();
//				  days[Integer.parseInt(d)]=Integer.parseInt(d);
//			  }
			  
			  for(int k:days)
			  {
				  System.out.println("k="+k);
			  }
			  
			  model.addAttribute("rdays", days);
			  // jsp로 전송 
			  model.addAttribute("year", year);
			  model.addAttribute("month", month);
			  model.addAttribute("day", day);
			  model.addAttribute("week", week-1);
			  model.addAttribute("strWeek", strWeek);
			  model.addAttribute("lastday", lastday);
			  // 1일자의 요일 
		  return"reserve_date";
	}
	@RequestMapping("center_time.do")
	public String ceter_time()
	{
		
		return "reserve_time";
	}
}
