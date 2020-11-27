<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
			<div class="container">
				<div class="row">
          <div class="col-lg-8">
          	<div class="row">
          	<c:forEach var="vo" items="${list }">
          		<div class="col-md-6 ftco-animated">
		            <div class="blog-entry">
		              <a href="../clinic/detail.do?no=${vo.clno }">
		              <c:choose>
		               <c:when test="${vo.poster==null }">
		                <img src="../images/aa.jpg"  class="block-20" width=420 height=100>
		               </c:when>
		               <c:otherwise>
		                <img src="${vo.poster }" class="block-20" width=420 height=100>
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
                              <li class="page_item">
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
                              <li class="page_item">
                                  <a class="page-link">
                                      &gt;
                                  </a>
                              </li>
                            </c:if>
		              </ul>
		            </div>
		          </div>
		        </div>
          </div>
        </div>
			</div>
  <!-- loader -->
<%--   <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div> --%>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
</body>
</html>