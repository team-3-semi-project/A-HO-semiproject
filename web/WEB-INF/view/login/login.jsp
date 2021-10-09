<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<style>
    #rog {
        width: 400px;
        margin-left: auto;
        margin-right: auto;
    }
    .sign {
        width: 400px;
        margin-left: auto;
        margin-right: auto;
    }
    #a {
        margin-top: 15em;
    }
</style>
<title>login</title>
</head>
<body class="text-center"> 
    <div class="form-signin">
        <div id="a">
            <img class="mb-4" src="../miniproject/Images/A-HO-icon.png" alt="" width="172" height="72">
            <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
            <form action="${ pageContext.servletContext.contextPath }/user/login">
            	<div id="rog">
	            	<label for="inputEmail" class="sr-only">Email address</label>
                	<input type="text" id="inputEmail" name="id" class="form-control" placeholder="Email address" required autofocus>
                	<label for="inputPassword" class="sr-only">Password</label>
                	<input type="text" id="inputPassword" name="pw" class="form-control" placeholder="Password" required>
                	<button class="sign btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
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