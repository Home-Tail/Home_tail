<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container">
    <div class="row">
     <h1>글쓰기</h1>
     <form method=post action="insert_ok.do">
     <table class="table">
       <tr>
        <th class="text-right" width=15%>이름</th>
        <td width=85%>
          <input type=text name=id size=50>
        </td>
       </tr>
       <tr>
        <th class="text-right" width=15%>제목</th>
        <td width=85%>
          <input type=text name=title size=50>
        </td>
       </tr>
       <tr>
        <th class="text-right" width=15%>내용</th>
        <td width=85%>
          <textarea rows="8" cols="55" name=content></textarea>
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


