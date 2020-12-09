<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script type="text/javascript">
$(function() {
	$("#pdate").datepicker({
        dateFormat: 'yy-mm-dd' 
        ,showOtherMonths: true 
        ,showMonthAfterYear:true 
        ,changeYear: true 
        ,changeMonth: true            
        ,showOn: "both" 
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" 
        ,buttonImageOnly: true 
        ,buttonText: "선택"                
        ,yearSuffix: "년" 
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] 
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
        ,dayNamesMin: ['일','월','화','수','목','금','토'] 
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] 
        ,minDate: "-1M" 
        ,maxDate: "+1M"                
    });                    
    
    $('#pdate').datepicker('setDate', 'today');  
});
</script>
</head>
<body>
	<div class="latest-products">
      <div style="height: 130px"></div>
        <div class="container">
         <div class="row">
		  <div class="col-md-12">
		    <h3 class="text-center">제보하기</h3>
		    <form method="post" id="report_board" action="../report/insert_ok.do">
		   <table class="table table-hover">
		     <tr>
		       <th class="danger text-right" width=15%>카테고리</th>
			   <td width=85%>
		         <select form="report_board">
		         	<option value="cate0">전체</option>
		         	<option value="cate1">실종</option>
		         	<option value="cate2">목격</option>
		         </select>
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>분류</th>
		       <td width=85%>
		         <select form="report_board" required>
		         	<option value="kind0">모든동물</option>
		         	<option value="kind1">개</option>
		         	<option value="kind2">고양이</option>
		         	<option value="kind3">기타</option>
		         </select>
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>품종</th>
		       <td width=85%>
		         <select form="report_board" required>
		         	<option value="sub_kind0">전체</option>
		         </select>
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>성별</th>
		       <td width=85%>
		         <select form="report_board">
		         	<option value="sex1">미확인</option>
		         	<option value="sex2">수컷</option>
		         	<option value="sex3">암컷</option>
		         </select>
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>나이</th>
		       <td width=85%>
		         <select form="report_board">
		         	<option value="age0">나이 모름</option>
		         	<option value="age1">1살</option>
		         	<option value="age2">2살</option>
		         	<option value="age3">3살</option>
		         </select>
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>몸무게</th>
		       <td width=85%>
		         <input type=text name=weight size=45 class="input-sm">
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>특징</th>
		       <td width=85%>
		         <input type=text name=point size=45 class="input-sm">
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>장소</th>
		       <td width=85%>
		         <select form="report_board">
		         	<option value="loc0">모든 지역</option>
		         </select>
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>실종일</th>
		       <td width=85%>
				 <input type=text name=pdate class="input-sm" id="pdate">
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>전화번호</th>
		       <td width=85%>
		         <input type=text name=tel size=45 class="input-sm">
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>내용</th>
		       <td width=85%>
		         <textarea rows="5" cols="50" name=content></textarea>
		       </td>
		     </tr>
		     <tr>
		       <th class="danger text-right" width=15%>비밀번호</th>
		       <td width=85%>
		         <input type=password name=pwd size=10 class="input-sm">
		       </td>
		     </tr>
		     <tr>
		       <td colspan="2" class="text-center">
		         <input type=submit value=글쓰기 class="btn btn-sm btn-primary">
		         <input type=button value=취소 class="btn btn-sm btn-primary"
		           onclick="javascript:history.back()"
		         >
		       </td>
		     </tr>
		    </table>
		   </form>
		  </div>
		 </div>
		 </div>
		 <div style="height: 130px"></div>
		</div>
</body>
</html>