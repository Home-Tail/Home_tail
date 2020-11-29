<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<th width=100 class="text-center danger" style="font-size:20px">제목</th>
					<td width=100 class="text-center">${vo.title }</td>
				</tr>
				<tr>
					<th width=20% class="text-center danger">작성자</th>
					<td width=30% class="text-center">${vo.id }</td>
				</tr>

				<tr>
					<th width=20% class="text-center danger">작성일</th>
					<td width=30% class="text-center"><fmt:formatDate
							value="${vo.regdate}" pattern="yyyy-MM-dd" /></td>

					<th width=20% class="text-center danger">발견지역</th>
					<td width=30% class="text-center">${vo.loc }</td>
				</tr>
				
			</table>
			
				<table class="table"></table>
				</div>
				<div style="text-align: center;">
					<span ><img src="${vo.poster }" width=400px height=400px></span>
				</div>
				<div style="text-align: center;">
				<span>${vo.content }</span>
				</div>
			
				<div class="text-right">
				<a href="list.do" class="btn btn-sm btn-primary py-2 px-4">&nbsp;목록&nbsp;</a>
				</div>
	</div>

</body>
</html>