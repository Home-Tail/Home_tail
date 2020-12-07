<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
    
<body>

<!-- list -->
	<section class="ftco-section">
		<div class="container">
			<div class="row">
          <div class="col-lg-8">
           	<div class="row">
          	<table class="table">
             <tr>
              <td>
               <img src="${vo.poster }" width=230 height=200></td>
             </tr>
            </table>
            <table class="table">
              <tr>
                <td width=20%>상태</td>
                <td width=80%>${vo.cate }</td>
              </tr>
              <tr>
                <td width=20%>공고번호</td>
                <td width=80%>${vo.punumber }</td>
              </tr>
              <tr>
                <td width=20%>품종</td>
                <td width=80%>${vo.kind }&nbsp; / ${vo.sub_kind }</td>
              </tr>
              <tr>
                <td width=20%>색상</td>
                <td width=80%>${vo.color }</td>
              </tr>
              <tr>
                <td width=20%>성별</td>
                <td width=80%>${vo.sex }</td>
              </tr>
              <tr>
                <td width=20%>나이/체중</td>
                <td width=80%>${vo.age } 년생&nbsp;${vo.weight }kg</td>
              </tr>
              <tr>
                <td width=20%>접수일지</td>
                <td width=80% ><fmt:formatDate value="${vo.regdate }"/></td>
              </tr>
              <tr>
                <td width=20%>발견장소</td>
                <td width=80%>${vo.area }</td>
              </tr>
              <tr>
                <td width=20%>특징</td>
                <td width=80%>${vo.point }</td>
              </tr>
              <tr>
                <td width=20%>공고기한</td>
                <td width=80%><fmt:formatDate value="${vo.regdate }"/> ~ <fmt:formatDate value="${vo.term }"/></td>
              </tr>
              <tr>
                <td width=20%>보호센터</td> 
                <td width=80%>${vo.center }</td>
              </tr>
              <tr>
                <td width=20%>보호센터 전화번호</td>
                <td width=80%>${vo.tel }</td>
              </tr>
            </table>
            <table class="table">
             <tr>
               <td>
                 <div id="piechart" style="width: 500px; height: 250px;"></div>
               </td>
             </tr>
            </table>
            <table class="table">
              <tr>
               <td>
               <h3>댓글</h3>
                 <form method="post" action="../adopt/reply_insert.do">
	                 <input type="hidden" name="cno" value="${vo.adno }">
	                 <textarea rows="3" cols="93" name="msg" style="float: left" placeholder="내용을 입력하세요."></textarea>
	                 <input type=submit value="등록" class="btn btn-sm btn-primary px-4"
	                  style="float: left;height: 74px">
                  </form>
               </td>
              </tr>
            </table>
		    </div>  
          </div>
 <!-- list end -->
           <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box ftco-animate"> 
            	<h3>입양가능한 List</h3>
              <table class="table">
              <c:forEach var="vo" items="${aList }">
		         <tr>
		           <td>
		            <a href="../adopt/detail.do?no=${vo.adno }"><img src="${vo.poster }" width=35 height=35></a>
		           </td>
		           <td>${vo.cate }</td>
		           <td>${vo.punumber }</td>
		         </tr>
		       </c:forEach>
            </table>
            
       <hr>
      </div>

            <div class="sidebar-box ftco-animate">
              <h3>주변 지도</h3>
            <table class="table">
              <tr>
               <td class="text-center">
                <div id="map" style="width:100%;height:350px;"></div>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7e8bc1d2f7bde96cce0a16b1cec2ee0&libraries=services"></script>
                <script>
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        	    mapOption = {
        	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        	        level: 3 // 지도의 확대 레벨
        	    };  
        	
        	// 지도를 생성합니다    
        	var map = new kakao.maps.Map(mapContainer, mapOption); 
        	
        	// 주소-좌표 변환 객체를 생성합니다
        	var geocoder = new kakao.maps.services.Geocoder();
        	
        	// 주소로 좌표를 검색합니다
        	geocoder.addressSearch('${vo.area}', function(result, status) {
        	
        	    // 정상적으로 검색이 완료됐으면 
        	     if (status === kakao.maps.services.Status.OK) {
        	
        	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        	
        	        // 결과값으로 받은 위치를 마커로 표시합니다
        	        var marker = new kakao.maps.Marker({
        	            map: map,
        	            position: coords
        	        });
        	
        	        // 인포윈도우로 장소에 대한 설명을 표시합니다
        	        var infowindow = new kakao.maps.InfoWindow({
        	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.center}</div>'
        	        });
        	        infowindow.open(map, marker);
        	
        	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        	        map.setCenter(coords);
        	    } 
        	});    
                </script>
               </td>
              </tr>
            </table>
            </div>
            <div class="sidebar-box ftco-animate">
            	<div class="sidebar-box ftco-animate"> 
            	<h3>관련 뉴스</h3>
              <table class="table">
              <c:forEach var="nvo" items="${list }">
                <tr>
                 <td>
                  <img src="${nvo.poster }" width=35 height=35 class="img-rounded">
                 </td>
                 <td style="font-size:8pt">${nvo.title }</td>
                </tr>
              </c:forEach>
            </table>
            
       <hr>
      </div>
			</div>
		</section>
</body>
</html>