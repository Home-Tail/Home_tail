<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mosaic - Free Bootstrap 4 Template by Colorlib</title>
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
  </head>
<body>
   	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">Mosaic</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        <!-- 테스트 -->
	        	<li class="nav-item active"><a href="index.html" class="nav-link">Home</a></li>
	        	<li class="nav-item"><a href="../report/list.jsp" class="nav-link">신고/제보</a></li>
	        	<li class="nav-item"><a href="../temp/list.jsp" class="nav-link">임시보호</a></li>
	        	<li class="nav-item"><a href="services.html" class="nav-link">입양</a></li>
	        	<li class="nav-item"><a href="team.html" class="nav-link">봉사/후원</a></li>
	        	<li class="nav-item"><a href="blog.html" class="nav-link">동물병원</a></li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">커뮤니티</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">임시보호</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</span></p>
          </div>
        </div>
      </div>
    </section>
    
   <div class="container">
    <div class="row">

     <h1>글쓰기</h1>
     <p></p>
     <form method=post action="insert_ok.do">
     <table class="table">
       <tr>
        <th class="text-right danger" width=15%>이름</th>
        <td width=80%>
          <input type=text name=name size=15>
        </td>
       </tr>
       
       <tr>
        <th class="text-right danger" width=15%>제목</th>
        <td width=85%>
          <input type=text name=subject size=50>
        </td>
       </tr>
       
       <tr>
        <th class="text-right danger" width=15%>내용</th>
        <td width=85%>
          <textarea rows="8" cols="55" name=content></textarea>
        </td>
       </tr>
       <tr>
        <th class="text-right danger" width=15%>비밀번호</th>
        <td width=85%>
          <input type="password" name=pwd size=10>
        </td>
       </tr>
       
       <tr>
        <td colspan="2" class="text-center">
          <input type=submit value="글쓰기">
          <input type=button value="취소" onclick="javascript:history.back()">
        </td>
       </tr>
     </table>
     </form>
    </div>
  </div>
    
    <!-- footer_start  -->
     <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Mosaic</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Links</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Home</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>About</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Services</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Projects</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Contact</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Services</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Architectural Design</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Interior Design</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Exterior Design</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Lighting Design</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>AutoCAD Service</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Newsletter</h2>
            	<p>Far far away, behind the word mountains, far from the countries.</p>
              <form action="#" class="subscribe-form">
                <div class="form-group">
                  <input type="text" class="form-control mb-2 text-center" placeholder="Enter email address">
                  <input type="submit" value="Subscribe" class="form-control submit px-3">
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
</body>
</html>