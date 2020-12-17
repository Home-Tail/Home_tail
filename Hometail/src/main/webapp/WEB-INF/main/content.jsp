<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../img/hometail.png" rel="shortcut icon" type="image/x-icon">
<title>HomeTail</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../css/animate.css">
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">
<link rel="stylesheet" href="../css/aos.css">
<link rel="stylesheet" href="../css/ionicons.min.css">
<link rel="stylesheet" href="../css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../css/jquery.timepicker.css">
<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/icomoon.css">
<link rel="stylesheet" href="../css/style.css">
<style type="text/css">
.ftco-section11{
padding: 1em;
}
.be-light11{
background: none;
background-color: none;
}
#crimage{
border-radius: 25px;
border:1px solid orange;
}

</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = google.visualization.arrayToDataTable([
        ['지역별', '기관'],
        ['센터',     <c:out value="${total_center}"/>],
        ['봉사횟수',     <c:out value="${total_center_service}"/>],
      ]);
      
      var options = {
        is3D:true,
        fontSize : 13
      };
      
      var data_shelter = google.visualization.arrayToDataTable([
        ['지역별', '기관'],
        ['보호소',     <c:out value="${total_shelter}"/>],
        ['봉사횟수',     <c:out value="${total_shelter_service}"/>],
      ]);
      
      var options_shelter = {
        is3D:true,
        fontSize : 13
      };
      var data_ask = google.visualization.arrayToDataTable([
        ['지역별', '기관'],
        ['신문지',     <c:out value="${poster_count[0]}"/>],
        ['통조림',     <c:out value="${poster_count[1]}"/>],
        ['사료',     <c:out value="${poster_count[2]}"/>],
        ['헌옷',     <c:out value="${poster_count[3]}"/>],
        ['이불',     <c:out value="${poster_count[4]}"/>],
      ]);
      
      var options_ask = {
        is3D:true,
        fontSize : 13
      };

      var chart = new google.visualization.PieChart(document.getElementById('center_graph'));
      var chart_shelter = new google.visualization.PieChart(document.getElementById('shelter_graph'));
      var chart_ask = new google.visualization.PieChart(document.getElementById('ask_graph'));
      chart.draw(data, options);
      chart_shelter.draw(data_shelter, options_shelter);
      chart_ask.draw(data_ask, options_ask);
    }
    
    
$(function(){
	$('.board_detail').click(function(){				
			var no = $(this).attr("data-no");
			var title = $(this).attr("data-title");
			var id = $(this).attr("data-id");
			var cate = $(this).attr("data-cate");
			var regdate = $(this).attr("data-regdate");
			var hit = $(this).attr("data-hit");
			var poster = $(this).attr("data-poster");
			var content = $(this).attr("data-content");

			console.log('no는 :'+no);
			console.log('title는:'+title);
			console.log('id는:'+id);
			console.log('cate는:'+cate);
			console.log('regdate는:'+regdate);
			console.log('hit는:'+hit);
			console.log('poster는:'+poster);	
			console.log('content는:'+content);
			console.log('사진 값'+poster.indexOf('adoptreview'));
			if(poster.indexOf('adoptreview')>0)
			{
				console.log('트루트루');
				$('#b_poster').attr("src",poster);
			}
			if(poster.indexOf('adoptreview')<0)
			{
				console.log('');
				$('#b_poster').attr("src",'../boardPoster/'+poster);
			}
			$('#b_title').text(title);
			$('#b_content').text(content);
			
			
	})
});
google.charts.load('current', {'packages':['corechart']});

google.charts.setOnLoadCallback(drawSarahChart);

google.charts.setOnLoadCallback(drawAnthonyChart);

function drawSarahChart() {

  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Topping');
  data.addColumn('number', 'Slices');
  data.addRows([
    ['개', 120],
    ['고양이', 102],
    ['기타축종', 4],
  ]);

  var options = {title:'보호소의 축종 Chart',
              pieHole: 0.4,
              width:600,
                 height:400};
  var chart = new google.visualization.PieChart(document.getElementById('Sarah_chart_div'));
  chart.draw(data, options);
}
function drawAnthonyChart() {

  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Topping');
  data.addColumn('number', 'Slices');
  data.addRows([
    ['공고중', 8],
    ['자연사', 71],
    ['보호중', 47],
    ['안락사', 7],
    ['입양', 60],
    ['반환', 33]
  ]);

  var options = {title: "상태별 Chart",
          width: 600,
          height: 400,
          bar: {groupWidth: "95%"},
          legend: { position: "none" },};

  var chart = new google.visualization.ColumnChart(document.getElementById('Anthony_chart_div'));
  chart.draw(data, options);
}

</script>
  </head>
<body>
<!-- 입양후기 시작 -->
	 <section class="ftco-section">
         <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                   <div class="col-md-7 heading-section ftco-animate">
                      <span class="subheading subheading-with-line"><span class="pr-2 bg-white">커뮤니티</span></span>
                      <h2 class="mb-4" style="color:#EDA900;">입양후기</h2>
                        <p>귀엽고 사랑스러운 유기견, 유기묘 친구들을 입양한 분들의 다양한 입양후기를 만나보세요.</p>
                   </div>
              </div>   
            <div class="row">
               <c:forEach var="bvo" items="${bList }">
                  <div class="col-md-6 col-lg-3 ftco-animate">
                     <div class="staff">
                        <a class="board_detail" data-toggle="modal" data-target="#board_modal" style="color:#EDA900;"
                           data-no="${bvo.board_no }"
                           data-title="${bvo.title }"
                           data-id="${bvo.id }"
                           data-cate="${bvo.cate }"
                           data-regdate="${bvo.regdate }"
                           data-hit="${bvo.hit }"
                           data-poster="${bvo.poster}"   
                           data-content="${bvo.content }"                
                           ><div class="img" style="background-image: url(${bvo.poster});"></div></a>
                        <div class="text px-4 pt-4">
                           <h5><a class="board_detail" data-toggle="modal" data-target="#board_modal" style="color:#EDA900;"
                           data-no="${bvo.board_no }"
                           data-title="${bvo.title }"
                           data-id="${bvo.id }"
                           data-cate="${bvo.cate }"
                           data-regdate="${bvo.regdate }"
                           data-hit="${bvo.hit }"
                           data-poster="${bvo.poster}"   
                           data-content="${bvo.content }"                
                           >${bvo.title }</a></h5>
                           <span class="position mb-2"  style="color:#333;">${bvo.id }</span>
                           <div class="faded">
                              <ul class="ftco-social d-flex">
                                     <li class="ftco-animate">${bvo.regdate }</li>
                                   </ul>
                                </div>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </div>
         </div>
      </section>
      <div id='board_modal' class="modal fade" role="dialog">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <div class="row">
                        <table class="table">
                             <tr>
                             <td class="text-center" style="border-top:none;">
                                           <img id="b_poster" width=400px height=400px>
                               </td>
                             </tr>
                             <tr>
                                <td id="b_title" style="color:#EDA900; font-weight:bold;"></td>
                             </tr>
                             <tr>
                                <td class="text-left" valign="top" id="b_content" ></td>
                             </tr>
                        </table>
                         </div>
               </div>
            </div>
         </div>
      </div>
<!-- 입양후기 끝 -->
<!-- 봉사 현황 시작 -->
		<section class="ftco-services">
			<div class="container">
				<div class="row justify-content-start">
          <div class="col-md-12 heading-section ftco-animate">
            <h2 class="mb-4">현재 봉사/요청 참여 현황</h2>
          	<div class="pl-md-4 border-line">
	          	<p>현재의 참여중인 봉사 인원, 보호소에서 요청하는 물품</p>
          	</div>
          </div>
        </div>
		<div class="row">
          <div class="col-md-4 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon d-flex justify-content-center align-items-center">
            		<span style="font-size:20px; text-align:center;">센터<br>봉사</span>
              </div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading" id="center_graph"></h3>
              </div>
            </div>           
          </div>
          <div class="col-md-4 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon d-flex justify-content-center align-items-center">
            		<span style="font-size:20px; text-align:center;">보호소<br>봉사</span>
              </div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading" id="shelter_graph"></h3>
              </div>
            </div>    
          </div>
          <div class="col-md-4 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon d-flex justify-content-center align-items-center">
            		<span style="font-size:20px; text-align:center;">보호소<br>요청</span>
              </div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading" id="ask_graph"></h3>
              </div>
            </div>      
          </div>
        </div>
			</div>
		</section>
<!-- 봉사 현황 끝 -->
<!-- 임시보호 시작 -->
		  <section class="ftco-section">
         <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
             <span class="subheading subheading-with-line"><small class="pr-2 bg-white">Temporary protection</small></span>
            <h2 class="mb-4">임시보호</h2>
            <p>유기동물들을 임시보호중입니다. 임시보호 중인 동물 확인이 가능하며 임시보호가 가능하신 분들은 사진을 클릭해주세요!</p>
          </div>
        </div>   
            <div class="row">
                 <c:forEach items="${tList }" var="tvo">
                  <div class="col-md-6 col-lg-3 ftco-animate">
                  <div class="staff">
                  <c:choose>
                        <c:when test = "${fn:contains(tvo.poster, 'zooseyo')}">
                           <a href="../temp/detail.do?no=${tvo.petno }" style="color: black;" ><div class="img" style="background-image: url(${tvo.poster});"></div></a>
                        </c:when>
                        <c:when test = "${fn:contains(tvo.poster, 'myohagae')}">
                          <a href="../temp/detail.do?no=${tvo.petno }" style="color: black;" ><div class="img" style="background-image: url(${tvo.poster});"></div></a>
                        </c:when>
                        <c:otherwise>
                           <a href="../temp/detail.do?no=${tvo.petno }" style="color: black;" ><div class="img" style="background-image: url(../TempPoster/${tvo.poster});"></div></a>
                         </c:otherwise>
                     </c:choose>
                     <div class="text px-4 pt-4">
                        <c:choose>
                           <c:when test="${tvo.cate==5}">
                              <h6><a href="../temp/detail.do?no=${tvo.petno }" style="color: black;" ><b><span style="color: red;">[보호중]</span>${tvo.title }</b></a></h6>
                              <h6><a href="../temp/detail.do?no=${tvo.petno }" style="color: black;">${tvo.loc }</h6>
                           <h6><a href="../temp/detail.do?no=${tvo.petno }" style="color: black;">발견날짜 : <fmt:formatDate pattern="yyyy-MM-dd " value="${tvo.pdate}" /></a></h6>
                           </c:when>
                           <c:when test="${tvo.cate==6}">
                              <h6><a href="../temp/detail.do?no=${tvo.petno }" style="color: black;" ><b><span style="color: blue;">[보호요청]</span>${tvo.title }</b></a></h6>
                              <h6><a href="../temp/detail.do?no=${tvo.petno }" style="color: black;">${tvo.loc }</a></h6>
                           <h6><a href="../temp/detail.do?no=${tvo.petno }" style="color: black;">발견날짜 : <fmt:formatDate pattern="yyyy-MM-dd " value="${tvo.pdate}" /></a></h6>
                           </c:when>
                           <c:otherwise>
                              <h6><a href="../temp/detail.do?no=${tvo.petno }" style="color: black;" ><b><span style="color: green;">[찾았어요]</span>${tvo.title }</b></a></h6>
                              <h6><a href="../temp/detail.do?no=${tvo.petno }" style="color: black;">${tvo.loc }</a></h6>
                                 <h6><a href="../temp/detail.do?no=${tvo.petno }" style="color: black;">발견날짜 : <fmt:formatDate pattern="yyyy-MM-dd " value="${tvo.pdate}" /></a></h6>
                           </c:otherwise>
                        </c:choose>
                      </div>
                     </div>
                  </div>
                  </c:forEach>
               </div>
               </div>
               </section>
<!-- 임시보호 끝 -->
<!-- 동물병원 시작     -->
         <section class="ftco-section11 bg-light11">
       <div class="container">
          <div class="row justify-content-start">
          <div class="col-md-4 heading-section ftco-animate">
             <span class="subheading subheading-with-line"><small class="pr-2 bg-light">댓글이 많이 달린</small></span>
            <h2 class="mb-4">동물병원 리스트</h2>
          </div>
          <div class="col-md-8 pl-md-6 heading-section ftco-animate">
          <div>
          </div>
          </div>
        </div>
       </div>
       <div class="container">
          <div class="row">
             <c:forEach var="crvo" items="${cntlist }">
             <div class="col-md-6 col-lg-3 ftco-animated">
                <div class="project" id="crimage">
                   <img src="${crvo.poster }" width="300px" height="350px" id="crimage" >
                   <div class="text">
                      <h3><a href="../clinic/detail.do?no=${crvo.clno }">${crvo.title }</a></h3>
                   </div>
                </div>
             </div>
             </c:forEach>
       </div>
       </div>
       </section>
 <!-- 동물병원 끝 -->
 <!-- 입양차트 시작 -->
       <section class="ftco-section">
       <div class="container">
         <div class="row">
          <table class="columns">
		      <tr>
		        <td><div id="Sarah_chart_div" style="border: 1px solid #ccc"></div></td>
		        <td><div id="Anthony_chart_div" style="border: 1px solid #ccc"></div></td>
		      </tr>
		  </table>
		</div>
		</div>
       </section>
 <!-- 입양차트 끝 -->       
	</body>
</html>