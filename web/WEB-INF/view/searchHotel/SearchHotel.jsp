<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#startDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
    });
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
			
			<tr>
				<td>
					<%-- 호텔 검색 --%>
				<jsp:include page="../common/paging.jsp"/>
		

					    <input type="hidden" name="hotelRegion" value="1">
						<!-- 호텔 지역 선택 -->
					    <select id="searchHotel" name="searchHotel">
							<option value="region" ${ requestScope.selectCriteria.searchCondition eq "region"? "selected": "" }>--</option>
							<option value="region" ${ requestScope.selectCriteria.searchCondition eq "region"? "selected": "" }>강원점</option>
							<option value="region" ${ requestScope.selectCriteria.searchCondition eq "region"? "selected": "" }>부산점</option>
							<option value="region" ${ requestScope.selectCriteria.searchCondition eq "region"? "selected": "" }>서울점</option>
							<option value="region" ${ requestScope.selectCriteria.searchCondition eq "region"? "selected": "" }>인천점</option>
							<option value="region" ${ requestScope.selectCriteria.searchCondition eq "region"? "selected": "" }>제주점</option>
						</select>
				</td>
				<td>
						<!--  호텔 체크인 / 아웃 선택 -->
						<input type="text" id="startDate">
				</td>
				<td>
						<input type="text" id="endDate">
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
						<button type="submit" onclick="location.href='mainPage.jsp'">검색하기</button>
				</td>
		
			</tr>

			</table>

			
				
		</div>
	</div>
	
<jsp:include page="../common/footer.jsp"/>
</body>
</html>