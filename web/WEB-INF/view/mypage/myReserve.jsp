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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <title>예약내역조회</title>
</head>
<body>
  	<jsp:include page="../common/header.jsp"/>
  <!-- --------------------------------------------------------------------------------------------- -->



  <main class="container-fluid">
    <div class="row">

        <jsp:include page="mypage-side.jsp"/>

        <div class="col-sm-9" >
          <div class="card col-sm-9">
            <div class="card-body">
              <h2 class="card-title">예약 내역</h2><br><br>
              
              <c:if test="${ !empty requestScope.reserveList }">
              <c:forEach var="reserved" items="${ requestScope.reserveList }">
                    <h4 class="card-title">결제일 <fmt:formatDate value="${ reserved.paymentDate }" type="date" pattern="yyyy-MM-dd (E)"/></h4>
                    <div class="card mb-3" style="max-width: 600px;">
                        <div class="row no-gutters">
                          <div class="col-md-4">
                          <c:if test="${ empty reserved.hotelPhoto.file }">
                            <img src="${ pageContext.servletContext.contextPath }/resources/common-Img/A-HO.png" alt="호텔사진없음" width="100%" height="100%">
                          </c:if>
                          <c:if test="${ !empty reserved.hotelPhoto.file }">
                          	<img src="${ pageContext.servletContext.contextPath }${ reserved.hotelPhoto.file }" alt="..." width="100%" height="100%">
                          </c:if>
                          </div>
                          <div class="col-md-8">
                            <div class="card-body">
                              <h4 class="card-title"><c:out value="${ reserved.hotel.hoName }"/></h4>
                              <p class="card-text"><c:out value="${ reserved.room.roomName }"/></p>
                              
                              <c:if test="${ reserved.option eq 'Y' }">
                              <p class="card-text">침대 추가</p>
                              </c:if>
                              <c:if test="${ reserved.option eq 'N' }">
                              <p class="card-text">옵션 없음</p>
                              </c:if>
                              
                              <p class="card-text"><small class="text-muted"><fmt:formatDate value="${ reserved.startDate }" type="date" pattern="yyyy-MM-dd 15시"/> ~ <fmt:formatDate value="${ reserved.endDate }" type="date" pattern="yyyy-MM-dd 11시"/></small>
                              <c:if test="${ reserved.startDate gt requestScope.today}">
                              	
                              	
                              	
                              	
                              	
                              	
                     <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop" style="float: right;">
					  취소
					</button>
					<!-- Modal -->
					<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="staticBackdropLabel">예약 취소 여부</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					       예약을 취소하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary" onclick="reviewCancle(${ reserved.reserveCode})">예</button>
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">아니요</button>
					      </div>
					    </div>
					  </div>
					</div>
                              	
                              </c:if>
                              <c:if test="${ reserved.startDate lt requestScope.today}">
                              	<c:if test="${ empty reserved.review }">
                              	<button style="float: right;" id="review" value="${ reserved.reserveCode }" class="btn btn-secondary">리뷰</button>
                              	</c:if>
                              </c:if>
                            </div>
                          </div>
                        </div>
                      </div>
                      <br>
              </c:forEach>
              </c:if>
              
              <c:if test="${ empty requestScope.reserveList }">
             	 <br><br>
             	 <p style="text-align: center; font-size: 2.5em">예약 내역이 없습니다.</p>
             	 <br><br>
              </c:if>

                      <script>
                      	$("#review").click(function(){
                      		const no = $(this).val();
                      		console.log(no);
                      		location.href = "${ pageContext.servletContext.contextPath }/mypage/review?no=" + no;
                      	});
                      	
                      	function reviewCancle(number) {
                      		var num = number;
                      		
                      		location.href = "${ pageContext.servletContext.contextPath }/reserve/cancle?num=" + num;
                      	}
                      </script>
            </div>
          </div>
        </div>
      </div>
  </main>





  <!-- --------------------------------------------------------------------------------------------- -->
  
  <jsp:include page="../common/footer.jsp"/>
</body>
</html>