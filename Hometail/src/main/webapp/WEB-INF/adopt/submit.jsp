<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name");
String sex=request.getParameter("sex");
String age=request.getParameter("age");
String tel=request.getParameter("tel");
String email=request.getParameter("email");
String time=request.getParameter("time");
String area=request.getParameter("area");
String marry=request.getParameter("marry");
String job=request.getParameter("job");
String past=request.getParameter("past");
String now=request.getParameter("now");
String akind=request.getParameter("akind");
String aage=request.getParameter("aage");
String asex=request.getParameter("asex");
String agree=request.getParameter("agree");
String want=request.getParameter("want");
String absen=request.getParameter("absen");
String info=request.getParameter("info");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
		      <h4 class="panel-title"> 입양신청서확인</h4>
<table class="table table-boardered">
		            <tr>
		                <th>1. 신청인 성명</th>
		                <td><%=name %></td>        
		            </tr>
		            <tr>
		                <th>2. 성별</th>
		                <td><%=sex %></td>     
		            </tr>
		            <tr>
		                <th>3. 연령</th>
		                <td><%=age %></td>      
		            </tr>
		            <tr>
		                <th>4. 전화번호</th>
		                <td><%=tel %></td>      
		            </tr>
		            <tr>
		                <th>5. 이메일</th>
		                <td><%=email %></td>       
		            </tr>
		            <tr>
		                <th>6. 통화하기 편한 시간</th>
		                <td><%=time %></td>       
		            </tr>
		            <tr>
		                <th>7. 사시는 지역</th>
		                <td><%=area %></td>       
		            </tr>
		            <tr>
		                <th>8. 결혼여부</th>
		                <td><%=marry %></td>     
		            </tr>
		            <tr>
		                <th>9. 신청인 직업</th>
		                <td><%=job %></td>       
		            </tr>
		            
		            <tr>
		                <th>1. 예전에 반려동물을 키우신 적이 있으신가요?</th>
		                <td><%=past %></td>   
		            </tr>
		            <tr>
		                <th>2. 현재 집에서 다른 동물을 키우고 계십니까? </th>
		               <td><%=now %></td>      
		            </tr>
		             <tr>
		                <th>2-1.만일 있으시다면 다음 사항에 입력해주세요</th>
		                 <td>종류 : <%=akind %></td>&nbsp;&nbsp;
		                 <td>나이: <%=aage %></td>&nbsp;&nbsp;
		                 <td>성별: <%=asex %></td>&nbsp;&nbsp;  
		                   
		            </tr>
		             <tr>
		                <th>3. 가족들은 입양에 대해서 모두 찬성하시나요? </th>
		                <td><%=agree %></td>     
		            </tr>
		            <tr>
		                <th>4. 입양을 원하시는 이유는 무엇인가요?</th>
		                <td><%=want %></td>       
		            </tr>
		            <tr>
		                <th>5. 부재시 반려동물을 어떻게 관리하실 예정이신가요?</th>
		                <td><%=absen %></td>       
		            </tr>
		            <tr>
		                <th>6. 하고 싶은 말이 있으신가요?</th>
		                <td><%=info %> </td>     
		            </tr>
		            <tr>
		                <td colspan="2">
							<input type=button value="뒤로가기" onclick="javascript:history.back()" class="btn btn-sm btn-primary" >
		                </td>
		            </tr>
		             
		             
		        </table>
		        </div>
</body>
</html>