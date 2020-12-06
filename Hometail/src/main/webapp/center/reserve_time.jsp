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
function doOpenCheck(chk){
    var obj = document.getElementsByName("xxx");
    var value = $(chk).attr("value");
    console.log('출력'+value);
    $('#time').val(value);
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
</script>
</head>
<body>
 	 <table class="table" style="margin-top: 150px;">
     <tr>
      <td>
        	<input type="checkbox" name="xxx" value="오전반 [09:30~12:30]" onclick="doOpenCheck(this);">&nbsp;&nbsp;오전반&nbsp;&nbsp;[09:30~12:30]
      </td>
      </tr>
      <tr>
      <td>
          	<input type="checkbox" name="xxx" value="오후반 [13:30~16:30]" onclick="doOpenCheck(this);">&nbsp;&nbsp;오후반&nbsp;&nbsp;[13:30~16:30]
      </td>
      </tr>
      <tr>
      <td>
          	<input type="checkbox" name="xxx" value="종일반 [09:30~16:30]" onclick="doOpenCheck(this);">&nbsp;&nbsp;종일반&nbsp;&nbsp;[09:30~16:30]
      </td>
     </tr>
   </table>
</body>   
</html>