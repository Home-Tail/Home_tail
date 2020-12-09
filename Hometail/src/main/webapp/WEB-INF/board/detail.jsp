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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){ 
		 $('#boardDel').click(function(){
			 // board_no, content
			    var board_no = $('#delBoard_no').val();
			    var cate = $('#delCate').val();
			   console.log('삭제 board_no : '+board_no);
			   console.log('삭제 cate : '+cate);
				  $.ajax({
					type:'POST',
					data:{'cate':cate},
					url:'../board/delete_ok.do?board_no='+board_no,
					success:function(res) 
					{
						$('#print').html(res);
					}
				}); 			 
		 })
		$('.update').click(function(){
			let board_no = $(this).attr("value");		
			$.ajax({
				type:'POST',
				url:'../board/update.do',
				data:{'board_no':board_no},
				success:function(res) 
				{
					$('#print').html(res);
				}
			});
		});
		 $('.back').click(function(){
			 no=$(this).attr("value");
				console.log(no+'클릭');
				$.ajax({
					type:'POST',
					url:'../board/cboard_list.do',
					data:{"no":no},
					success:function(res)
					{
						$('#print').html(res);
					}
				});
			});
		 
		 
		 let i=0;
		 $(function(){
		 	$('.upBtn').click(function(){
		 		$('.rupdate').hide();
		 		let no=$(this).attr("data-no");
		 		if(i==0)
		 		{
		 			$(this).text("취소");
		 			$('#reply_up'+no).show();
		 			i=1;
		 		}
		 		else
		 		{
		 			$(this).text("수정");
		 			$('#reply_up'+no).hide();
		 			i=0;	
		 		}
		 	})
		 	
		 });
		 $('#replyBtn').click(function(){
			 // board_no, content
			    var board_no = $('#for_test').attr("value");
			   var content =$('#reply_content').val();
			   console.log('board_no : '+board_no);
			   console.log('reply_content : '+reply_content);
				 $.ajax({
					type:'POST',
					url:'../board/board_reply_insert.do?board_no='+board_no,
					data:{'content':content},
					success:function(res) 
					{
						$('#print').html(res);
					},
					 error : function(error) {
					        alert("로그인 해주세요!");
					    }
				}); 			 
		 })

		 $('#replyUpdate').click(function(){
			 // board_no, content
			    var board_no = $('#reUpBno').attr("value");
			   var replyno=$('#reUpRno').attr("value");
			   var content =$('#reUpContent').val();
			   console.log('수정 board_no : '+board_no);
			   console.log('수정 replyno : '+replyno);
			   console.log('수정 content : '+content);
				 $.ajax({
					type:'POST',
					url:'../board/reply_update.do?board_no='+board_no+'&replyno='+replyno,
					data:{'content':content},
					success:function(res) 
					{
						$('#print').html(res);
					}
				}); 			 
		 })
		 
		 $('#reDelBtn').click(function(){
			 // board_no, content
			    var board_no = $('#del_bno').attr("value");
			   var replyno=$(this).attr("data-no");
			   console.log('삭제 replyno : '+replyno);
			   console.log('삭제 board_no : '+board_no);
				  $.ajax({
					type:'POST',
					url:'../board/reply_delete.do?board_no='+board_no+'&replyno='+replyno,
					success:function(res) 
					{
						$('#print').html(res);
					}
				}); 			 
		 })
		 
	});
</script> 
</head>
<body>
   <div class="container">
     <div class="row">
	      <table class="table">
	      <c:if test="${!empty vo.poster }">
		        <tr>
		        <td colspan=4 class="text-center">
		       		 <c:set var = "po" value = "${vo.poster}"/>
					      <c:choose>
					         <c:when test = "${fn:contains(vo.poster, 'adoptreview')}">
					            <img src="${vo.poster }" width=400px height=400px>
					         </c:when>
					         <c:otherwise>
					          	<img src="../boardPoster/${vo.poster}" width=400px height=400px>
					          </c:otherwise>
					      </c:choose>
					 </td>
		        </tr>
		   </c:if>
	        <tr>
	          <th width=20% class="text-center danger">이름</th>
	          <td width=30% class="text-center">${vo.id }</td>
	          <th width=20% class="text-center danger">조회수</th>
	          <td width=30% class="text-center">${vo.hit }</td>
	        </tr>
	        <tr>
	          <th width=20% class="text-center danger">제목</th>
	          <td class="text-left">${vo.title }</td>
	          <th width=20% class="text-center danger">작성일</th>
	          <td width=30% class="text-center"> 
	            <fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/>
	          </td>
	        </tr>
	        <tr>
	          <td colspan="4" class="text-left" valign="top" height=200>
	            ${vo.content }
	          </td>
	        </tr>
	        <tr>
	          <td colspan="4" class="text-right">
	          <c:if test="${sessionScope.id==vo.id }">
				     <input type=hidden name=delBoard_no value=${vo.board_no } id="delBoard_no">
				     <input type=hidden name=delCate value=${cate } id="delCate">
		            <span class="btn btn-sm btn-primary update" value="${ vo.board_no}" id="boardUp">수정</span>
		            <span class="btn btn-sm btn-primary" value="${ vo.board_no}" id="boardDel">삭제</span>
		      </c:if>      
	            <span class="btn btn-sm btn-primary back" value="${cate }">목록</span>
	          </td>
	        </tr>
	      </table>
	             <!-- 댓글 출력 -->
       		<table class="table">
       		<tr>
       			<td>
       				<c:forEach var="rvo" items="${rlist }">
       					<table class="table">
       						<tr>
       							<td class="text-left">
       								☆${rvo.id }(${rvo.db_regdate })
       							</td>
       							<td class="text-right">
       								<c:if test="${sessionScope.id==rvo.id }">
				       					<input type=hidden name=del_bno value=${vo.board_no } id="del_bno">
       									<span class="btn btn-xs btn-primary upBtn" data-no="${rvo.replyno }">수정</span>
       									<span class="btn btn-xs btn-primary reDel" data-no="${rvo.replyno }" id="reDelBtn">삭제</span>
       								</c:if>
       							</td> 
       						</tr>
       						<tr>
       							<td colspan=2>
       							<pre style="white-space:pre-line; border=none; background-color:white;">
       								${rvo.content }
       							</pre>
       							</td>
       						</tr>
				       			<tr id="reply_up${rvo.replyno }" class="rupdate" style="display:none;">
				       				<td colspan=2>
				       					<form method=post action="reply_update.do">
					       					<input type=hidden name=board_no value=${vo.board_no } id="reUpBno">
					       					<input type=hidden name=replyno value=${rvo.replyno } id="reUpRno">
					       					<textarea rows="2" cols="100" style="float:left; margin-right:20px;" name=content id="reUpContent">${rvo.content }</textarea>
					       					<input type=button class="btn btn-sm btn-primary" value="수정하기" style="height:50px; float:left;" id="replyUpdate">
				       					</form>
				       				</td>
				       			</tr> 
       					</table>
       				</c:forEach>
       			</td>
       		</tr>
       		
				<c:choose>
					<c:when test = "${cate==4 && sessionScope.id eq 'admin'}">
					    <tr>
	       				<td>
	       					<form method=post action="board_reply_insert.do" id="replyForm" name="replyForm">
		       					<input type=hidden id="for_test" name=board_no value="${vo.board_no }">
		       					<input type=hidden name=cate value=${cate }> 
		       					<textarea rows="2" cols="100" style="float:left; margin-right:20px;" name=content id="reply_content"></textarea>
		       					<input type=button class="btn btn-sm btn-primary" value="댓글쓰기" style="height:50px; float:left;" id="replyBtn">
	       					</form>
	       				</td>
	       			</tr>
					</c:when>
					<c:when test = "${cate==4 && sessionScope.id != 'admin'}">
					    <tr>
	       				<td class="text-center" colspan=2>
	       					<span style="color:red; font-weight:bold;">* 답변은 관리자만 작성 가능합니다. *</span>
	       				</td>
	       			</tr>
					</c:when>
					<c:when test = "${cate==1 or cate==2}">
					    <tr>
	       				<td>
	       					<form method=post action="board_reply_insert.do" id="replyForm" name="replyForm">
		       					<input type=hidden id="for_test" name=board_no value="${vo.board_no }">
		       					<input type=hidden name=cate value=${cate }> 
		       					<textarea rows="2" cols="100" style="float:left; margin-right:20px;" name=content id="reply_content"></textarea>
		       					<input type=button class="btn btn-sm btn-primary" value="댓글쓰기" style="height:50px; float:left;" id="replyBtn">
	       					</form>
	       				</td>
	       			</tr>
					</c:when>
				</c:choose>
       		</table>
       	</div>
     </div>
</body>
</html>