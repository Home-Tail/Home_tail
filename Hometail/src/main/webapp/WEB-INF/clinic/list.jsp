<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18b988d228ba568335019cf062c1ebf7"></script>
<script type="text/javascript">
 $(function(){ 
	$('li').click(function(){ 
	
 		let page = $(this).attr("page");
 		console.log(page);
 	 $.ajax({
 		 type:'POST',
		 url:'../clinic/list.do?page='+page,
// 		 data:{page:page},
		 success:function(result)
		 { 
			 $('#tagin').html(result);
 		 }
	 }) 
})
 });
</script>
<style>
#climage{
border-style: solid;border-color: #B0E0E6;
border-radius: 25px;
}
.heading{
font-family: 'Jua', sans-serif;
}
</style>
</head>
<body>
        
        
        <div class="row">
         <c:forEach var="vo" items="${list }">
          		<div class="col-md-6 ftco-animated">
		            <div class="blog-entry">
		             <c:choose>
		               <c:when test="${vo.poster==null }">
		              <a href="../clinic/detail.do?no=${vo.clno }" id="climage" class="block-20" style="background-image: url('../images/aa.jpg');">
		              </a>
		              </c:when>
		              <c:otherwise>
		              <a href="../clinic/detail.do?no=${vo.clno }" id="climage" class="block-20" style="background-image: url('${vo.poster}');">
		              </a>
		              </c:otherwise>
		              </c:choose>
		              <div class="text d-flex py-4">
		                <div class="meta mb-3">
		                </div>
		                <div class="desc pl-3">
		                <h3 class="heading"><a href="../clinic/detail.do?no=${vo.clno }">${vo.title }</a></h3>
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
</body>
</html>