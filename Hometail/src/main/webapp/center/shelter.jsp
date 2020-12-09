<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- SimpleDateFormat --%>
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
	    $.getJSON("myJson.json",function(data){
	    	$.each(data["datas"],function(index,value){
	    			console.log('일단 돌아감');
	    	})
	    });
	    
 			  $.getJSON("myJson.json",function(data){
// 	 			  $( "#tabs" ).tabs();
 			     var html = [];
 				 var aJsonArray = new Array();
 				 
 			   	$.each(data["datas"],function(index,value){
 			   	 	
 			   	 var jsondata = JSON.stringify(value); // 문자열변환
 			   	 
 				 var obj = eval("("+jsondata+")"); // object 형태로 변경
 				 var aJson = new Object();
 				 aJson.NO = obj.NO;
 				 aJson.SHELTER_NAME = obj.SHELTER_NAME;
 				 aJson.TEL = obj.TEL;
 				 aJson.POST = obj.POST;
 				 aJson.ADDR = obj.ADDR;
 				 aJson.POSTER = obj.POSTER;
 				 console.log(aJson.POST);
 				 console.log('x좌표'+obj.WGS84_X);
 				 console.log('y좌표'+obj.WGS84_Y);
 				 aJson.latlng = new kakao.maps.LatLng(obj.WGS84_X,obj.WGS84_Y);
 		         aJsonArray.push(aJson); // 배열에 Object push
 		         mapdata = aJsonArray; 
 		         console.log(mapdata); // 배열형태 확인  
 		         	console.log(mapdata.length); //배열 사이즈 확인
 			   	})
	 			   var mapContainer = document.getElementById('maps'), // 지도를 표시할 div  
			   	    mapOption = { 
			   	        center: new kakao.maps.LatLng(37.5665,126.9780),  // 지도의 중심좌표
			   	        level: 8 // 지도의 확대 레벨
			   	    };
 			   	
	   	    
			   		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		   			for(var i=0;i<mapdata.length;i++)
		   			{
	 			   		var imageSrc = mapdata[i].POSTER;
	
	 			   		var imageSize = new kakao.maps.Size(35, 35); 
	 			   		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		   				var marker = new kakao.maps.Marker({
		   					map: map,
		   					position: mapdata[i].latlng,
		   					title: mapdata[i].NO+"|"+mapdata[i].SHELTER_NAME+"|"+mapdata[i].TEL
		   							+"|"+mapdata[i].POST+"|"+mapdata[i].ADDR,
		   					image: markerImage
		   				});
		   			}
 			  });
});
</script>
</head>
<body>
 <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <!-- <div class="overlay"></div> -->
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">임시보호</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="../main/main.do">Home</a></span></p>
          </div>
        </div>
      </div>
</section>
<div class="container">
		<div class="map_wrap col-lg-12" style="float: left; padding-top: 100px;">
		    <div id="maps" style="width:1000px;height:600px; border:1px solid black; float: left;"></div>
		</div>
		
		<div class="map_wrap col-lg-12" style="float: left; padding-top: 100px;">
			<div class="map_wrap col-lg-6" style="float: left; padding-top: 100px;">
				
			</div>
			<div class="map_wrap col-lg-6" style="float: left; padding-top: 100px;">
		
			</div>
		</div>
		
	</div>
  </body>
  </body>
</html>
