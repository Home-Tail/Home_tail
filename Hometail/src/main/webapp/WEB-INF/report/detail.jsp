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
      })
</script>
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
               <td><img src="${vo.poster }" width=210 height=200></td>
              </td>
             </tr>
            </table>
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
              <%--
                <td width=20%>성별</td>
                <c:choose>
                 <c:when test="${vo.sex eq 0 }">
               	  <td width=80%>미확인</td>
              	 </c:when>
             	 <c:when test="${vo.sex eq 1 }">
               	  <td width=80%>수컷</td>
              	 </c:when>
              	 <c:when test="${vo.sex eq 2 }">
               	  <td width=80%>암컷</td>
              	 </c:when>
                </c:choose>
               --%>
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
                <td width=20%>전화번호</td>
                <td width=80%>${vo.tel }</td>
              </tr>
              <tr>
                <td width=20%>내용</td>
                <td width=80%>${vo.content }</td>
              </tr>
            </table>
            <hr>
			<div style="height:100px"></div>	
					
			<!-- 댓글 입력창 -->
<!-- 			<div style="height:100px"></div> -->
			<h3>댓글</h3>
            <table class="table">
              <tr>
               <td>
               	 <c:if test="${sessionScope.id==null }">
	                 <textarea rows="2" cols="70" name="content" style="float: left" placeholder="로그인 후 입력해주세요"></textarea>
                 </c:if>
               	 <c:if test="${sessionScope.id!=null }">
                 <form method="post" action="../report/reply_insert.do">
	                 <input type="hidden" name="petno" value="${vo.petno }">
	                 <textarea rows="2" cols="70" name="content" style="float: left"></textarea>
	                  <input type=submit value="댓글쓰기" class="btn btn-sm btn-primary" style="width:100px; height: 67px; margin-left:5px; font: 16px Raleway;" >
                  </form>
                  </c:if>
               </td>
              </tr>
            </table>
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
                       <span value="${rvo.replyno }" class="btn btn-xs btn-success up">수정</span>
                       <a href="../report/reply_delete.do?rno=${rvo.replyno }&pno=${vo.petno}" class="btn btn-xs btn-info">삭제</a>
                      </c:if>
                     </td>
                    </tr>
                    <tr>
                      <td colspan="2">
                       <pre style="white-space: pre-wrap;border:none;background-color: white">${rvo.content }</pre>
                      </td>
                    </tr>
                    <tr class="updates" id="u${rvo.replyno }" style="display:none">
		               <td colspan="2">
		                 <form method="post" action="../report/reply_update.do">
			                 <input type="hidden" name="pno" value="${vo.petno }">
			                 <input type="hidden" name="rno" value="${rvo.replyno }">
			                 <textarea rows="3" cols="60" name="content" style="float: left">${rvo.content }</textarea>
			                 <input type=submit value="댓글수정" class="btn btn-sm btn-primary"
			                  style="float: left;height: 73px">
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
      </div>
      <div class="col-md-12" style="height:100px"></div>
      <div class="col-md-12"><hr></div>
      <div class="col-md-12" style="text-align: right ">
      	<tr>
		  <td colspan="2" class="text-center">
		   <input type=button value=목록 class="btn btn-sm btn-primary" style="height: 35px; width: 80px; font: 15px Raleway;" onclick="javascript:history.back()">
		   <c:if test="${sessionScope.id==vo.id }">
		   	<a href="../report/update.do?no=${vo.petno }" class="btn btn-sm btn-success" style="height: 35px; width: 80px; font: 15px Raleway;">수정</a>
		   	<a href="../report/delete.do?no=${vo.petno }" class="btn btn-sm btn-danger" style="height: 35px; width: 80px; font: 15px Raleway;">삭제</a>
		   </c:if>
		  </td>
		</tr>
      </div>
     </div>
   </div>
   <div style="height:150px"></div>
  </div>
  
</body>
</html>