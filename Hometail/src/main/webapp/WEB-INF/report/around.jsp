<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.containerX a
{
    color: #FFF;
    text-decoration: none;
    font: 20px Raleway;
    margin: 0px 10px;
    padding: 10px 10px;
    position: relative;
    z-index: 0;
    cursor: pointer;
}

div.topBotomBordersOut a:before, div.topBotomBordersOut a:after
{
    position: absolute;
    left: 0px;
    width: 100%;
    height: 2px;
    background: #0082C6;
    content: "";
    opacity: 0;
    transition: all 0.3s;
}

div.topBotomBordersOut a:before
{
    top: 0px;
    transform: translateY(10px);
}

div.topBotomBordersOut a:after
{
    bottom: 0px;
    transform: translateY(-10px);
}


div.topBotomBordersOut a:hover:before, div.topBotomBordersOut a:hover:after
{
    opacity: 1;
    transform: translateY(0px);
}

</style>

<script type="text/javascript">
$(function() {
	//전체,실종,제보,완료 버튼 누를때마다 카테고리 변경 용도
	$('div .containerX a').click(function(){
		cate=$(this).attr("cate");
		
		if(cate!=4)
		{
		$.ajax({
				type:'post',
				url:'../report/list.do',
				data: {cate:cate}, //버튼누를때마다 카테고리별 정렬
				success:function(result)
				{
					console.log("cate!=4");
					$('#tagin').html(result);
				}
			})
		}
		if(cate==4)
		{
		$.ajax({
				type:'post',
				url:'../report/around.do',
				success:function(result)
				{
					console.log("cate==4");
					$('#tagin').html(result);
				}
			})
		}
	});
});


</script>

</head>
<body>
<div class="container">
  <div class="row">
  			
      <div class="col-lg-8 ftco-animated">
	      <div class="containerX blue topBotomBordersOut" style="margin-bottom: 20px; margin-top: 20px;">
				  <a cate=0 style="color: black; font-weight: 800;">전체</a>
				  <a cate=1 style="color: black; font-weight: 800;">실종</a>
				  <a cate=2 style="color: black; font-weight: 800;">제보</a>
				  <a cate=3 style="color: black; font-weight: 800;">완료</a>
				  <a cate=4 style="color: black; font-weight: 800;">주변</a>
		 </div>
		 
		 
<input type="text" id="sample5_address" placeholder="주소" readonly="readonly">
<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>


<div id="map" style="width:100%;height:350px;">testtest</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf0dee115b69fb07b0a086d4b7d2b75a&libraries=services"></script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};

    //지도를 미리 생성
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    //주소-좌표 변환 객체를 생성
    var geocoder = new kakao.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

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
                    }
                });
            }
        }).open();
    }
</script>
		 

		 
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