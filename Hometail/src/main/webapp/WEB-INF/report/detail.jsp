<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="container">
		<div class="row">
<!--           <div class="col-md-12"> -->
            <table class="table">
            	<tr>
            		<td colspan=4><h3>${vo.title }</h3></td>   
            	</tr>
            	<tr>     
            		<td>작성자:</td>
            		<td>${vo.id }</td>
					<td>작성일:</td>
            		<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>      
             	</tr>
            	
            	<tr>
             	<td colspan=4>
<%--              	<img src="${vo.poster }" style="width: 100px; height: 100px"> --%>
             	
<!--        		<section class="ftco-section ftco-client"> -->
			<div class="container">
				<div class="row justify-content-start mb-2 pb-2">
        	</div>
	        <div class="row ftco-animate">
	          <div class="col-md-12">
	            <div class="carousel-client owl-carousel" >
	              <div class="item" class="client text-center p-5" style="width: 200px; height: 200px">
	
					<img src="${vo.poster }" style="width: 200px; height: 200px">
	              </div>
	              <div class="item" class="client text-center p-5" style="width: 200px; height: 200px">
	
					<img src="${vo.poster }" style="width: 200px; height: 200px">
	              </div>
	              <div class="item" class="client text-center p-5" style="width: 200px; height: 200px">
	
					<img src="${vo.poster }" style="width: 200px; height: 200px">
	              </div>
<!-- 	              <div class="item" class="client text-center p-5" style="width: 200px; height: 200px"> -->
	
<%-- 					<img src="${vo.poster }" style="width: 200px; height: 200px"> --%>
<!-- 	              </div> -->
	            </div>
	          </div>
	        </div>
			</div>
<!-- 	</section> -->
             	
             	</td>
             </tr>
            </table>
            <table class="table">              
              <tr>
                <td width=20%>냥</td>
                <td width=80%></td>
              </tr>
              <tr>
                <td width=20%>냥냥</td>
                <td width=80%></td>
              </tr>
              <tr>
                <td width=20%>냐옹</td>
                <td width=80%></td>
              </tr>
            </table>

          </div>
		</div>

</body>
</html>
