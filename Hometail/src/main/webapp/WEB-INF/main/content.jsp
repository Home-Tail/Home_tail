<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../img/hometail.png" rel="shortcut icon" type="image/x-icon">
<title>HomeTail</title>
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(function(){
	$('.board_detail').click(function(){				
			var no = $(this).attr("data-no");
			var title = $(this).attr("data-title");
			var id = $(this).attr("data-id");
			var cate = $(this).attr("data-cate");
			var regdate = $(this).attr("data-regdate");
			var hit = $(this).attr("data-hit");
			var poster = $(this).attr("data-poster");
			var content = $(this).attr("data-content");

			console.log('no는 :'+no);
			console.log('title는:'+title);
			console.log('id는:'+id);
			console.log('cate는:'+cate);
			console.log('regdate는:'+regdate);
			console.log('hit는:'+hit);
			console.log('poster는:'+poster);	
			console.log('content는:'+content);
			console.log('사진 값'+poster.indexOf('adoptreview'));
			if(poster.indexOf('adoptreview')>0)
			{
				console.log('트루트루');
				$('#b_poster').attr("src",poster);
			}
			if(poster.indexOf('adoptreview')<0)
			{
				console.log('');
				$('#b_poster').attr("src",'../boardPoster/'+poster);
			}
			$('#b_title').text(title);
			$('#b_content').text(content);
			
// 			adoptreview
			
	})
});

</script>
  </head>
<body>
		<!-- 입양후기 시작 -->
		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center mb-5 pb-3">
	          		<div class="col-md-7 heading-section ftco-animate">
	          			<span class="subheading subheading-with-line"><span class="pr-2 bg-white">입양후기</span></span>
	            		<!-- <h2 class="mb-4">입양후기</h2>
	           			 <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p> -->
	          		</div>
	        	</div>	
				<div class="row">
					<c:forEach var="bvo" items="${bList }">
						<div class="col-md-6 col-lg-3 ftco-animate">
							<div class="staff">
								<div class="img" style="background-image: url(${bvo.poster});"></div>
								<div class="text px-4 pt-4">
									<h5><a class="board_detail" data-toggle="modal" data-target="#board_modal" style="color:#EDA900;"
									data-no="${bvo.board_no }"
									data-title="${bvo.title }"
									data-id="${bvo.id }"
									data-cate="${bvo.cate }"
									data-regdate="${bvo.regdate }"
									data-hit="${bvo.hit }"
									data-poster="${bvo.poster}"	
									data-content="${bvo.content }"					 
									>${bvo.title }</a></h5>
									<span class="position mb-2"  style="color:#333;">${bvo.id }</span>
									<div class="faded">
										<ul class="ftco-social d-flex">
							                <li class="ftco-animate">${bvo.regdate }</li>
			              				</ul>
		              				</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<div id='board_modal' class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="row">
						      <table class="table">
							        <tr>
							        <td class="text-center" style="border-top:none;">
										          	<img id="b_poster" width=400px height=400px>
										 </td>
							        </tr>
							        <tr>
							        	<td id="b_title" style="color:#EDA900; font-weight:bold;"></td>
							        </tr>
							        <tr>
							        	<td class="text-left" valign="top" id="b_content" ></td>
							        </tr>
						      </table>
					       	</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>