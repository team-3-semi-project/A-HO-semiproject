<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <jsp:include page="../../common/header.jsp"/>
  <!-- --------------------------------------------------------------------------------------------- -->
  
  <main role="main" class="container">
    <div style="height: 700px; text-align: center;">
        <div style="height: 100px;"></div>
        <h1>정말 탈퇴하시겠습니까?</h1>
        <div style="height: 150px;"></div>
        <a href="${ pageContext.servletContext.contextPath }/mypage/accountSelect"><button type="button" class="btn btn-secondary btn-lg">취소</button></a>&nbsp;&nbsp;&nbsp;
        <a href="${ pageContext.servletContext.contextPath }/mypage/accountDelete"><button type="button" id="deletebtn" class="btn btn-danger btn-lg">탈퇴하기</button></a>
    </div>

  </main>

  <!-- --------------------------------------------------------------------------------------------- -->
  <jsp:include page="../../common/footer.jsp"/>
</body>
</html>