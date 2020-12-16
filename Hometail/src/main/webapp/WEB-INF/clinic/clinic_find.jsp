<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.ss{
background-color: #ffe680;
}
.ss2{
background-color: #fff5cc;
}
</style>
</head>
<body>
	<c:if test="${count==0 }">
		<h3 class="text-center">검색결과가 없습니다</h3>
	</c:if>
	
	<c:if test="${count>0 }">
		<c:forEach var="vo" items="${list }">
		 <div>
			<table class="table table-bordered" width="400px" style="margin-left: auto; margin-right: auto;">
			<tr>
			  <th width=100px class="ss">병원이름</th>
			  <td width=300px class="ss2">${vo.title }</td>
			</tr>
			<tr>
			  <th width=100px class="ss">주소</th>
			  <td width=300px class="ss2">${vo.addr }</td>
			</tr>
			</table>
			</div>
		</c:forEach>
	</c:if>
</body>
</html>
