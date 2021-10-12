<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css"> 
<title>login</title>
</head>
<body class="text-center"> 
    <div class="form-signin">
        <div id="a">
            <a class="blog-header-logo text-dark" href="${ pageContext.servletContext.contextPath }" id="mainLogo">A-HO</a>
            <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
            <form action="${ pageContext.servletContext.contextPath }/user/login">
            	<div id="rog">
	            	<label for="inputEmail" class="sr-only">Email address</label>
                	<input type="text" id="inputEmail" name="id" class="form-control" placeholder="ID" required autofocus>
                	<label for="inputPassword" class="sr-only">Password</label>
                	<input type="password" id="inputPassword" name="pw" class="form-control" placeholder="Password" required>
                	<button class="sign btn btn-lg btn-primary btn-block" type="submit">로그인</button>
            	</div>
            </form>
           	<a href="../login/findid.jsp" type="button" class="btn btn-lg">아이디 찾기</a>
            <a href="../login/findpwd.jsp" type="button" class="btn btn-lg">비밀번호 찾기</a>
            <a href="${ pageContext.servletContext.contextPath }/user/signup" id="signup" type="button" class="btn btn-lg">회원가입</a>
            
            <p class="mt-5 mb-3 text-muted">© 2021-2030</p>
        </div>
    </div>
</body>
</html>