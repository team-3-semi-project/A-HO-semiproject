<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>header</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">
   
  </head>
  
  <body>
    <header class="blog-header py-3">
    <div class="container-fluid" id="header">
        <div class="row flex-nowrap justify-content-between align-items-center">
          <div class="col-4 pt-1">
            <a class="text-muted" href="${ pageContext.servletContext.contextPath }" id="logoleft"><img class="logo rounded mx-auto d-block" src="${ pageContext.servletContext.contextPath }/resources/common-Img/A-HO-icon.png"></a>
          </div>
          
          <div class="col-4 text-center">
            <a class="blog-header-logo text-dark" href="${ pageContext.servletContext.contextPath }" id="mainLogo">A-HO</a>
          </div>
          <div class="col-4 d-flex justify-content-end align-items-center" >
            <a class="text-muted" href="${ pageContext.servletContext.contextPath }/hotelserch" aria-label="Search">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24" focusable="false" ><title>검색</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
            </a>
            <c:if test="${ empty sessionScope.loginUser }">
            	<a class="btn btn-sm btn-outline-secondary" href="${ pageContext.servletContext.contextPath }/user/login">로그인</a> &nbsp;
            	<a class="btn btn-sm btn-outline-secondary" href="${ pageContext.servletContext.contextPath }/user/signup">회원가입</a>
            </c:if>
            <c:if test="${ !empty sessionScope.loginUser }">
            	<a class="btn btn-sm btn-outline-secondary" href="${ pageContext.servletContext.contextPath }/mypage">마이페이지</a>  &nbsp;
            	<a class="btn btn-sm btn-outline-secondary" href="${ pageContext.servletContext.contextPath }/user/logout">로그아웃</a>
            </c:if>
          </div>
        </div>
      </div>
    </header>
    <script>
    	if(${ sessionScope.loginUser.code } == 0) {
    		location.replace("${ pageContext.servletContext.contextPath }/manager/userlist");
    	}
    </script>
  	</body>
</html>

