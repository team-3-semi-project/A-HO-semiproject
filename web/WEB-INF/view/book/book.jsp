<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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

	<main class="container">
	    <form action="${ pageContext.servletContext.contextPath }/book" method="post">
	        <div class="row">
	            <div class="col-sm-8">
	                <div class="card">
	                    <div class="card-body">
	                        <div class="col-sm-10">
	                            <br>
	                            <div>
	                            	<h4>예약자 정보</h4>
		                            <br>
		                            <div>
		                            	<label for="userId">예약자명</label>  
		                            	<input type="text" class="form-control" id="bookName" name="bookName" value="${ requestScope.bookingUser.userName }" required>
		                            </div>
		                            <br>
		                            <div>
		                            	<label for="userPw">휴대폰 번호</label>  
		                            	<input type="text" class="form-control" id="bookPhone" name="bookPhone" value="${ requestScope.bookingUser.userPhone }" required>
		                            </div>
	                            </div>
	                            <br>
	                            <hr>
	                            <div>
		                            <h4>반려동물 정보</h4>
		                            <br>
      								<label>숙박하는 반려동물 수 : </label>&nbsp;&nbsp;
      								<input type="number" id="petNum" name="petNum" min="1" value="1" style="width: 15%" required>
      								<div id="addInput" class="form-inline form-group">
	      									
	      							</div>
		                            <div class="form-inline form-group" >
      									<li>
		                            		<input type="text" class="form-control" id="petKind" name="petKind" placeholder="예) 강아지" style="width: 40%" required>
	      									<select name="petSize" id="petSize">
				                                <option value="small">소 (small)</option>
				                                <option value="medium">중 (medium)</option>
				                                <option value="large">대 (large)</option>
				                            </select>
				                            <br>
				                            <input type="text" class="form-control" id="petIssue" name="petIssue" placeholder="반려동물 특이사항 입력란 (없을 시 공백)" style="width: 150%">
		                            	</li>
     								</div>
		                            <script>
	                            		$(function() {
	                            			$("#petNum").change(function() {
	                            				document.getElementById("addInput").innerHTML = "";
	                            				var petNum = Number($(this).val());
	                            				
	                            				var step;
	                            				for (step = 1; step < petNum; step++) {
	                            					$('#addInput').append('<li>' +
	         												'<input type="text" class="form-control" id="petKind" name="petKind" placeholder="예) 강아지" style="width: 40%" required>&nbsp;' + 
	          												'<select name="petSize" id="petSize">' + 
	    			                                			'<option value="small">소 (small)</option>' + 
	    			                                			'<option value="medium">중 (medium)</option>' + 
	    			                                			'<option value="large">대 (large)</option>' + 
	    			                            			'</select>' + 
	    			                            			'<br>' + 
	    			                                		'<input type="text" class="form-control" id="petIssue" name="petIssue" placeholder="반려동물 특이사항 입력란 (없을 시 공백)" style="width: 150%">' +
	    			                            			'</li><br><br><br><br>');
	                            				}
	                            				
	                            				var sumPrice = ${ requestScope.sumPrice } + (35000 * (petNum - 1));
	                            				$("#sumPrice").val(sumPrice);
	                            				
	                            				var sumPriceSale = sumPrice - ${ requestScope.priceSale };
     											$("#sumPriceSale").val(sumPriceSale);
     											
     											var totalAmountOfPayment = sumPriceSale - Number($("#usePoint").val());
     											$("#totalAmountOfPayment").val(totalAmountOfPayment);
	                            			})
	                            		});
	                            	</script>
		                            <br>
	                            	<!-- <div>
	                            		<label for="userName">반려동물 특이사항</label>  
	                            		<input type="text" class="form-control" id="userName" name="userName" placeholder="반려동물 특이사항 입력란">
	                            	</div> -->
	                            </div>
	                            <br>
	                            <hr>
	                            <div>
	                            	<h4>결제 금액</h4>
	                            	<br>
	                            	<div>
	                            		<label>합계 금액 : </label>&nbsp;
	                            		<input type="text" id="sumPrice" value="${ requestScope.sumPrice }" style="border:0 solid black; width: 100px; text-align: right" disabled>
	                            		<span>원</span>
	                            	</div>
	                            	<div>
	                            		<label>등급 할인 : </label>&nbsp;
	                            		<input type="text" id="priceSale" value="${ requestScope.priceSale }" style="border:0 solid black; width: 100px; text-align: right" disabled>
	                            		<span>원</span>
	                            	</div>
	                            	<div>
	                            		<label style="font-size: 17px">할인 적용 금액 : </label>&nbsp;
	                            		<input type="text" id="sumPriceSale" value="${ requestScope.sumPrice - requestScope.priceSale }" style="border:0 solid black; width: 100px; text-align: right" disabled>
	                            		<span>원</span>
	                            	</div>
	                            	<br>
	                            	<div>
	                            		<label for="username">포인트 사용 : </label>&nbsp;&nbsp;
		                            	<input type="text" name="usePoint" id="usePoint" value="0" style="width: 17%; text-align: right">&nbsp;
										<span>P&nbsp;&nbsp;&nbsp;(사용 가능한 포인트 : <c:out value="${ requestScope.bookingUser.point }"/></span>
										<span>P)</span>
	                            	</div>
	                            	<script>
	                            		$(function() {
	                            			$("#usePoint").change(function() {
	                            				var usingPoint = $(this).val();
	                            				
	                            				if (usingPoint > ${ requestScope.bookingUser.point }) {
	                            					usingPoint = 0;
	                            					$("#usePoint").val(0);
	                            					alert("보유하신 포인트 이상 사용 불가합니다.");
	                            				}
	                            				
	                            				var totalAmountOfPayment = Number($("#sumPriceSale").val()) - usingPoint;
	                            				$("#totalAmountOfPayment").val(totalAmountOfPayment);
	                            			})
	                            		});
	                            	</script>
	                            </div>
	                            <br>
	                            <hr>
	                            <div>
	                            	<h4>결제 수단 선택</h4>
		                            <br>
		                            <button class="btn btn-outline-secondary">카드</button>
		                            <button class="btn btn-outline-secondary">현금</button>
		                            <button class="btn btn-outline-secondary">카카오페이</button>
	                            </div>
	                            <br>
	                            <br>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-sm-4">
	                <div class="card" style="background-color:rgb(230, 243, 248); border: none; padding: 1px;">
	                    <div class="card-body">
	                        <div>
	                            <h5><strong>호텔명</strong></h5>
	                            <p><c:out value="${ requestScope.bookingHotel.hotelName }"/></p>
	                        </div>
	                        <div>
	                            <h5><strong>객실명</strong></h5>
	                            <p><c:out value="${ requestScope.bookingRoom.roomName }"/></p>
          						<input type="text" id="roomCode" name="roomCode" value="${ requestScope.bookingRoom.roomCode }" hidden="true">
	                        </div>
	                        <div>
	                            <h5><strong>체크 인</strong></h5>
	                            <p><c:out value="${ requestScope.checkIn }"/></p>
          						<input type="text" id="checkIn" name="checkIn" value="${ requestScope.checkIn }" hidden="true">
	                        </div>
	                        <div>
	                            <h5><strong>체크 아웃</strong></h5>
	                            <p><c:out value="${ requestScope.checkOut }"/></p>
          						<input type="text" id="checkOut" name="checkOut" value="${ requestScope.checkOut }" hidden="true">
	                        </div>
	                        <div>
	                            <h5><strong>숙박 인원</strong></h5>
	                            <p><c:out value="${ requestScope.roomPerson }"/>명</p>
          						<input type="text" id="roomPerson" name="roomPerson" value="${ requestScope.roomPerson }" hidden="true">
	                        </div>
	                        <div>
	                            <h5><strong>침대추가 여부</strong></h5>
	                            <p>
	                            <c:if test="${ requestScope.roomOption eq 'Y' }">O</c:if>
	                            <c:if test="${ requestScope.roomOption eq 'N' }">X</c:if>
	                            </p>
          						<input type="text" id="roomOption" name="roomOption" value="${ requestScope.roomOption }" hidden="true">
	                        </div>
	                        <br>
	                        <hr>
	                        <div>
	                            <h4><strong>총 결제 금액</strong></h4>
	                            <input type="text" id="totalAmountOfPayment" name="totalAmountOfPayment" readonly value="${ requestScope.sumPrice - requestScope.priceSale }" style="border:0 solid black; width: 150px; text-align: right; font-size: 2em; background-color:rgb(230, 243, 248); outline-style: none; ">
	                            <span>원</span>
	                        </div>
	                        <br>
	                        <div>
	                            <mark><input type="checkbox" style="zoom: 1.3;">&nbsp;&nbsp;<label for=""><strong>결제약관 동의</strong>&nbsp;&nbsp;</label></mark>
	                            <p><small>해당 가격은 세금, 봉사료, 청소비가 포함된 금액입니다. 결제 완료 후 예약자명으로 체크인이 가능합니다.</small></p>
	                        </div>
	                    </div>
	                    <div class="text-right">
	                        <button type="submit" class="btn btn-primary" style="width: 100%; height: 70px; font-size: 2em;"><strong>결제하기</strong></button>
	                    </div>
	                </div> 
	            </div>
	        </div>
	    </form>
	    <br>
	    <br>
	    <br>
	    <br>
	</main>

	<!-- --------------------------------------------------------------------------------------------- -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
  
</body>
</html>