<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
    .wrap {position: absolute;left: 0;bottom: 40px;width: 400px;height: 180px;margin-left: -198px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 100%;height: 100%;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info .link {color: #5085BB;}

	.ftco-sectionXX {
	    padding: 0em 0;
	    position: relative;
	}
	
	.pl-4XX, .px-4 {
	    padding-left: 0rem !important;
	}
	
	.hero-wrapXX {
	width: 100%;
	height: 100%;
	position: inherit;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: top center;
	position: relative; }
	
	@media (max-width: 991.98px) {
	  .hero-wrapXX {
	    background-position: top center !important; } }
	.hero-wrapXX .overlay {
	  position: absolute;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  content: '';
	  opacity: .8;
	  background: #0033c700; }
	.hero-wrapXX.hero-wrapXX-2 {
	  height: 300px; }
	  .hero-wrapXX.hero-wrapXX-2 .slider-text {
	    height: 300px; }
	    .hero-wrapXX.hero-wrapXX-2 .slider-text .bread {
	      font-weight: 900;
	      color: #fff; }
	    .hero-wrapXX.hero-wrapXX-2 .slider-text .breadcrumbs {
	      text-transform: uppercase;
	      font-size: 13px;
	      letter-spacing: 1px; }
	      .hero-wrapXX.hero-wrapXX-2 .slider-text .breadcrumbs span {
	        color: #fff;
	        border-bottom: 2px solid rgba(255, 255, 255, 0.1); }
	        .hero-wrapXX.hero-wrapXX-2 .slider-text .breadcrumbs span a {
	          color: #fff; }

.btn {
	border: 2px solid black;
	background-color: white;
	color: black;
	padding: 8px 14px;
	font-size: 10px;
	cursor: pointer;
	border-color: black;
	color: Purple;
}

#btn1:hover {
	background: #FFB6C1;
}

#btn2:hover {
	background: #00a3d2;
}

div.toggleWrap1 { position: relative; width: 200px; margin: 0 auto; padding: 0 10px; background: #FFB6C1; } div.toggleWrap1 > span { font-size: 15px; font-weight: 600; line-height: 2; color: white; } input { display: none; }
.toggleWrap1 > div { position: absolute; top: 0; bottom: 0; right: 10px; width: 34px; height: 20px; margin-top: 5px; } label { display: block; width: 36px; height: 20px; box-sizing: border-box; border-radius: 36px; border: 1px solid #e5e5e5; background: #fff; transition: all 0.3s ease; } label > span { position: absolute; top: 3px; left: 3px; display: block; width: 14px; height: 14px; border-radius: 50%; box-sizing: border-box; box-shadow: 0 0 3px 0 rgba(0, 0, 0, 0.25), 0 3px 3px 0 rgba(0, 0, 0, 0.15); transition: all 0.3s cubic-bezier(0.275, -0.45, 0.725, 1.45); background: #fff; }
input:active + div label, input:checked + div label { border: 10px solid #abe2fb; box-shadow: 0 0 5px #abe2fb; } input:active + div label > span, input:checked + div label > span { left: 18px; }

div.toggleWrap2 { position: relative; width: 200px; margin: 0 auto; padding: 0 10px; background: #00A3D2; } div.toggleWrap2 > span { font-size: 15px; font-weight: 600; line-height: 2; color: white; } input { display: none; }
.toggleWrap2 > div { position: absolute; top: 0; bottom: 0; right: 10px; width: 34px; height: 20px; margin-top: 5px; } label { display: block; width: 36px; height: 20px; box-sizing: border-box; border-radius: 36px; border: 1px solid #e5e5e5; background: #fff; transition: all 0.3s ease; } label > span { position: absolute; top: 3px; left: 3px; display: block; width: 14px; height: 14px; border-radius: 50%; box-sizing: border-box; box-shadow: 0 0 3px 0 rgba(0, 0, 0, 0.25), 0 3px 3px 0 rgba(0, 0, 0, 0.15); transition: all 0.3s cubic-bezier(0.275, -0.45, 0.725, 1.45); background: #fff; }
input:active + div label, input:checked + div label { border: 10px solid #abe2fb; box-shadow: 0 0 5px #abe2fb; } input:active + div label > span, input:checked + div label > span { left: 18px; }


</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf0dee115b69fb07b0a086d4b7d2b75a"></script>
<script type="text/javascript">
var jsonData;
var jsonArrMissing = new Array();
var jsonArrReport = new Array();
var clickedOverlay = null;
var missingMarkers = [];
var reportMarkers = [];
let st1=1;
let st2=1;
$(function() {
	$('#btnMiss').click(function() {
		if (st1 == 1) {
			st1 = 2;
		} else {
			st1 = 1;
		}
	});
	$('#btnReport').click(function() {
		if (st2 == 1) {
			st2 = 2;
		} else {
			st2 = 1;
		}
	});
	
	$.ajax({
		type:'post',
		url:'../report/around_data.do',
		async:false,
		success:function(result)
		{
			//data는 json []
			let data=JSON.parse(result.trim());
			for(let i=0;i<data.length;i++)
			{
				//jsonData는 [] 안에 있는 {}을 String으로
				jsonData=JSON.stringify(data[i])
				//jsonData을 object 형으로 변환
				var obj_json = JSON.parse(jsonData);
				var json = new Object();
				
				//실종
				if(obj_json.cate===1)
				{
					json.no=obj_json.no;
					json.title=obj_json.title;
	            	json.body=  '<table>'+
					            '<thead>'+
					            '  <tr>'+
					            '    <th><img src="../reportposter/'+obj_json.poster+'" width="200" height="150">' +
					            '    <th><span class="ellipsis" style="margin-left: 3px;">'+obj_json.loc+'</span>'+
					            '    <div class="ellipsis" style="margin-left: 3px;">분류 : '+obj_json.kind+'</div>'+
					            '    <div class="ellipsis" style="margin-left: 3px;">품종 : '+obj_json.sub_kind+'</div>'+
					            '    <div class="ellipsis" style="margin-left: 3px;">성별 : '+obj_json.sex+'</div>'+
					            '    <div class="ellipsis" style="margin-left: 3px;">나이 : '+obj_json.age+'</div>'+
					            '    <div><a href="../report/detail.do?no='+obj_json.no+'" class="link" style="margin-left: 3px;">상세페이지</a></div>'+
					            '    </th>'
					            '  </tr>'+
					            '</thead>'+
					            '</table>';
					json.poster=obj_json.poster;
					json.cate=obj_json.cate;
					json.kind=obj_json.kind;
					json.loc=obj_json.loc;
					json.map_x=obj_json.map_x;
					json.map_y=obj_json.map_y;
					json.latlng=new kakao.maps.LatLng(obj_json.map_x, obj_json.map_y);
					jsonArrMissing.push(json);
				}
				
				//제보
				if(obj_json.cate===2)
				{
					json.no=obj_json.no;
					json.title=obj_json.title;
					json.body=  '<table>'+
					            '<thead>'+
					            '  <tr>'+
					            '    <th><img src="../reportposter/'+obj_json.poster+'" width="200" height="150">' +
					            '    <th><span class="ellipsis" style="margin-left: 3px;">'+obj_json.loc+'</span>'+
					            '    <div class="ellipsis" style="margin-left: 3px;">분류 : '+obj_json.kind+'</div>'+
					            '    <div class="ellipsis" style="margin-left: 3px;">품종 : '+obj_json.sub_kind+'</div>'+
					            '    <div class="ellipsis" style="margin-left: 3px;">성별 : '+obj_json.sex+'</div>'+
					            '    <div class="ellipsis" style="margin-left: 3px;">나이 : '+obj_json.age+'</div>'+
					            '    <div><a href="../report/detail.do?no='+obj_json.no+'" class="link" style="margin-left: 3px;">상세페이지</a></div>'+
					            '    </th>'
					            '  </tr>'+
					            '</thead>'+
					            '</table>';
					json.poster=obj_json.poster;
					json.cate=obj_json.cate;
					json.kind=obj_json.kind;
					json.loc=obj_json.loc;
					json.map_x=obj_json.map_x;
					json.map_y=obj_json.map_y;
					json.latlng=new kakao.maps.LatLng(obj_json.map_x, obj_json.map_y);
					jsonArrReport.push(json);
				}
			}
		}
	})
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.566689, 126.978414), // 지도의 중심좌표
	        level: 8 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	// jsonArr로 대체 => 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	/* 
	var positions = [
	    { 
	        content: jsonArr[0].title, 
	        latlng: new kakao.maps.LatLng(jsonArr[0].map_x, jsonArr[0].map_y)
	    },
	    {
	        content: '<div>생태연못</div>', 
	        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
	    },
	    {
	        content: '<div>텃밭</div>', 
	        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
	    },
	    {
	        content: '<div>근린공원</div>',
	        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
	    }
	];
	*/
	
	// '실종' 데이터 개수만큼 마커생성
	for (var i = 0; i < jsonArrMissing.length; i ++) {
		 var missingData = jsonArrMissing[i];
		 displayMissingMarker(missingData);
	}
	
	// '제보' 데이터 개수만큼 마커생성
	for (var i = 0; i < jsonArrReport.length; i ++) {
		 var reportData = jsonArrReport[i];
		 displayReportMarker(reportData);
	}
	
	//=============실종 마커, 오버레이 생성 함수 시작(기능: 마커,오버레이 생성, 마커클릭이벤트)=============
	function displayMissingMarker(missingData) {
		var imageSrc = "https://i.ibb.co/k0psBhx/missing.png";
		var imageSize = new kakao.maps.Size(29, 42); 
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: missingData.latlng,
	        image : markerImage
	    });
	    
	    //배열에 마커추가
	    missingMarkers.push(marker);
	    
	    var overlay = new kakao.maps.CustomOverlay({
	        //yAnchor: 3,
	        position: marker.getPosition()
	    });
	    
	    //=============커스텀오버레이 컨텐츠=============
	    var content = document.createElement('div');
	    content.className = 'wrap';
	    var info = document.createElement('div');
	    info.className = 'info';
	    content.appendChild(info);
	    var title = document.createElement('div');
	    title.className = 'title';
	    title.appendChild(document.createTextNode(missingData.title));
	    info.appendChild(title);
	    var closeBtn = document.createElement('div');
	    closeBtn.className = 'close';
	    closeBtn.onclick = function () { // X버튼누를시 해당 오버레이 끄기
	        overlay.setMap(null);
	    };
	    title.appendChild(closeBtn);
	    var body=document.createElement('div');
	    body.className = 'body';
	    body.innerHTML=missingData.body;
	    info.appendChild(body);
	  	//=============커스텀오버레이 컨텐츠=============
	    
	  	//오버레이에 셋
	    overlay.setContent(content);

	  	//마커 클릭시 오버레이 출력
	  	//clickedOverlay => 오버레이 떠있는 상태에서 다른마커 누르면 기존 오버레이 끄는 용도
	    kakao.maps.event.addListener(marker, 'click', function() {
	    	// 2. 기존에 떠있던 오버레이가 있다면 
	        if (clickedOverlay) {
	        // 3. 해당 오버레이를 끈다.
	            clickedOverlay.setMap(null);
	        }
	    	//누른 마커에 해당하는 오버레이 출력
	        overlay.setMap(map);
	        // 1.clickedOverlay에 누른 마커 저장
	        clickedOverlay = overlay;
	    });
	}
	//=============실종 마커, 오버레이 생성 함수 시작(기능: 마커,오버레이 생성, 마커클릭이벤트)=============

	//=============제보 마커, 오버레이 생성 함수 시작(기능: 마커,오버레이 생성, 마커클릭이벤트)=============
	function displayReportMarker(reportData) {
		var imageSrc = "https://i.ibb.co/58VyR2R/report.png";
		var imageSize = new kakao.maps.Size(29, 42); 
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: reportData.latlng,
	        image: markerImage
	    });
	    
	  	//배열에 마커추가
	    reportMarkers.push(marker);
	    
	    var overlay = new kakao.maps.CustomOverlay({
	        //yAnchor: 3,
	        position: marker.getPosition()
	    });
	    
	    //=============커스텀오버레이 컨텐츠=============
	    var content = document.createElement('div');
	    content.className = 'wrap';
	    var info = document.createElement('div');
	    info.className = 'info';
	    content.appendChild(info);
	    var title = document.createElement('div');
	    title.className = 'title';
	    title.appendChild(document.createTextNode(reportData.title));
	    info.appendChild(title);
	    var closeBtn = document.createElement('div');
	    closeBtn.className = 'close';
	    closeBtn.onclick = function () { // X버튼누를시 해당 오버레이 끄기
	        overlay.setMap(null);
	    };
	    title.appendChild(closeBtn);
	    var body=document.createElement('div');
	    body.className = 'body';
	    body.innerHTML=reportData.body;
	    info.appendChild(body);
	  	//=============커스텀오버레이 컨텐츠=============
	    
	  	//오버레이에 셋
	    overlay.setContent(content);

	  	//마커 클릭시 오버레이 출력
	  	//clickedOverlay => 오버레이 떠있는 상태에서 다른마커 누르면 기존 오버레이 끄는 용도
	    kakao.maps.event.addListener(marker, 'click', function() {
	    	// 2. 기존에 떠있던 오버레이가 있다면 
	        if (clickedOverlay) {
	        // 3. 해당 오버레이를 끈다.
	            clickedOverlay.setMap(null);
	        }
	    	//누른 마커에 해당하는 오버레이 출력
	        overlay.setMap(map);
	        // 1.clickedOverlay에 누른 마커 저장
	        clickedOverlay = overlay;
	    });
	}
	//=============제보 마커, 오버레이 생성 함수 시작(기능: 마커,오버레이 생성, 마커클릭이벤트)=============		
		
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMissingMarkers(map) {
	    for (var i = 0; i < missingMarkers.length; i++) {
	    	missingMarkers[i].setMap(map);
	    }            
	}
	
	function setReportMarkers(map) {
	    for (var i = 0; i < reportMarkers.length; i++) {
	    	reportMarkers[i].setMap(map);
	    }            
	}
	
	$('#btnMiss').click(function(){
		if(st1==1)
		showMissingMarkers();
		if(st1==2)
		hideMissingMarkers();
	});
	
	function showMissingMarkers() {
		setMissingMarkers(map);
	}
	function hideMissingMarkers() {
		setMissingMarkers(null);
        if (clickedOverlay) {
            clickedOverlay.setMap(null);
        }
	}
	
	$('#btnReport').click(function(){
		if(st2==1)
		showReportMarkers();
		if(st2==2)
		hideReportMarkers();
	});
	
	function showReportMarkers() {
		setReportMarkers(map);
	}
	function hideReportMarkers() {
		setReportMarkers(null);
        if (clickedOverlay) {
            clickedOverlay.setMap(null);
        }
	}
	
	
		
	
	
	/*
	for (var i = 0; i < jsonArr.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: jsonArr[i].latlng // 마커의 위치
	    });
		
	    
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: jsonArr[i].content // 인포윈도우에 표시할 내용
	    });
	    
	    
	    //===========================================
	    var content = document.createElement('div');
	    content.className = 'wrap';

	    var info = document.createElement('div');
	    info.className = 'info';
	    content.appendChild(info);

	    var title = document.createElement('div');
	    title.className = 'title';
	    title.appendChild(document.createTextNode(jsonArr[i].title));
	    info.appendChild(title);
	    
	    var closeBtn = document.createElement('button');
	    closeBtn.appendChild(document.createTextNode('닫기'));

	    title.appendChild(closeBtn);
	  //===========================================
	    
		// 마커 위에 커스텀오버레이를 표시합니다
	 	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
// 	    var overlay = new kakao.maps.CustomOverlay({
// 	        content: jsonArr[i].content,
// 	        position: marker.getPosition()       
// 	    });
	  
	  var overlay = new kakao.maps.CustomOverlay({
	        content: content,
	        position: marker.getPosition()       
	    });
	  

	    //overlay.setMap(map);
		
	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
// 	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
// 	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	    
	    
	    
	 	// 마커 위에 커스텀오버레이를 표시합니다
		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(marker, 'click', A(map,overlay));
		//kakao.maps.event.addListener(closeBtn, 'click',  B);
	    closeBtn.onclick = function(){
	    						return closeOverlay(overlay);
	    					};
		
// 	 	var t = document.getElementsByClassName('close');
		//kakao.maps.event.addListener(document.getElementsByClassName('close'), 'click', B);
	}
	*/
	
	/*
	function A(map, overlay) {
	    return function() {
	    	overlay.setMap(map);
	    };
	}
	
	function B() {
	    alert('테스트');
	}
	
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay(overlay) {
	    overlay.setMap(null);     
	}
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	*/
	
	/* 아래와 같이도 할 수 있습니다 */
	/*
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });
	
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });
	
	    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
	    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    (function(marker, infowindow) {
	        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
	        kakao.maps.event.addListener(marker, 'mouseover', function() {
	            infowindow.open(map, marker);
	        });
	
	        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
	        kakao.maps.event.addListener(marker, 'mouseout', function() {
	            infowindow.close();
	        });
	    })(marker, infowindow);
	}
	*/
	
});

 </script>
</head>
<body>

<section class="hero-wrapXX hero-wrapXX-2" style="background-image: url('https://i.ibb.co/Hd3n3Vz/33322.png');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread" style="text-shadow: 1px 0 #212529, 0 1px #212529, 1px 0 #212529, 0 1px #212529;">주변동물</h1>
          </div>
        </div>
      </div>
</section>

<div class="container">
	<div style="margin-top: 10px;">
		<div class="toggleWrap1" style="border-radius: 10px;margin-left: 0px;">
		  <span>실종 켜고/끄기</span>
		  <input type="checkbox" id="toggle_alarm1" name="" value="" checked/>
		  <div>
		    <label for="toggle_alarm1" id="btnMiss">
		      <span />
		    </label>
		  </div>
		</div>
		<div class="toggleWrap2" style="border-radius: 10px;margin-left: 0px; margin-top: 10px">
		  <span>제보 켜고/끄기</span>
		  <input type="checkbox" id="toggle_alarm2" name="" value="" checked/>
		  <div>
		    <label for="toggle_alarm2" id="btnReport">
		      <span />
		    </label>
		  </div>
		</div>
	</div>
	<div class="row">
		    <!-- 지도가 표시될 div -->
  			<div id="map" style="width:70%;height:500px;margin-top: 10px; margin-bottom: 30px; margin-left: 20px"></div>
	    <!-- 지도 위에 표시될 마커 카테고리 -->
	    <div class="category">
	        <ul>
	         	<li>
	              		<img src="https://i.ibb.co/k0psBhx/missing.png" style="width: 29px; height: 42px"> 실종
	            </li>
	            <br>
	            <li>
	                	<img src="https://i.ibb.co/58VyR2R/report.png" style="width: 29px; height: 42px"> 제보
	            </li>
	            <br>
	            <li>
	                	상세정보를 보시려면 마커를 클릭하세요
	            </li>
	             <br>
	            <li>
	                	내 주변 실종/제보를 확인해보세요
	            </li>
	        </ul>
	    </div>
	</div>
</div>

</body>
</html>