<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
border-style: outset;border-color: #b3e5fc;
}
</style>
</head>
<body>
          	<div class="row">
          	<c:forEach var="vo" items="${list }">
          		<div class="col-md-4 ftco-animated">
		            <div class="blog-entry">
		              <a href="../clinic/detail.do?no=${vo.clno }">
		              <c:choose>
		               <c:when test="${vo.poster==null }">
		                <img src="../images/aa.jpg"  class="block-20" width=120% height=80% id="climage">
		               </c:when>
		               <c:otherwise>
		                <img src="${vo.poster }" class="block-20" width=120% height=80% id="climage">
		               </c:otherwise>
		              </c:choose>
		              </a>
		              <div class="text d-flex py-4">
		                <div class="meta mb-3">
		                  <div><a href="#">Jan. 20, 2019</a></div>
		                  <div><a href="#">Admin</a></div>
		                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
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
                              <li page="${startPage-1 }">
                                  <a class="page-link" >
                                    &lt;
                                    </a>
                              </li>
                              </c:if>
                              <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i==curpage }">
                              <li class="page_item active" page="${i}">
                                  <a class="page-link">${i }</a>
                              </li>
                              </c:if>
                              <c:if test="${i!=curpage }">
                              	<li class="page_item" page="${i}">
                                  <a class="page-link">${i }</a>
                              </li>
                              </c:if>
                              </c:forEach>
                              <c:if test="${endPage<totalpage }">
                              <li page=${endPage+1 }>
                                  <a class="page-link">
                                      &gt;
                                  </a>
                              </li>
                            </c:if>
		              </ul>
		            </div>
		          </div>
		        </div>
</body>
</html>