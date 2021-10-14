<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
		<h2 align="center">호텔 리스트</h2>
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
			
			<tr>
				<td>
					<%-- 호텔 검색 --%>
				<jsp:include page="../common/paging.jsp"/>
		

					    <input type="hidden" name="hotelRegion" value="1">
						<!-- 호텔 지역 선택 -->
					    <select id="searchHotel" name="searchHotel">
							<option value="none" ${ requestScope.selectCriteria.searchCondition eq "region"? "selected": "" }>--</option>
							<option value="kangwon" ${ requestScope.selectCriteria.searchCondition eq "region"? "selected": "" }>강원점</option>
							<option value="busan" ${ requestScope.selectCriteria.searchCondition eq "region"? "selected": "" }>부산점</option>
							<option value="seoul" ${ requestScope.selectCriteria.searchCondition eq "region"? "selected": "" }>서울점</option>
							<option value="incheon" ${ requestScope.selectCriteria.searchCondition eq "region"? "selected": "" }>인천점</option>
							<option value="jeju" ${ requestScope.selectCriteria.searchCondition eq "region"? "selected": "" }>제주점</option>
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
		<br>
		<div width="200" position="absolute" left="50%">
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
			<div width="200">
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div>
          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%"/></svg>
        </div margin-left="50px">
        <div class="col p-4 d-flex flex-column position-static">
          <h3 class="mb-0">A-HO호텔 부산점</h3><br>
          <p class="card-text mb-auto">한 눈에 보이는 해변과 바닷 바람이 일품입니다.</p>
          <button type="submit">찜하기</button>
          <button type="submit">객실정보 보기</button>
        </div>
      </div>
    </div>				
		</div>
			<div width="200">
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div>
          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%"/></svg>
        </div margin-left="50px">
        <div class="col p-4 d-flex flex-column position-static">
          <h3 class="mb-0">A-HO호텔 서울점</h3><br>
          <p class="card-text mb-auto">서울의 모습을 한 눈에 내려다 볼 수 있으며 야경이 일품입니다.</p>
          <button type="submit">찜하기</button>
          <button type="submit">객실정보 보기</button>
        </div>
      </div>
    </div>				
		</div>
			<div width="200">
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div>
          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%"/></svg>
        </div margin-left="50px">
        <div class="col p-4 d-flex flex-column position-static">
          <h3 class="mb-0">A-HO호텔 인천점</h3><br>
          <p class="card-text mb-auto">배들이 드나드는 항구를 볼 수 있고 수산시장이 가까이 있습니다.</p>
          <button type="submit">찜하기</button>
          <button type="submit">객실정보 보기</button>
        </div>
      </div>
    </div>				
		</div>
			<div width="200">
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div>
          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%"/></svg>
        </div margin-left="50px">
        <div class="col p-4 d-flex flex-column position-static">
          <h3 class="mb-0">A-HO호텔 제주점</h3><br>
          <p class="card-text mb-auto">앞쪽엔 해수욕장이, 뒤쪽엔 한라산이 있어서 산해진미를 맛볼 수 있는 제주점입니다.</p>
          <button type="submit">찜하기</button>
          <button type="submit">객실정보 보기</button>
        </div>
      </div>
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