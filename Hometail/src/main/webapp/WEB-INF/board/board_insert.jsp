<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <div class="row">
     <form method=post action="insert_ok.do">
     <input type=hidden value=${no } name=no>
     <table class="table">
       <tr>
        <th class="text-right" width=30%>이름</th>
        <td>
          <input type=text name=id size=80 value="${sessionScope.id }" readonly>
        </td>
       </tr>
       <tr>
        <th class="text-right" width=30%>제목</th>
        <td>
          <input type=text name=title size=80>
        </td>
       </tr>
       <tr>
        <th class="text-right" width=20%>내용</th>
        <td>
          <textarea rows="8" cols="80" name=content></textarea>
        </td>
       </tr>
       <tr>
        <td colspan="2" class="text-center">
          <input type=submit value="글쓰기" class="btn btn-sm btn-primary">
          <input type=button value="취소" onclick="javascript:history.back()" class="btn btn-sm btn-default">
        </td>
       </tr>
     </table>
     </form>
    </div>
  </div>
</body>
</html>