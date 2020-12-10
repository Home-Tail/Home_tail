<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script type="text/javascript">
$(function() {
	
});
</script>
</head>
<body>
	<div class="latest-products">
      <div style="height: 130px"></div>
        <div class="container">
         <div class="row">
		  <div class="col-md-12">
		    <h3 class="text-center">제보하기</h3>
		    <form method="post" action="../report/insert_ok.do" enctype="multipart/form-data">
		   <table class="table table-hover">
		   	 <tr>
		       <th class="danger text-right" width=15%>제목</th>
		       <td width=85%>
		         <input type=text name=title size=45 class="input-sm">
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>카테고리</th>
			   <td width=85%>
		         <select name=cate >
		         	<option value="1">실종</option>
		         	<option value="2">목격</option>
		         </select>
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>분류</th>
		       <td width=85%>
		         <select name=kind required>
		         	<option value="0">모든동물</option>
		         	<option value="1">개</option>
		         	<option value="2">고양이</option>
		         	<option value="3">기타</option>
		         </select>
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>품종</th>
		       <td width=85%>
		         <select name=sub_kind required>
		         	<option value="0">전체</option>
		         </select>
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>성별</th>
		       <td width=85%>
		         <select name=sex>
		         	<option value="0">미확인</option>
		         	<option value="1">수컷</option>
		         	<option value="2">암컷</option>
		         </select>
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>나이</th>
		       <td width=85%>
		         <select name=age>
		         	<option value="0">나이 모름</option>
		         	<option value="1">1살</option>
		         	<option value="2">2살</option>
		         	<option value="3">3살</option>
		         </select>
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>몸무게</th>
		       <td width=85%>
		         <input type=text name=weight size=45 class="input-sm" placeholder="숫자만 입력해주세요">
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>털색</th>
		       <td width=85%>
		         <input type=text name=color size=45 class="input-sm" placeholder="무늬나 털색을 적어주세요">
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>특징</th>
		       <td width=85%>
		         <input type=text name=point size=45 class="input-sm" placeholder="눈에 띄는 특징을 적어주세요">
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>장소</th>
		       <td width=85%>
		       <!-- 입력창 -->
			   <input type="text" name=loc id="sample5_address" placeholder="주소를 검색하시거나 지도에서 클릭해주세요" readonly="readonly" style="width: 500px">
			   <input type="text" name=map_x id="map_x" value="">
			   <input type="text" name=map_y id="map_y" value="">
			   <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
			   
			   <!-- 지도 -->	
			   <div id="map" style="width:500px;height:300px;margin-top:10px;"></div>
					
					<!-- 주소&지도 스크립트 시작 -->
					<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf0dee115b69fb07b0a086d4b7d2b75a&libraries=services"></script>
					<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = { 
							    center: new kakao.maps.LatLng(37.566689, 126.978414), // 지도의 중심좌표
							    level: 8 // 지도의 확대 레벨
							};
					
					    //지도를 미리 생성
					    var map = new kakao.maps.Map(mapContainer, mapOption); 
					    //주소-좌표 변환 객체를 생성
					    var geocoder = new kakao.maps.services.Geocoder();
					    //인포윈도우
					    var infowindow = new kakao.maps.InfoWindow({zindex:1});
					    //마커를 미리 생성
					    var marker = new kakao.maps.Marker({
					        map: map
					    });
					    
					    
					  	//==========버튼기능 활용시작==========
					    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
					        searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
					            if (status === kakao.maps.services.Status.OK) {
					                var detailAddr = !!result[0].road_address ? '<div>도로명 : ' + result[0].road_address.address_name + '</div>' : '';
					                detailAddr += '<div>지번 : ' + result[0].address.address_name + '</div>';
					                
					                var content = '<div class="bAddr" style="padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap; ">' +
					                                detailAddr + 
					                            '</div>';
					                
					                // 클릭한 위도, 경도 정보를 가져옵니다 
		                            var latlng = mouseEvent.latLng; 
		                            document.getElementById("map_x").value=latlng.getLat();
		                            document.getElementById("map_y").value=latlng.getLng();

					                // 마커를 클릭한 위치에 표시합니다 
					                marker.setPosition(mouseEvent.latLng);
					                marker.setMap(map);

					                // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					                infowindow.setContent(content);
					                infowindow.open(map, marker);
					                
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
					                    	map.setLevel(4);
					                        var result = results[0]; //첫번째 결과의 값을 활용
					
					                        // 해당 주소에 대한 좌표를 받아서
					                        var coords = new daum.maps.LatLng(result.y, result.x);
					                        // 지도를 보여준다.
					                        mapContainer.style.display = "block";
					                        map.relayout();
					                        // 지도 중심을 변경한다.
					                        map.setCenter(coords);
					                        // 마커를 결과값으로 받은 위치로 옮긴다.
					                        marker.setPosition(coords)
					                        
					                        infowindow.setContent(content);
							                infowindow.open(map, marker);
							                
							                var latlng = map.getCenter(); 
				                            document.getElementById("map_x").value=latlng.getLat();
				                            document.getElementById("map_y").value=latlng.getLng();
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
		       <th class="danger text-right" width=15%>실종일</th>
		       <td width=85%>
				 <input type=date name=pdate class="input-sm" id="pdate">
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>연락처</th>
		       <td width=85%>
		         <input type=text name=tel size=45 class="input-sm" placeholder="연락처를 남겨주세요">
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>내용</th>
		       <td width=85%>
		         <textarea rows="5" cols="50" name=content></textarea>
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>사진첨부(최대 3장)</th>
		       <td width=85%>
		         <input type="file" name=poster size=45 class="input-sm">
		       </td>
		     </tr>
		     <tr>
		       <td colspan="2" class="text-center">
		         <input type=submit value=제보하기 class="btn btn-sm btn-primary">
		         <input type=button value=취소 class="btn btn-sm btn-primary"
		           onclick="javascript:history.back()"
		         >
		       </td>
		     </tr>
		    </table>
		   </form>
		  </div>
		 </div>
		 </div>
		 <div style="height: 130px"></div>
		</div>
</body>
</html>