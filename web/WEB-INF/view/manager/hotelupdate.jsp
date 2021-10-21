<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	p {
		width: 100px;
	}
	
	#img {
		float: right;	
	}
	
	#main-img {
		width: 400px;
		height: 250px;
		border: solid 1px;
	}
	
	#else-img1, #else-img2, #else-img3 {
		width: 115px;
		height: 70px;
		border: solid 1px;
		float: left;
		margin-top: 10px;
		margin-left: 13px;
	}
	
		#main-img:hover, #contentImg1:hover, 
	#contentImg2:hover, #contentImg3:hover {
	cursor:pointer;
}
	
</style>
</head>
<body>
	<jsp:include page="../manager/managerheader.jsp"></jsp:include>
	
	<section id="maindiv" class="userdetail col-md-auto ml-sm-auto col-lg-7 px-md-4" style="padding-top: 10px !important;">
			<form action="${ pageContext.servletContext.contextPath }/manager/hotelupdate" id="insertform" method="post" encType="multipart/form-data">
				<button style="float: right;">수정 하기</button>
            	<h2 class="text-center">호텔 수정</h2>
            	<hr>
            
            <article id="hotelUpdate">
            	<input hidden="" value="${hotel.hotelPhoto[0].filePath}" id="test12">
            		<div id="img">
            			<h4>대표 이미지</h4>
            			<div id="main-img">
            				<img id="titleImg" width="400" height="250" src="${ pageContext.servletContext.contextPath }${hotel.hotelPhoto[0].filePath}">
            			</div>
            			<div id="else-img1">
            				<img id="contentImg1" width="115" height="70" <c:if test="${ !empty hotel.hotelPhoto[1].filePath}">src="${ pageContext.servletContext.contextPath }${hotel.hotelPhoto[1].filePath}"</c:if>>
            			</div>
            			<div id="else-img2">
            				<img id="contentImg2" width="115" height="70" <c:if test="${ !empty hotel.hotelPhoto[2].filePath}">src="${ pageContext.servletContext.contextPath }${hotel.hotelPhoto[2].filePath}"</c:if>>
            			</div>	
            			
            			<div id="else-img3">
            				<img id="contentImg3" width="115" height="70" <c:if test="${ !empty hotel.hotelPhoto[3].filePath}">src="${ pageContext.servletContext.contextPath }${hotel.hotelPhoto[3].filePath}"</c:if>>
            			</div>
            			<div class="thumbnail-file-area">
							<input required="required" type="file" hidden id="thumbnailImg1" name="titleimg" onchange="loadImg(this,1)">
							<input type="file" hidden id="thumbnailImg2" name="thumbnailImg1" onchange="loadImg(this,2)">
							<input type="file" hidden id="thumbnailImg3" name="thumbnailImg2" onchange="loadImg(this,3)">
							<input type="file" hidden id="thumbnailImg4" name="thumbnailImg3" onchange="loadImg(this,4)">
						</div>
						
							<input hidden id="titleImgCode" name="titleImgCode" value="${ hotel.hotelPhoto[0].photoCode }">
							<input hidden id="subImgCode1" name="subImgCode1" value="${ hotel.hotelPhoto[1].photoCode }">
							<input hidden id="subImgCode2" name="subImgCode2" value="${ hotel.hotelPhoto[2].photoCode }">
							<input hidden id="subImgCode3" name="subImgCode3" value="${ hotel.hotelPhoto[3].photoCode }">
						
						
            		</div>
            		<div id="infoForm" style="margin-left: 20px">
            			<p class="m-0">호텔 코드</p>
	                    <input readonly="readonly" type="text" name="hotelCode" value="${hotel.hotelCode}">
            			<p class="m-0">호텔명</p>
	                    <input type="text" name="hotelName" value="${hotel.hotelName}">
	                    <p class="m-0">호텔 등급</p>
	                    <input name="hotelStar" value="${hotel.hotelStar}">
	                    <p class="m-0">연락처</p>
	                    <input name="hotelPhone" value="${hotel.hotelPhone}">
	                    <p class="m-0">주소</p>
	                    <input name="hotelAddress" value="${hotel.hotelAddress}">
	                    <p class="m-0">운영 여부</p>
	                    <input name="hotelOpen" value="${hotel.hotelOpen}">
	                    <p class="m-0">체크인</p>
	                    <input name="checkIn" value="${hotel.checkIn}">
	                    <p class="m-0">체크아웃</p>
	                    <input name="checkOut" value="${hotel.checkOut}">
	                    <p class="m-0">위도</p>
	                    <input name="latitude" value="${hotel.latitude}">
	                    <p class="m-0">경도</p>
	                    <input name="longitude" value="${hotel.longitude}">
	                    <p class="m-0">호텔 소개</p>
	                    <input name="introduce" value="${hotel.introduce}">
            		</div>
                </form>
            </article>
        </section>
        <button id="test1" >테스트</button>
        <div id="plusdiv" class="section col-md-auto ml-sm-auto col-lg-3 px-md-4"></div>
</body>

<script>
	const $titleImgArea = document.getElementById("main-img");
	const $contentImgArea1 = document.getElementById("else-img1");
	const $contentImgArea2 = document.getElementById("else-img2");
	const $contentImgArea3 = document.getElementById("else-img3");
	
	$titleImgArea.onclick = function() {
		document.getElementById("thumbnailImg1").click(); 
	}
	
	$contentImgArea1.onclick = function() {
		document.getElementById("thumbnailImg2").click();
	}
	
	$contentImgArea2.onclick = function() {
		document.getElementById("thumbnailImg3").click();
	}
	
	$contentImgArea3.onclick = function() {
		document.getElementById("thumbnailImg4").click();
	}
	
	$("#test1").click(function() {
		console.log($("#titleImgCode").val());
	})
	
	/* " 이미지 미리보기 관련 함수(File API 활용하기) */
	function loadImg(value, num) {
		/* https://developer.mozilla.org/ko/docs/Web/API/FileReader 참고 (MDN 사이트 참고)*/
		if (value.files && value.files[0]) {			// value.files[0]는 파일 이름
			const reader = new FileReader();
			/*
				FileReader 객체는 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는 File 혹은 Blob 객체를
				이용해 파일의 내용을(혹은 raw data버퍼로) 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 하는 것	
				Blob(Binary large object) : 파일류의 불변하는 미가공 데이터로 텍스트와 이진 데이터의 형태로 읽을 수 있음
			*/
			// reader.readAsText(value.files[0]);			// 텍스트 파일을 읽을 때 사용 (이미지 파일을 텍스트로 읽어서 글자가 깨짐)			
			// reader.readAsArrayBuffer(value.files[0]);	// 데이터를 일정한 크기로 조금씩(파일을 표현하는 ArrayBuffer) 서버로 보낼 때
			// reader.readAsBinaryString(value.files[0]);	// 이진 데이터를 서버로 보낼 때 사용
			reader.readAsDataURL(value.files[0]);		// Base64방식으로 파일을 FileReader에 전달 (Base64로 인코딩한 것은 브라우저가 원래 데이터로 만들게 됨)
			
			// load 이벤트의 핸들러로 읽기 동작이 성공적으로 완료 되었을 때마다 발생한다.
			reader.onload = function(e) {				// load EventListener에 function 등록 (FileReader에서 전달 받은 파일을 다 읽으면 리스너에 등록한 function이 호출 됨)
				switch(num){
				case 1:
					console.log(e.target.result);		// e.target.result는 인코딩한 결과로 img태그의 src로 사용할 수 있음
					document.getElementById("titleImg").src = e.target.result;
					break;
				case 2:
					document.getElementById("contentImg1").src = e.target.result;
					break;
				case 3:
					document.getElementById("contentImg2").src = e.target.result;
					break;
				case 4:
					document.getElementById("contentImg3").src = e.target.result;
					break;
				}
			}
		}
	}
	
</script>

</html>