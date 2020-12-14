<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    	  
    	  $("#reportModal").on('shown.bs.modal', function(){
    		  reportmap.relayout();
    		  });
    	  
      })
</script>
<style type="text/css">
.modal{
	
}
</style>
</head>
<body>

<div class="latest-products">
      <div class="container">
		<hr>
		<div style="height: 50px"></div>
<!--         <div class="row"> -->
<!--           <table class="table"> -->
<!--             <tr> -->
<%--               <c:forTokens var="poster" items="${vo.poster }" delims="^"> --%>
<%--                <td><img src="${vo.poster }" width=210 height=200></td> --%>
<%--               </c:forTokens> --%>
<%-- 			  <td><img src="${vo.poster }" width=210 height=200></td> --%>
<!--             </tr> -->
<!--           </table> -->
<!--         </div> -->
        <div style="height:20px"></div>
        <div class="row">
          <div class="col-md-7">
            <table class="table">
             <tr>
              <td>
               <h3>
                <c:choose>
             	 <c:when test="${vo.cate eq 1 }">
               	  <span style="color:#ff00a9;">[실종]</span> 
              	 </c:when>
              	 <c:when test="${vo.cate eq 2 }">
               	  <span style="color:#28a745;">[제보]</span>
              	 </c:when>
              	 <c:when test="${vo.cate eq 3 }">
               	  <span style="color:#939782;">[완료]</span>
              	 </c:when>
              	</c:choose>
              	  ${vo.title }
               </h3>
              </td>
             </tr>
             <tr>
              <td>
               <img src="../reportposter/${vo.poster}" width=210 height=200>
              </td>
             </tr>
            </table>
            <table class="table">
              <tr>
                <td width=20%>분류</td>
                <c:choose>
                 <c:when test="${vo.kind eq 0 }">
               	  <td width=80%>모든 동물</td>
              	 </c:when>
             	 <c:when test="${vo.kind eq 1 }">
               	  <td width=80%>개</td>
              	 </c:when>
              	 <c:when test="${vo.kind eq 2 }">
               	  <td width=80%>고양이</td>
              	 </c:when>
              	 <c:when test="${vo.kind eq 3 }">
               	  <td width=80%>기타</td>
              	 </c:when>
                </c:choose>
<%--                 <td width=80%>${vo.kind }</td> --%>
              </tr>
              <tr>
                <td width=20%>품종</td>
                <c:choose>
                 <c:when test="${vo.sub_kind eq 0 }">
               	  <td width=80%>전체</td>
              	 </c:when>
             	 
                </c:choose>
<%--                 <td width=80%>${vo.sub_kind }</td> --%>
              </tr>
              <tr>
                <td width=20%>성별</td>
                <td width=80%>${vo.sex }</td>
              </tr>
              <tr>
                <td width=20%>나이</td>
                <td width=80%>${vo.age }살</td>
              </tr>
              <tr>
                <td width=20%>몸무게</td>
                <td width=80%>${vo.weight }kg</td>
              </tr>
              <tr>
                <td width=20%>털색</td>
                <td width=80%>${vo.color }</td>
              </tr>
              <tr>
                <td width=20%>특징</td>
                <td width=80%>${vo.point }</td>
              </tr>
              <tr>
                <td width=20%>실종일</td>
                <td width=80%>${vo.pdate }</td>
<%--                 <fmt:formatDate value="${vo.pdate }" pattern="yyyy-MM-dd"/></td>   --%>
              </tr>
              <tr>
                <td width=20%>실종장소</td>
                <td width=80%>${vo.loc }</td>
              </tr>
              <tr>
                <td width=20%>아이디</td>
                <td width=80%>${vo.id }</td>
              </tr>
              <tr>
                <td width=20%>연락처</td>
                <td width=80%>${vo.tel }</td>
              </tr>
              <tr>
                <td width=20%>내용</td>
                <td width=80%>${vo.content }</td>
              </tr>
            </table>
            <hr>
			<div style="height:50px"></div>	
					
			<!-- 댓글 입력창 -->
<!-- 			<div style="height:100px"></div> -->
<!-- 			<h3>댓글</h3> -->
			
			
			
			<div class="comment-form-wrap pt-5">
                <h4 class="mb-3 h4 font-weight-bold">댓글</h4>
<!--                 <form action="#" class="p-4 bg-light"> -->
<!--                   <div class="form-group "> -->
<!--                     <label for="message">Message</label> -->
<!--                     <textarea name="content" id="content" cols="30" rows="3" class="form-control" placeholder="내용을 입력해주세요"></textarea> -->
<!--                   </div> -->
<!--                   <div style="text-align:right;"> -->
<!--                     <input type="submit" value="입력" class="btn py-1 px-3 btn-primary"> -->
<!--                   </div> -->
<!--                 </form> -->
              
            <table class="table">
              <tr>
               <td>
               	 <c:if test="${sessionScope.id==null }">
<!-- 	                 <textarea rows="2" cols="70" name="content" style="float: left" placeholder="로그인 후 입력해주세요"></textarea> -->
					<div class="p-4 bg-light ">
                    <textarea name="content" id="content" cols="30" rows="3" class="form-control" placeholder="내용을 입력해주세요"></textarea>
                  </div>
                 </c:if>
               	 <c:if test="${sessionScope.id!=null }">
<!--                  <form method="post" action="../report/reply_insert.do"> -->
<%-- 	                 <input type="hidden" name="petno" value="${vo.petno }"> --%>
<!-- 	                 <textarea rows="2" cols="70" name="content" style="float: left"></textarea> -->
<!-- 	                  <input type=submit value="댓글쓰기" class="btn btn-sm btn-primary" style="width:100px; height: 67px; margin-left:5px; font: 16px Raleway;" > -->
<!--                   </form> -->
				<form action="../report/reply_insert.do" class="p-4 bg-light">
					<input type="hidden" name="petno" value="${vo.petno }">
                  <div class="form-group ">
                    <textarea name="content" cols="30" rows="3" class="form-control" placeholder="내용을 입력해주세요"></textarea>
                  </div>
                  <div style="text-align:right;">
                    <input type="submit" value="입력" class="btn py-1 px-3 btn-primary">
                  </div>
                </form>
                  </c:if>
               </td>
              </tr>
            </table>
            </div>
            <!-- 댓글 리스트 -->
            <table class="table">
              <tr>
               <td>
                 <c:forEach var="rvo" items="${rList }">
                   <table class="table table-striped">
                    <tr>
                     <td class="text-left">◑${rvo.id }(<span style="color:#939782;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${rvo.regdate}" /></span>)</td>
                     <td class="text-right">
                      <c:if test="${sessionScope.id==rvo.id }">
                       <span value="${rvo.replyno }" class="btn py-1 px-2 btn-success up" style=" font: 10px Raleway;">수정</span>
                       <a href="../report/reply_delete.do?rno=${rvo.replyno }&pno=${vo.petno}" class="btn py-1 px-2 btn-danger" style=" font: 10px Raleway;">삭제</a>
                      </c:if>
                     </td>
                    </tr>
                    <tr>
                      <td colspan="2">
                       <pre style="white-space: pre-wrap;border:none;background-color: white" ><span style=" font: 16px Raleway;">${rvo.content }</span></pre>
                      </td>
                    </tr>
                    <tr class="updates" id="u${rvo.replyno }" style="display:none">
		               <td colspan="2">
		                 <form method="post" action="../report/reply_update.do" >
			                 <input type="hidden" name="pno" value="${vo.petno }">
			                 <input type="hidden" name="rno" value="${rvo.replyno }">
<%-- 			                 <textarea rows="3" cols="60" name="content" style="float: left">${rvo.content }</textarea> --%>
<!-- 			                 <input type=submit value="댓글수정" class="btn btn-sm btn-primary" -->
<!-- 			                  style="float: left;height: 73px"> -->
							  <div class="form-group ">
			                    <textarea name="content" cols="30" rows="3" class="form-control" style=" font: 16px Raleway;">${rvo.content }</textarea>
			                  </div>
			                  <div style="text-align:right;">
			                    <input type="submit" value="댓글수정" class="btn py-1 px-2 btn-primary" style=" font: 10px Raleway;">
			                  </div>
		                  </form>
		               </td>
		              </tr>
                   </table>
                 </c:forEach>
               </td>
              </tr>
            </table>
            
          </div>
          <!-- 	지도		 -->
          <div class="col-md-5">
            <h3>실종 장소</h3>
            <table class="table">
              <tr>
               <td class="text-center">
                <div id="map" style="width:100%;height:350px;"></div>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38f29003dfceb26147055ab6401f2dcf&libraries=services"></script>
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
        	geocoder.addressSearch('${vo.loc}', function(result, status) {
        	
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
        	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.title}</div>'
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
       <hr>
       
       <!-- 목격했어요!! 			-->
       <!-- Button to Open the Modal -->
       <div style="text-align: right ">
       <c:if test="${sessionScope.id!=null }">
       	<button type="button" class="btn btn-info font-weight-bold" data-toggle="modal" data-target="#reportModal" style="height: 45px; width: 120px; font: 17px Raleway;">
			  목격했어요!
		</button>
		</c:if>
      </div>
      
	<!-- The Modal -->
	<div class="modal" id="reportModal">
	  <div class="modal-dialog" style="max-width:560px;  width: 560px; height: 1000px;">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h6 class="modal-title">목격 장소를 검색하시거나 지도에서 클릭해주세요</h6>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <table class="table ">
	        	
			    <tr>
			       <td>
			       <!-- 입력창 -->
				   <input type="hidden" name=loc id="sample5_address" readonly="readonly" style="width: 300px">
				   <input type="hidden" name=map_x2 id="map_x2" value="">
				   <input type="hidden" name=map_y2 id="map_y2" value="">
				   <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" style="width: 90px"><br>
				   
				   <!-- 지도 -->	
				   <div id="reportmap" style="width:500px;height:300px;"></div>
						
						<!-- 주소&지도 스크립트 시작 -->
						<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf0dee115b69fb07b0a086d4b7d2b75a&libraries=services"></script>
						<script>
								var mapContainer = document.getElementById('reportmap'), // 지도를 표시할 div 
								mapOption = { 
								    center: new kakao.maps.LatLng(37.566689, 126.978414), // 지도의 중심좌표
								    level: 4 // 지도의 확대 레벨
								};
						
						    //지도를 미리 생성
						    var reportmap = new kakao.maps.Map(mapContainer, mapOption); 
						    //주소-좌표 변환 객체를 생성
						    var geocoder = new kakao.maps.services.Geocoder();
						    //인포윈도우
						    var infowindow = new kakao.maps.InfoWindow({zindex:1});
						    //마커를 미리 생성
						    var marker = new kakao.maps.Marker({
						        reportmap: reportmap
						    });
						    
						    
						  	//==========버튼기능 활용시작==========
						    kakao.maps.event.addListener(reportmap, 'click', function(mouseEvent) {
						        searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
						            if (status === kakao.maps.services.Status.OK) {
						                var detailAddr = !!result[0].road_address ? '<div>도로명 : ' + result[0].road_address.address_name + '</div>' : '';
						                detailAddr += '<div>지번 : ' + result[0].address.address_name + '</div>';
						                
						                var content = '<div class="bAddr" style="padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap; ">' +
						                                detailAddr + 
						                            '</div>';
						                
						                // 클릭한 위도, 경도 정보를 가져옵니다 
			                            var latlng = mouseEvent.latLng; 
			                            document.getElementById("map_x2").value=latlng.getLat();
			                            document.getElementById("map_y2").value=latlng.getLng();
	
						                // 마커를 클릭한 위치에 표시합니다 
						                marker.setPosition(mouseEvent.latLng);
						                marker.setMap(reportmap);
	
						                // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
						                infowindow.setContent(content);
						                infowindow.open(reportmap, marker);
						                
										document.getElementById("sample5_address").value=!!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name;
						                
						            }   
						        });
						    });
						    
						    function searchAddrFromCoords(coords, callback) {
						        // 좌표로 행정동 주소 정보를 요청합니다
						        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
						    }
	
						    function searchDetailAddrFromCoords(coords, callback) {
						        // 좌표로 법정동 상세 주소 정보를 요청합니다
						        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
						    }
						  	//==========버튼기능 활용끝==========
						
						    //==========검색기능 활용시작==========
						    function sample5_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                var addr = data.address; // 최종 주소 변수
						                var roadAddr = data.roadAddress; // 도로명 주소 변수
						                var extraRoadAddr = ''; // 참고 항목 변수
						                
						                var detailAddr = '<div>도로명 : ' + data.roadAddress + '</div>';
						                detailAddr += '<div>지번 : ' + data.jibunAddress + '</div>';
						                
						                var content = '<div class="bAddr" style="padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap; ">' +
						                                detailAddr + 
						                            '</div>';
						
						                // 주소 정보를 해당 필드에 넣는다.
						                document.getElementById("sample5_address").value = addr;
						                // 주소로 상세 정보를 검색
						                geocoder.addressSearch(data.address, function(results, status) {
						                    // 정상적으로 검색이 완료됐으면
						                    if (status === daum.maps.services.Status.OK) {
						                    	reportmap.setLevel(4);
						                        var result = results[0]; //첫번째 결과의 값을 활용
						
						                        // 해당 주소에 대한 좌표를 받아서
						                        var coords = new daum.maps.LatLng(result.y, result.x);
						                        // 지도를 보여준다.
						                        mapContainer.style.display = "block";
						                        reportmap.relayout();
						                        // 지도 중심을 변경한다.
						                        reportmap.setCenter(coords);
						                        // 마커를 결과값으로 받은 위치로 옮긴다.
						                        marker.setPosition(coords)
						                        
						                        infowindow.setContent(content);
								                infowindow.open(reportmap, marker);
								                
								                var latlng = reportmap.getCenter(); 
					                            document.getElementById("map_x2").value=latlng.getLat();
					                            document.getElementById("map_y2").value=latlng.getLng();
						                    }
						                });
						            }
						        }).open();
						    }
						  	//==========검색기능 활용끝==========
						</script>
						<!-- 주소&지도 스크립트 끝 -->
	
			       </td>
			     </tr>
			     <tr>
	        		
	        		<td>
	        		<textarea rows="3" cols="63" name="content" style="float: left" placeholder="내용을 입력해주세요"></textarea>
	        		</td>
	        	</tr>
	        </table>
	      </div>

	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	
	        <button type="button" class="btn btn-success" data-dismiss="modal">제보하기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
      
      
      
      </div>
      
      
      <div class="col-md-12" style="height:100px"></div>
      <div class="col-md-12"><hr></div>
      <div class="col-md-12" style="text-align: right ">
      	
		   <input type=button value=목록 class="btn btn-sm btn-primary" style="height: 35px; width: 75px; font: 15px Raleway;" onclick="javascript:history.back()">
		   <c:if test="${sessionScope.id==vo.id }">
		   	<a href="../report/update.do?no=${vo.petno }" class="btn btn-sm btn-success" style="height: 35px; width: 75px; font: 15px Raleway;">수정</a>
		   	<a href="../report/delete.do?no=${vo.petno }" class="btn btn-sm btn-danger" style="height: 35px; width: 75px; font: 15px Raleway;">삭제</a>
		   </c:if>
		  </td>
		
      </div>
     </div>
   </div>
   <div style="height:150px"></div>
  </div>
  
  

  
  
  
</body>
</html>