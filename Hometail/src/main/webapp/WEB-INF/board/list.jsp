<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$('.cate').hover(function(){
			$(this).css("cursor", "pointer")
		}, function(){
			$(this).css("cursor", "")
		});
		
		$('.cate').click(function(){
			let no=$(this).attr("value");
			$.ajax({
				type:'POST',
				url:'../recommend/recomm_list.do',
				data:{"no":no},
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
	        <!-- <div class="col-md-2">
	        	<table>
	        		<tr>
	        			<td><span class="btn" value="1">자유게시판</span></td>
	        		</tr>
	        		<tr>
	        			<td><span class="btn" value="2">입양후기</span></td>
	        		</tr>
	        		<tr>
	        			<td><span class="btn" value="3">봉사후기</span></td>
	        		</tr>
	        		<tr>
	        			<td><span class="btn" value="4">Q&A</span></td>
	        		</tr>
	        	</table>
	        </div>	 -->
	        <!-- <div class="col-md-12" >
	        
	        <table class="table">
	         <tr>
	           <td>
	             <a href="insert.do" class="btn btn-sm btn-primary">새글</a>
	           </td>
	         </tr>
	       </table>
	       <table class="table">
	       		<tr>
	       			 <c:forEach var="vo" items="${list }">
	       			 	<td><img src="${vo.poster }"></td>
	       			 	<td>${vo.title }
	       			 </c:forEach>
	       		</tr>
	       </table>
	       
       <table class="table table-striped">
         <tr class="danger">
           <th class="text-center" width=10%>번호</th>
           <th class="text-center" width=45%>제목</th>
           <th class="text-center" width=15%>이름</th>
           <th class="text-center" width=20%>작성일</th>
           <th class="text-center" width=10%>조회수</th>
         </tr>
         <c:forEach var="vo" items="${list }">
           <tr>
               <td class="text-center" width=10%>${vo.board_no }</td>
	           <td class="text-left" width=45%>
	             <a href="detail.do?board_no=${vo.board_no }">${vo.title }</a>
	           </td>
	           <td class="text-center" width=15%>${vo.id }</td>
	           <td class="text-center" width=20%>
	             <fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/>
	           </td>
	           <td class="text-center" width=10%>${vo.hit }</td>
           </tr>
         </c:forEach>
       </table>
        
       <table class="table">
         <td class="text-center">
          <a href="#" class="btn btn-sm btn-primary">이전</a>
          ${curpage } page / ${totalpage } pages
          <a href="#" class="btn btn-sm btn-primary">다음</a>
         </td>
       </table>
	        </div>    
	</div>	
     -->
		
		<section class="ftco-section">
			<div class="container">
				<div class="row">
				<div class="col-lg-3 sidebar ftco-animate">
            <div class="sidebar-box ftco-animate">
            	<h3>Category</h3>
              <ul class="categories">
                <li><span class="cate" value="1">자유게시판</span></li>
                <li><span class="cate" value="2">입양후기</span>
                <li><span class="cate" value="3">봉사후기</span>
                <li><span class="cate" value="4">Q&A</span>
              </ul>
            </div>
            </div>
          <div class="col-lg-9">
          	<div class="row">
          	 <c:forEach var="vo" items="${list }">
          		<div class="col-md-4 ftco-animate">
		            <div class="blog-entry">
		              <a href="blog-single.html" class="block-20" style="background-image: url('${vo.poster}');">
		              </a>
		              <div class="text d-flex py-4">
		                <div class="meta mb-3">
		                  <div>${vo.regdate }</div>
		                  <div>${vo.id }</div>
		                </div>
		                <div class="desc pl-3">
			                <h3 class="heading">${vo.title }</h3>
			              </div>
		              </div>
		            </div>
		          </div>
		         </c:forEach>
          	</div>
          	<div class="row no-gutters my-5">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
		                <li><a href="#">&lt;</a></li>
		                <li class="active"><span>1</span></li>
		                <li><a href="#">2</a></li>
		                <li><a href="#">3</a></li>
		                <li><a href="#">4</a></li>
		                <li><a href="#">5</a></li>
		                <li><a href="#">&gt;</a></li>
		              </ul>
		            </div>
		          </div>
		        </div>
          </div>

          


			</div>
</body>
</html>