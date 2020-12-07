<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		
		$('#new').hover(function(){
			$(this).css("cursor", "pointer")
		}, function(){
			$(this).css("cursor", "")
		});
		
		$('#new').click(function(){
			$.ajax({
				type:'POST',
				url:'../temp/insert.do',
				data:{no:no},
				success:function(res)
				{
					$('#print').html(res);
				}
			});
		});
		$('.detail').click(function(){
			
		    var petno = $(this).attr("data-petno");
		    console.log('petno는'+petno);
			$.ajax({
				type:'POST',
				url:'../temp/detail.do?petno='+petno,
				data:{'petno':petno},
				success:function(res) 
				{
					$('#print').html(res);
				}
			});
		});
		//페이지 넘기는 용도
	
		$('.page').click(function(){
			let page=$(this).attr("page");
			console.log(page);
			$.ajax({
					type:'post',
					url:'../temp/ctemp_list.do',
					data: {page:page,no:no},
					success:function(result)
					{
						$('#print').html(result);
					}
				})
		});
	});
</script> 
</head>
<body>
<section class="ftco-section">
	  			<div class="container">
        		<div class="col-lg-12">
        		<div class="row">
        		<c:if test="${sessionScope.id!=null }">
        			<tr>
		      			 <td>
		        			<a href="../temp/insert.do" class="btn btn-sm btn-primary py-2 px-4" id="new">등록하기</a>
		       			</td>
		    		 </tr>
		    	</c:if>	 
					 <table class="table">
		     			
		  			 </table>
		  			 
			 		<c:forEach var="vo"  items="${list }">
					<div class="col-md-3 ftco-animated">
			   		<div class="blog-entry">
			   		
			   			<c:set var = "po" value = "${vo.poster}"/>
					      <c:choose>
					         <c:when test = "${fn:contains(vo.poster, 'zooseyo')}">
					            <a href="../temp/detail.do?no=${vo.petno }" class="block-20" style="background-image: url('${vo.poster}');"></a>
					         </c:when>
					         <c:when test = "${fn:contains(vo.poster, 'myohagae')}">
					          <a href="../temp/detail.do?no=${vo.petno }" class="block-20" style="background-image: url('${vo.poster}');"></a>
					         </c:when>
					         <c:otherwise>
					          	<a href="../temp/detail.do?no=${vo.petno }" class="block-20" style="background-image: url('../TempPoster/${vo.poster}');"></a>
					          </c:otherwise>
					      </c:choose>
			   		
			   		
			     		
				     	<div class="text d-flex py-4">
				        <div class="desc pl-4XX" style="width: calc(100%);">
			     
			        <c:if test="${vo.cate==5 }">
			         <h5><a href="../temp/detail.do?no=${vo.petno }" ></a></h5>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;" ><b><span style="color:#0000ff;">[보호중]</span>${vo.title }</b></a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">${vo.loc }</a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">발견날짜 : <fmt:formatDate pattern="yyyy-MM-dd " value="${vo.pdate}" /></a></h6>
			         </c:if>
			         
			         <c:if test="${vo.cate==6 }">
			         <h5><a href="../temp/detail.do?no=${vo.petno }" ></a></h5>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;" ><b><span style="color:#FF0000;">[보호요청] </span>${vo.title }</b></a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">${vo.loc }</a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">발견날짜 : <fmt:formatDate pattern="yyyy-MM-dd " value="${vo.pdate}" /></a></h6>
			         </c:if>
			         
			   </div>
			     </div>
			   </div>
			 </div>
			</c:forEach>
			</div>
			</section>
			
			<div class="row no-gutters my-5">
			  <div class="col text-center">
			    <div class="block-27">
			      <ul>
			      	<c:if test="${curpage>BLOCK }">
			        	<li page="${startPage-1 }"><a style="cursor: pointer;">&lt;</a></li>
			        </c:if> 
			        
			        <c:forEach var="i" begin="${startPage }" end="${endPage }">
			         	<c:if test="${i==curpage }">
		                     <li class="active" page="${i }">
		                         <a href="../temp/list.do?page=${i}" style="cursor: pointer;">${i }</a>
		                     </li> 
			            </c:if>
			            <c:if test="${i!=curpage }">
		                     <li page="${i }">
		                         <a href="../temp/list.do?page=${i}" style="cursor: pointer;">${i }</a>
		                     </li>
			        	</c:if>
			         </c:forEach>
			        
			        <c:if test="${endPage<totalpage }">
			        	<li page="${endPage+1 }"><a style="cursor: pointer;">&gt;</a></li>
			        </c:if>
			        
			      </ul>
			    </div>
			  </div>
		</div>
		</div>
   	  </div>
	</div>
</body>
</html>