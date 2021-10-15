<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../manager/managerheader.jsp"></jsp:include>
	
	<section id="maindiv" class="userdetail col-md-auto ml-sm-auto col-lg-6 px-md-4" style="padding-top: 10px !important;">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a class="nav-link active" id="button1" type="button">기본정보</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="button2" type="button">예약 내역</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="button3" type="button">리뷰 내역(신고)</a>
                </li>
            </ul>
            
            <article id="userDetail">
            	<table class="table table-bordered table-sm">
                <tr>
                    <th>이름</th>
                    <td> ${user.name} </td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td>${user.id} </td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>${user.birth}</td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>${user.gender}</td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td>${user.phone}</td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <th>보유포인트</th>
                    <td>${user.point}</td>
                </tr>
                <tr>
                    <th>예약횟수</th>
                    <td>
                    	${reserveList.size()}
                    </td>
                </tr>
                <tr>
                    <th>등급</th>
                    <td>${user.grade}</td>
                </tr>
                <tr>
                    <th>가입일자</th>
                    <td>${user.joinDate}</td>
                </tr>
                <tr>
                    <th>탈퇴여부</th>
                    <td>${user.outYN}</td>
                </tr>
                <tr>
                    <th>블랙리스트 여부</th>
                    <td>${user.blackListYN}</td>
                </tr>
                <tr>
                    <th>블랙리스트 사유</th>
                    <td>${user.blackListReason}</td>
                </tr>
            </table>
            </article>
            
            <article id="reserveDetail">
            	<table class="table table-bordered table-sm">
	                <tr>
	                    <th>예약코드</th>
	                    <th>객실코드</th>
	                    <th>예약일</th>
	                    <th>결제금액</th>
	                    <th>사용포인트</th>
	                    <th>시작일</th>
	                    <th>종료일</th>
	                    <th>리뷰작성</th>
	                </tr>
	                
	                <c:forEach items="${ reserveList }" var="reserve">
                   		<tr>
                            <td>${ reserve.reserveCode }</td>
                            <td>${ reserve.roomCode }</td>
                            <td>${ reserve.paymentDate }</td>
                            <td>${ reserve.price }</td>
                            <td>${ reserve.usePoint }</td>
                            <td>${ reserve.startDate }</td>
                            <td>${ reserve.endDate }</td>
                            <td>${ reserve.review }</td>
                       	</tr>
                    </c:forEach>
            	</table>
            </article>
            
            <article id="reviwDetail">
            	<table class="table table-bordered table-sm">
	                <tr>
	                    <th>예약 코드</th>
	                    <th style="width: 350px">후기</th>
	                    <th>후기 작성일</th>
	                    <th>별점</th>
	                    <th>신고 횟수</th>
	                    <th>최근 신고 사유</th>
	                </tr>
	                <c:forEach items="${ reportReserveList }" var="review">
                   		<tr>
                            <td>${ review.reserveCode }</td>
                            <td>${ review.review }</td>
                            <td>${ review.reviewDate }</td>
                            <td>${ review.score }</td>
                            <td>${ review.reportCount }</td>
                            <td>${ review.latelyReportReason }</td>
                       	</tr>
                    </c:forEach>
            	</table>
            </article>
            
            <button onclick="blackon();">블랙리스트 등록</button>
            <button onclick="blackoff();">블랙리스트 해제</button>
            
        </section>
        <div id="plusdiv" class="section col-md-auto ml-sm-auto col-lg-4 px-md-4"></div>
        
	<script> 
	$("#button1").click()
	$("#reviwDetail").hide();
	$("#reserveDetail").hide();
	
	$("#button1").click(function() {
		 $("#userDetail").show();
		 $("#reserveDetail").hide();
		 $("#reviwDetail").hide();
		 $("#button1").attr('class','nav-link active');
		 $("#button2").attr('class','nav-link');
		 $("#button3").attr('class','nav-link');
		});
	
	 $("#button2").click(function() {
		 $("#userDetail").hide();
		 $("#reserveDetail").show();
		 $("#reviwDetail").hide();
		 $("#button1").attr('class','nav-link');
		 $("#button2").attr('class','nav-link active');
		 $("#button3").attr('class','nav-link');
		});
	 
	 $("#button3").click(function() {
		 $("#userDetail").hide();
		 $("#reserveDetail").hide();
		 $("#reviwDetail").show();
		 $("#button1").attr('class','nav-link');
		 $("#button2").attr('class','nav-link');
		 $("#button3").attr('class','nav-link active');
		});
	
        function blackoff() {
            var result = confirm("이 회원의 이용 정지(블랙리스트)를 해제 하시겠습니까?");
        }

        function blackon() {
            var result = prompt("블랙리스트 사유 작성");
        }
    </script>
</body>
</html>