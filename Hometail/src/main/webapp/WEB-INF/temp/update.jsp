<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#tempup').click(function(){
		  var form = $('#updateForm')[0];
		   var formData = new FormData(form);
			 $.ajax({
				type:'POST',
				url:'../temp/update_ok.do',
				contentType : false,
				processData : false,
				data : formData,
				success:function(result) 
				{
					$('#tagin').html(result);
				}
			}); 
	});
});
</script> -->
</head>
<body>
   <div class="container">
   <h1  class="text-left">수정하기</h1>
    <div class="row">
     <form action="update_ok.do" enctype="multipart/form-data"  method="post">
     <table class="table">
     
    <!--  <tr> 
        <th class="text-center danger" width=15%>번호</th>
        <td width=20%>
          <input type=text name=petno size=5>
        </td>
        
       </tr> -->
       
      <tr>
          <th class="text-center danger"  >카테고리</th>
        <td>
         <!--  <input type=text name=loc size=15> -->
          <select name="cate" style="font-size:14pt;">
         <option value="" selected>전체</OPTION>
         <OPTION value="5">[보호중]</OPTION>
         <OPTION value="6">[보호요청]</OPTION>
         <OPTION value="7">[찾았어요]</OPTION>
         </select>                                                               
        </td>
      </tr>
      
      <tr>
        <th class="text-center danger" width=15%>제목</th>
        <td width=20%>
          <input type=text name=title size=96 value="${vo.title }">
          <input type=hidden name=no value="${vo.petno }">
        </td>
       </tr>
       
       <%-- <tr>
        <th class="text-center danger" width=20%>작성자</th>
        <td width=25%>
          <input type=text name=id size=20 value="${vo.id }">
        </td> --%>
        
        <tr>
        <th class="text-center danger" width=20%>연락처</th>
        <td width=25%>
          <input type=text name=tel size=20 value="${vo.tel }">
        </td>
       
       <tr>
        <th class="text-center danger" width=20%>발견날짜</th>
        <td width=25%>
          <input type=date name=db_pdate size=10 value="${vo.pdate }">
        </td>
       </tr>
       <tr>
        <th class="text-center danger" width=20%>발견지역</th>
        <td width=20%>
         <!--  <input type=text name=loc size=15> -->
          <select name="loc" style="font-size:14pt;">
         <option value="" selected>지역선택</OPTION>
         <OPTION value="서울" >서울시</OPTION>
         <OPTION value="인천" >인천시</OPTION>
         <OPTION value="대전" >대전시</OPTION>
         <OPTION value="광주" >광주시</OPTION>
         <OPTION value="대구" >대구시</OPTION>
         <OPTION value="울산" >울산시</OPTION>
         <OPTION value="부산" >부산시</OPTION>
         <OPTION value="경기" >경기도</OPTION>
         <OPTION value="강원" >강원도</OPTION>
         <OPTION value="세종" >세종시</OPTION>
         <OPTION value="충남" >충청남도</OPTION>
         <OPTION value="충북" >충청북도</OPTION>
         <OPTION value="전남" >전라남도</OPTION>
         <OPTION value="전북" >전라북도</OPTION>
         <OPTION value="경남" >경상남도</OPTION>
         <OPTION value="경북" >경상북도</OPTION>
         <OPTION value="제주" >제주도</OPTION>
         </select>                                                               
         <input type="text" name="loctext" size="10" style="padding-left:3px; border: 1px solid rgb(204, 204, 204); background-color: rgb(248, 248, 248);" value="${vo.loc }"">
         <font color="df516b">* 9글자까지만 글 목록에 노출됩니다. </font></td>
        </td>
       </tr>

       <tr>
        <th class="text-center danger" width=15%>내용</th>
        <td width=100%>
          <textarea rows="10" cols="100" name=content>${vo.content }</textarea>
        </td>
       </tr>
       
<%--        <c:if test="${!empty vo.poster }"> --%>
<!-- 	      <tr> -->
<!-- 		     <th class="text-center danger" width=20%>첨부파일</th> -->
<!-- 		     <td> -->
<%-- 		     <input type="file" class="input-sm" name="poster" id="upPoster" value="${vo.poster }"> --%>
		      
<!-- 		      </td> -->
<!-- 	     </tr> -->
<%-- 	     </c:if>  --%>
      <tr>
      <th class="text-center danger" >첨부파일</th>
      <td>
      <input type="file" class="input-sm" name="poster" value="${vo.poster }">
       </td>
      </tr>
        <tr>
        <td colspan="2" class="text-center">
          <input type=submit class="btn btn-sm btn-primary" value="수정하기">
          <input type=button  class="btn btn-sm btn-primary" value="취소" onclick="javascript:history.back()">
        </td>
       </tr>
       
       
   </table>
  </form>
 </div>
 </div>
</body>
</html>