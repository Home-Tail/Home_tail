<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
	.ftco-sectionXX {
	    padding: 0em 0;
	    position: relative;
	}
	
	.pl-4XX, .px-4 {
	    padding-left: 0rem !important;
	}
	
	.hero-wrapXX {
	width: 100%;
	height: 100%;
	position: inherit;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: top center;
	position: relative; }
	
	@media (max-width: 991.98px) {
	  .hero-wrapXX {
	    background-position: top center !important; } }
	.hero-wrapXX .overlay {
	  position: absolute;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  content: '';
	  opacity: .8;
	  background: #0033c700; }
	.hero-wrapXX.hero-wrapXX-2 {
	  height: 300px; }
	  .hero-wrapXX.hero-wrapXX-2 .slider-text {
	    height: 300px; }
	    .hero-wrapXX.hero-wrapXX-2 .slider-text .bread {
	      font-weight: 900;
	      color: #fff; }
	    .hero-wrapXX.hero-wrapXX-2 .slider-text .breadcrumbs {
	      text-transform: uppercase;
	      font-size: 13px;
	      letter-spacing: 1px; }
	      .hero-wrapXX.hero-wrapXX-2 .slider-text .breadcrumbs span {
	        color: #fff;
	        border-bottom: 2px solid rgba(255, 255, 255, 0.1); }
	        .hero-wrapXX.hero-wrapXX-2 .slider-text .breadcrumbs span a {
	          color: #fff; }

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let cate=0;
$(function() {
	//시작하자마자 본문에 list.do 내용 출력하는 용도
	$.ajax({
				type:'post',
				url:'../report/list.do',
				data: {cate:cate},
				success:function(result)
				{
					console.log("실행");
					$('#tagin').html(result);
				}
		  })
});
</script>

</head>



<body>
	<section class="hero-wrapXX hero-wrapXX-2" style="background-image: url('https://i.ibb.co/Hd3n3Vz/33322.png');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread" style="text-shadow: 1px 0 #212529, 0 1px #212529, 1px 0 #212529, 0 1px #212529;">신고 & 제보</h1>
          </div>
        </div>
      </div>
	</section>
    
	<section class="ftco-sectionXX" id="tagin">
		<!-- 값들어가는곳 -->
	</section>
    
</body>
</html>


