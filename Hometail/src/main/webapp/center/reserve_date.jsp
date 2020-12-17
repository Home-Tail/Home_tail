<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
// click(태그 전체)=> img,tr,div...button , change => select , hover(전체태그)
/*
 *   태그가지고 오기 (selector)
 *   $('태그명')
     $('#id')
     $('.class')
     
     => 제어 
        <태그>값</태그> => text()
        <태그 속성="값"> => attr(속성명)
        <input><select> => val()
        
        <태그><태그>값</태그></태그>  => text() => 값
                                 => html() => <태그>값</태그>
                                 ==============================
        <태그>와 </태그>에 데이터,태그를 여러개 첨부 ==> append
        
        = $('a').hide() , show() 
        = contains() => like
        = parent()
          <tr>
           <td>
             <img> click
           </td>
          </tr>
        = child()
 */
$(function(){
	$('.rdays_ok').hover(function(){
		$(this).css("cursor","pointer");
	},function(){
		$(this).css("cursor","");
	})
	$('#year').change(function(){
		let year=$(this).val();
		$.ajax({
			type:'post',
			url:'../center/center_date.do',
			data:{"strYear":year},
			success:function(result)
			{
				$('#reserve_date').html(result);
			}
		})
	});
	$('#month').change(function(){
		let month=$(this).val();
		$.ajax({
			type:'post',
			url:'../center/center_date.do',
			data:{"strMonth":month},
			success:function(result)
			{
				$('#reserve_date').html(result);
			}
		})
	});
	
	// 예약일 클릭시 
	// <span data-year="2020"> => attr("data-year")
	// <span>28</span> => text()
	// <input type=text> <select> ==> val()
	$('.rdays_ok').click(function(){
		let year=$(this).attr("data-year");
		let month=$(this).attr("data-month");
		let day=$(this).text();
		let rday=year+"-"+month+"-"+day.trim();
		console.log('year은?'+year);
		console.log('month은?'+month);
		console.log('day은?'+day.trim());
		console.log('rday은?'+rday.trim());
// 		$('#strYear').val(year);
// 		$('#strMonth').val(month);
// 		$('#strDay').val(day.trim());
// 		$('#movie_reserve').text(rday);
		$('#rday').val(rday);
		$('#reserve_text_rday').text(rday);
		// 시간 출력 
		/*
		    result => text,html,xml,json
		    @Controller , @RestController
		*/
// 		$.ajax({
// 			type:'post',
// 			url:'../reserve/time.do',
// 			data:{"day":day},
// 			success:function(result)
// 			{
// 				$('#time_info').html(result);
// 			}
// 		})
	})
        
});
function ch_color(target,bgcolor){
	console.log('클릭클릭클릭~');
	var tbody = target.parentNode;
	var trs = $('.bg_data');
	for( var i =0; i<trs.length;i++)
	{
		if(trs[i]!=target)
		{
			trs[i].style.backgroundColor='';			
			console.log('찍혀라 제발.');		
		}
		else{
			trs[i].style.backgroundColor= bgcolor;			
		}
	}
}
function doOpenCheck(chk){
    var obj = document.getElementsByName("xxx");
    var value = $(chk).attr("value");
    console.log('출력'+value);
    $('#time').val(value);
    $('#reserve_text_time').text(value);
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
</script>
</head>
<body>
      <h4 class="text-center">${year }년도 ${month }월</h4>
      <table class="table">
        <tr>
          <td colspan=3>
            <select name="year" id="year">
             <c:forEach var="i" begin="2020" end="2030">
               <option ${i==year?"selected":"" }>${i }</option>
             </c:forEach>
            </select>년도&nbsp;
            <select name="month" id="month">
             <c:forEach var="i" begin="1" end="12">
               <option ${i==month?"selected":"" }>${i }</option>
             </c:forEach>
            </select>월
          </td>
          </tr>
          <tr>
           <td>
        	<input type="checkbox" name="xxx" value="오전반 [09:30~12:30]" onclick="doOpenCheck(this);">&nbsp;&nbsp;오전반&nbsp;&nbsp;[09:30~12:30]
    	  </td>
    	  <td>
          	<input type="checkbox" name="xxx" value="오후반 [13:30~16:30]" onclick="doOpenCheck(this);">&nbsp;&nbsp;오후반&nbsp;&nbsp;[13:30~16:30]
    	  </td>
    	   <td>
          	<input type="checkbox" name="xxx" value="종일반 [09:30~16:30]" onclick="doOpenCheck(this);">&nbsp;&nbsp;종일반&nbsp;&nbsp;[09:30~16:30]
     	 </td>
        </tr>
      </table>
      <table class="table-striped" style="width: 700px; border:1px solid #ddd;">
        <tr class="danger" style="height:40px;">
          <c:forEach var="str" items="${strWeek }" varStatus="s">
            <c:choose>
              <c:when test="${s.index==0 }">
                <c:set var="color" value="red"/>
              </c:when>
              <c:when test="${s.index==6 }">
                <c:set var="color" value="blue"/>
              </c:when>
              <c:otherwise>
                <c:set var="color" value="black"/>
              </c:otherwise>
            </c:choose>
            <th class="text-center" bgcolor="#3CA0FF"><font color="${color }">${str }</font></th>
          </c:forEach>
        </tr>
        <c:set var="week" value="${week }"/>
        <c:forEach var="i" begin="1" end="${lastday }">
           <c:choose>
              <c:when test="${week==0 }">
                <c:set var="color" value="red"/>
              </c:when>
              <c:when test="${week==6 }">
                <c:set var="color" value="blue"/>
              </c:when>
              <c:otherwise>
                <c:set var="color" value="black"/>
              </c:otherwise>
            </c:choose>
           <c:if test="${i==1 }">
             <tr style="height:40px; border:1px solid #ddd;">
             <c:forEach var="j" begin="1" end="${week }">
               <td>&nbsp;</td>
             </c:forEach>
           </c:if>
           
           <c:if test="${i==rdays[i] }">
             <c:set var="bg" value="text-center danger"/>
           </c:if>
           <c:if test="${i!=rdays[i]  }">
             <c:set var="bg" value="text-center"/>
           </c:if>
           
           <td class="${bg } bg_data" onClick="ch_color(this,'#50B4FF');" style="border:1px solid #ddd;"><font color="${color }" class="rdays_ok" data-year=${year } data-month=${month }>
            <c:if test="${i==rdays[i] }">
             <span class="rdays_ok"  data-year=${year } data-month=${month }>${i }</span>
            </c:if>
            <c:if test="${i!=rdays[i]  }">
             ${i }
            </c:if>
           </font></td>
           <c:set var="week" value="${week+1 }"/>
           <c:if test="${week>6 }">
             <c:set var="week" value="0"/>
             </tr>
             <tr style="height:40px">
           </c:if>
        </c:forEach>
        </tr>
      </table>
</body>
</html>
