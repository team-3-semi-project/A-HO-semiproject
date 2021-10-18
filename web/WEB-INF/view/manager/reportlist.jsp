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
                <div id="tablecaption"><h2>신고관리</h2></div>
                    <thead>
                        <tr>
                            <th scope="col">신고코드</th>
                            <th scope="col">예약코드(리뷰)</th>
                            <th scope="col">리뷰 작성자 ID</th>
                            <th scope="col">리뷰 신고자 ID</th>
                            <th scope="col" class="review">리뷰 내용</th>
                            <th scope="col">신고 사유</th>
                            <th scope="col">관리자 확인</th>
                        </tr>
                    </thead>
                    <c:forEach items="${ requestScope.reportList }" var="report">
                    		<tr id="test" 
                    		<c:if test="${ empty report.reportCheck }">
                    		onclick="managerCheck(${ report.reportCode });"
                    		</c:if>
                    		>
	                            <td scope="row" style="width: 100px">${ report.reportCode }</td>
	                            <td style="width: 150px">${ report.reserveCode }</td>
	                            <td style="width: 150px">${ report.reviewerId }</td>
	                            <td style="width: 150px">${ report.repoterId }</td>
	                            <td style="width: 500px">${ report.review }</td>
	                            <td>${ report.reportReason }</td>
	                            <td>${ report.reportCheck }</td>
                        	</tr>
                    </c:forEach>
                </table>
                
                <script>
                	const link = "${ pageContext.servletContext.contextPath }/manager/reportlist";
                </script>
                
                <jsp:include page="../common/paging.jsp"/>
    
         <div class="search-area" align="center">
			<form id="loginForm" action="${ pageContext.servletContext.contextPath }/manager/reportlist" method="get" style="display:inline-block">		
			    <input type="hidden" name="currentPage" value="1">
			    <select id="searchCondition" name="searchCondition">
					<option value="reviewerid" ${ requestScope.selectCriteria.searchCondition eq "reviewerid"? "selected": "" }>작성자 아이디</option>
					<option value="reporterid" ${ requestScope.selectCriteria.searchCondition eq "reporterid"? "selected": "" }>신고자 아이디</option>
					<option value="reason" ${ requestScope.selectCriteria.searchCondition eq "reason"? "selected": "" }>신고 사유</option>
					<option value="reservecode" ${ requestScope.selectCriteria.searchCondition eq "reservecode"? "selected": "" }>예약코드</option>
				</select>
		        <input type="search" id="searchValue" name="searchValue" value="<c:out value="${ requestScope.selectCriteria.searchValue }"/>">

				<button type="submit">검색하기</button>
			</form>
		</div>
    </article>
	
	<script>
	function managerCheck(code) {
		var result = prompt("리뷰신고에 대한 관리자 확인 사항 기재");
		if(result != null) {
			location.href="${ pageContext.servletContext.contextPath }/manager/reportcheck?reportcheck="+result+"&reportcode="+code;	
		}
	}
	
	</script>
</body>
</html>