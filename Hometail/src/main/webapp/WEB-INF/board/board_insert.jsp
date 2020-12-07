<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#insertBtn').click(function(){
		   var form = $('#uploadForm')[0];
		   var formData = new FormData(form);
		   /* var id =$('#insertId').val();
		   var title =$('#insertTitle').val();
		   var content =$('#insertContent').val();
		   var poster =$('#insertPoster').val();
		   console.log('id : '+id);
		   console.log('title : '+title);
		   console.log('content : '+content);
		   console.log('poster : '+poster); */
			 $.ajax({
				type:'POST',
				url:'../board/insert_ok.do',
				contentType : false,
				processData : false,
				data : formData,
				success:function(res) 
				{
// 					alert('성공이다!');
					$('#print').html(res);
				}
			}); 
	});
});
</script>
</head>
<body>
<div class="container">
    <div class="row">
     <form method=post action="insert_ok.do" enctype="multipart/form-data" id="uploadForm">
     <table class="table">
       <tr>
        <th class="text-right" width=30%>이름</th>
        <td>
          <input type=text name=id size=80 value="${sessionScope.id }" readonly id="insertId">
        </td>
       </tr>
       <tr>
        <th class="text-right" width=30%>제목</th>
        <td>
          <input type=text name=title size=80 id="insertTitle">
        </td>
       </tr>
       <tr>
        <th class="text-right" width=20%>내용</th>
        <td>
          <textarea rows="8" cols="80" name=content id="insertContent"></textarea>
        </td>
       </tr>
       <c:if test="${no==2 }">
	      <tr>
		     <th class="text-center danger" width=20%>첨부파일</th>
		     <td>
		     <input type="file" class="input-sm" name="poster" id="insertPoster">
		      
		      </td>
	     </tr>
	     </c:if>
       <tr>
        <td colspan="2" class="text-center">
        <input type=hidden value="${no }" name=no>
          <input type=button value="글쓰기" class="btn btn-sm btn-primary" id="insertBtn">
          <input type=button value="취소" onclick="javascript:history.back()" class="btn btn-sm btn-default">
        </td>
       </tr>
     </table>
     </form>
    </div>
  </div>
</body>
</html>