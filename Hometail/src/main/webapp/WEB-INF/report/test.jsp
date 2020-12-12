<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.toggleWrap1 { position: relative; width: 300px; margin: 0 auto; padding: 0 10px; background: #1F3766; } div.toggleWrap1 > span { font-size: 15px; font-weight: 600; line-height: 2; color: #fff; } input { display: none; }
.toggleWrap1 > div { position: absolute; top: 0; bottom: 0; right: 10px; width: 34px; height: 20px; margin-top: 5px; } label { display: block; width: 36px; height: 20px; box-sizing: border-box; border-radius: 36px; border: 1px solid #e5e5e5; background: #fff; transition: all 0.3s ease; } label > span { position: absolute; top: 3px; left: 3px; display: block; width: 14px; height: 14px; border-radius: 50%; box-sizing: border-box; box-shadow: 0 0 3px 0 rgba(0, 0, 0, 0.25), 0 3px 3px 0 rgba(0, 0, 0, 0.15); transition: all 0.3s cubic-bezier(0.275, -0.45, 0.725, 1.45); background: #fff; }
input:active + div label, input:checked + div label { border: 10px solid #abe2fb; box-shadow: 0 0 5px #abe2fb; } input:active + div label > span, input:checked + div label > span { left: 18px; }

div.toggleWrap2 { position: relative; width: 300px; margin: 0 auto; padding: 0 10px; background: #1F3766; } div.toggleWrap2 > span { font-size: 15px; font-weight: 600; line-height: 2; color: #fff; } input { display: none; }
.toggleWrap2 > div { position: absolute; top: 0; bottom: 0; right: 10px; width: 34px; height: 20px; margin-top: 5px; } label { display: block; width: 36px; height: 20px; box-sizing: border-box; border-radius: 36px; border: 1px solid #e5e5e5; background: #fff; transition: all 0.3s ease; } label > span { position: absolute; top: 3px; left: 3px; display: block; width: 14px; height: 14px; border-radius: 50%; box-sizing: border-box; box-shadow: 0 0 3px 0 rgba(0, 0, 0, 0.25), 0 3px 3px 0 rgba(0, 0, 0, 0.15); transition: all 0.3s cubic-bezier(0.275, -0.45, 0.725, 1.45); background: #fff; }
input:active + div label, input:checked + div label { border: 10px solid #abe2fb; box-shadow: 0 0 5px #abe2fb; } input:active + div label > span, input:checked + div label > span { left: 18px; }

</style>
</head>
<body>
<div class="toggleWrap1">
  <span>알림</span>
  <input type="checkbox" id="toggle_alarm1" name="" value="" />
  <div>
    <label for="toggle_alarm1">
      <span />
    </label>
  </div>
</div>
<div class="toggleWrap2">
  <span>알림</span>
  <input type="checkbox" id="toggle_alarm2" name="" value="" />
  <div>
    <label for="toggle_alarm2">
      <span />
    </label>
  </div>
</div>
</body>
</html>