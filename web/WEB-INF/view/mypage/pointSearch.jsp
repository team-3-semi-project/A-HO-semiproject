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
  <title>포인트 내역조회</title>
  <style>
      .table tr {
          text-align: center;
      }
  </style>
</head>
<body>
  
  <jsp:include page="../common/header.jsp"/>
  
  <!-- --------------------------------------------------------------------------------------------- -->



  <main class="container-fluid">
     


    <div class="row">
        
        <!-- mypage는 이쪽에 include 해야함 -->
        <jsp:include page="mypage-side.jsp"/>

        <div class="col-sm-9" >
          <div class="card" style="width: 50rem;">
            <div class="card-body">
              <h2 class="card-title">포인트 내역</h2><br><br>
              
              
              <form action="${ pageContext.servletContext.contextPath }/mypage/point" method="post">
              <div style="float: right;">보유포인트</div><br><br>
                <table class="table">
                    <thead class="thead-dark">
                      <tr align="center">
                        <th scope="col">#</th>
                        <th scope="col">날짜</th>
                        <th scope="col" colspan="2">이용내역</th>
                        <th scope="col">적립포인트</th>
                        <th scope="col">사용포인트</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">1</th>
                        <td>2021-10-05</td>
                        <td colspan="2"><input type="text" value="${ sessionScope.loginMember.nickname }" name="writer" readonly></td>
                        <td data-toggle="tooltip" title="2222">+ 100</td>
                        <td>0</td>
                        
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td colspan="2">Thornton</td>
                        <td>@fat</td>
                        <td>@mdo</td>
                      </tr>
                    </tbody>
                  </table>
              </form>
            </div>
          </div>
        </div>
      </div>

      
  </main>





  <!-- --------------------------------------------------------------------------------------------- -->
  
  <jsp:include page="../common/footer.jsp"/>
  
</body>
</html>