<%@page import="com.ahohotel.hotelserch.model.dto.RoomListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
<title>호텔 검색</title>
</head>
<jsp:include page="../common/header.jsp"/>
<body>			

	<div class="outer outer-board-list text-center">
		<br>
		<h2 align="center">호텔 검색</h2>
		<div class="table-area">
		<form class="select-form" id="select-form" action="${ pageContext.servletContext.contextPath }/hotelserch" method="POST">
			<table id="listArea" style="margin-left: auto; margin-right: auto;">
			<tr>
				<th width="100px">지역</th>
				<th width="100px">체크인</th>
				<th width="100px">체크아웃</th>
				<th width="100px">성인</th>
				<th width="100px">아동</th>
			</tr>
						
			<tr>
					<td>
							<!-- 호텔 지역 선택 -->
						    <select id="searchHotel" name="searchHotel">
								<option value="">--</option>
								<c:forEach var="hotel" items="${ requestScope.hotelList }">
								<option value="${ hotel.hotelCode }" ${ requestScope.selectCriteria.hotelCode eq hotel.hotelCode? "selected" : "" }>"${ hotel.hotelName }"</option>
								</c:forEach>			
							</select>
							<input type="hidden" value="" name="hotel" id="hotel">
					</td>
					<td>
							<!--  호텔 체크인 / 아웃 선택 -->
							<input required="required" type="date" name="startdate" id="startdate" value="${ requestScope.selectCriteria.startdate }">
					</td>
					<td>
							<input required="required" type="date" name="enddate" id="enddate" value="${ requestScope.selectCriteria.enddate }">
					</td>
					<td>	
							<!-- 성인, 아동 인원 선택 -->
							<input type="number" id="adult" name="adult" min="0" max="10" value="${ requestScope.selectCriteria.adult }" />
					</td>
					<td>
							<input type="number" id="kids" name="kids" min="0" max="10" value="${ requestScope.selectCriteria.kids }" />
					</td>
					<td>
							<button type="button" id="btn" onchange="getHotel()">검색하기</button>
					</td>
			</tr>
			</table>
			<input type="hidden" value="" name="roomCode" id="roomCode">
			<input type="hidden" value="" name="addBed" id="addBed">
		</form>
		</div>
	</div>
	<c:if test="${ !empty requestScope.noneSelect }">
		<h1 class="text-center" style="margin-top: 40px; margin-bottom: 40px;"> ${ requestScope.noneSelect } </h1>
	</c:if>
	<c:if test="${ !empty requestScope.roomList }">
		<c:set var="badplus" value="10000"></c:set>
		<c:forEach items="${ requestScope.roomList }" var="room" varStatus="st">>
			<div class="row justify-content-md-center" id="roomdetail" style="margin-top: 10px;">
				<div class="col-md-6" >
			      <div class="row no-gutters border rounded flex-md-row mb-4">
			        <div>
			        	<img src="${ pageContext.servletContext.contextPath }${ room.roomPhoto[0].filePath }" width="250px" height="170px">
			        </div>
			        <div class="col p-4 d-flex flex-column" style="z-index:1">
			          <h3 class="mb-0">${ room.roomName }</h3><br>
			          
			          <p class="card-text mb-auto">1박 <fmt:formatNumber value="${ room.price }" pattern="#,###"/>원~</p>
				          <div class="dropdown">
							  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">예약하기</button>
							  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							    <button class="dropdown-item" onclick="basiceserve(${ room.roomCode })" value="${ room.roomCode }" >기본 1박당 <fmt:formatNumber value="${ room.price }" pattern="#,###"/>원</button>
							    <button class="dropdown-item" onclick="addreserve(${ room.roomCode })" value="${ room.roomCode }" >배드 추가 1박당 <fmt:formatNumber value="${ room.price + badplus }" pattern="#,###"/>원</button>
							  </div>
							</div>
			        </div>
			      </div>
			    </div>
	    	</div>
		</c:forEach>
    </c:if>	
	
<script>
	var hotelflag = false;
	var startflag = true;
	var endflag = true;
	var adultflag = true;
	
	if($("#startdate").val() == "") {
		startflag = false;
	}
	
	if($("#enddate").val() == "") {
		endflag = false;
	}
	
	if($("#adult").val() == "") {
		adultflag = false;
	}

	function getToday(){
	    var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	
    	return year + "-" + month + "-" + day;
	}
	
	$("#enddate").change(function() {
		if ($("#enddate").val() <= $("#startdate").val()) {
			alert("시작일 이후 날짜만 예약할 수 있습니다.");
			$("#enddate").val("").focus();
		} else {
			endflag = true;
		}
	})
	
	$("#startdate").change(function() {
		var day = getToday();
		
		if($("#startdate").val() <= day) {
			alert("오늘 이후 날짜만 예약할 수 있습니다.");
			$("#startdate").val("").focus();
		} else {
			startflag = true;
		}
	})
	
	$("#btn").click(function() {
		$("#hotel").val($('#searchHotel').val());
		
		if($("#adult").val() != "") {
			adultflag = true;
		}
		
		if($("#hotel").val() != "") {
			hotelflag = true;
		}
		
		console.log($("#kids").val());
		if($("#kids").val() == "") {
			$("#kids").val("0");
		}
		
		if(!hotelflag) {
			alert("호텔을 선택해 주세요");
		} else if(!startflag) {
			alert("시작일을 입력해 주세요");
		} else if(!endflag) {
			alert("종료일을 입력해 주세요");
		} else if(!adultflag) {
			alert("인원(성인)을 입력해 주세요");
		} else {
			$("#select-form").submit();		
		}
	});
	
	function basiceserve(a) {
		if(${ empty sessionScope.loginUser }) {
			alert("로그인 후 예약 가능합니다.")
			location.href = "${ pageContext.servletContext.contextPath }/user/login";
		} else {
			$("#hotel").val($('#searchHotel').val());
			$("#addBed").val("basic");
			$("#roomCode").val(a);
			
			$("#select-form").attr("action", "${ pageContext.servletContext.contextPath }/book");
			$("#select-form").attr("method", "get");
			$("#select-form").submit();			
		}
	}
	
	
	function addreserve(a) {
		if(${ empty sessionScope.loginUser }) {
			alert("로그인 후 예약 가능합니다.")
			location.href = "${ pageContext.servletContext.contextPath }/user/login";
		} else {
			$("#hotel").val($('#searchHotel').val());
			$("#addBed").val("add");
			$("#roomCode").val(a);
			
		 	$("#select-form").attr("action", "${ pageContext.servletContext.contextPath }/book");
		 	$("#select-form").attr("method", "get");
			$("#select-form").submit();			
		}
	}
	
	
</script>
	
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
