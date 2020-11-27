<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<body>

<!-- list -->
	<section class="ftco-section">
		<div class="container">
			<div class="row">
          <div class="col-lg-8">
           	<div class="row">
          	<table class="table">
             <tr>
              <td>
               <img src="${vo.poster }" width=230 height=200></td>
             </tr>
            </table>
            <table class="table">
              <tr>
                <td width=20%>상태</td>
                <td width=80%>${vo.cate }</td>
              </tr>
              <tr>
                <td width=20%>공고번호</td>
                <td width=80%>${vo.punumber }</td>
              </tr>
              <tr>
                <td width=20%>품종</td>
                <td width=80%>${vo.kind }&nbsp; / ${vo.sub_kind }</td>
              </tr>
              <tr>
                <td width=20%>색상</td>
                <td width=80%>${vo.color }</td>
              </tr>
              <tr>
                <td width=20%>성별</td>
                <td width=80%>${vo.sex }</td>
              </tr>
              <tr>
                <td width=20%>나이/체중</td>
                <td width=80%>${vo.age } 년생&nbsp;${vo.weight }kg</td>
              </tr>
              <tr>
                <td width=20%>접수일지</td>
                <td width=80% ><fmt:formatDate value="${vo.regdate }"/></td>
              </tr>
              <tr>
                <td width=20%>발견장소</td>
                <td width=80%>${vo.area }</td>
              </tr>
              <tr>
                <td width=20%>특징</td>
                <td width=80%>${vo.point }</td>
              </tr>
              <tr>
                <td width=20%>공고기한</td>
                <td width=80%><fmt:formatDate value="${vo.regdate }"/> ~ <fmt:formatDate value="${vo.term }"/></td>
              </tr>
              <tr>
                <td width=20%>보호센터</td> 
                <td width=80%>${vo.center }</td>
              </tr>
              <tr>
                <td width=20%>보호센터 전화번호</td>
                <td width=80%>${vo.tel }</td>
              </tr>
            </table>
            <table class="table">
             <tr>
               <td>
                 <div id="piechart" style="width: 500px; height: 250px;"></div>
               </td>
             </tr>
            </table>	
		    </div>  
          </div>
 <!-- list end -->
          <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box ftco-animate">
            	<h3>관련 뉴스</h3>
              <table class="table">
              <c:forEach var="nvo" items="${list }">
                <tr>
                 <td>
                  <img src="${nvo.poster }" width=35 height=35 class="img-rounded">
                 </td>
                 <td style="font-size:8pt">${nvo.title }</td>
                </tr>
              </c:forEach>
            </table>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Popular Articles</h3>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> Oct. 04, 2018</a></div>
                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> Oct. 04, 2018</a></div>
                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> Oct. 04, 2018</a></div>
                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Tag Cloud</h3>
              <ul class="tagcloud m-0 p-0">
                <a href="#" class="tag-cloud-link">House</a>
                <a href="#" class="tag-cloud-link">Office</a>
                <a href="#" class="tag-cloud-link">Land</a>
                <a href="#" class="tag-cloud-link">Building</a>
                <a href="#" class="tag-cloud-link">Table</a>
                <a href="#" class="tag-cloud-link">Intrior</a>
                <a href="#" class="tag-cloud-link">Exterior</a>
              </ul>
            </div>

            <div class="sidebar-box ftco-animate">
            	<h3>Archives</h3>
              <ul class="categories">
              	<li><a href="#">December 2018 <span>(30)</span></a></li>
              	<li><a href="#">Novemmber 2018 <span>(20)</span></a></li>
                <li><a href="#">September 2018 <span>(6)</span></a></li>
                <li><a href="#">August 2018 <span>(8)</span></a></li>
              </ul>
            </div>
          
			</div>
		</section>
</body>
</html>