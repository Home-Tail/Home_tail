<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

// Colors
$color-primary: #0c8040;
$color-secondary: #626262;
$color-border: #ccd7d7;

// Media Queries breakpoints
$small: 480px;
$medium: 768px;
$large: 992px;
$x-large: 1200px;

@mixin hide-menu-items($index) {
  &:nth-child(n + #{$index + 1}) {
    display: none;
  }

  &:nth-child(#{$index}) .menu__link {
    border-right: 0;
  }
}

.divxx {
  display: flex;
  align-items: center;
  height: 100vh;
  background: #fefefe;
}

a {
  outline: 0;
  text-decoration: none;
}

.navigationXX {
  width: 100%;
  border-bottom: 3px solid $color-border;
  font-family: 'Pathway Gothic One', sans-serif;
  font-size: 22px;
}

.menuXX {
  display: flex;
  justify-content: center;
  max-width: 1150px;
  margin: 0 auto;
  padding-left: 0;
}

.menu__itemXX {
  display: inline-block;
	white-space: nowrap;

  @media screen and (max-width: $small) {
    @include hide-menu-items(2);
  }

  @media screen and (max-width: $medium) {
    @include hide-menu-items(3);
  }

  @media screen and (max-width: $large) {
    @include hide-menu-items(4);
  }

  &:last-child .menu__link {
    border-right: 0;
  }
}

.menu__link {
  display: block;
  padding: 6px 30px 3px;
  border-right: 2px dotted $color-border;

  &:hover,
  &:focus {
    .menu__first-word {
      transform: translate3d(0, -105%, 0);
    }

    .menu__second-word {
      transform: translate3d(0, 105%, 0);
    }
  }

  @media screen and (min-width: $medium) {
    padding: 6px 40px 3px;
  }
}

.menu__titleXX {
  display: inline-block;
  overflow: hidden;
}

.menu__first-wordXX,
.menu__second-wordXX {
  display: inline-block;
  position: relative;
  transition: transform .3s;

  &::before {
    position: absolute;
    content: attr(data-hover);
  }
}

.menu__first-word {
  color: $color-primary;

  &::before {
    top: 105%;
    color: $color-secondary;
  }
}

.menu__second-word {
  color: $color-secondary;

  &::before {
    bottom: 105%;
    color: $color-primary;
  }
}


</style>
</head>
<body>
test
</body>
</html>