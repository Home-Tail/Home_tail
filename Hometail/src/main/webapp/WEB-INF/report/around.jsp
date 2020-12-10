<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
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

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf0dee115b69fb07b0a086d4b7d2b75a"></script>
<script type="text/javascript">
console.log("test123123");
$(function() {
	var jsonData;
	var jsonArr = new Array();
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
				json.no=obj_json.no;
				console.log(json.no);
				
				json.title=obj_json.title;
				json.cate=obj_json.cate;
				json.kind=obj_json.kind;
				json.loc=obj_json.loc;
				json.map_x=obj_json.map_x;
				json.map_y=obj_json.map_y;
				jsonArr.push(json);
			}
		}
	})

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
	    {
	        content: '<div>카카오</div>', 
	        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
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
	
	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
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
  <div class="row">
		 	
		 	<!-- 지도생성 -->
			<div id="map" style="width:100%;height:350px;"></div>
			
		 
</div> <!-- .col-md-8 -->


<!-- 
          <div class="col-lg-4 sidebar ftco-animated">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                  <span class="icon icon-search"></span>
                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
                </div>
              </form>
            </div>
        </div>
 -->
 
</body>
</html>