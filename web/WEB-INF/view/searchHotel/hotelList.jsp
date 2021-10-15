<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  $( function() {
	    $( "#datepicker2" ).datepicker();
	  } );
  </script>
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
							<option value="none" ${ requestScope.selectCriteria.searchCondition eq "none"? "selected": "" }>--</option>
							<option value="kangwon" ${ requestScope.selectCriteria.searchCondition eq "kangwon"? "selected": "" }>강원점</option>
							<option value="busan" ${ requestScope.selectCriteria.searchCondition eq "busan"? "selected": "" }>부산점</option>
							<option value="seoul" ${ requestScope.selectCriteria.searchCondition eq "seoul"? "selected": "" }>서울점</option>
							<option value="incheon" ${ requestScope.selectCriteria.searchCondition eq "incheon"? "selected": "" }>인천점</option>
							<option value="jeju" ${ requestScope.selectCriteria.searchCondition eq "jeju"? "selected": "" }>제주점</option>
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
		</div>
	</div>

	<div class="outer outer-notice-insert">
		<br>
		<div class="table-area">
			<formmethod="post">
				<div width="200" position="absolute" left="80%">
				    <div class="col-md-6">
				      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4">
				        <div>
				          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%"/></svg>
				        </div>
				        <div class="col p-4 d-flex flex-column position-static">
				          <h3 class="mb-0">A-HO호텔 강원점</h3><br>
				          <p class="card-text mb-auto">산 속의 맑은 공기를 마시며 자연과 함께 즐기는 것이 장점입니다.</p>
				          <button type="submit">찜하기</button>
				          <button type="submit">객실정보 보기</button>
				        </div>
				      </div>
				    </div>				
				</div>
			</form>
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