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
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table" style="width:800px; margin:0px auto; margin-top:50px;">
				<tr>
					<th width=100 class="text-center danger" style="font-size:20px">제목</th>
					<td width=100 class="text-left" colspan=3 style="color:black;">${vo.title }</td>
				</tr>
				<tr>
					<th width=20% class="text-center danger">작성일</th>
					<td width=30% class="text-left"><fmt:formatDate
							value="${vo.regdate}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th width=20% class="text-center danger">작성자</th>
					<td width=30% class="text-left">${vo.id }</td>
					
					<th width=20% class="text-center danger">연락처</th>
					<td width=30% class="text-left">${vo.tel }</td>
				</tr>
				<tr>
					<th width=20% class="text-center danger">발견날짜</th>
					<td width=30% class="text-left"><fmt:formatDate
							value="${vo.pdate}" pattern="yyyy-MM-dd" /></td>

					<th width=20% class="text-center danger">발견지역</th>
					<td width=30% class="text-left">${vo.loc }</td>
					
				</tr>
            <tr>
               <td colspan=4>
               
               <c:set var = "po" value = "${vo.poster}"/>
					      <c:choose>
					         <c:when test = "${fn:contains(vo.poster, 'zooseyo')}">
					            <img src="${vo.poster }" width=400px height=400px>
					         </c:when>
					         <c:when test = "${fn:contains(vo.poster, 'myohagae')}">
					            <img src="${vo.poster }" width=400px height=400px>
					         </c:when>
					         <c:otherwise>
					          	<img src="../TempPoster/${vo.poster}" width=400px height=400px>
					          </c:otherwise>
					      </c:choose>
               
                  <%-- <img src="../TempPoster/${vo.poster }" width=400px height=400px><br>${vo.content } --%>
               
               </td>
            </tr>
            <tr>
            	<td style="border-top:none;">${vo.content }</td>
            </tr>
            <tr>
            <td class="text-right" colspan=4>
            <c:if test="${sessionScope.id==vo.id }">
            <a href="../temp/update.do?petno=${vo.petno }" class="btn btn-sm btn-primary" style="margin:10px">수정</a>          
               <a href="../temp/delete_ok.do?petno=${vo.petno }" class="btn btn-sm btn-primary">삭제</a>
             </c:if>       
            </td>
            </tr>
         </table>      
      	<!----------------- 댓글폼 ------------------>		
      	
      	<div class="container" style="margin:10px">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bno" value="${detail.bno}"/>
               <input type="text" class="form-control" size=100 id="content" name="content"  placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-sm btn-primary py-2 px-4" style="margin:5px" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
       		 </form>
    		</div>
    
    			<div class="container">
       			 <div class="commentList"></div>
    			</div>
				<tr>
				<td></td>
				</tr>	
				</div>
				<!-----------------목록버튼 ------------- -->
				<table class="table">
				<div class="text-right" style="padding-right:300px; margin:10px">
				<tr>
				<td></td>
				<tr>
				<a href="list.do" class="btn btn-sm btn-primary py-3 px-4">&nbsp;목록&nbsp;</a>
				</table>
				</div>
				</div>	
</body>
</html>