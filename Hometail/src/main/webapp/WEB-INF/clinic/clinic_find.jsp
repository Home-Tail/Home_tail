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
  <c:forEach var="vo" items="${list }">
	     <div class="col-md-3 ftco-animated">
	       <div class="blog-entry">
	       <c:choose>
	       <c:when test="${vo.poster==null }">
	       <img src="../images/aa.jpg" style="width:100px;height:100px">
	       </c:when>
	       <c:otherwise>
	        <img src="${vo.poster }" style="width:100px;height:100px">
	        </c:otherwise>
	        </c:choose>
	        <p>${vo.title }</p>
	      </div>
	     </div>
	  </c:forEach>
   </c:if>
</body>
</html>
