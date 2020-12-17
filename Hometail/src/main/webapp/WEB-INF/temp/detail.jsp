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
<style type="text/css">

#b1:hover
{
	background-color: #CEF6CE
}
#b2:hover
{
	background-color: #F78181
}
#b3:hover
{
	background-color: #81DAF5
}
#b4
{
	border : solid;
}
.back
{
	background-color:#ff4500;
 	 color:#FFFFFF;
 	 
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		/// 목록버튼 
		 let cate=0;
		 $('.back').click(function(){
			 cate=$(this).attr("value");
				location.href="../temp/main.do"
				
			})
	})
	
		
let i=0;
let u=0;
$(function(){
	$('.reply_reply').click(function(){
	  $('.rIn').hide();
	  $('.rUp').hide();
	  $('.reply_reply').text("댓글");
	  let no=$(this).attr('value');
	  if(i==0)
	  {
		    
			$('#rIn'+no).show();
			$(this).text("취소");
			i=1;
	  }
	  else
	  {
		    $('#rIn'+no).hide();
		    $(this).text("댓글");
			i=0;
	  }
		
	});
	
	$('.reply_update').click(function(){
		let no=$(this).attr("value");
		$('.rIn').hide();
		$('.rUp').hide();
		if(u==0)
		{
			$('#rUp'+no).show();
			u=1;
		}
		else
		{
			$('#rUp'+no).hide();
			u=0;
		}
	})
	let d=0;
	$('#delBtn').click(function(){
		if(d==0)
		{
			$('#delTr').show();
			d=1;
		}
		else
		{
			$('#delTr').hide();
			d=0;
		}
	});
});

</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table" style="width:1200px; margin:0px auto; margin-top:50px;">
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
					<td width=30% class="text-left">${sessionScope.id } </td>
					
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
					            <img src="${vo.poster }" width=500px height=500px>
					         </c:when>
					         <c:when test = "${fn:contains(vo.poster, 'myohagae')}">
					            <img src="${vo.poster }" width=500px height=500px>
					         </c:when>
					         <c:otherwise>
					          	<img src="../TempPoster/${vo.poster}" width=500px height=500px>
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
            <c:if test="${sessionScope.id==sessionScope.id }">
                 <a href="../temp/update.do?petno=${vo.petno }" class="btn btn-sm btn-primary" value="${vo.petno}">수정</a>
           		 <a href="../temp/delete_ok.do?petno=${vo.petno }" class="btn btn-sm btn-primary" onclick="return confirm('선택한 게시물을 삭제하시겠습니까?');">삭제</a>
             </c:if>       
            </td>
            </tr>
         </table>      
         
      	<!----------------- 댓글리스트 ------------------>		
     
			 <div class="row row1">
				    <h3>comment</h3>
				    <hr>
				    <c:forEach var="rvo" items="${trList }">
				      <table class="table">
				        <tr>
				          <td class="text-left">
				           <c:if test="${rvo.group_tap>0 }">
				             <c:forEach var="i" begin="1" end="${rvo.group_tap }">
				              	&nbsp;<!-- &nbsp;&nbsp;&nbsp;  -->
				             </c:forEach>
				            <%--  ${rvo.content} --%>
				            
				           </c:if>
				         &nbsp;<b>${rvo.id }</b> 
				       <!--   <td style="font-size:8px; color:#848484;"> -->
				         <fmt:formatDate value="${rvo.regdate }" pattern="YYYY-MM-dd"  /> 
				        
				          </td>
				          <td class="text-right">
				            <c:if test="${sessionScope.id==rvo.id }">
				             <span class="btn btn-xs reply_update" value="${rvo.replyno }"id="b1" >수정</span>
				             <a href="../temp/reply_delete.do?no=${rvo.replyno }&bno=${vo.petno}" class="btn btn-xs delBtn" id="b2" onclick="return confirm('선택한 댓글을 삭제하시겠습니까?')" >삭제</a>
				             
				             <span class="btn btn-xs reply_reply" value="${rvo.replyno }" id="b3" >댓글</span>
				            </c:if>
				          </td>
				        </tr>
				        <tr>
				          <td class="text-left" colspan="2">
				            <c:if test="${rvo.group_tap>0 }">
				             <c:forEach var="i" begin="1" end="${rvo.group_tap }">
				               &nbsp;&nbsp; &nbsp;&nbsp;
				             </c:forEach>
				           </c:if>
				           	 &nbsp;&nbsp; &nbsp;&nbsp;
				            <pre style="white-space: pre-wrap;background-color: white;border:none">${rvo.content }</pre>
				          </td>
				        </tr>
				       <tr class="rIn" id="rIn${rvo.replyno }" value="${rvo.replyno }" style="display:none">
				       <td colspan="2">
				        <form method=post action="../temp/reply_reply_insert.do">
				            <input type=hidden name="replyno" value="${rvo.replyno }">
				            <input type=hidden name="petno" value="${vo.petno }">
					        <textarea rows="3" cols="80" name="content" style="float: left"></textarea>
					        <input type=submit value="댓글쓰기" style="height:70px;float: left"
					          class="btn btn-sm "
					        > 
				        </form>
				       </td>
				      </tr>
				      <tr class="rUp" id="rUp${rvo.replyno }" value="${rvo.replyno }" style="display:none">
				       <td colspan="2">
				        <form method=post action="../temp/reply_update.do">
				            <input type=hidden name="replyno" value="${rvo.replyno }">
				            <input type=hidden name="petno" value="${vo.petno }">
					        <textarea rows="3" cols="80" name="content" style="float: left">${rvo.content }</textarea>
					        <input type=submit value="댓글수정" style="height:70px;float: left"
					          class="btn btn-sm reply_update"
					        >
				        </form>
				       </td>
				      </tr>
				      </table>
				    </c:forEach>
				    <hr>
				    
				    <!------------댓글폼  --------------->
				    <table class="table">
				      <tr>
				       <td>
				        <c:if test="${sessionScope.id==null }">
					        <textarea rows="3" cols="80" name="content" style="float: left" placeholder="로그인 후 입력해주세요"></textarea>
					    </form>
				        </c:if>
				       <c:if test="${sessionScope.id!=null }">
				        <form method=post action="../temp/reply_insert.do">
				            <input type=hidden name="petno" value="${vo.petno }">
					        <textarea rows="3" cols="80" name="content" style="float: left" ></textarea>
					        <input type=submit value="댓글쓰기" style="height:70px;float: left;margin:10px;"
					          class="btn btn-sm" id="b4"
					        >
				        </form>
				        </c:if>
				       </td>
				      </tr>
				    </table>
				  </div>	

				<!-----------------목록버튼 --------------->
				
				<table class="table">
				<div class="text-right" style="padding-right:1200px;  margin:10px">
				<tr>
				<td></td>
				<tr>
				 <span class="btn btn-sm py-3 px-4 back" value="${vo.cate}">목록</span>
				</table>
				</div>
				</div>	
				
				
</body>
</html>