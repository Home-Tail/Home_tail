<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	let no=1;	
	$(function(){
		$('.cate').hover(function(){
			$(this).css("cursor", "pointer")
			$(this).css("color", "#EDA900")
		}, function(){
			$(this).css("cursor", "")
			$(this).css("color", "black")
		});
		
		$.ajax({
			type:'POST',
			url:'../board/cboard_list.do',
			data:{"no":no},
			success:function(res)
			{
				console.log("test");
				$('#print').html(res);
			}
		});
		
// // 		뉴스 가져오는 부분
// 		$('.b_news').click(function(){
// 			$.ajax({
// 				type:'POST',
// 				url:'../board/news_list.do',
// 				success:function(res)
// 				{
// // 					$('#print').html(res);
// 					console.log('성공');
// 				}
// 			});
// 		})
		$('.cate').click(function(){
			no=$(this).attr("value");
			console.log(no+'클릭');
			$.ajax({
				type:'POST',
				url:'../board/cboard_list.do',
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
<section class="hero-wrap hero-wrap-2" style="background-image: url('../img/dog.jpg');" data-stellar-background-ratio="0.5">
 <div class="overlay" style="background-color:#CACACA;"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">커뮤니티</h1>
          </div>
        </div>
      </div>
</section>
		<section class="ftco-section">
			<div class="container">
				<div class="row">
				<div class="col-lg-3 sidebar ftco-animate">
            <div class="sidebar-box ftco-animate">
            	<h3>Category</h3>
              <ul class="categories">
                <li><span class="btn cate" value="1" >자유게시판</span></li>
                <li><span class="btn cate" value="2">입양후기</span>
                <li><span class="btn cate" value="3">유기동물 소식</span>
                <li><span class="btn cate" value="4">Q&A</span>
              </ul>
            </div>
            </div>          
          <div class="col-lg-9">
          	<div class="row" id="print">
          		<!-- 본문 -->
          	</div>
          </div>
		        </div>
			</div>
			</section>
</body>
</html>