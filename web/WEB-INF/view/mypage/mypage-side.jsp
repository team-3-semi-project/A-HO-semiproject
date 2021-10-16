<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-sm-3">
		<div class="card">
                <div class="card-body">
                  <h1 class="user-name"><c:out value="${ sessionScope.loginUser.name }"/> 님</h1>
                  <a href="${ pageContext.servletContext.contextPath }/mypage/accountSelect"><p class="user-information">내 정보 수정</p></a><br><br><br>
                </div>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item"><a href="${ pageContext.servletContext.contextPath }/mypage/point">포인트</a></li>
                  <li class="list-group-item"><a href="#">찜 목록</a></li>
                  <li class="list-group-item"><a href="${ pageContext.servletContext.contextPath }/mypage/reserve">예약내역</a></li>
                  <li class="list-group-item"><a href="#">나의 후기</a></li>
                  <li class="list-group-item"><a href="#">1:1문의 내역</a></li>
                </ul>
                <div class="card-body">
                </div>
            </div> 
        </div>
</body>
</html>