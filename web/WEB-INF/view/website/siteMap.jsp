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

  <jsp:include page="../common/header.jsp"></jsp:include>
  <!-- ---------------------------- header --------------------------------- -->
  
  <main class="container-fluid">
    <div class="row">
    
        <jsp:include page="website-side.jsp"/>
        
        <div class="col-sm-9">
          <div class="col-sm-1"></div>
          <div class="card col-sm-11">
            <div class="card-body">
              <br>
              <h1 class="card-title">사이트 맵</h1><br><br>
              <div class="row">
                <div class="card-body" style="text-align: center;">
                  <h3>회사 정보</h3>
                  <br>
                  <a href="${ pageContext.servletContext.contextPath }/website/company"><p>회사 소개</p></a>
                  <a href="${ pageContext.servletContext.contextPath }/sitemap"><p>사이트 맵</p></a>
                </div>
                <div class="card-body" style="text-align: center;">
                  <h3>호텔 정보</h3>
                  <br>
                  <a href="${ pageContext.servletContext.contextPath }/hotel/list?no=1"><p>호텔 지점 정보</p></a>
                  <a href="${ pageContext.servletContext.contextPath }/roomList"><p>룸 정보</p></a>
                  <a href="${ pageContext.servletContext.contextPath }/hotelserch"><p>호텔 검색</p></a>
                </div>

                <div class="card-body" style="text-align: center;">
                  <h3>고객센터</h3>
                  <br>
                  <a href="${ pageContext.servletContext.contextPath }/termsOfUse"><p>공지 사항</p></a>
                  <a href="${ pageContext.servletContext.contextPath }/website/oftenOQ"><p>자주하는 질문</p></a>
                  <a href="${ pageContext.servletContext.contextPath }/notice"><p>약관 및 정책</p></a>
                </div>
              </div>
            </div>
          	<br><br><br><br><br>
          </div>
        </div>
      </div>
      <br><br><br>
  </main>

  <!-- ---------------------------- footer --------------------------------- -->
  <jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>