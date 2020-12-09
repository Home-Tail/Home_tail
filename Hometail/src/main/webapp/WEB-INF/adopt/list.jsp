<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<body>
<section class="hero-wrap hero-wrap-2" style="background-image: url('../images/adopt.jpg');" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">입양</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="../main/main.do">Home <i class="ion-ios-arrow-forward"></i></a></span> <span><a href="../adopt/process.do">입양절차 <i class="ion-ios-arrow-forward"></i></a></span></p>
          </div>
        </div>
      </div>
</section>

<!-- cate -->

 <!-- cate end -->
 <%-- <section class="ftco-section ftco-client">
			<div class="container">
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-client owl-carousel">
            <c:forEach var="vo" items="${aList }">
              <div>
                <a href="../adopt/detail.do?no=${vo.adno }" class="client text-center p-5">
                	<tr>
		           <td>
		            <img src="${vo.poster }" width=35 height=35>
		           </td>
		           <td>${vo.cate }</td>
		           <td>${vo.punumber }</td>
		         </tr>
                </a>
              </div>
			  </c:forEach>
            </div>
          </div>
        </div>
			</div>
		</section>  --%>
<!-- cate end -->
<!-- list -->
	<section class="ftco-section">
		 <%-- <div class="container">
    		<div class="row justify-content-start mb-5 pb-2">
          <div class="col-md-4 heading-section ftco-animate">
          	<span class="subheading subheading-with-line"><small class="pr-2 bg-light">Search</small></span>
            <h2 class="mb-4">검색</h2>
          </div>
          <div class="col-md-8 pl-md-5 heading-section ftco-animate">
          	<form name="form1" method="post" action="list.do">
			    <select name="search_option">
			        <option value="all" 
			<c:if test="${map.search_option == 'all'}">selected</c:if>
			        전체>ㅈ</option>
			        <option value="title" 
			<c:if test="${map.search_option == 'punumber'}">selected</c:if>
			        >공고번호</option>
			        <option value="content" 
			<c:if test="${map.search_option == 'cate'}">selected</c:if>
			        >축종</option>
			
			
			    </select>
			    <input name="keyword" value="${map.keyword}">
			    <input type="submit" value="조회">
			</form>
          	
          </div>
        </div>
    	</div> --%>
    	<div class="container">
    		<div class="row">
    		<c:forEach var="vo" items="${list }">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="project">
	    				<img src="${vo.poster}" alt="" width="350" height="250">
	    				<div class="text">
	    					<span>공고번호</span>
	    					<h3><a href="../adopt/detail.do?no=${vo.adno }">${vo.punumber }</a></h3>
	    				</div>
	    				
    				</div>
    			</div>
    			</c:forEach>
    	</div>
    </section>

		          <!-- page -->
				<div class="row no-gutters my-5">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
		              <c:if test="${curpage>BLOCK }">
		                <li><a href="../adopt/list.do?page=${startPage-1 }">&lt;</a></li>
		              </c:if>
		              <c:forEach var="i" begin="${startPage }" end="${endPage }">
		              <c:if test="${i==curpage }">
		               	 	<li class="active"><a href="../adopt/list.do?page=${i }">${i }</a></li>
		                </c:if>
		                <c:if test="${i!=curpage }">
		                	<li><a href="../adopt/list.do?page=${i }">${i }</a></li>
		                </c:if>
					</c:forEach>
					<c:if test="${endPage<totalpage }">
		                <li><a href="../adopt/list.do?page=${endPage+1 }">&gt;</a></li>
		             </c:if>   
  
		              </ul>
		            </div>
		          </div>
		        </div>
          </div>
			</div>
		</section>
</body>
</html>