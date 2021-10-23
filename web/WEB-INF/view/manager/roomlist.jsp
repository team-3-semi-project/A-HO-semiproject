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
	
	<article class="userlisttb col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <table class="table table-hover" id="table">
                <div id="tablecaption"><h2>객실관리</h2></div>
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">호텔명</th>
                            <th scope="col">객실명</th>
                            <th scope="col">가격</th>
                            <th scope="col">방 갯수</th>
                            <th scope="col">정원(최대 인원)</th>
                        </tr>
                    </thead>
                    <c:forEach items="${ requestScope.roomList }" var="room">
                    		<tr onclick="location.href='${ pageContext.servletContext.contextPath }/manager/userdetail?code=${ room.roomCode }'">
	                            <td scope="row">${ room.roomCode }</td>
	                            <td>${ room.hotelCode }</td>
	                            <td>${ room.roomName }</td>
	                            <td>${ room.price }</td>
	                            <td>${ room.count }</td>
	                            <td>${ room.roomPerson }</td>
                        	</tr>
                    </c:forEach>
                </table>
                
                <script>
                	const link = "${ pageContext.servletContext.contextPath }/manager/roomlist";
                </script>
                
                <jsp:include page="../common/paging.jsp"/>
    
         <div class="search-area" align="center">
			<form id="loginForm" action="${ pageContext.servletContext.contextPath }/manager/roomlist" method="get" style="display:inline-block">		
			    <input type="hidden" name="currentPage" value="1">
			    <select id="searchCondition" name="searchCondition">
					<option value="hotelName" ${ requestScope.selectCriteria.searchCondition eq "hotelName"? "selected": "" }>호텔명</option>
					<option value="roomName" ${ requestScope.selectCriteria.searchCondition eq "roomName"? "selected": "" }>객실명</option>
				</select>
		        <input type="search" id="searchValue" name="searchValue" value="<c:out value="${ requestScope.selectCriteria.searchValue }"/>">

				<button type="submit">검색하기</button>
			</form>
		</div>
    </article>
	
</body>
</html>