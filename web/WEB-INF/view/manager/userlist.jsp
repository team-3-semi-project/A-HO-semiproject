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
                <div id="tablecaption"><h2>계정관리</h2></div>
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">아이디</th>
                            <th scope="col">이름</th>
                            <th scope="col">생년월일</th>
                            <th scope="col">성별</th>
                            <th scope="col">휴대폰번호</th>
                            <th scope="col">이메일</th>
                            <th scope="col">보유 포인트</th>
                            <th scope="col">가입일자</th>
                        </tr>
                    </thead>
                    <c:forEach items="${ requestScope.userList }" var="user">
                    		<tr onclick="location.href='${ pageContext.servletContext.contextPath }/manager/userdetail?code=${ user.code }'">
	                            <td scope="row">${ user.code }</td>
	                            <td>${ user.id }</td>
	                            <td>${ user.name }</td>
	                            <td>${ user.birth }</td>
	                            <td>${ user.gender }</td>
	                            <td>${ user.phone }</td>
	                            <td>${ user.email }</td>
	                            <td>${ user.point }</td>
	                            <td>${ user.joinDate }</td>
                        	</tr>
                    </c:forEach>
                </table>
                
                <script>
                	const link = "${ pageContext.servletContext.contextPath }/manager/userlist";
                </script>
                
                <jsp:include page="../common/paging.jsp"/>
    
         <div class="search-area" align="center">
			<form id="loginForm" action="${ pageContext.servletContext.contextPath }/manager/userlist" method="get" style="display:inline-block">		
			    <input type="hidden" name="currentPage" value="1">
			    <select id="searchCondition" name="searchCondition">
					<option value="id" ${ requestScope.selectCriteria.searchCondition eq "id"? "selected": "" }>아이디</option>
					<option value="name" ${ requestScope.selectCriteria.searchCondition eq "name"? "selected": "" }>이름</option>
					<option value="email" ${ requestScope.selectCriteria.searchCondition eq "email"? "selected": "" }>이메일</option>
					<option value="phone" ${ requestScope.selectCriteria.searchCondition eq "phone"? "selected": "" }>전화번호</option>
				</select>
		        <input type="search" id="searchValue" name="searchValue" value="<c:out value="${ requestScope.selectCriteria.searchValue }"/>">

				<button type="submit">검색하기</button>
			</form>
		</div>
    </article>
	
</body>
</html>