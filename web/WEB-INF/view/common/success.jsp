<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		(function(){
			const successCode = "${ requestScope.successCode }";
			
			let successMessage = "";
			let movePath = "";
			
			switch(successCode){
				case "" : 
					successMessage = "***에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }";
					break;
				
				case "insertReview" :
					successMessage = "리뷰작성 성공";
					movePath = "${ pageContext.servletContext.contextPath }/mypage/reserve";
					break;
					
				case "insertReport" :
					successMessage = "신고 성공";
					movePath = "${ pageContext.servletContext.contextPath }/hotel/list";
					break;
					
				case "deleteReview" :
					successMessage = "리뷰 삭제 성공";
					movePath = "${ pageContext.servletContext.contextPath }/mypage/myReview";
					break;
					
				case "updateReview" :
					successMessage = "리뷰 수정 성공";
					movePath = "${ pageContext.servletContext.contextPath }/mypage/myReview";
					break;
					
				case "deleteReserve" :
					successMessage = "예약 취소 성공";
					movePath = "${ pageContext.servletContext.contextPath }/mypage/reserve";
					break;
			}

			alert(successMessage);
			
			location.replace(movePath);
		})();
	
	</script>
</body>
</html>
