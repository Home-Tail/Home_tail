<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	 <form name="sendForm" method="get" >
 	 <table class="table" style="margin-top: 150px;">

     <tr>
      <td>
        	<input type="checkbox" name="xxx" value="yyy" checked>&nbsp;&nbsp;오전반&nbsp;&nbsp;[09:30~12:30]
      </td>
      </tr>
      <tr>
      <td>
          	<input type="checkbox" name="xxx" value="yyy" check>&nbsp;&nbsp;오후반&nbsp;&nbsp;[13:30~16:30]
      </td>
      </tr>
      <tr>
      <td>
          	<input type="checkbox" name="xxx" value="yyy" check>&nbsp;&nbsp;종일반&nbsp;&nbsp;[09:30~16:30]
      </td>
     </tr>
   </table>
     </form>
</body>
</html>