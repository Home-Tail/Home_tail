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
     <form method=post action="insert_ok.do" enctype="multipart/form-data">
     <table class="table">
       <tr>
        <th class="text-right" width=20%>이름</th>
        <td>
          <input type=text name=id size=50>
        </td>
       </tr>
       <tr>
        <th class="text-right" width=20%>제목</th>
        <td>
          <input type=text name=title size=50>
        </td>
       </tr>
       <tr>
        <th class="text-right" width=20%>내용</th>
        <td>
          <textarea rows="8" cols="55" name=content></textarea>
        </td>
       </tr>
	      <tr>
		     <th class="text-center danger" width=20%>첨부파일</th>
		     <td>
		     <input type="file" class="input-sm" name="poster">
		      
		      </td>
	     </tr>
       <tr>
        <td colspan="2" class="text-center">
          <input type=submit value="글쓰기">
          <input type=button value="취소" onclick="javascript:history.back()">
        </td>
       </tr>
     </table>
     </form>
    </div>
  </div>
</body>
</html>


