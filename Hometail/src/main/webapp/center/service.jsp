<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- SimpleDateFormat --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.row {
   margin: 0px auto;
   width:900px;
}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
</style>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f479a055a85358bb537395d0d7aeb6"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f479a055a85358bb537395d0d7aeb6&libraries=LIBRARY"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f479a055a85358bb537395d0d7aeb6&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f479a055a85358bb537395d0d7aeb6&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
  	
			console.log('ajax돌아기전') 				 
		$.ajax({
			type:'POST',
			url:'../center/center_date.do',
			success:function(data)
			{
			console.log('ajax돌아감!!!!!!!!!!!!!!!!!!!!') 				 
				$('#reserve_date').html(data);
			}
		  });
			
			
		$.ajax({
				type:'POST',
				url:'../center/center_time.do',
				success:function(data)
				{
					$('#reserve_time').html(data);
				}
			  });
			$.getJSON("hospital.json",function(data){
				$.each(data["datas"],function(index,value){
						jsondata_p= JSON.stringify(value);
// 						console.log('protection.json 출력'+jsondata_p);
						var obj_p = eval("("+jsondata_p+")");
						var aJon_p = new Object();
						/*
						<유기동물보호시설현황>
						  <row>
						    <SUM_YY>집계년도</SUM_YY>
						    <SIGUN_NM>시군명</SIGUN_NM>
						    <ENTRPS_NM>업체명</ENTRPS_NM>
						    <ENTRPS_TELNO>업체전화번호</ENTRPS_TELNO>
						    <REPRSNTV_NM>대표자명</REPRSNTV_NM>
						    <CONTRACT_PERD>계약기간</CONTRACT_PERD>
						    <ACEPTNC_ABLTY_CNT>수용능력수</ACEPTNC_ABLTY_CNT>
						    <RM_MATR>비고사항</RM_MATR>
						    <REFINE_ZIPNO>소재지우편번호</REFINE_ZIPNO>
						    <REFINE_LOTNO_ADDR>소재지지번주소</REFINE_LOTNO_ADDR>
						    <REFINE_ROADNM_ADDR>소재지도로명주소</REFINE_ROADNM_ADDR>
						    <REFINE_WGS84_LAT>WGS84위도</REFINE_WGS84_LAT>
						    <REFINE_WGS84_LOGT>WGS84경도</REFINE_WGS84_LOGT>
						  </row>
						*/
						aJon_p.NO = obj_p.NO;
						aJon_p.SHELTER_NAME = obj_p.SHELTER_NAME;
						aJon_p.TEL = obj_p.TEL;
						aJon_p.CAPACITY = obj_p.CAPACITY;
						aJon_p.REPRESENTATIVE = obj_p.REPRESENTATIVE; //대표자
		 				 console.log(obj_p.REPRESENTATIVE);
		 				aJon_p.CITY = obj_p.CITY; //시군구
		 				aJon_p.REMINDER = obj_p.REMINDER; //비고 사항
		 				aJon_p.POST = obj_p.POST;
		 				aJon_p.LOTNO_ADDR = obj_p.LOTNO_ADDR;
		 				aJon_p.ROADNO_ADDR = obj_p.ROADNO_ADDR;
		 				aJon_p.POSTER = obj_p.POSTER;
		 				 console.log(aJon_p.POST);
		 				 console.log('x좌표'+obj_p.WGS84_X);
		 				 console.log('y좌표'+obj_p.WGS84_Y);
		 				aJon_p.latlng = new kakao.maps.LatLng(obj_p.WGS84_X,obj_p.WGS84_Y);
		 				 
		 				 
						aJsonArray_p.push(aJon_p);
						mapdata_p= aJsonArray_p;
				})
			
			
 			  $.getJSON("myJson.json",function(data){
// 	 			  $( "#tabs" ).tabs();
 			     var html = [];
 				 var aJsonArray = new Array();
 				 
 			   	$.each(data["datas"],function(index,value){
 			   		
 			   	 var jsondata = JSON.stringify(value); // 문자열변환
 				 //console.log(jsondata) // {"lat":"33.450690851406016","lng":"126.57040313031214"}
//  				 console.log('가보자'+jsondata);
 			   
 				 var obj = eval("("+jsondata+")"); // object 형태로 변경
 				 //console.log(obj) // {lat: "33.450690851406016", lng: "126.57040313031214"}
 				 var aJson = new Object();
 				 var i =0;
 				 /*
 				 	넣어줘야 할 Json 데이터 
 				 	[{"SIGUN_NM":"가평군",		//지역 이름
				    "RSCU_INST_NM":"선진가축병원",	//이름
				    "RSCU_INST_TELNO":"",		//전화번호
				    "REFINE_ZIPNO":"12414",		//우편 번호
				    "REFINE_LOTNO_ADDR":"경기도 가평군 가평읍 읍내리 746번지",	//소재지 도로명 주소
				    "REFINE_ROADNM_ADDR":"경기도 가평군 가평읍 석봉로 243",	//소재지   지번  주소
				    "REFINE_WGS84_LAT":"37.83648319","REFINE_WGS84_LOGT":"127.5081603"}, //경도 위도
 				 */
 				 
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
 			   	var imageSrc = "hospital.png";
//  			    	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
 			   	// 마커 이미지의 이미지 크기 입니다
			   	var imageSize = new kakao.maps.Size(35, 35); 
			   	    
			   	// 마커 이미지를 생성합니다    
			   	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
 			   	for(var j=0;j<mapdata_p.length;j++)
 			   {
 				  var marker= new kakao.maps.Marker({
 					  	map: map, // 마커를 표시할 지도
			   	        position: mapdata_p[j].latlng, // 마커를 표시할 위치
	   					title: mapdata_p[j].NO+"|"+mapdata_p[j].SHELTER_NAME+"|"+mapdata_p[j].TEL
							+"|"+mapdata_p[j].CAPACITY+"|"+mapdata_p[j].REPRESENTATIVE+
							"|"+mapdata_p[j].CITY+"|"+mapdata_p[j].REMINDER+
							"|"+mapdata_p[j].POST+"|"+mapdata_p[j].LOTNO_ADDR+
							"|"+mapdata_p[j].ROADNO_ADDR,
						image : markerImage
			   	    }); 
 				  
 				 var infowindow = new kakao.maps.InfoWindow({
				        content: mapdata_p[j].ENTRPS_NM // 인포윈도우에 표시할 내용
				    });
				    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker));
			   		function makeClickListener(map, marker, infowindow) {
			   			return function(){
			   			var temp = marker.getTitle();
			   			var temp2 = temp.split('|');
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
	 			   		console.log('병원이름'+hospital_name);
	 			   		console.log('지역위치'+city);
	 			   		console.log('전화번호'+tel);
	 			   		console.log('우편번호'+post);
	 			   		console.log('도로주소'+lotno_addr);
	 			   		console.log('지번주소'+roadnm_addr);
			   			$('#hospital_name').text(hospital_name);
			   			$('#loc').text(loc);
			   			$('#hospital_addr').text(lotno_addr);
			   			$('#hospital_addr2').text(roadnm_addr);
			   			$('#hospital_tel').text(tel);
			   			$('#post').text(post);
			   			};
			   		}
			   		
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
 				var imageSrc = "shelter.png";
//		    	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		   	// 마커 이미지의 이미지 크기 입니다
	   			var imageSize = new kakao.maps.Size(35, 35); 
	   			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
 			   for (var i = 0; i < mapdata.length; i ++) {
 			   	// 마커를 생성합니다
 				var marker= new kakao.maps.Marker({
 			   	        map: map, // 마커를 표시할 지도
 			   	        position: mapdata[i].latlng, // 마커를 표시할 위치
	   					title: mapdata[i].NO+"|"+mapdata[i].SHELTER_NAME+"|"+mapdata[i].TEL
							+"|"+mapdata[i].CAPACITY+"|"+mapdata[i].REPRESENTATIVE+
							"|"+mapdata[i].CITY+"|"+mapdata[i].REMINDER+
							"|"+mapdata[i].POST+"|"+mapdata[i].LOTNO_ADDR+
							"|"+mapdata[i].ROADNO_ADDR,
//  			   	        loc: mapdata[i].SIGUN_NM,		// 지역 위치
//  			   	        tel: mapdata[i].RSCU_INST_TELNO, // 전화 번호
//  			   	        post: mapdata[i].REFINE_ZIPNO,	// 우편 번호
//  			   	        lotno_addr: mapdata[i].REFINE_LOTNO_ADDR, // 도로명 주소
//  			   	        roadnm_addr: mapdata[i].REFINE_ROADNM_ADDR, //지번 주소
 			   	        image : markerImage // 마커 이미지 
 			   	        
 			   	    });
 				    var infowindow = new kakao.maps.InfoWindow({
 				        content: mapdata[i].RSCU_INST_NM // 인포윈도우에 표시할 내용
 				    });
 				    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker));
 			   		function makeClickListener(map, marker, infowindow) {
 			   			return function(){
 			   			console.log(marker.getTitle()+'클릭');
 			   			console.log(marker.getPosition()+'위치');
 			   			var temp = marker.getTitle();
 			   			var temp2 = temp.split('|');
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
	 			   		console.log('병원이름'+shelter_name);
	 			   		console.log('지역위치'+city);
	 			   		console.log('전화번호'+tel);
	 			   		console.log('우편번호'+post);
	 			   		console.log('도로주소'+lotno_addr);
	 			   		console.log('지번주소'+roadnm_addr);
	 			   		
	 			   		var city_temp = city.substring(0,2);
	 					$.ajax({
	 						type:'POST',
	 						url:'../center/graph.do',
	 						data:{"city":city_temp},
	 						success:function(data)
	 						{
	 							console.log('graph ajax 성공!')
	 							$('#graph').html(data);
	 						}
	 					});
	 					
	 					
 			   			$('#hospital_name').text(shelter_name);
 			   			$('#loc').text(city);
 			   			$('#hospital_addr').text(lotno_addr);
 			   			$('#hospital_addr2').text(roadnm_addr);
 			   			$('#hospital_tel').text(tel);
 			   			$('#post').text(post);
 			   			
 			   			$('#hospital_name2').val(shelter_name);
 			   			$('#loc2').val(city);
 			   			$('#hospital_addr1').val(lotno_addr);
 			   			$('#hospital_addr22').val(roadnm_addr);
 			   			$('#hospital_tel2').val(tel);
 			   			$('#post2').val(post);
 			   			};
 			   		}
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
 			 	for (var i = 0; i < mapdata.length; i ++) {
 		   		$('#table3').append(
 		   			"<tr><td>"+mapdata[i].SIGUN_NM+"</td><td>"+mapdata[i].RSCU_INST_NM+"</td></tr>"
 		   		);
 			 	}
			    
	 			// 지도에 마커를 표출하는 함수입니다
 			 	function displayPlaces(places) {
 			 	    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
 			 	    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
 			 	    var order = document.getElementById(currCategory).getAttribute('data-order');
 			 	    
 			 	    for ( var i=0; i<places.length; i++ ) {
 			 	            // 마커를 생성하고 지도에 표시합니다
 			 	            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
			
 			 	            // 마커와 검색결과 항목을 클릭 했을 때
 			 	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
 			 	            (function(marker, place) {
 			 	                kakao.maps.event.addListener(marker, 'click', function() {
 			 	                    displayPlaceInfo(place);
 			 	                });
 			 	            })(marker, places[i]);
 			 	    }
 			 	}
 			 	function addMarker(position, order) {
 			 	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
 			 	        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
 			 	        imgOptions =  {
 			 	            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
 			 	            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
 			 	            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
 			 	        },
 			 	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
 			 	            marker = new kakao.maps.Marker({
 			 	            position: position, // 마커의 위치
 			 	            image: markerImage 
 			 	        });
 			 	    marker.setMap(map); // 지도 위에 마커를 표출합니다
 			 	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
			 
 			 	    return marker;
 			 	}
 			  });
			});
});
 
function button_click(){
 console.log('클릭클릭');
	let loc=$('#loc2').val();
	if(loc.trim()=="")
	{
		$('#text_view').focus();
		$('#text_view').text('*위치를 선택해 주세요.*');
		console.log('보호소선택');
		return;
	}
	let strDay=$('#rday').val();
	console.log('날짜선택'+strDay);
	if(strDay.trim()=="")
	{
		$('#text_view').focus();
		$('#text_view').text('*날짜를 선택해 주세요.*');
		return;
	}
	let time=$('#time').val();
	console.log('시간선택'+time);
	if(time.trim()=="")
	{
		$('#text_view').focus();
		$('#text_view').text('*시간을 선택해 주세요.*');
	}
	else
	{
		ReserveFrm.submit();	
	}
}
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
	<div class="map_wrap col-lg-12" style="padding-top: 30px; height: 1500px; padding-left: 15px; width: 1300px;">
<!-- 		    <div id="maps" class="col-lg-6" style="width:700px;height:600px; border:1px solid black; float: left;"></div> -->
<!-- 		    <ul id="category"> -->
<!-- 		        <li id="MT1" >  -->
<!-- 		            <span > -->
<!-- 		            	<img alt="" src="../center/hospital.png"> -->
<!-- 		            </span> -->
<!-- 		           센터 -->
<!-- 		        </li>   -->
<!-- 		        <li id="PM9" data-order="2">  -->
<!-- 		            <span class="category_bg pharmacy"></span> -->
<!-- 		           보호소 -->
<!-- 		        </li>   -->
<!-- 		    </ul> -->
			<table align="center">
				<tr>
					<th><img src="../center/hospital.png" width=50 height=50></th>
					<th></th>
					<th align="right" style="padding-left: 15px;"><img src="../center/shelter.png" width=50 height=50> </th>
				</tr>
				<tr>
					<td>치료 병원 </td>
					<td></td>
					<td style="padding-left:18px;"> 보호소</td>
				</tr>
			</table>
			<div class="map_wrap col-lg-8" style="padding-top: 10px; float: left">
			    <div id="maps" style="width:700px;height:600px; border:1px solid black;"></div>
			</div>
			
			<div  id="graph" style="padding-top: 50px; padding-left: 730px;">
			</div>

			<div class="map_wrap col-lg-4" style="float: left; margin-left:730px;">
			<form action="../center/service_map.do" method="post" name="ReserveFrm">
			<table class="table">
				<h3>정보 내역</h3>
				<tr>
					<th>지역</th>
					<td id="loc">
					<input type="hidden" id="loc2"  name="city">
					</td>
				</tr>
				<tr>
					<th>병원 이름</th>
					<td id="hospital_name">
					<input type="hidden" id="hospital_name2"  name="name">
					</td>
				</tr>
				<tr>
					<th>지번주소</th>
					<td id="hospital_addr" >
					<input type="hidden" id="hospital_addr1"  name=lotno_addr>
					</td>
				</tr>
				<tr>
					<th>도로명주소</th>
					<td id="hospital_addr2">
					<input type="hidden" id="hospital_addr22"  name="roadno_addr">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td id="hospital_tel">
					<input type="hidden" id="hospital_tel2"  name="tel">
					</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td id="post" name="post"></td>
				</tr>
<!--                   <input type=hidden name="strYear" id="strYear"> -->
<!--                   <input type=hidden name="strMonth" id="strMonth"> -->
<!--                   <input type=hidden name="strDay" id="strDay"> -->
			</table>
<!--                   <input type=submit value="예매하기" class="btn btn-lg btn-primary"> -->
				  <input type=hidden id="post2"  name="post">
                  <input type=hidden name="rday" id="rday">
                  <input type=hidden name="time" id="time">
	              <input type="button" value="예약" onclick="button_click();" class="btn btn-primary">
			</form> 
	              <p id="text_view" style="color:red;"></p>
	              </div>
	        <div class="col-sm-12" style="float: left;">
				<div class="col-sm-6" id="reserve_date">
				</div>
	        		
				<div class="col-sm-6" id="reserve_time">
				</div>
	        </div>	
			 <div class="col-sm-12">
			 	<h4>센터 page</h4>
<!--          <div id="tabs"> -->
<!--            <ul> -->
<!--              <li><a href="#tabs-1">치료기관 </a></li> -->
<!--            </ul> -->
<!--            <div id="tabs-1"> -->
<!--              <table class="table" id="table1"> -->
<!--               <ul> -->
<!--              <li><a href="#tabs-1">보호소</a></li> -->
<!--              </ul> -->
<!--              </table> -->
<!--            </div> -->
<!--            <div id="tabs-2"> -->
<!--              <table class="table" id="table2"> -->
             
<!--              </table> -->
<!--            </div> -->
<!--            <div id="tabs-3"> -->
<!--              <table class="table" id="table3"> -->
             
<!--              </table> -->
<!--            </div> -->
<!--          </div> -->
	   </div>
			</div>
	</div>

  </body>
</html>