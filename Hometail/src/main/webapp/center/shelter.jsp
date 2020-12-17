<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f479a055a85358bb537395d0d7aeb6&libraries=services""></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f479a055a85358bb537395d0d7aeb6&libraries=LIBRARY"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f479a055a85358bb537395d0d7aeb6&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f479a055a85358bb537395d0d7aeb6&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
$(function(){
	    $.getJSON("shelter.json",function(data){
	    	$.each(data["datas"],function(index,value){
	    			console.log('일단 돌아감');
	    	})		
	    });			
	    			
 			  $.getJSON("shelter.json",function(data){
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
 				 aJson.CAPACITY = obj.CAPACITY;
 				 aJson.REPRESENTATIVE = obj.REPRESENTATIVE; //대표자
 				 console.log(obj.REPRESENTATIVE);
 				 aJson.CITY = obj.CITY; //시군구
 				 aJson.REMINDER = obj.REMINDER; //비고 사항
 				 aJson.POST = obj.POST;
 				 aJson.LOTNO_ADDR = obj.LOTNO_ADDR;
 				 aJson.ROADNO_ADDR = obj.ROADNO_ADDR;
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
// 	 			   		var imageSrc = mapdata[i].POSTER;
	 			   		var imageSrc = mapdata[i].POSTER;
								
	 			   		var imageSize = new kakao.maps.Size(55, 55); 
	 			   		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		   				var marker = new kakao.maps.Marker({
		   					map: map,
		   					position: mapdata[i].latlng,
		   					//title에 들어갈 내용들~
// 		    				 aJson.NO = obj.NO;
// 		    				 aJson.SHELTER_NAME = obj.SHELTER_NAME;
// 		    				 aJson.TEL = obj.TEL;
// 		    				 aJson.CAPACITY = obj.CAPACITY;
// 		    				 aJson.REPRESENTATIVE = obj.REPRESENTATIVE; //대표자
// 		    				 aJson.CITY = obj.CITY; //시군구
// 		    				 aJson.REMINDER = obj.REMINDER; //비고 사항
// 		    				 aJson.POST = obj.POST;
// 		    				 aJson.LOTNO_ADDR = obj.LOTNO_ADDR;
// 		    				 aJson.ROADNO_ADDR = obj.ROADNO_ADDR;
// 		    				 aJson.POSTER = obj.POSTER;
		   					title: mapdata[i].NO+"|"+mapdata[i].SHELTER_NAME+"|"+mapdata[i].TEL
		   							+"|"+mapdata[i].CAPACITY+"|"+mapdata[i].REPRESENTATIVE+
		   							"|"+mapdata[i].CITY+"|"+mapdata[i].REMINDER+
		   							"|"+mapdata[i].POST+"|"+mapdata[i].LOTNO_ADDR+
		   							"|"+mapdata[i].ROADNO_ADDR,
		   					image: markerImage
		   				});		
		   				var infowindow = new kakao.maps.InfoWindow({
					        content: mapdata.SHELTER_NAME// 인포윈도우에 표시할 내용
					    });		
		   			 kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker));
	 			   		function makeClickListener(map, marker, infowindow) {
	 			   			return function(){
// 	 			   				console.log(marker.getTitle()+'클릭');
// 	 			   				console.log(marker.getPosition()+'위치');
	 			   			var temp = marker.getTitle();
	 			   			var temp2 = temp.split('|');
	 			   			//순서!
// 			 			   		1-NO
// 				 			   	2-SHELTER_NAME
// 				 			   	3-TEL
// 				 			   	4-CAPACITY
// 				 			   	5-REPRESENTATIVE
// 				 			   	6-CITY
// 				 			   	7-REMINDER
// 				 			   	8-POST
// 				 			   	9-LOTNO_ADDR
// 				 			   	10-ROADNO_ADDR
	 			   			for (var i in temp2){
	 			   				if(i==0)
	 			   					no=temp2[i];
	 			   				else if(i==1)
	 			   					shelter_name=temp2[i];
	 			   				else if(i==2)
	 			   					tel=temp2[i];
	 			   				else if(i==3)
	 			   					capacity=temp2[i];
	 			   				else if(i==4)
	 			   					representative=temp2[i];
	 			   				else if(i==5)
	 			   					city=temp2[i];
	 			   				else if(i==6)
	 			   					reminder=temp2[i];
	 			   				else if(i==7)
	 			   					post=temp2[i];
	 			   				else if(i==8)
	 			   					lotno_addr=temp2[i];
	 			   				else if(i==9)
	 			   					roadno_addr=temp2[i];
	  			   			}		
// 	 			   			콘솔찍기!	
							console.log('보호소 번호  '+no);
							console.log('보호소 이름  '+shelter_name);
							console.log('==========================');
									
// 							데이터 전달하기! 여기에!
							$('#name').text(shelter_name);
	 			   			$('#representative').text(representative);
	 			   			$('#city').text(city);
	 			   			$('#capacity').text(capacity+'명');
	 			   			$('#roadno_addr').text(roadno_addr);
	 			   			$('#reminder').text(reminder);
							$('#input_name').val(shelter_name);
							$('#no').val(no);
	 			   			};
	 			   		}		
		   			}			
 			  });				
 			 $('#add_btn').click(function(){
 				$('#shelter_click_data').hide();
 				$.ajax({
 					type:'POST',
 					url:'../center/shelter_add.do',
 					success:function(data)
 					{
 					console.log('ajax 미쳐 돌아간다') 				 
 						$('#add_shelter').html(data);
 					}
 				  });
 			 });	
});					
</script>			
</head>				
<body>				
 <section class="hero-wrap hero-wrap-2" style="background-image: url('../center/dog.png');" data-stellar-background-ratio="0.5">
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
	<div class="row">
		<div class="map_wrap col-lg-12" style="float: left; padding-top: 50px;">
		    <div id="maps" style="width:1200px;height:600px; border:1px solid black; float: center; margin:0px auto;"></div>
		</div>		
<!-- 		<div class="map_wrap col-lg-12" style="float: left; padding-top: 100px; height: 500px;"> -->
		<div class="map_wrap col-lg-12" id="add_shelter">
			<div class="map_wrap col-lg-6" style="float: left; padding-top: 100px;" id="shelter_click_data">
		 	 <input type="button" value="보호소 추가" id="add_btn" class="btn btn-primary">
		 	 <sup style="color: red;">*찾는 보호소가 없으면 보호소를 추가해주세요</sup>		
		 	 <form action="../center/shelter_insert.do" method="post">
				<table class="table">
					<tr style="padding-top: 50px;">
						<th width=30% style="text-align: left; margin-top: 50px" >● 요청 보호소</th>
						<td id="name" width=70%>-</td>
					</tr>
					<tr>
						<th width=30% style="text-align: left;">● 보호소 대표자</th>
						<td id="representative" width=70%>-</td>
					</tr>
					<tr>
						<th width=30% style="text-align: left;">● 보호소 지역</th>
						<td id="city" width=70%>-</td>
					</tr>
					<tr>
						<th width=30% style="text-align: left;">● 보호소  수용 능력</th>
						<td id="capacity" width=70%>-</td>
					</tr>
					<tr>
						<th width=30% style="text-align: left;">● 보호소 주소</th>
						<td id="roadno_addr" width=70%>-</td>
					</tr>
					<tr>
						<th width=30% style="text-align: left;">● 비고 사항</th>
						<td id="reminder" width=70%>-</td>
					</tr>
					<tr>
						<th width=30% style="text-align: left;">● 요청 품목</th>
						<td width=70%>
							<select id="poster" name="poster">
								<option value="0">신문지</option>
								<option value="1">통조림</option>
								<option value="2">사료</option>
								<option value="3">헌옷</option>
								<option value="4">이불</option>
							</select>
						</td>
					</tr>
					<tr>
						<th colspan=2>※ 요청 메시지</th>
					</tr>
					<tr>
						<td colspan=2 style="border-top:none;"><textarea rows="5" cols="60" id="message"></textarea></td>
					</tr>
					<tr>
						<td colspan=2 class="text-center">
							<input type="hidden"  id="input_name" name="name">
							<input type="hidden"  id="no" name="no">
							<input type="submit"  class="btn btn-primary" value="요청하기">
						</td>
					</tr>
				</table>
				</form>
			</div>		
			<div class="col-lg-6" style="float: left; padding-top: 100px;" >
					<div id="root"></div>
		            <script src="../center_news/center_news.js"></script>
			</div>		
		</div>		
					</div>
					
	</div>			
  </body>			
</html>