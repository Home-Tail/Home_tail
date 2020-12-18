<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f479a055a85358bb537395d0d7aeb6&libraries=services"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let cate=0; 
$(function() {
	//시작하자마자 본문에 list.do 내용 출력하는 용도
	$.ajax({
				type:'post',
				url:'../temp/list.do',
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

	<section class="hero-wrap hero-wrap-2" style="background-image: url('../images/test.jpg');" data-stellar-background-ratio="0.5">
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

<section class="ftco-sectionXX" id="tagin">
		<!-- 값들어가는곳 -->
	</section>
    
		
</body>
</html>
