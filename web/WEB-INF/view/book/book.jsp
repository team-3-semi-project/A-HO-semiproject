<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<style>
		.box-radio-input input[type="radio"]{
		  display:none;
		}
		
		.box-radio-input input[type="radio"] + span{
		  display:inline-block;
		  background:none;
		  border:1px solid #dfdfdf;  
		  padding:0px 10px;
		  text-align:center;
		  height:35px;
		  line-height:33px;
		  font-weight:500;
		  cursor:pointer;
		}
		
		.box-radio-input input[type="radio"]:checked + span{
		  border:1px solid #23a3a7;
		  background:#23a3a7;
		  color:#fff;
		}
	</style>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  <title>A-HO</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head> 
<body>

  	<jsp:include page="../common/header.jsp"></jsp:include>
  	<!-- --------------------------------------------------------------------------------------------- -->

	<main class="container">
	    <form id="pay-form" action="${ pageContext.servletContext.contextPath }/book" method="post">
	        <div class="row">
	            <div class="col-sm-8">
	                <div class="card">
	                    <div class="card-body">
	                        <div class="col-sm-10">
	                            <br>
	                            <div>
	                            	<h4>????????? ??????</h4>
		                            <br>
		                            <div>
		                            	<label for="userId">????????????</label>  
		                            	<input type="text" class="form-control" id="bookName" name="bookName" value="${ requestScope.bookingUser.userName }" required>
		                            </div>
		                            <br>
		                            <div>
		                            	<label for="userPw">????????? ??????</label>  
		                            	<input type="text" class="form-control" id="bookPhone" name="bookPhone" value="${ requestScope.bookingUser.userPhone }" required>
		                            </div>
	                            </div>
	                            <br>
	                            <hr>
	                            <div>
		                            <h4>???????????? ??????</h4>
		                            <br>
      								<label>???????????? ???????????? ??? : </label>&nbsp;&nbsp;
      								<input type="number" id="petNum" name="petNum" min="1" value="1" style="width: 15%" required>
      								<div id="addInput" class="form-inline form-group">
	      									
	      							</div>
		                            <div class="form-inline form-group" >
      									<li>
		                            		<input type="text" class="form-control" id="petKind" name="petKind" placeholder="???) ?????????" style="width: 40%" required>
	      									<select name="petSize" id="petSize">
				                                <option value="small">??? (small)</option>
				                                <option value="medium">??? (medium)</option>
				                                <option value="large">??? (large)</option>
				                            </select>
				                            <br>
				                            <input type="text" class="form-control" id="petIssue" name="petIssue" placeholder="???????????? ???????????? ????????? (?????? ??? ??????)" style="width: 150%">
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
	         												'<input type="text" class="form-control" id="petKind" name="petKind" placeholder="???) ?????????" style="width: 40%" required>&nbsp;' + 
	          												'<select name="petSize" id="petSize">' + 
	    			                                			'<option value="small">??? (small)</option>' + 
	    			                                			'<option value="medium">??? (medium)</option>' + 
	    			                                			'<option value="large">??? (large)</option>' + 
	    			                            			'</select>' + 
	    			                            			'<br>' + 
	    			                                		'<input type="text" class="form-control" id="petIssue" name="petIssue" placeholder="???????????? ???????????? ????????? (?????? ??? ??????)" style="width: 150%">' +
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
	                            </div>
	                            <br>
	                            <hr>
	                            <div>
	                            	<h4>?????? ??????</h4>
	                            	<br>
	                            	<div>
	                            		<label>?????? ?????? : </label>&nbsp;
	                            		<input type="text" id="sumPrice" value="${ requestScope.sumPrice }" style="border:0 solid black; width: 100px; text-align: right" disabled>
	                            		<span>???</span>
	                            	</div>
	                            	<div>
	                            		<label>?????? ?????? : </label>&nbsp;
	                            		<input type="text" id="priceSale" value="${ requestScope.priceSale }" style="border:0 solid black; width: 100px; text-align: right" disabled>
	                            		<span>???</span>
	                            	</div>
	                            	<div>
	                            		<label style="font-size: 17px">?????? ?????? ?????? : </label>&nbsp;
	                            		<input type="text" id="sumPriceSale" value="${ requestScope.sumPrice - requestScope.priceSale }" style="border:0 solid black; width: 100px; text-align: right" disabled>
	                            		<span>???</span>
	                            	</div>
	                            	<br>
	                            	<div>
	                            		<label for="username">????????? ?????? : </label>&nbsp;&nbsp;
		                            	<input type="text" name="usePoint" id="usePoint" value="0" style="width: 17%; text-align: right">&nbsp;
										<span>P&nbsp;&nbsp;&nbsp;(?????? ????????? ????????? : <c:out value="${ requestScope.bookingUser.point }"/></span>
										<span>P)</span>
	                            	</div>
	                            	<script>
	                            		$(function() {
	                            			$("#usePoint").change(function() {
	                            				var usingPoint = $(this).val();
	                            				
	                            				if (usingPoint > ${ requestScope.bookingUser.point }) {
	                            					usingPoint = 0;
	                            					$("#usePoint").val(0);
	                            					alert("???????????? ????????? ?????? ?????? ???????????????.");
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
	                            	<h4>?????? ?????? ??????</h4>
		                            <br>
									<label class="box-radio-input"><input type="radio" name="pgMethod" value="kakaopay" checked><span>???????????????</span></label>
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
	                            <h5><strong>?????????</strong></h5>
	                            <p><c:out value="${ requestScope.bookingHotel.hotelName }"/></p>
	                        </div>
	                        <div>
	                            <h5><strong>?????????</strong></h5>
	                            <p><c:out value="${ requestScope.bookingRoom.roomName }"/></p>
          						<input type="text" id="roomCode" name="roomCode" value="${ requestScope.bookingRoom.roomCode }" hidden="true">
	                        </div>
	                        <div>
	                            <h5><strong>?????? ???</strong></h5>
	                            <p><c:out value="${ requestScope.checkIn }"/></p>
          						<input type="text" id="checkIn" name="checkIn" value="${ requestScope.checkIn }" hidden="true">
	                        </div>
	                        <div>
	                            <h5><strong>?????? ??????</strong></h5>
	                            <p><c:out value="${ requestScope.checkOut }"/></p>
          						<input type="text" id="checkOut" name="checkOut" value="${ requestScope.checkOut }" hidden="true">
	                        </div>
	                        <div>
	                            <h5><strong>?????? ??????</strong></h5>
	                            <p><c:out value="${ requestScope.roomPerson }"/>???</p>
          						<input type="text" id="roomPerson" name="roomPerson" value="${ requestScope.roomPerson }" hidden="true">
	                        </div>
	                        <div>
	                            <h5><strong>???????????? ??????</strong></h5>
	                            <p>
	                            <c:if test="${ requestScope.roomOption eq 'Y' }">O</c:if>
	                            <c:if test="${ requestScope.roomOption eq 'N' }">X</c:if>
	                            </p>
          						<input type="text" id="roomOption" name="roomOption" value="${ requestScope.roomOption }" hidden="true">
	                        </div>
	                        <br>
	                        <hr>
	                        <div>
	                            <h4><strong>??? ?????? ??????</strong></h4>
	                            <input type="text" id="totalAmountOfPayment" name="totalAmountOfPayment" readonly value="${ requestScope.sumPrice - requestScope.priceSale }" style="border:0 solid black; width: 150px; text-align: right; font-size: 2em; background-color:rgb(230, 243, 248); outline-style: none; ">
	                            <span>???</span>
	                        </div>
	                        <br>
	                        <div>
	                            <!-- <mark><input type="checkbox" style="zoom: 1.3;">&nbsp;&nbsp;<label for=""><strong>???????????? ??????</strong>&nbsp;&nbsp;</label></mark> -->
	                            <p><small><mark>?????? ????????? ??????, ?????????, ???????????? ????????? ???????????????. ?????? ?????? ??? ?????????????????? ???????????? ???????????????.</mark></small></p>
	                        </div>
	                    </div>
	                    <div class="text-right">
	                        <button type="button" class="btn btn-primary" id="finish" style="width: 100%; height: 70px; font-size: 2em;"><strong>????????????</strong></button>
	                    </div>
	                </div> 
	            </div>
	        </div>
	    </form>
	    <br>
	    <br>
	    <br>
	    <br>
	    <script>
		    $("#finish").click(function() {
		    	var IMP = window.IMP; // ????????????
		    	IMP.init('imp74195802'); // 'iamport' ?????? ???????????? "????????? ????????????"??? ??????
		    	var msg;
		        
		    	IMP.request_pay({
		    		pg : 'kakaopay',
		        	pay_method : 'card',
		            merchant_uid : 'merchant_' + new Date().getTime(),
		            name : 'AHO?????? ?????? ??????',
		            amount : 100,
		            buyer_email : '971215wldnjs@naver.com',
		            buyer_name : '?????????',
		            buyer_tel : '01096542201',
		            buyer_addr : '????????????',
		            buyer_postcode : '123-456',
		            //m_redirect_url : 'http://www.naver.com'
		        }, function(rsp) {
		            if ( rsp.success ) {
		                //[1] ??????????????? ???????????? ????????? ?????? jQuery ajax??? imp_uid ????????????
		                jQuery.ajax({
		                    url: "/payments/complete", //cross-domain error??? ???????????? ????????? ??????????????????
		                    type: 'POST',
		                    dataType: 'json',
		                    data: {
		                        imp_uid : rsp.imp_uid
		                        //?????? ????????? ???????????? ????????? ?????? ??????
		                    }
		                }).done(function(data) {
		                    //[2] ???????????? REST API??? ?????????????????? ??? ?????????????????? ???????????? ??????
		                    if ( everythings_fine ) {
		                        msg = '????????? ?????????????????????.';
		                        msg += '\n??????ID : ' + rsp.imp_uid;
		                        msg += '\n?????? ??????ID : ' + rsp.merchant_uid;
		                        msg += '\?????? ?????? : ' + rsp.paid_amount;
		                        msg += '?????? ???????????? : ' + rsp.apply_num;
		                        
		                        alert(msg);
		                    } else {
		                        //[3] ?????? ????????? ????????? ?????? ???????????????.
		                        //[4] ????????? ????????? ????????? ????????? ?????? ????????? ?????????????????????????????????.
		                    }
		                });
		                //????????? ????????? ?????????
		                document.getElementById("pay-form").submit();
		            } else {
		                msg = '????????? ?????????????????????.';
		                msg += '???????????? : ' + rsp.error_msg;
		                //????????? ????????? ?????????
		                location.href="<%=request.getContextPath()%>";
		                alert(msg);
		            }
				});
		    });
    	</script>
	</main>

	<!-- --------------------------------------------------------------------------------------------- -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
  
</body>
</html>