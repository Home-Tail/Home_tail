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
		 
		 tst
		 
      </div> <!-- .col-md-8 -->

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
</div>
</body>
</html>