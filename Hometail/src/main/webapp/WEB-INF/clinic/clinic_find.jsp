<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   
   <c:if test="${count==0 }">
     <h3 class="text-center">검색결과가 없습니다</h3>
   </c:if>
   <c:if test="${count>0 }">
   <table class="table table-striped">
		     <tr class="success" bgcolor="#CCFFCC">
		      <th class="text-center" width=10%>병원 이름</th>
		      <th class="text-center" width=45%>주소</th>
		     </tr>
	   <c:forEach var="vo" items="${list }">
	     <tr class="success">
			      <td class="text-center" width=20%>${vo.title }</td>
			      <td class="text-center" width=10%>${vo.addr }</td>
			     </tr>
	   </c:forEach>
   </table>
   </c:if>
</body>
</html>