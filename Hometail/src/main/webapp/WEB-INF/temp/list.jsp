<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
	<section class="hero-wrap hero-wrap-2" style="background-image: url('../images/temp.jpg');" data-stellar-background-ratio="0.5">
      <!-- <div class="overlay"></div> -->
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">임시보호</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="../main/main.do">Home</a></span></p>
          </div>
        </div>
      </div>
</section>
			
				<section class="ftco-section">
	  			<div class="container">
        		<div class="col-lg-12">
        		<div class="row">
        			<tr>
		      			 <td>
		        			<a href="../temp/insert.do" class="btn btn-sm btn-primary py-2 px-4">등록하기</a>
		       			</td>
		    		 </tr>
					 <table class="table">
		     			
		  			 </table>
		  			 
			 		<c:forEach var="vo"  items="${list }">
					<div class="col-md-3 ftco-animated">
			   		<div class="blog-entry">
			     		<a href="../temp/detail.do?no=${vo.petno }" class="block-20" style="background-image: url('${vo.poster}');">
			     		</a>
				     	<div class="text d-flex py-4">
				        <div class="desc pl-4XX" style="width: calc(100%);">
			     
			        <c:if test="${vo.cate==5 }">
			         <h5><a href="../temp/detail.do?no=${vo.petno }" ></a></h5>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;" ><b><span style="color:#0000ff;">[보호중]</span>${vo.title }</b></a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">${vo.loc }</a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">발견날짜 : <fmt:formatDate pattern="yyyy-MM-dd " value="${vo.pdate}" /></a></h6>
			         </c:if>
			         
			         <c:if test="${vo.cate==6 }">
			         <h5><a href="../temp/detail.do?no=${vo.petno }" ></a></h5>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;" ><b><span style="color:#FF0000;">[보호요청] </span>${vo.title }</b></a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">${vo.loc }</a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">발견날짜 : <fmt:formatDate pattern="yyyy-MM-dd " value="${vo.pdate}" /></a></h6>
			         </c:if>
			         
			   </div>
			     </div>
			   </div>
			 </div>
			</c:forEach>
			</div>
			</section>
			
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
		                         <a href="../temp/list.do?page=${i}" style="cursor: pointer;">${i }</a>
		                     </li> 
			            </c:if>
			            <c:if test="${i!=curpage }">
		                     <li page="${i }">
		                         <a href="../temp/list.do?page=${i}" style="cursor: pointer;">${i }</a>
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


