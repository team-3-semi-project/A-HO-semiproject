<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  $( function() {
	    $( "#datepicker2" ).datepicker();
	  } );
  </script>

<title>호텔 객실</title>
</head>

<jsp:include page="../common/header.jsp"/>

  <body>
   
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <h3 style="text-align: center;">A-HO호텔 <c:out value="${ requestScope.hotelName }"/> 점</h3>
            <div class="row gx-4 gx-lg-5 align-items-center my-5" >
                <div><img src="img/download.jpg" style="display: block; margin-left: 200px; width:700px; height:400px;"/></div>
                <div class="col-lg-5">
                </div>
            </div>
            <hr>
            <br>
            <div>
                <a href="#">객실안내</a>
                <a>|</a>
                <a href="#">숙소정보</a>
                <a>|</a>
                <a href="#">리뷰</a>
            </div>

            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5">
                <div class="col-md-2.5 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">숙박 일자 선택</h5>
                            <input type="date" name="startDate" id="startDate">
                            <input type="date" name="endDate" id="endDate">
                            
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $.datepicker.setDefaults($.datepicker.regional['ko']);
                                    $( "#startDate" ).datepicker({
                                        changeMonth: true, changeYear: true, nextText: '다음 달', prevText: '이전 달',
                                        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                                        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                                        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                                        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                                        dateFormat: "yymmdd", maxDate: 0,
                                        onClose: function( selectedDate ) { 
                                            $("#endDate").datepicker( "option", "minDate", selectedDate ); } });
                                            $( "#endDate" ).datepicker({ changeMonth: true, changeYear: true, nextText: '다음 달', prevText: '이전 달',
                                            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                                            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                                            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                                            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], dateFormat: "yymmdd", maxDate: 0,
                                            onClose: function( selectedDate ) {
                                                $("#startDate").datepicker( "option", "maxDate", selectedDate ); } }); });
                                                </script>
                        </div>
                    </div>
                </div>              
            </div>
            <hr>
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <table border="1">
                    
                <div class="col-lg-7"><img src="img/download.jpg" width="450px" height="300px"/></div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">Standard</h1>
                    <br>
                    <p>가격 : </p><br>
                    <button type=”button”>&nbsp;&nbsp;&nbsp;&nbsp;찜하기&nbsp;&nbsp;&nbsp;&nbsp;</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type=”button” onclick = "location.href = 'reserve.html'">&nbsp;&nbsp;예약하기&nbsp;&nbsp;</button>
                  </div>
            </table>
            
            <table border="1">
              
              <div class="col-lg-7"><img src="img/download.jpg" width="450px" height="300px"/></div>
              <div class="col-lg-5">
                <h1 class="font-weight-light">De luxe</h1>
                <br>
                <p>가격 : </p><br>
                <button type=”button”>&nbsp;&nbsp;&nbsp;&nbsp;찜하기&nbsp;&nbsp;&nbsp;&nbsp;</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type=”button” onclick = "location.href = 'reserve.html'">&nbsp;&nbsp;예약하기&nbsp;&nbsp;</button>
              </div>
            </table>

            <table border="1">
              
              <div class="col-lg-7"><img src="img/download.jpg" width="450px" height="300px"/></div>
              <div class="col-lg-5">
                <h1 class="font-weight-light">Family</h1>
                <br>
                <p>가격 : </p><br>
                <button type=”button”>&nbsp;&nbsp;&nbsp;&nbsp;찜하기&nbsp;&nbsp;&nbsp;&nbsp;</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type=”button” onclick = "location.href = 'reserve.html'">&nbsp;&nbsp;예약하기&nbsp;&nbsp;</button>
              </div>
            </table>

            <table border="1">
              
              <div class="col-lg-7"><img src="img/download.jpg" width="450px" height="300px"/></div>
              <div class="col-lg-5">
                <h1 class="font-weight-light">Sweet</h1>
                <br>
                <p>가격 : </p><br>
                <button type=”button”>&nbsp;&nbsp;&nbsp;&nbsp;찜하기&nbsp;&nbsp;&nbsp;&nbsp;</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type=”button” onclick = "location.href = 'reserve.html'">&nbsp;&nbsp;예약하기&nbsp;&nbsp;</button>
              </div>
            </table>

            <table border="1">
              
              <div class="col-lg-7"><img src="img/download.jpg" width="450px" height="300px"/></div>
              <div class="col-lg-5">
                <h1 class="font-weight-light">VIP</h1>
                <br>
                <p>가격 : </p><br>
                <button type=”button”>&nbsp;&nbsp;&nbsp;&nbsp;찜하기&nbsp;&nbsp;&nbsp;&nbsp;</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type=”button” onclick = "location.href = 'reserve.html'">&nbsp;&nbsp;예약하기&nbsp;&nbsp;</button>
              </div>
            </table>
          </div>

          <div>
            <h1 class="font-weight-light" style="text-align: left;">호텔 시설 소개</h1>
            <img src="${ pageContext.servletContext.contextPath }/resources/common-Img/호텔소개.jpg" style="display: block; margin-left: 50px;"/>
          </div>
          <hr>
          
            <div>
            <h5>오시는 길</h5>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3336.8709933017203!2d126.56625675139865!3d33.24368298073967!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x350c5375044f7471%3A0xd40b6fe15bc738db!2z7IOI66eM67aA7KCV!5e0!3m2!1sko!2skr!4v1633684616176!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>