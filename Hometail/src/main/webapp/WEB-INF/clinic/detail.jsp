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
let u=0;
$(function(){
	  $('.up').click(function(){
		 $('.updates').hide();
		 let no=$(this).attr("value");
		 if(u==0)
		 {
			 $('#u'+no).show();
			 $(this).text("취소");
			 u=1;
		 }
		 else
		 {
			 $('#u'+no).hide();
			 $(this).text("수정");
			 u=0;
		 }
	  });
})
</script>
</script>
</head>
<body>
 <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/cc.jpg');" data-stellar-background-ratio="0.5">
<!--       <div class="overlay"></div> -->
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">${vo.title }</h1>
          </div>
        </div>
      </div>
    </section>
		
		<section class="ftco-section">
			<div class="container">
				<div class="row">
          <div class="col-lg-8 ftco-animate">
          	<p>
          	<c:choose>
          	<c:when test="${vo.poster==null }">
          	 <img src="../images/aa.jpg" alt="" width=900 height=400>
          	</c:when>
          	<c:otherwise>
              <img src="${vo.poster }" alt="" width=700 height=400>
              </c:otherwise>
              </c:choose>
            </p>
            <h2 class="mb-3">${vo.title}</h2>
            <p style="font-size:25">전화번호 :
            <c:choose>
          	<c:when test="${vo.tel==null }">
          	등록된 전화번호가 없습니다
          	</c:when>
          	<c:otherwise>
              ${vo.tel }
              </c:otherwise>
              </c:choose>
            </p>
            <p style="font-size:25">주소 : ${vo.addr }</p>
			<p style="font-size:25">도로명우편번호 : ${vo.post }</p>

		`
            <div class="pt-5 mt-5">
              <h3 class="mb-5 h4 font-weight-bold">Comments</h3>
              <ul class="comment-list">
				<c:forEach var="cvo" items="${clist }">
                <li class="comment">
                  <div class="comment-body">
                    <h3>${cvo.id }</h3>
                    <div class="meta mb-2"><fmt:formatDate value="${cvo.regdate }" pattern=""/></div>
                    <p>${cvo.content }</p>
                    <c:if test="${sessionScope.id==cvo.id }">
                       <p><span value="${cvo.replyno}" class="btn btn-xs btn-dark up">수정</span></p>
                       <a href="#" class="btn btn-xs btn-info">삭제</a>
                      </c:if>
                  </div>

                </li>
                
                <div class="comment-form-wrap pt-5 updates" id="u${cvo.replyno }">
                <h3 class="mb-5 h4 font-weight-bold">update a comment</h3>
              <form method="post" action="../clinic/clinic_reply_update.do" class="p-5 bg-light">
                <input type="hidden" name="clno" value="${cvo.clno }">
                <input type="hidden" name="replyno" value="${cvo.replyno}">
                  <div class="form-group">
                    <label for="message">Message</label>
                    <textarea name="content" cols="30" rows="10" class="form-control">${cvo.content }</textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
                  </div>

                </form>
            </div>
				</c:forEach>
              </ul>
              <!-- END comment-list -->
              
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5 h4 font-weight-bold">Leave a comment</h3>
                <form method="post" action="../clinic/clinic_reply.do" class="p-5 bg-light">
                <input type="hidden" name="clno" value="${vo.clno }">
                  <div class="form-group">
                    <label for="message">Message</label>
                    <textarea name="content" cols="30" rows="10" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
                  </div>

                </form>
              </div>
              
          </div> <!-- .col-md-8 -->
          <div class="col-lg-4">
			<div id="maps" style="width: 150%; height: 400px;"></div>

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

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});
			</script>
			</div>
		</div>
		
	</div>
		</section>
    

 
</body>
</html>