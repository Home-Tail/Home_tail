<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f479a055a85358bb537395d0d7aeb6"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f479a055a85358bb537395d0d7aeb6&libraries=LIBRARY"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f479a055a85358bb537395d0d7aeb6&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f479a055a85358bb537395d0d7aeb6&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
$(function(){
 		var aJsonArray_p = new Array();
 		var jsondata_p;
 		var hospital_name;
		var loc;
		var tel;
  		var post;		
  		var lotno_addr;	 
	  	var roadnm_addr;
	    $.getJSON("myJson.json",function(data){
	    	$.each(data["datas"],function(index,value){
	    			console.log('일단 돌아감');
	    	})
	    });
	    
	    
 			  $.getJSON("myjson.json",function(data){
// 	 			  $( "#tabs" ).tabs();
 			     var html = [];
 				 var aJsonArray = new Array();
 				 
 			   	$.each(data["datas"],function(index,value){
 			   		
 			   	 var jsondata = JSON.stringify(value); // 문자열변환
 				 //console.log(jsondata) // {"lat":"33.450690851406016","lng":"126.57040313031214"}
//  				 console.log('가보자'+jsondata);
 			   
 				 var obj = eval("("+jsondata+")"); // object 형태로 변경
 				 console.log('나오려나..'+obj);
 				 //console.log(obj) // {lat: "33.450690851406016", lng: "126.57040313031214"}
 				 var aJson = new Object();
 				 var i =0;
//  		         aJson.REFINE_WGS84_LAT = obj.REFINE_WGS84_LAT;	//경도 위도
//  		         aJson.REFINE_WGS84_LOGT = obj.REFINE_WGS84_LOGT;//경도 위도
//  		         aJson.RSCU_INST_NM = obj.RSCU_INST_NM;			//이름
//  		         aJson.SIGUN_NM = obj.SIGUN_NM; 				//지역 이름 
//  		         aJson.RSCU_INST_TELNO = obj.RSCU_INST_TELNO;	//전화번호 
//  		         aJson.REFINE_ZIPNO = obj.REFINE_ZIPNO;			//우편번호
//  		         aJson.REFINE_LOTNO_ADDR = obj.REFINE_LOTNO_ADDR;//소재지 도로명 주소
//  		         aJson.REFINE_ROADNM_ADDR = obj.REFINE_ROADNM_ADDR;//소재지 지번 주소
//  		         aJson.latlng = new kakao.maps.LatLng(obj.REFINE_WGS84_LAT,obj.REFINE_WGS84_LOGT);
 		         
 		         i+1;
//  		         console.log('이름'+aJson.RSCU_INST_NM);
//  		         console.log('위도'+aJson.REFINE_WGS84_LAT);
//  		         console.log('경로'+aJson.REFINE_WGS84_LOGT);
 		         aJsonArray.push(aJson); // 배열에 Object push
 		         mapdata = aJsonArray; 
 			   	})
 		          console.log(mapdata); // 배열형태 확인  
 		          console.log(mapdata.length); //배열 사이즈 확인
 		          
//  		          console.log('첫번째'+mapdata[0].RSCU_INST_NM);
 		          
 		         // 지도에 다각형을 표시합니다
//  		         polygon.setMap(map); 
 			   		var mapContainer = document.getElementById('maps'), // 지도를 표시할 div  
 			   	    mapOption = { 
 			   	        center: new kakao.maps.LatLng(37.5665,126.9780),  // 지도의 중심좌표
 			   	        level: 8 // 지도의 확대 레벨
 			   	    };
				
 			   	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 			   	 
 			   	// 마커를 표시할 위치와 title 객체 배열입니다 
//  			   	var positions = [
//  			   	    {
//  			   	        	title: mapdata[0].RSCU_INST_NM, 
//  			   	        	latlng: new kakao.maps.LatLng(mapdata[0].REFINE_WGS84_LAT, mapdata[0].REFINE_WGS84_LOGT)
//  			   	    }
//  			   	];
//  			   	positions.push(mapdata);
 			   	// 마커 이미지의 이미지 주소입니다
 			   	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
 			   
 			   	// 마커 이미지의 이미지 크기 입니다
			   	var imageSize = new kakao.maps.Size(24, 35); 
			   	    
 			   
 			   for (var i = 0; i < mapdata.length; i ++) {
 			   	// 마커를 생성합니다
 				var marker= new kakao.maps.Marker({
 			   	        map: map, // 마커를 표시할 지도
 			   	        position: mapdata[i].latlng, // 마커를 표시할 위치
 			   	        title: mapdata[i].RSCU_INST_NM+'|'+mapdata[i].SIGUN_NM+'|'+mapdata[i].RSCU_INST_TELNO
 			   	        +'|'+mapdata[i].REFINE_ZIPNO+'|'+mapdata[i].REFINE_LOTNO_ADDR+'|'+mapdata[i].REFINE_ROADNM_ADDR // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
//  			   	        loc: mapdata[i].SIGUN_NM,		// 지역 위치
//  			   	        tel: mapdata[i].RSCU_INST_TELNO, // 전화 번호
//  			   	        post: mapdata[i].REFINE_ZIPNO,	// 우편 번호
//  			   	        lotno_addr: mapdata[i].REFINE_LOTNO_ADDR, // 도로명 주소
//  			   	        roadnm_addr: mapdata[i].REFINE_ROADNM_ADDR, //지번 주소
//  			   	        image : markerImage // 마커 이미지 
 			   	        
 			   	    });
 				   	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록 (생성해줘야함)
 			        // 이벤트 리스너로는 클로저를 만들어 등록
 			        // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록된다.
 			        kakao.maps.event.addListener(marker,"mouseover",makeOverListener(map, marker, infowindow));
 			        kakao.maps.event.addListener(marker,"mouseout",makeOutListener(infowindow));
 			        
 			        // 인포윈도우를 표시하는 클로저를 만드는 함수입니다
 			        function makeOverListener(map, marker, infowindow) {
 			            return function () {
 			              infowindow.open(map, marker);
 			            };
 			          }
 			          // 인포윈도우를 닫는 클로저를 만드는 함수입니다
 			          function makeOutListener(infowindow) {
 			            return function () {
 			              infowindow.close();
 			            };
 			          }
 			   	}
 			  });
});
</script>
</head>
<body>
    <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">Contact Us</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Contact <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
      </section>
<div class="container">
	<div class="col-lg-12" style="padding-top: 30px;">
<!-- 		    <div id="maps" class="col-lg-6" style="width:700px;height:600px; border:1px solid black; float: left;"></div> -->
				
			<div class="map_wrap col-" style="float: left; padding-top: 100px;"  >
			    <div id="maps" style="width:700px;height:600px; border:1px solid black; float: left;"></div>
			    <ul id="category">
			        <li id="MT1" data-order="1"> 
			            <span class="category_bg mart"></span>
			           센터
			        </li>  
			        <li id="PM9" data-order="2"> 
			            <span class="category_bg pharmacy"></span>
			           보호소
			        </li>  
			    </ul>
			</div>
		</div>
	</div>
  </body>
</html>
