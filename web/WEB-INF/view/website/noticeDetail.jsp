<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  <title>A-HO</title>
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
              <div style="text-align: right">
              	<label>조회수 : </label> <c:out value="${ requestScope.notice.noticeCount }"/>
              </div>
              <div>
                <input type="text" class="form-control" id="title" name="title" value="${ requestScope.notice.noticeTitle }" readonly><br>
              </div>
              <div>
                <textarea class="form-control" rows="15px" aria-label="With textarea" readonly>${ requestScope.notice.noticeContent }</textarea><br>
              </div>
            </div>
            <br>
            <div style="text-align: center;">
              <button type="button" class="btn btn-dark btn-lg" onclick="location.href='${ pageContext.servletContext.contextPath }/notice'">목록으로</button>
            </div>
            <br><br>
          </div>
        </div>
      </div>

      
  </main>





  <!-- --------------------------------------------------------------------------------------------- -->
  
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>