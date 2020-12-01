<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//시작하자마자 본문에 list.do 내용 출력하는 용도
		$.ajax({
			type : 'post',
			url : '../clinic/list.do',
			success : function(result) {
				console.log("te");
				$('#tagin').html(result);
			}
		})
	});
	
	$(function(){
		$('.images').hover(function(){
			$(this).css("cursor","pointer");
		},function(){
			$(this).css("cursor","");
		});
		
		$('.images').click(function(){
			let no=$(this).attr("data-value");
			$.ajax({
				type:'POST',
				url:'../clinic/clinic_find.do',
				data:{"no":no},
				success:function(res)
				{
					$('#print').html(res);
				}
			});
		});
	});
</script>

</head>
<body>
	<section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bb.jpg');" data-stellar-background-ratio="0.5">
      <!-- <div class="overlay"></div> -->
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">동물병원</h1>
            <p class="breadcrumbs">Pet Clinic</p>
          </div>
        </div>
      </div>
</section>

		<div class="row">
			<div class="col-lg-8" id="tagin">
			<!-- 리스트 ajax -->
			</div>
			
			<div class="col-lg-4">
			<div id="a">
				<img id="seoul_1" src="../map/1111.png">
				<c:forEach var="i" begin="1" end="25">
					<img id="gu${i }" src="../map/gu_${i }_off.png"
						onmouseover="this.src='../map/gu_${i}_on.png'"
						onmouseout="this.src='../map/gu_${i}_off.png'" class="images"
						data-value="${i }">
				</c:forEach>
			</div>
			<div id="print" class="row">
			</div>
		</div>
			
			<!-- END COL -->
		</div>
</body>
</html>