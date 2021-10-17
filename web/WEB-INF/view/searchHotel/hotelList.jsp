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
   	
  <style>
  	.flex-container{
	  display: -webkit-box;
	  display: -ms-flexbox;
	  display: flex;
	  -webkit-box-align: center;
	      -ms-flex-align: center;
	          align-items: center;
	  -webkit-box-pack: center;
	      -ms-flex-pack: center;
	          justify-content: center;
	}
	
	.width{
		width: 500px;

	}
  </style>
<title>호텔 검색</title>
</head>

<jsp:include page="../common/header.jsp"/>
<body>			

	<div class="outer outer-board-list">
		<br>
		<h2 align="center">호텔 검색</h2>
		<div class="table-area">
			<table align="center" id="listArea">
			<tr>
				<th width="100px">지역</th>
				<th width="100px">체크인</th>
				<th width="100px">체크아웃</th>
				<th width="100px">성인</th>
				<th width="100px">아동</th>
				<th width="100px">상세</th>
			</tr>
			<c:forEach var="hotel" items="${ requestScope.hotelList }">
			<tr>
				<td><c:out value="${ hotel.hotelCode }"/></td>
				<td><c:out value="${ hotel.hotelName }"/></td>
				<td><c:out value="${ hotel.hotelStar }"/></td>
				<td><c:out value="${ hotel.hotelUserAvg }"/></td>
				<td><c:out value="${ hotel.hotelPhone }"/></td>
				<td><c:out value="${ hotel.createdDate }"/></td>
			</tr>
			</c:forEach>			
			<tr>
				<td>
					<%-- 페이징 처리 --%>
				<jsp:include page="../common/paging.jsp"/>
		

					    <input type="hidden" name="hotelRegion" value="1">
						<!-- 호텔 지역 선택 -->
					    <select id="searchHotel" name="searchHotel">
							<option value="none">--</option>
							<option value="kangwon">강원점</option>
							<option value="busan">부산점</option>
							<option value="seoul">서울점</option>
							<option value="incheon">인천점</option>
							<option value="jeju">제주점</option>
						</select>
				</td>
				<td>
						<!--  호텔 체크인 / 아웃 선택 -->
						<input type="text" id="datepicker">
				</td>
				<td>
						<input type="text" id="datepicker2">
				</td>
				<td>	
						<!-- 성인, 아동 인원 선택 -->
						<input type="number" min="0" max="10" />
				</td>
				<td>
						<input type="number" min="0" max="10" />
				</td>
				<td>
						
						<!-- 일반, 특가 선택 -->
						<input type="radio" id="normal" name="room">
		                        <label for="normal">일반</label><br>
		                <input type="radio" id="sale" name="room">
		                        <label for="sale">특가</label>
				</td>
				<td>
						<button type="submit" onclick="getHotel()">검색하기</button>
				</td>
		
			</tr>
			</table>
			<br>
		</div>
	</div>


		<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4" style="width:800px; margin-left:500px;">
			<div>
				<svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%"/></svg>
			</div>
				<div class="col p-4 d-flex flex-column position-static">
				  <h3 class="mb-0">A-HO호텔<c:out value="${ requestScope.hotelName }"/>점</h3><br><br>
				  <a href="${ pageContext.servletContext.contextPath }/mypage/accountSelect" class="btn btn-outline-primary">찜하기</a>
				  <a href="${ pageContext.servletContext.contextPath }/room/room" class="btn btn-outline-primary">객실정보 보기</a>
				 </div>
		</div>
		
		<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4" style="width:800px; margin-left:500px;">
			<div>
				<svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%"/></svg>
			</div>
				<div class="col p-4 d-flex flex-column position-static">
				  <h3 class="mb-0">A-HO호텔<c:out value="${ requestScope.hotelName }"/>점</h3><br><br>
				  <a href="${ pageContext.servletContext.contextPath }/mypage/accountSelect" class="btn btn-outline-primary">찜하기</a>
				  <a href="${ pageContext.servletContext.contextPath }/room/room" class="btn btn-outline-primary">객실정보 보기</a>
				 </div>
		</div>
		
		<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4" style="width:800px; margin-left:500px;">
			<div>
				<svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%"/></svg>
			</div>
				<div class="col p-4 d-flex flex-column position-static">
				  <h3 class="mb-0">A-HO호텔<c:out value="${ requestScope.hotelName }"/>점</h3><br><br>
				  <a href="${ pageContext.servletContext.contextPath }/mypage/accountSelect" class="btn btn-outline-primary">찜하기</a>
				  <a href="${ pageContext.servletContext.contextPath }/room/room" class="btn btn-outline-primary">객실정보 보기</a>
				 </div>
		</div>
		
		<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4" style="width:800px; margin-left:500px;">
			<div>
				<svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%"/></svg>
			</div>
				<div class="col p-4 d-flex flex-column position-static">
				  <h3 class="mb-0">A-HO호텔<c:out value="${ requestScope.hotelName }"/>점</h3><br><br>
				  <a href="${ pageContext.servletContext.contextPath }/mypage/accountSelect" class="btn btn-outline-primary">찜하기</a>
				  <a href="${ pageContext.servletContext.contextPath }/room/room" class="btn btn-outline-primary">객실정보 보기</a>
				 </div>
		</div>
		
		<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4" style="width:800px; margin-left:500px;">
			<div>
				<svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%"/></svg>
			</div>
				<div class="col p-4 d-flex flex-column position-static">
				  <h3 class="mb-0">A-HO호텔<c:out value="${ requestScope.hotelName }"/>점</h3><br><br>
				  <a href="${ pageContext.servletContext.contextPath }/mypage/accountSelect" class="btn btn-outline-primary">찜하기</a>
				  <a href="${ pageContext.servletContext.contextPath }/room/room" class="btn btn-outline-primary">객실정보 보기</a>
				 </div>
		</div>

	
	
		
<script>
function getHotel(){
	$("#searchHotel option:selected").val();
}

</script>
	
<jsp:include page="../common/footer.jsp"/>
</body>
</html>