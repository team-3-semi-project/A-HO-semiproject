<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  <title>A-HO</title>
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
          <div class="card col-sm-9">
            <div class="card-body">
              <h2 class="card-title">포인트 내역</h2><br><br>
              
              <div style="float: right;">보유포인트 : <c:out value="${ requestScope.ahoUser.point }"/> P</div><br><br>
                
                <c:if test="${ !empty requestScope.reserveList }">

                <table class="table">
                    <thead class="thead-dark">
                      <tr align="center">
                        <th scope="col">#</th>
                        <th scope="col">결제 날짜</th>
                        <th scope="col" colspan="2">이용내역</th>
                        <th scope="col">적립포인트</th>
                        <th scope="col">사용포인트</th>
                      </tr>
                    </thead>
                    <tbody>
                    
                    <c:forEach var="pointSelect" items="${ requestScope.reserveList }" varStatus="num">
                    	<c:set var="plusePoint" value="${ Integer.valueOf(pointSelect.price * 0.01) }"/>
                      
                      <tr>
                        <th scope="row">${ num.index + 1 }</th>
                        <td><fmt:formatDate value="${ pointSelect.paymentDate }" type="date" pattern="yyyy-MM-dd (E)"/></td>
                        <td colspan="2"><c:out value="${ pointSelect.hotel.hoName }"/> <c:out value="${ pointSelect.room.roomName }"/></td>
                        <td data-toggle="tooltip" title="포인트 소멸 일자 : <c:out value="${pointSelect.endPointDate }"/>">+ <c:out value="${ pageScope.plusePoint }"/></td>
                        <td><c:out value="- ${ pointSelect.usePoint }"/></td>
                      </tr>
                        
                    </c:forEach>
                    
                    </tbody>
                  </table>
             	</c:if>
             	
             	<c:if test="${ empty requestScope.reserveList }">
             	
             	<p style="text-align: center; font-size: 2.5em">포인트 내역이 없습니다.</p>
             	<br><br>
             	</c:if>
             	
            </div>
          </div>
        </div>
      </div>

      
  </main>





  <!-- --------------------------------------------------------------------------------------------- -->
  
  <jsp:include page="../common/footer.jsp"/>
  
</body>
</html>