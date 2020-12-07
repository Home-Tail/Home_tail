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
	$('#boardUp').click(function(){
		  var form = $('#updateForm')[0];
		   var formData = new FormData(form);
		   /* var board_no = $('#bno').val();
		   var title =$('#upTitle').val();
		   var content =$('#upContent').val();
		   var poster =$('#upPoster').val();
		   console.log('board_no : '+board_no);
		   console.log('title : '+title);
		   console.log('content : '+content);
		   console.log('poster : '+poster); */
			 $.ajax({
				type:'POST',
				url:'../board/update_ok.do',
				contentType : false,
				processData : false,
				data : formData,
				success:function(res) 
				{
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
     <form method=post action="update_ok.do" enctype="multipart/form-data" id="updateForm">
     <table class="table" style="width:600px;">
       <tr>
        <th class="text-right" width=30%>이름</th>
        <td>
          <input type=text name=id size=50 value="${vo.id }" readonly>
          <input type=hidden name=bno value="${vo.board_no }" id="bno">
        </td>
       </tr>
       <tr>
        <th class="text-right" width=30%>제목</th>
        <td>
          <input type=text name=title size=50 value="${vo.title }" id="upTitle">
        </td>
       </tr>
       <tr>
        <th class="text-right" width=30%>내용</th>
        <td>
          <textarea rows="8" cols="55" name=content id="upContent" value="${vo.content }">${vo.content }</textarea>
        </td>
       </tr>
       <c:if test="${!empty vo.poster }">
	      <tr>
		     <th class="text-center danger" width=20%>첨부파일</th>
		     <td>
		     <input type="file" class="input-sm" name="poster" id="upPoster" value="${vo.poster }">
		      
		      </td>
	     </tr>
	     </c:if>
       <tr>
        <td colspan="2" class="text-center">
          <input type=button value="수정하기" id="boardUp" class="btn btn-sm btn-primary">
          <input type=button value="취소" onclick="javascript:history.back()" class="btn btn-sm btn-default">
        </td>
       </tr>
     </table>
     </form>
    </div>
  </div>
</body>
</html>