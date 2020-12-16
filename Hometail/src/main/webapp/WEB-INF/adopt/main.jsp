<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let cate=0;
$(function() {
	//시작하자마자 본문에 list.do 내용 출력하는 용도
	$.ajax({
				type:'post',
				url:'../adopt/list.do',
				data: {cate:cate},
				success:function(result)
				{
					console.log("실행");
					$('#tagin').html(result);
				}
		  })
});
</script>
<title>Insert title here</title>
</head>
<body>

</body>
</html>