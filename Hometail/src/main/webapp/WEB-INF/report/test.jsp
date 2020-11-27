<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.navXX {
  position: relative;
  display: flex;
  width: 640px;
  margin: 4em auto;
}
.navXX .aXX {
  display: block;
  width: 20%;
  padding: .75em 0;
  color: #333;
  text-decoration: none;
  text-align: center;
}
.nav-underlineXX {
  position: absolute;
  left: 0;
  bottom: -2px;
  width: 20%;
  height: 2px;
  background: #333;
  transition: all .3s ease-in-out;
}
.navXX .aXX:nth-child(1).is-current ~ .nav-underline {
  left: 0;
}
.navXX .aXX:nth-child(2).is-current ~ .nav-underline {
  left: 20%;
}
.navXX .aXX:nth-child(3).is-current ~ .nav-underline {
  left: 40%;
}
.navXX .aXX:nth-child(4).is-current ~ .nav-underline {
  left: 60%;
}
.navXX .aXX:nth-child(5).is-current ~ .nav-underline {
  left: 80%;
}
.navXX .aXX:nth-child(1):hover ~ .nav-underline {
  left: 0;
}
.navXX .aXX:nth-child(2):hover ~ .nav-underline {
  left: 20%;
}
.navXX .aXX:nth-child(3):hover ~ .nav-underline {
  left: 40%;
}
.navXX .aXX:nth-child(4):hover ~ .nav-underline {
  left: 60%;
}
.navXX .aXX:nth-child(5):hover ~ .nav-underline {
  left: 80%;
}
</style>
</head>
<body>
<div>
<nav clas="navXX">
  <a class="aXX" href="#">Primary</a>
  <a class="aXX" href="#">Secondary</a>
  <a class="aXX" href="#" class="is-current">Tertiary</a>
  <a class="aXX" href="#">Quaternary</a>
  <a class="aXX" href="#">Quinary</a>
  <div class="nav-underlineXX"></div>
</nav>
</div>
</body>
</html>