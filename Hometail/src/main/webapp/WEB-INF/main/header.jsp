<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Mosaic - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/aos.css">
    <link rel="stylesheet" href="../css/ionicons.min.css">
    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/style.css">
<style>
#sootag{
	margin: 0 0px 4px 13px;
}
</style>
</head>
<body>
   	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="../main/main.do">Home&Tail</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
			
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        <!-- 테스트 -->
	        	<li class="nav-item active"><a href="../main/main.do" class="nav-link">Home</a></li>
	        	<li class="nav-item"><a href="../report/main.do" class="nav-link">신고/제보</a></li>
	        	<li class="nav-item"><a href="../temp/main.do" class="nav-link">임시보호</a></li>
	        	<li class="nav-item"><a href="../adopt/list.do" class="nav-link">입양</a></li>
	        	
	        	<li class="nav-item submenu dropdown">
	               <a href="../center/service.do" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                 aria-expanded="false">봉사/후원</a>
	               <ul class="dropdown-menu">
			       <li class="nav-item"><a href="../center/service.do" class="nav-link" style="color: black;">봉사/후원</a></li>
			       <li class="nav-item"><a href="../center/shelter.do" class="nav-link" style="color: black;">보호소</a></li>
	               </ul>
	            </li>
	        	
	        	<li class="nav-item"><a href="../clinic/main.do" class="nav-link">동물병원</a></li>
	            <li class="nav-item"><a href="../board/list.do" class="nav-link">커뮤니티</a></li>
	        <c:if test="${sessionScope.id==null }">   
	          	<li class="nav-item"><a class="nav-link" data-toggle="modal" data-target="#myModal">로그인</a></li>
	        </c:if>
			<c:if test="${sessionScope.id!=null }">       
				<li class="nav-item"><a href="../main/logout.do" class="nav-link">로그아웃</a></li>
	        </c:if>
	        </ul> 
	        <div>
	        <c:if test="${count>=1 }">
	        	<sup style="color: red;">new</sup>
	        </c:if>	
	        	<li class="nav-item" id="sootag" data-toggle="modal" data-target="#mailbox" style="margin: 0 0px 4px 13px;"><img src="../user.png" width=20 height=20></li>
	        </div>	
	      </div> 
	    </div>
	  </nav>
    <!-- END nav -->
    		
</body>		
</html>