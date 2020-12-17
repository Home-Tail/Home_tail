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
	var coords;
	let u = 0;
	$(function() {
		$('.updates').hide();
		$('.up').click(function() {
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
		$("#clinicModal").on('shown.bs.modal', function(){
  		  map.relayout();
  		  console.log(coords);
  		  console.log('test');
  		  map.setCenter(coords); //이게 안먹히는거?웅 coords가 저게 relayout되고나서 값이 찍히는건가1도모르겠네 자맘ㄴ
  		  console.log('goooood');
  		  });
		
	})
	
	
	let s= 0;
	$(function(){
		$('.reply_reply').hide();
		$('.replyclick').click(function(){
			$('.reply_reply').hide()
			let sno = $(this).attr("data-value");
			console.log('번호값:' + sno);
			if (s == 0) {
				console.log('돈다돌아');
				$('#rIn' + sno).show();
				$(this).text("취소");
				s = 1;
			} else {
				console.log('else 돈다돌아');
				$('#rIn' + sno).hide();
				$(this).text("Reply");
				s = 0;
			}
		});
	});
	
$(function(){
	$('#btn22').click(function(){
		let owner=$('#owner').val();
		let pname=$('#pname').val();
		let content=$('#content').val();
		if(owner=="")
		{
			$('#owner').focus();
			return;
		}
		if(pname=="")
		{
			$('#owner').focus();
			return;
		}
		if(content=="")
		{
			$('#content').focus();
			return;
		}
	})
})

</script>
<style type="text/css">
.modify{
text-align: right;
}
.btn {
	border: 2px solid black;
	background-color: white;
	color: #ffb84d;
	padding: 8px 14px;
	font-size: 10px;
	cursor: pointer;
}
#btn2 {
	border-color: #ffb84d;
	color: Orange;
}

#btn2:hover {
	background: #ffb84d;
	color: white;
}
#btn3 {
	border: 2px solid #ffb84d;
	background-color: white;
	color: whote;
	padding: 4px 8px;
	font-size: 10px;
	cursor: pointer;
	border-color: #ffb84d;
}
#btn3:hover {
	background: #ffb84d;
	color: white;
}

#btn22 {
	border-color: #ffb84d;
	color: #ffb84d;
}

#btn22:hover {
	background: #ffb84d;
	color: white;
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
	border-color: #ffb84d;
	color: #ffb84d;
}
#btn1:hover {
	background: #ffb84d;
	color: white;
}
#cldetail{
border-radius: 15px;
border:4px solid #ffb84d;
}
#reply_re{
padding: 0 0 0 120px;
}
</style>
</head>
<body>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('../images/abc.jpg'); background-position: center center"
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
	
<!-- ========================= 배너 ================================-->

	<section class="ftco-section" id="soofont">
	<div class="container">
		<div class="row">
			<div class="col-lg-7 ftco-animate">
				<p>
					<c:choose>
						<c:when test="${vo.poster==null }">
							<img src="../images/aa.jpg" alt="" width=700 height=400 id="cldetail">
						</c:when>
						<c:otherwise>
							<img src="${vo.poster }" alt="" width=700 height=400 id="cldetail">
						</c:otherwise>
					</c:choose>
				</p>


				<!-- END comment-list -->

				<div class="comment-form-wrap pt-5 insert">
					<h3 class="mb-5 h4 font-weight-bold" style="color:orange;">Leave a comment</h3>
					<c:if test="${sessionScope.id==null }">
						<form method="post" action="../clinic/clinic_reply.do">
							<input type="hidden" name="clno" value="${vo.clno }">
							<div class="form-group">
								<label for="message">Message</label>
								<textarea name="content" cols="30" rows="3" class="form-control"
									disabled>로그인 후 이용 가능 합니다</textarea>
							</div>
						</form>
					</c:if>
					<c:if test="${sessionScope.id!=null }">
						<form method="post" action="../clinic/clinic_reply.do">
							<input type="hidden" name="clno" value="${vo.clno }">
							<div class="form-group">
								<label for="message">Message</label>
								<textarea name="content" cols="30" rows="3" class="form-control" required></textarea>
							</div>
							<div class="form-group text-right">
								<input type="submit" value="Post Comment" class="btn" id="btn2">
							</div>
						</form>
					</c:if>

				</div>

			</div>
			<!-- col-md-8 -->
			
			<!--====================== 병원정보 ==============================-->
			
			<div class="col-lg-5">
				<table class="table">
					<tr>
						<td>
							<h1 style="color:orange;">${vo.title}</h1>
						</td>
					</tr>
				</table>
				<table class="table">
					<tr>
						<td>병원 상세 정보&nbsp;&nbsp; 
						<button class="btn" id="btn1" data-toggle="modal" data-target="#clinicModal">지도보기</button>
						<c:if test="${sessionScope.id!=null }">
						<button class="btn" id="btn1" data-toggle="modal" data-target="#ResModal">예약하기</button>
						</c:if>
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
				<!-- ================== 병원정보 끝 ==================== -->
				
				<!-- =================== 댓글 리스트 출력 =====================-->

				<div class="pt-5 mt-5">
					<h3 class="font-weight-bold text-center" style="color:orange;">Comments</h3>
					<ul class="comment-list">
						<c:forEach var="cvo" items="${clist }">
							<li class="comment">
							<c:choose>		
							<c:when test="${cvo.group_tap>0 }">
							<div class="children" id="reply_re">
									<h5>${cvo.id }</h5>
									<div class="meta mb-2">
										<fmt:formatDate value="${cvo.regdate }" pattern="YYYY-MM-dd" />
									</div>
									<p>${cvo.content }</p>
									
									<c:if test="${sessionScope.id!=null }">
									<c:if test="${sessionScope.id==cvo.id }">
									<div class="modify">
										<span class="replyclick" data-value=${cvo.replyno } class="btn btn-xs" id="btn3">답글</span>
										<span value="${cvo.replyno}" class="btn btn-xs up" id="btn3" >수정</span>
										<a href="../clinic/clinic_reply_delete.do?clno=${cvo.clno }&replyno=${cvo.replyno}"
											class="btn btn-xs" id="btn3">삭제</a>
									</div>
									</c:if>
									</c:if>
									
									  
									<div class="comment-form-wrap pt-5 reply_reply" id="rIn${cvo.replyno }" value="${cvo.replyno }">
										<form method="post" action="../clinic/clinicReply_replyInsert.do">
											<input type="hidden" name="clno" value="${vo.clno }">
											<input type="hidden" name="replyno" value="${cvo.replyno}">
											<label for="message">Message</label> 
											<div class="form-group">
												<textarea name="content" cols="30" rows="2" class="form-control" required>★</textarea>
											</div>
											<div class="form-group text-right">
												<input type="submit" value="대댓달아" class="reply">
											</div>
										</form>
									</div>
								</div>
							</c:when>	
							<c:otherwise>				
								<div class="comment-body">
									<h5>${cvo.id }</h5>
									<div class="meta mb-2">
										<fmt:formatDate value="${cvo.regdate }" pattern="YYYY-MM-dd" />
									</div>
									<p>${cvo.content }</p>
									
									<c:if test="${sessionScope.id!=null }">
									<c:if test="${sessionScope.id==cvo.id }">
									<div class="modify">
										<span class="replyclick" data-value=${cvo.replyno } class="btn btn-xs" id="btn3">답글</span>
										<span value="${cvo.replyno}" class="btn btn-xs up" id="btn3" >수정</span>
										<a href="../clinic/clinic_reply_delete.do?clno=${cvo.clno }&replyno=${cvo.replyno}"
											class="btn btn-xs" id="btn3">삭제</a>
									</div>
									</c:if>
									</c:if>
									
									  
									<div class="comment-form-wrap pt-5 reply_reply" id="rIn${cvo.replyno }" value="${cvo.replyno }">
										<form method="post" action="../clinic/clinicReply_replyInsert.do">
											<input type="hidden" name="clno" value="${vo.clno }">
											<input type="hidden" name="replyno" value="${cvo.replyno}">
											<label for="message">Message</label> 
											<div class="form-group">
												<textarea name="content" cols="30" rows="2" class="form-control" required>★</textarea>
											</div>
											<div class="form-group text-right">
												<input type="submit" value="대댓달아" class="reply">
											</div>
										</form>
									</div>
								</div>
								<!-- 여기 -->
								</c:otherwise>
								</c:choose>
							</li>

				
				<div class="comment-form-wrap pt-5 updates" id="u${cvo.replyno }"
					value="${cvo.replyno }">
					<h3 class="h4 font-weight-bold">update a comment</h3>
					<form method="post" action="../clinic/clinic_reply_update.do">
						<input type="hidden" name="clno" value="${cvo.clno }"> 
						<input type="hidden" name="replyno" value="${cvo.replyno}">
						<div class="form-group">
							<label for="message">Message</label>
							<textarea name="content" cols="30" rows="3" class="form-control" required>${cvo.content }</textarea>
						</div>
						<div class="form-group">
							<input type="submit" value="수정하기" class="btn btn-xs " id="btn3">
						</div>
					</form>
					</div>
				</c:forEach>
              </ul>
				</div>
					<!-- ========================= 댓글리스트 끝 =========================== -->
				</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 모달 섹션 -->
	 <!-- Map Modal -->
  <div class="modal" id="clinicModal">
    <div class="modal-dialog">
      <div class="modal-content" style="width:600px; height:600px;">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">동물병원 지도</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          
          <div id="clinicmap" style="width:100%;height:400px;"></div> 
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18b988d228ba568335019cf062c1ebf7&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('clinicmap'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			// 주소-좌표 변환 객체를 생성합니다
			geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch("${vo.addr}", function(result, status) {
			
				 
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			    	coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			    	console.log(coords);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;">${vo.title}</div>'
			        });
			        infowindow.open(map, marker);
				
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        //그래서 모달창띄울때 relayout 하는거 일테고
			        map.setCenter(coords); //이게 안먹히는거?웅 coords가 저게 relayout되고나서 값이 찍히는건가1도모르겠네 자맘ㄴ
 			    } 
			});    
			</script>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn" id="btn2" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  <!-- Map Modal 종료 -->
  
  <!-- Reserve Modal 시작 -->
   <div class="modal" id="ResModal">
    <div class="modal-dialog">
      <div class="modal-content" >
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="text-center modal-title" >예약 접수</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <form method=post action="../clinic/clinic_reserve_insert.do" name="resFrm" id="resFrm">
        <input type="hidden" name="clno" value="${vo.clno }">
        <input type="hidden" name="id" value="${sessionScope.id}">
          <table class="table">
           <tr>
		       <th class="text-center" width="35%">예약날짜</th>
		       <td width=65%>
		         <input type=date name="resdate" class="input-sm" size=20 id="resdate" pattern="yyyy-MM-dd">
		       </td>
     	  </tr>
     	  <tr>
		       <th class="text-center" width="35%">보호자 이름</th>
		       <td width=65%>
		         <input type=text name="owner" class="input-sm" size=15 id="owner" required>
		       </td>
     	  </tr>
     	  <tr>
		       <th class="text-center" width="35%">반려동물 이름</th>
		       <td width=65%>
		         <input type=text name="pname" class="input-sm" size=15 id="pname" required>
		       </td>
     	  </tr>
     	  <tr>
		       <th class="text-center" width="35%">증상 및 특이사항</th>
		       <td width=65%>
		         <textarea rows="3" cols="18" name="content" id="content"></textarea>
		       </td>
     	  </tr>
     	  <tr>
     	  <th class="text-center" width="30%">예약 시간</th>
     	   <td width=70%>
     	      <input type="radio" id="restime1" name="time" value="9:00 - 10:00" required>
			  <label for="restime1">9:00 - 10:00</label><br>
			  <input type="radio" id="restime2" name="time" value="10:00 - 11:00">
			  <label for="restime2">10:00 - 11:00</label><br>
			  <input type="radio" id="restime3" name="time" value="11:00 - 12:00">
			  <label for="restime3">11:00 - 12:00</label><br>
			  <input type="radio" id="restime4" name="time" value="12:00 - 13:00">
			  <label for="restime4">12:00 - 13:00</label><br>
			  <input type="radio" id="restime5" name="time" value="14:00 - 15:00">
			  <label for="restime5">14:00 - 15:00</label><br>
			  <input type="radio" id="restime6" name="time" value="15:00 - 16:00">
			  <label for="restime6">15:00 - 16:00</label><br>
			  <input type="radio" id="restime7" name="time" value="6:00 - 17:00">
			  <label for="restime7">16:00 - 17:00</label><br>
			  <p style="color:red">야간 진료는 전화 문의 부탁드립니다</p> 
     	   </td>
     	  </tr>
          </table>
          <!-- Modal footer -->
          <div class="modal-footer">
          <input type="submit" value="병원예약" class="btn" id="btn22">
         <button type="button" class="btn" id="btn2" data-dismiss="modal">Close</button>
        </div>
          </form>
        </div> 
        
        
        
      </div>
    </div>
  </div>
  <!-- Res Modal 종료 -->

</body>
</html>