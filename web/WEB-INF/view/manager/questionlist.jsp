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
                <div id="tablecaption"><h2>1:1문의 관리</h2></div>
                    <thead>
                        <tr>
                            <th scope="col">문의코드</th>
                            <th scope="col">회원ID</th>
                            <th scope="col">제목</th>
                            <th scope="col">카테고리</th>
                            <th scope="col">내용</th>
                            <th scope="col">작성일</th>
                            <th scope="col">답변 여부</th>
                        </tr>
                    </thead>
                    <c:forEach items="${ requestScope.questionList }" var="question">
                    		<tr id="row" onclick="managerCheck(${ question.inquiryCode });">
	                            <td scope="row" style="width: 100px">${ question.inquiryCode }</td>
	                            <td style="width: 150px">${ question.userId }</td>
	                            <td style="width: 150px">${ question.inquiryTitle }</td>
	                            <td style="width: 150px">${ question.inquiryCategory }</td>
	                            <td style="width: 500px">${ question.inquiryContent }</td>
	                            <td>${ question.inquiryDate }</td>
	                            <td><c:if test="${ !empty question.inquiryAnswer }">답변 완료</c:if></td>
                        	</tr>
                    </c:forEach>
                </table>
                
                <script>
                	const link = "${ pageContext.servletContext.contextPath }/manager/questionlist";
                </script>
                
                <jsp:include page="../common/paging.jsp"/>
    
         <div class="search-area" align="center">
			<form id="loginForm" action="${ pageContext.servletContext.contextPath }/manager/questionlist" method="get" style="display:inline-block">		
			    <input type="hidden" name="currentPage" value="1">
			    <select id="searchCondition" name="searchCondition">
					<option value="userid" ${ requestScope.selectCriteria.searchCondition eq "userid"? "selected": "" }>작성자 아이디</option>
					<option value="title" ${ requestScope.selectCriteria.searchCondition eq "title"? "selected": "" }>제목</option>
					<option value="category" ${ requestScope.selectCriteria.searchCondition eq "category"? "selected": "" }>카테고리</option>
				</select>
				<input type="search" id="searchValue" name="searchValue" value="<c:out value="${ requestScope.selectCriteria.searchValue }"/>">
		        <input type="hidden" id="noanswer" name="noanswer" value="">
				<button type="submit">검색하기</button>
				<button type="button" id="noanswerbtn">답변 미완료 문의 보기</button>
			</form>
		</div>
    </article>
	
	<script>
	function managerCheck(code) {
		location.href="${ pageContext.servletContext.contextPath }/manager/questiondetail?questioncode="+code;	
	}
	
	$("#noanswerbtn").click(function() {
		$("#noanswer").val("no");
		$("#loginForm").submit();
	})
	
	</script>
</body>
</html>