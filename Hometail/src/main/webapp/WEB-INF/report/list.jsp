<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<style type="text/css">
div.containerX a
{
    color: #FFF;
    text-decoration: none;
    font: 20px Raleway;
    margin: 0px 10px;
    padding: 10px 10px;
    position: relative;
    z-index: 0;
    cursor: pointer;
}

div.topBotomBordersOut a:before, div.topBotomBordersOut a:after
{
    position: absolute;
    left: 0px;
    width: 100%;
    height: 2px;
    background: #0082C6;
    content: "";
    opacity: 0;
    transition: all 0.3s;
}

div.topBotomBordersOut a:before
{
    top: 0px;
    transform: translateY(10px);
}

div.topBotomBordersOut a:after
{
    bottom: 0px;
    transform: translateY(-10px);
}


div.topBotomBordersOut a:hover:before, div.topBotomBordersOut a:hover:after
{
    opacity: 1;
    transform: translateY(0px);
}

</style>

<script type="text/javascript">


$(function() {
	//전체,실종,제보,완료 버튼 누를때마다 카테고리 변경 용도
	$('div .containerX a').click(function(){
		cate=$(this).attr("cate");
		
		if(cate!=4)
		{
		$.ajax({
				type:'post',
				url:'../report/list.do',
				data: {cate:cate}, //버튼누를때마다 카테고리별 정렬
				success:function(result)
				{
					console.log("cate!=4");
					$('#tagin').html(result);
				}
			})
		}
		if(cate==4)
		{
		$.ajax({
				type:'post',
				url:'../report/around.do',
				success:function(result)
				{
					console.log("cate==4");
					$('#tagin').html(result);
				}
			})
		}
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
			<div class="containerX blue topBotomBordersOut" style="margin-bottom: 20px; margin-top: 20px;">
			  <a cate=0 style="color: black; font-weight: 800;">전체</a>
			  <a cate=1 style="color: black; font-weight: 800;">실종</a>
			  <a cate=2 style="color: black; font-weight: 800;">제보</a>
			  <a cate=3 style="color: black; font-weight: 800;">완료</a>
			  <a cate=4 style="color: black; font-weight: 800;">주변</a>
			</div>
			<div>
				<a href="../report/insert.do">글쓰기</a>
			</div>
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


