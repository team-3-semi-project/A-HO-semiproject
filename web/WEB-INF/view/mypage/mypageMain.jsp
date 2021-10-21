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
  <!-- ---------------------------- header --------------------------------- -->

  <main role="main" class="container">
    <br><br>
    <div class="card w-90">
        <div class="card-body">
          <h1><c:out value="${ requestScope.userName }"/> 님</h1>
          <h5>  <c:out value="${ requestScope.vipGrade }"/>등급</h5>
          <div style="text-align: right;">
            <a href="${ pageContext.servletContext.contextPath }/mypage/accountSelect" class="btn btn-outline-primary">내 정보 수정</a>
          </div>
        </div>
    </div>
    <br>
    <div class="card w-90">
        <div class="card-body">
            <div class="card-body">
                <div class="row gutters">
                    
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                            <div class="card" style="width: 30rem;">
                                <div class="card-body">
                                  <p class="card-text"><a href="${ pageContext.servletContext.contextPath }/mypage/point">포인트</a></p>
                                </div>
                              </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                            <div class="card" style="width: 30rem;">
                                <div class="card-body">
                                  <p class="card-text"><a href="">찜 목록</a></p>
                                </div>
                              </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                            <div class="card" style="width: 30rem;">
                                <div class="card-body">
                                  <p class="card-text"><a href="${ pageContext.servletContext.contextPath }/mypage/reserve">예약 내역</a></p>
                                </div>
                              </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                            <div class="card" style="width: 30rem;">
                                <div class="card-body">
                                  <p class="card-text"><a href="">나의 후기</a></p>
                                </div>
                              </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                            <div class="card" style="width: 63rem;">
                                <div class="card-body">
                                  <p class="card-text"><a href="${ pageContext.servletContext.contextPath }/mypage/inquiry">1:1 문의 내역</a></p>
                                </div>
                              </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br><br><br><br><br><br>
  </main>

  <!-- ---------------------------- footer --------------------------------- -->
  <jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>