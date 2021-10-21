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
	<jsp:include page="../manager/managerheader.jsp"></jsp:include>
	
	<article class="tb col-md-9 ml-sm-auto col-lg-10 px-md-4">
			<table class="table table-hover text-center" id="table">
                <h2 class="text-center">호텔 관리</h2>
                    <thead>
                        <tr>
                            <th scope="col">호텔 코드</th>
                            <th scope="col">호텔 명</th>
                            <th scope="col">호텔 등급</th>
                            <th scope="col">연락처</th>
                            <th scope="col">주소</th>
                            <th scope="col">체크인</th>
                            <th scope="col">체크 아웃</th>
                            <th scope="col">운영 여부</th>
                        </tr>
                    </thead>
                    <c:forEach items="${ requestScope.hotelList }" var="hotel">
                    		<tr id="hotellist">
                    			<tr onclick="location.href='${ pageContext.servletContext.contextPath }/manager/hotelupdate?code=${ hotel.hotelCode }'">
	                            <td scope="row" style="width: 100px">${ hotel.hotelCode }</td>
	                            <td>${ hotel.hotelName }</td>
	                            <td>${ hotel.hotelStar }</td>
	                            <td>${ hotel.hotelPhone }</td>
	                            <td>${ hotel.hotelAddress }</td>
	                            <td>${ hotel.checkIn }</td>
	                            <td>${ hotel.checkOut }</td>
	                            <td>${ hotel.hotelOpen }</td>
                        	</tr>
                    </c:forEach>
            </table>
    </article>

</body>
</html>