<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div style="height:30px"></div>
 <div class="container">
  <div class="row">
   <table class="table">
    <tr>
     <td colspan="2">${vo.title }</td>
    </tr>
    <tr>
     <td width=20% class="text-right">전화번호</td>
     <td width=50% class="text-left">${vo.tel }</td>
    </tr>
    <tr>
     <td width=20% class="text-right">주소</td>
     <td width=50% class="text-left">${vo.addr }</td>
    </tr>
    <tr>
     <td width=20% class="text-right">도로명 우편번호</td>
     <td width=50% class="text-left">${vo.post }</td>
    </tr>
    <tr>
     <td colspan="3" class="text-right">
      <a href="list.do" class="btn btn-sm btn-primary">목록</a>
     </td>
    </tr>
   </table>
  </div>
 </div>
</body>
</html>