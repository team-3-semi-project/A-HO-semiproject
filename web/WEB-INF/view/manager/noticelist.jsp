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
                <div id="tablecaption" class="row">
                 <div class="col-2"></div>
                 <h2 class="col-8">공지사항 관리</h2>
                 <div class="col-2"><button class="btn-primary" id="insertnoticebtn" style="width: 150px; height: 40px">공지사항 등록</button></div>
                </div>
                    <thead>
                        <tr>
                            <th scope="col">공지 코드</th>
                            <th scope="col">공지 제목</th>
                            <th scope="col">내용</th>
                            <th scope="col">작성일</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <c:forEach items="${ requestScope.noticeList }" var="notice">
                    		<tr onclick="location.href='${ pageContext.servletContext.contextPath }/manager/noticedetail?code=${ notice.noticeCode }'">
	                            <td style="width: 150px" scope="row">${ notice.noticeCode }</td>
	                            <td style="width: 250px">${ notice.noticeTitle }</td>
	                            <td style="width: 900px">${ notice.noticeContent }</td>
	                            <td>${ notice.noticeDate }</td>
	                            <td>${ notice.noticeCount }</td>
                        	</tr>
                    </c:forEach>
                </table>
                
                <script>
                	const link = "${ pageContext.servletContext.contextPath }/manager/noticelist";
                </script>
                
                <jsp:include page="../common/paging.jsp"/>
    
         <div class="search-area" align="center">
			<form id="loginForm" action="${ pageContext.servletContext.contextPath }/manager/noticelist" method="get" style="display:inline-block">		
			    <input type="hidden" name="currentPage" value="1">
			    <select id="searchCondition" name="searchCondition">
					<option value="title" ${ requestScope.selectCriteria.searchCondition eq "title"? "selected": "" }>제목</option>
					<option value="content" ${ requestScope.selectCriteria.searchCondition eq "content"? "selected": "" }>내용</option>
				</select>
		        <input type="search" id="searchValue" name="searchValue" value="<c:out value="${ requestScope.selectCriteria.searchValue }"/>">

				<button type="submit">검색하기</button>
			</form>
		</div>
    </article>
    
    <script>
    	$("#insertnoticebtn").click(function() {
			location.href="${ pageContext.servletContext.contextPath }/manager/noticeinsert";
		})
    </script>
	
</body>
</html>