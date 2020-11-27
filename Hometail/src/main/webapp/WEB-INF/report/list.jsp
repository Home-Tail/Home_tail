<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<script type="text/javascript">


$(function() {
	//전체,실종,제보,완료 버튼 누를때마다 카테고리 변경 용도
	$('.btn').click(function(){
		cate=$(this).attr("cate");
		$.ajax({
				type:'post',
				url:'../report/list.do',
				data: {cate:cate}, //버튼누를때마다 카테고리별 정렬
				success:function(result)
				{
					$('#tagin').html(result);
				}
			})
	});
	
	//페이지 넘기는 용도
	$('li').click(function(){
		let page=$(this).attr("page");
		$.ajax({
				type:'post',
				url:'../report/list.do',
				data: {page:page,cate:cate}, //cate를 가지고 넘겨야 카테고리별로 페이지 넘김 가능
				success:function(result)
				{
					$('#tagin').html(result);
				}
			})
	});
});
</script>

</head>
<body>
	
	<div class="container">
	  <div class="row">
        <div class="col-lg-12" >
        	<!-- 카테고리 버튼 -->
			<a cate=0 class="btn  px-3 py-6 mt-3 mb-3" style="margin-left: 10px; cursor: pointer; color: white; background-color:black" >전체</a>
			<a cate=1 class="btn  px-3 py-6 mt-3 mb-3" style="margin-left: 10px; cursor: pointer; color: white; background-color:#ff00a9">실종</a>
			<a cate=2 class="btn  px-3 py-6 mt-3 mb-3" style="margin-left: 10px; cursor: pointer; color: white; background-color:#28a745">제보</a>
			<a cate=3 class="btn  px-3 py-6 mt-3 mb-3" style="margin-left: 10px; cursor: pointer; color: white; background-color:#939782">완료</a>
		<div class="row">
			
			<!-- 실제 리스트 출력 -->
			<c:forEach items="${list }" var="vo">
				<div class="col-md-3 ftco-animated">
			   <div class="blog-entry">
			     <a href="../report/detail.do?no=${vo.petno }" class="block-20" style="background-image: url('${vo.poster}');">
			     </a>
			     <div class="text d-flex py-4">
			       <div class="desc pl-4XX" style="width: calc(100%);">
			        <c:if test="${vo.cate==1 }">
			         <h6><a href="../report/detail.do?no=${vo.petno }" style="color: black; font-weight: 800;"><span style="color:#ff00a9;">[실종]</span>${vo.title }</a></h6>
			         <h6><a href="../report/detail.do?no=${vo.petno }" style="color: black;">${vo.loc }</a></h6>
			         <h6><a href="../report/detail.do?no=${vo.petno }" style="color: black;">실종날짜 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vo.pdate}" /></a></h6>
			     </c:if>
			        <c:if test="${vo.cate==2 }">
			         <h6><a href="../report/detail.do?no=${vo.petno }" style="color: black; font-weight: 800;"><span style="color:#28a745;">[제보]</span>${vo.title }</a></h6>
			         <h6><a href="../report/detail.do?no=${vo.petno }" style="color: black;">${vo.loc }</a></h6>
			         <h6><a href="../report/detail.do?no=${vo.petno }" style="color: black;">실종날짜 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vo.pdate}" /></a></h6>
			     </c:if>
			        <c:if test="${vo.cate==3 }">
			         <h6><a href="../report/detail.do?no=${vo.petno }" style="color: black; font-weight: 800;"><span style="color:#939782;">[완료]</span>${vo.title }</a></h6>
			         <h6><a href="../report/detail.do?no=${vo.petno }" style="color: black;">${vo.loc }</a></h6>
			         <h6><a href="../report/detail.do?no=${vo.petno }" style="color: black;">실종날짜 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vo.pdate}" /></a></h6>
			     </c:if>
			   </div>
			     </div>
			   </div>
			 </div>
			</c:forEach>
		</div>
	     	
		<!-- 페이지 넘기는 버튼 -->
		<div class="row no-gutters my-5">
			  <div class="col text-center">
			    <div class="block-27">
			      <ul>
			      	<c:if test="${curpage>BLOCK }">
			        	<li page="${startPage-1 }"><a style="cursor: pointer;">&lt;</a></li>
			        </c:if>
			        
			        <c:forEach var="i" begin="${startPage }" end="${endPage }">
			         	<c:if test="${i==curpage }">
		                     <li class="active" page="${i }">
		                         <a style="cursor: pointer;">${i }</a>
		                     </li> 
			            </c:if>
			            <c:if test="${i!=curpage }">
		                     <li page="${i }">
		                         <a style="cursor: pointer;">${i }</a>
		                     </li>
			        	</c:if>
			         </c:forEach>
			        
			        <c:if test="${endPage<totalpage }">
			        	<li page="${endPage+1 }"><a style="cursor: pointer;">&gt;</a></li>
			        </c:if>
			        
			      </ul>
			    </div>
			  </div>
		</div>
		</div>
   	  </div>
	</div>
</body>
</html>


