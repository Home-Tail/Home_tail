<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.containerX a
{
   
 
  background-color:#FFFFFF;
  color:#000000  ;
  border: thick double #A9A9A9;
 
}
div.containerX a:hover
{
   
 border: thick double #EDA900;
 
}
/* #new
{
  background-color:#ff4500;
  color:#FFFFFF  ;
} */
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	
	// 로그인 안했을때 글등록하기 버튼 미노출
	$('#new').click(function(){
		console.log('등록하기 클릭');
	$.ajax({
		type:'POST',
		/* data:{cate:cate}, */
		url:'../temp/insert.do',
		success:function(result)
		{
			$('#tagin').html(result);
		}
	});
});
	
	//버튼 누를때마다 카테고리 변경 용도
	$('div .containerX a').click(function(){
		cate=$(this).attr("cate");
			
		$.ajax({
				type:'post',
				url:'../temp/list.do',
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
				url:'../temp/list.do',
				data: {page:page,cate:cate}, //cate를 가지고 넘겨야 카테고리별로 페이지 넘김 가능
				success:function(result)
				{
					$('#tagin').html(result);
				}
		})
	});
})
</script>

</head>
<body>
<div class="container">
     <div class="row">
        <div class="col-lg-12" >
           <!-- 카테고리 버튼 -->
         <div class="containerX topBotomBordersOut" style="margin-bottom: 20px; margin-top: 20px;">
           <a cate=0 class="btn btn-sm py-2 px-4">전체</a>
           <a cate=5 class="btn btn-sm py-2 px-3" >보호중</a>
           <a cate=6 class="btn btn-sm py-2 px-3" >보호요청</a>
              <c:if test="${sessionScope.id!=null }">
                   <span class="btn btn-sm btn-primary py-2 px-4" id="new" style="float:right;">등록하기</span>
             </c:if>    
         </div>
         </div>
           <c:forEach items="${list }" var="vo"  >

					<div class="col-md-3 ftco-animated">
			   		<div class="blog-entry">
						   			<!----------사진 출력 코드  ----------------->
						   			<c:set var = "po" value = "${vo.poster}"/>
								      <c:choose>
								         <c:when test = "${fn:contains(vo.poster, 'zooseyo')}">
								            <a href="../temp/detail.do?no=${vo.petno }" class="block-20" style="background-image: url('${vo.poster}');"></a>
								         </c:when>
								         <c:when test = "${fn:contains(vo.poster, 'myohagae')}">
								          <a href="../temp/detail.do?no=${vo.petno }" class="block-20" style="background-image: url('${vo.poster}');"></a>
								         </c:when>
								         <c:otherwise>
								          	<a href="../temp/detail.do?no=${vo.petno }" class="block-20" style="background-image: url('../TempPoster/${vo.poster}');"></a>
								          </c:otherwise>
								      </c:choose>
				     	<div class="text d-flex py-4">
				        <div class="desc pl-4XX" style="width: calc(100%);">
			     
			        <c:if test="${vo.cate==5 }">
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;" ><b><span style="color:#0000ff;">[보호중]</span>${vo.title }</b></a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">${vo.loc }</a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">발견날짜 : <fmt:formatDate pattern="yyyy-MM-dd " value="${vo.pdate}" /></a></h6>
			         </c:if>
			         
			         <c:if test="${vo.cate==6 }">		     
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;" ><b><span style="color:#FF0000;">[보호요청] </span>${vo.title }</b></a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">${vo.loc }</a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">발견날짜 : <fmt:formatDate pattern="yyyy-MM-dd " value="${vo.pdate}" /></a></h6>
			         </c:if>
			         
			         <c:if test="${vo.cate==7 }">
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;" ><b><span style="color:#3cb371;">[찾았어요] </span>${vo.title }</b></a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">${vo.loc }</a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">발견날짜 : <fmt:formatDate pattern="yyyy-MM-dd " value="${vo.pdate}" /></a></h6>
			         </c:if>
			         
			  		 </div>
			     </div>
			   </div>
			 </div>
			</c:forEach>
			</div>
			
			
			<!-- 페이지버튼 -->
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