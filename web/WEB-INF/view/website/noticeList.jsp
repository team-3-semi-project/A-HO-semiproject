<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  <title>A-HO</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>  
<body>

  	<jsp:include page="../common/header.jsp"></jsp:include>
  <!-- --------------------------------------------------------------------------------------------- -->


  <main class="container-fluid">
    <div class="row">
      
      <jsp:include page="website-side.jsp"/>
      
      <div class="col-sm-9">
        <div class="col-sm-1"></div>
        <div class="card col-sm-11">
          <div class="card-body">
            <br>
            <h1 class="card-title">공지 사항</h1><br><br>
            
             <div class="table-area">
                <table class="table" id="listArea">
                  <thead class="thead-light">
                    <tr>
                      <th scope="col">번호</th>
                      <th scope="col">제목</th>
                      <th scope="col" style="text-align: center">작성일</th>
                      <th scope="col" style="text-align: center">조회수</th>
                    </tr>
                  </thead>
                  <tbody>
                    
					<c:forEach items="${ requestScope.noticeList }" var="notice">
						<tr>
							<td><c:out value="${ notice.noticeCode }"/></td>
							<td><c:out value="${ notice.noticeTitle }"/></td>
							<td style="text-align: center"><c:out value="${ notice.noticeDate }"/></td>
							<td style="text-align: center"><c:out value="${ notice.noticeCount }"/></td>
						</tr>
					</c:forEach>					

                  </tbody>
                </table>
                </div>
                
                <%-- 페이지 처리 --%>
				<jsp:include page="noticePaging.jsp"/>
				
                <br><br>
                
                <!-- 검색 폼 -->
				<div class="search-area" align="center">
					<form id="loginForm" action="${ pageContext.servletContext.contextPath }/notice" method="get" style="display:inline-block">		
					    <input type="hidden" name="currentPage" value="1">
					    <select id="searchCondition" name="searchCondition">
							<option value="title" ${ requestScope.selectCriteria.searchCondition eq "title"? "selected": "" }>제목</option>
                  			<option value="content" ${ requestScope.selectCriteria.searchCondition eq "content"? "selected": "" }>내용</option>
						</select>
				        <input type="search" id="searchValue" name="searchValue" value="<c:out value="${ requestScope.selectCriteria.searchValue }"/>">
		
						<button type="submit" class="btn btn-secondary btn-sm">조회하기</button>
					</form>
				</div>
          </div>
        </div>
      </div>
      <script>
		
		if(document.getElementsByTagName("td")) {
			
			const $tds = document.getElementsByTagName("td");
			for(let i = 0; i < $tds.length; i++) {
				
				$tds[i].onmouseenter = function() {
					this.parentNode.style.backgroundColor = "peachpuff";
					this.parentNode.style.cursor = "pointer";
				}
				
				$tds[i].onmouseout = function() {
					this.parentNode.style.backgroundColor = "white";
				}
				
				$tds[i].onclick = function() {
					
					/* 게시물 번호까지 알아왔으니 이제 상세보기는 할 수 있겠죠? */
					const no = this.parentNode.children[0].innerText;
					location.href = "${ pageContext.servletContext.contextPath }/notice/detail?no=" + no;
				}
				
			}
			
		}
		
	</script>

    </div>  
  </main>
  
	<!-- --------------------------------------------------------------------------------------------- -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
  
</body>
</html>