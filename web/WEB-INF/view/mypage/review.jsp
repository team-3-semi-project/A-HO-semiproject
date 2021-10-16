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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<title>예약내역조회</title>

<style>
  input[type="radio"]+label {
  
  width: 24px;
  height: 24px;
  background: url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain;
}

.ss {
display: none;
}

.reviewB {
  margin-bottom: 20px;
  margin-right: 20px;
  float: right;
}
</style>  
</head>
<body>

  <jsp:include page="../common/header.jsp"/>
  <!-- --------------------------------------------------------------------------------------------- -->



  <main class="container-fluid">
     


    <div class="row">
    
        <jsp:include page="mypage-side.jsp"/>

        <div class="col-sm-9" >
          <div class="card" style="width: 50rem;">
            <div class="card-body">
              <h2 class="card-title">리뷰 작성</h2><br><br>
              <form action="" method="">
                <div style="border: 1px solid black;">
                  <br>
                  <div style="margin-left: 20px; margin-right: 20px;"><h4>호텔</h4></div><br>
                  <div style="margin-left: 20px;">
                    <input type="radio" name="1" id="2" class="ss"><label for="2"></label>
                    <input type="radio" name="1" id="3" class="ss"><label for="3"></label>
                    <input type="radio" name="1" id="4" class="ss"><label for="4"></label>
                    <input type="radio" name="1" id="5" class="ss"><label for="5"></label>
                    <input type="radio" name="1" id="6" class="ss"><label for="6"></label>
                    <p style="float: right; margin-right: 20px;" >예약 날짜</p>
                  </div>
                  <br>
                  <textarea name="111" id="" cols="40" rows="20" style="margin: 20px; width: 95%;"></textarea>
                  <br>
                  <button type="submit" class="reviewB">취소</button> <button type="reset" class="reviewB">확인</button>
                  <br clear="both">
                </div>
               
              </form>
            </div>
          </div>
        </div>
      </div>

      <script>
        $("#2").click(function(){
          $("#2+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#3+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
          $("#4+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
          $("#5+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
          $("#5+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
        });
        $("#3").click(function(){
          $("#2+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#3+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#4+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
          $("#5+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
          $("#6+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
        });
        $("#4").click(function(){
          $("#2+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#3+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#4+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#5+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
          $("#6+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
        });
        $("#5").click(function(){
          $("#2+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#3+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#4+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#5+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#6+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
        });
        $("#6").click(function(){
          $("#2+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#3+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#4+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#5+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#6+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
        });
      </script>
  </main>





  <!-- --------------------------------------------------------------------------------------------- -->
  
  
  <jsp:include page="../common/footer.jsp"/>

  
</body>
</html>