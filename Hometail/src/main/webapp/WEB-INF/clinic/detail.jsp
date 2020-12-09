<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	let u = 0;
	$(function() {
		$('.updates').hide();
		$('.up').click(function() {
			$('.updates').hide();
			$('.insert').hide();
			let no = $(this).attr("value");
			console.log('번호값:' + no);
			if (u == 0) {
				console.log('돈다돌아');
				$('#u' + no).show();
				$(this).text("취소");
				u = 1;
			} else {
				console.log('else 돈다돌아');
				$('#u' + no).hide();
				$('.insert').show();
				$(this).text("수정");
				u = 0;
			}
		});
	})
	
	
</script>
<style type="text/css">
.btn {
	border: 2px solid black;
	background-color: white;
	color: black;
	padding: 8px 14px;
	font-size: 10px;
	cursor: pointer;
}

#btn2 {
	border-color: #DB7093;
	color: Purple;
}

#btn2:hover {
	background: #FFB6C1;
	color: Purple;
}

.button {
	border: 2px solid black;
	background-color: white;
	color: black;
	padding: 8px 14px;
	font-size: 10px;
	cursor: pointer;
}
#btn1 {
	border-color: #809fff;
	color: #809fff;
}
#btn1:hover {
	background: #4d79ff;
	color: white;
}
</style>
</head>
<body>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('../images/cc.jpg');"
		data-stellar-background-ratio="0.5"> <!--       <div class="overlay"></div> -->
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<h1 class="mb-2 bread">${vo.title }</h1>
			</div>
		</div>
	</div>
	</section>

	<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-7 ftco-animate">
				<p>
					<c:choose>
						<c:when test="${vo.poster==null }">
							<img src="../images/aa.jpg" alt="" width=700 height=400>
						</c:when>
						<c:otherwise>
							<img src="${vo.poster }" alt="" width=700 height=400>
						</c:otherwise>
					</c:choose>
				</p>


				<!-- END comment-list -->

				<div class="comment-form-wrap pt-5 insert">
					<h3 class="mb-5 h4 font-weight-bold">Leave a comment</h3>
					<c:if test="${sessionScope.id==null }">
						<form method="post" action="../clinic/clinic_reply.do">
							<input type="hidden" name="clno" value="${vo.clno }">
							<div class="form-group">
								<label for="message">Message</label>
								<textarea name="content" cols="30" rows="3" class="form-control"
									disabled>로그인 후 이용 가능 합니다</textarea>
							</div>
							<!--                   <div class="form-group"> -->
							<!--                     <input type="submit" value="Post Comment" class="btn" id="btn2"> -->
							<!--                   </div> -->
						</form>
					</c:if>
					<c:if test="${sessionScope.id!=null }">
						<form method="post" action="../clinic/clinic_reply.do">
							<input type="hidden" name="clno" value="${vo.clno }">
							<div class="form-group">
								<label for="message">Message</label>
								<textarea name="content" cols="30" rows="3" class="form-control" required></textarea>
							</div>
							<div class="form-group">
								<input type="submit" value="Post Comment" class="btn" id="btn2">
							</div>
						</form>
					</c:if>

				</div>

			</div>
			<!-- .col-md-8 -->
			<!-- 병원정보 -->
			<div class="col-lg-5">
				<table class="table">
					<tr>
						<td>병원 상세 정보&nbsp;&nbsp; 
						<button class="btn" id="btn1" data-toggle="modal" data-target="#myModal">지도보기</button>
						</td>
					</tr>
				</table>
				<table class="table">
					<tr>
						<td>
							<h1>${vo.title}</h1>
						</td>
					</tr>
				</table>
				<table class="table">
					<tr>
						<td width=20%>전화번호</td>
						<td width=80%>
						<c:choose>
					 <c:when test="${vo.tel==null }">
		          	등록된 전화번호가 없습니다
		          	</c:when>
					<c:otherwise>${vo.tel }</c:otherwise>
					</c:choose>
					</td>
					</tr>
					<tr>
						<td width=10%>주소</td>
						<td width=90%>${vo.addr }</td>
					</tr>
					<tr>
						<td width=40%>도로명우편번호</td>
						<td width=60%>${vo.post }</td>
					</tr>
				</table>
				<!-- 병원정보 끝 -->
				<!-- 댓글 리스트 출력 -->
				<div class="pt-5 mt-5">
					<h3 class="font-weight-bold">Comments</h3>
					<ul class="comment-list">
						<c:forEach var="cvo" items="${clist }">
							<div class="comment-body">
								<h5>${cvo.id }</h5>
								<div>
									<fmt:formatDate value="${cvo.regdate }" pattern="YYYY-MM-dd" />
								</div>
								<h5>${cvo.content }</p>
									<c:if test="${sessionScope.id==cvo.id }">
										<span value="${cvo.replyno}" class="btn btn-xs up" id="btn2">수정</span>
										<a
											href="../clinic/clinic_reply_delete.do?clno=${cvo.clno }&replyno=${cvo.replyno}"
											class="btn btn-xs" id="btn2">삭제</a>
									</c:if>
							</div>
							<div class="comment-form-wrap pt-5 updates" id="u${cvo.replyno }"
								value="${cvo.replyno }">
								<h3 class="mb-5 h4 font-weight-bold">update a comment</h3>
								<form method="post" action="../clinic/clinic_reply_update.do"
									class="p-5 bg-light">
									<input type="hidden" name="clno" value="${cvo.clno }">
									<input type="hidden" name="replyno" value="${cvo.replyno}">
									<div class="form-group">
										<label for="message">Message</label>
										<textarea name="content" cols="30" rows="3"
											class="form-control">${cvo.content }</textarea>
									</div>
									<div class="form-group">
										<input type="submit" value="Post Comment"
											class="btn py-3 px-4 " id="btn2">
									</div>

								</form>
							</div>
						</c:forEach>
					</ul>
					<!-- 댓글리스트 끝 -->
				</div>
				</div>
			</div>
		</div>
	</section>
	
	 <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">동물병원 지도</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" style="width:650px; height:650px">
          
          <div id="maps"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18b988d228ba568335019cf062c1ebf7&libraries=services"></script>
				<script>
				
	 				var mapContainer = document.getElementById('maps'), // 지도를 표시할 div  
	 				mapOption = {
	 					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표 
	 					level : 3 
	 				// 지도의 확대 레벨
	 				}; 

	 				// 지도를 생성합니다    
	 				var map = new kakao.maps.Map(mapContainer, mapOption);
	 				
	 				function resizeMap() {
	 				    var mapContainer = document.getElementById('map');
	 				    mapContainer.style.width = '500px';
	 				    mapContainer.style.height = '300px'; 
	 				}

	 				function relayout() {    
	 				    
	 				    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
	 				    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
	 				    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
	 				    map.relayout();
	 				}
 				// 주소-좌표 변환 객체를 생성합니다 
					var geocoder = new kakao.maps.services.Geocoder(); 

	 				// 주소로 좌표를 검색합니다 
	 				geocoder 
	 						.addressSearch(
									'${vo.addr}',
									function(result, status) { 

	 									// 정상적으로 검색이 완료됐으면  
	 									if (status === kakao.maps.services.Status.OK) { 

	 										var coords = new kakao.maps.LatLng( 
	 												result[0].y, result[0].x); 

	 										// 결과값으로 받은 위치를 마커로 표시합니다 
	 										var marker = new kakao.maps.Marker({ 
	 											map : map, 
	 											position : coords 
	 										}); 

	 										// 인포윈도우로 장소에 대한 설명을 표시합니다 
	 										var infowindow = new kakao.maps.InfoWindow( 
	 												{ 
	 													content : '<div style="width:150px;text-align:center;padding:6px 0;">${vo.title}</div>'
	 												}); 
	 										infowindow.open(map, marker); 

											// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다 -
	 										map.setCenter(coords); 
	 									} 
	 								}); 
	 			</script> 
          
          
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>

	<!-- 내 소중한 지도 -->
	<!-- <div id="maps" style="width: 150%; height: 400px;"></div> -->

	<!-- 			<script type="text/javascript" -->
	<!-- 				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18b988d228ba568335019cf062c1ebf7&libraries=services"></script> -->
	<!-- 			<script> -->
	<!-- // 				var mapContainer = document.getElementById('maps'), // 지도를 표시할 div  -->
	<!-- // 				mapOption = { -->
	<!-- // 					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표 -->
	<!-- // 					level : 3 -->
	<!-- // 				// 지도의 확대 레벨 -->
	<!-- // 				}; -->

	<!-- // 				// 지도를 생성합니다     -->
	<!-- // 				var map = new kakao.maps.Map(mapContainer, mapOption); -->

	<!-- // 				// 주소-좌표 변환 객체를 생성합니다 -->
	<!-- // 				var geocoder = new kakao.maps.services.Geocoder(); -->

	<!-- // 				// 주소로 좌표를 검색합니다 -->
	<!-- // 				geocoder -->
	<!-- // 						.addressSearch( -->
	<%-- // 								'${vo.addr}', --%>
	<!-- // 								function(result, status) { -->

	<!-- // 									// 정상적으로 검색이 완료됐으면  -->
	<!-- // 									if (status === kakao.maps.services.Status.OK) { -->

	<!-- // 										var coords = new kakao.maps.LatLng( -->
	<!-- // 												result[0].y, result[0].x); -->

	<!-- // 										// 결과값으로 받은 위치를 마커로 표시합니다 -->
	<!-- // 										var marker = new kakao.maps.Marker({ -->
	<!-- // 											map : map, -->
	<!-- // 											position : coords -->
	<!-- // 										}); -->

	<!-- // 										// 인포윈도우로 장소에 대한 설명을 표시합니다 -->
	<!-- // 										var infowindow = new kakao.maps.InfoWindow( -->
	<!-- // 												{ -->
	<%-- // 													content : '<div style="width:150px;text-align:center;padding:6px 0;">${vo.title}</div>' --%>
	<!-- // 												}); -->
	<!-- // 										infowindow.open(map, marker); -->

	<!-- // 										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다 -->
	<!-- // 										map.setCenter(coords); -->
	<!-- // 									} -->
	<!-- // 								}); -->
	<!-- 			</script> -->


</body>
</html>