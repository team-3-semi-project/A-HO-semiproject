<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=338511ad86aa00eb3c607241f8c5c8e3"></script>
  <style>
    #ddd {
        
        border: 1px solid black;
      }
      .carousel img {
        width: 100%;
        height: 400px;
      }
      
      .nav-link{
        color: black;
      }
      .introduceHotel {
      font-weight: 550; 
      font-size: 1.3em; 
      white-space: pre-line; 
      line-height: 1.3em;
      }
      
      .starimg {
      margin-left: 7px; 
      float: left;
      height: 20px; 
      width: 24px;
      }
      
  </style>
  <title>A-HO</title>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  
  <main class="container-fluid">
  
  <div class="row" style="float: left;">
        <div class="sidebar" style="margin-left: 30px; margin-right: 30px;">
          <br><br>
            <div class="card">
                
                <ul class="list-group list-group-flush">
                  <li class="list-group-item"><a href="${ pageContext.servletContext.contextPath }/hotel/list?no=1">A-HO 서울</a></li>
                  <li class="list-group-item"><a href="${ pageContext.servletContext.contextPath }/hotel/list?no=2">A-HO 부산</a></li>
                  <li class="list-group-item"><a href="${ pageContext.servletContext.contextPath }/hotel/list?no=3">A-HO 인천</a></li>
                  <li class="list-group-item"><a href="${ pageContext.servletContext.contextPath }/hotel/list?no=4">A-HO 제주</a></li>
                  <li class="list-group-item"><a href="${ pageContext.servletContext.contextPath }/hotel/list?no=5">A-HO 강원</a></li>
                </ul>
                
            </div> 
        </div>
      </div>
  <div class="container">
      <div id="ddd">

    <ul class="nav justify-content-center">
      <li class="nav-item mt-auto">
        <a class="nav-link active" href="${ pageContext.servletContext.contextPath }/hotel/list?no=1">호텔목록</a>
      </li>
      <li class="nav-item mt-auto">
        <a class="nav-link" href="#">룸목록</a>
      </li>
      <li class="nav-item mt-auto">
        <a class="nav-link" href="#" style="font-size: 20px"><strong>호텔예약</strong></a>
      </li>
      <li class="nav-item mt-auto">
        <a class="nav-link" href="#">공지사항</a>
      </li>
    </ul>
  </div>
  
  <br>
  <!-- --------------------------------------------------------------------------------------------- -->

      <br>
      <div class="row">
        <div class="col">
          <div class="card">
          
            <div class="card" style="width: 100%;">
            <c:if test="${ !empty requestScope.mainPhoto }">
            	<img src="${ pageContext.servletContext.contextPath }/resources/${ requestScope.mainPhoto.fileName}" class="card-img-top" alt="...">
            	<div class="card-img-overlay">
                <br>
                <h1 style="text-align: center; color: white; font-weight: 800; font-style: italic;"><c:out value="${ requestScope.hotel.hoName }"/></h1>
              </div>
            </c:if>
            
            <c:if test="${ empty requestScope.mainPhoto }">
              <img src="${ pageContext.servletContext.contextPath }/resources/common-Img/v.jpg" class="card-img-top" alt="...">
              <div class="card-img-overlay">
                <br>
                <h1 style="text-align: center; color: white; font-weight: 800; font-style: italic;">대체 이미지입니다.</h1>
              </div>
            </c:if>
              <div class="card-body">
              <div>
                <p style="margin-left: 5px; float: left;" id="cardbody">성 호텔</p><p style="float: right; margin-right: 20px;">고객 평점 : </p>
              </div>
                <br clear="both">
                <div class="col-sm-5" style="height: 400px; float: left;" >

                  <div id="demo" class="carousel slide" data-ride="carousel">
                    <ul class="carousel-indicators">
                      <li data-target="#demo" data-slide-to="0" class="active"></li>
                      
                      <c:forEach var="photoSize" items="${ requestScope.hotel.hoPhoto }">
                      <li data-target="#demo" data-slide-to="${ photoSize.photoCode + 1 }"></li>
                      </c:forEach>
                      
                    </ul>
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="${ requestScope.mainPhoto.file }${ requestScope.mainPhoto.fileName}" alt="" class="rounded">
                      </div>
                      
                      <c:forEach var="photoSize" items="${ requestScope.hotel.hoPhoto }">
                      <div class="carousel-item">
                        <img src="${ photoSize.file }${ photoSize.fileName }" alt="" class="rounded">   
                      </div>
                      </c:forEach>
                      
                    </div>
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                      <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                      <span class="carousel-control-next-icon"></span>
                    </a>
                  </div>   
                </div>
                
                  <h2><c:out value="${ requestScope.hotel.hoName }"/> 소개</h2>
                  <br>
                  <h4 class="introduceHotel"><c:out value="${ requestScope.hotel.introduce }"/></h4>
                
                  <br clear="both">
                  <hr>
                  <br>
                  <br>
                  <div id="map" style="width:500px;height:400px; float: left; margin-left: 20px;"></div>
                  
                  
                  <p style="line-height: 1.5em; white-space: pre-line;">주소: <c:out value="${ requestScope.hotel.hoAddress }"/>
                  전화번호 : <c:out value="${ requestScope.hotel.hoPhone }"/></p>
                  
                  
                  
                  <br clear="both">
                  <hr>
                  <br>
                  <div class="card">
                    <h3 style="margin-left: 20px; margin-top: 10px;">리뷰</h3>
                    
                    <c:forEach var="review" items="${ requestScope.hotelReview }">
                     <c:if test="${ !empty review.review }">
                    <br>
                    <div style="border: 1px solid black; margin-left: 20px; margin-right: 20px; margin-bottom: 20px;" i>
                    <h5 style="float: left; margin-left: 20px; margin-top: 10px;"><c:out value="${ requestScope.hotel.hoName }"/></h5>
                    <h6 style="float: left; margin-left: 10px; margin-top: 10px;"><c:out value=" ${ review.room.roomName } ${ review.ahoUser.name }"/></h6>
                    
                    <c:if test="${ !empty sessionScope.loginUser }">
                    <button type="button" style="float: right; margin-right: 20px; margin-top: 10px;" class="btn btn-secondary" value="${ review.userCode }">신고하기</button>
                    </c:if>
                    <br clear="both">
                    
                    
                    <c:choose>
                    	<c:when test="${ review.score eq 1 }"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"></c:when>
						<c:when test="${ review.score eq 2 }"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"></c:when>
						<c:when test="${ review.score eq 3 }"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"></c:when>
						<c:when test="${ review.score eq 4 }"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"></c:when>
						<c:when test="${ review.score eq 5 }"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"><img alt="" src="${ pageContext.servletContext.contextPath}/resources/common-Img/star-fill.svg" class="starimg"></c:when>
					</c:choose>
                    
                    
                    
                    
                    <div style="clear: both;">
                      <p style="float: right; margin-right: 20px;"><small><fmt:formatDate value="${ review.reviewDate }" type="date" pattern="yyyy-MM-dd"/></small></p>
                     
                      <c:if test="${ !empty review.reviewPhotoList }">
                      	<c:forEach var="reviewPhoto" items="${ review.reviewPhotoList }">
 	                     <img src="${ pageContext.servletContext.contextPath }/resources/upload/review-img/${ reviewPhoto.fileName }" alt="" style="width: 150px; height: 150px; margin-bottom: 20px; margin-left: 20px; float: left;">
                      	
                      	</c:forEach>
                      
                      </c:if>
                      
                      <br clear="both">
                      <div class="card" style="margin-left: 20px; margin-right: 20px; height: 140px; margin-bottom: 30px;">
                        <p style="margin-left: 10px; margin-top: 5px;"><c:out value="${ review.review }"/></p>
                      </div>
                    </div>
                  </div>
                     </c:if>
                    </c:forEach>
                  </div>
                  

                  
              </div>
            </div>
           
          </div>

        </div>
        
      </div>
      <br>
</div>
      
  </main>

 <script>
 	var latitude = ${ requestScope.hotel.latitude};
 	var longitude = ${ requestScope.hotel.longitude};
 	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(latitude, longitude),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);
	
	const score = ${ requestScope.hotel.hoStar};
	var inStar = document.getElementById("cardbody");
	
	window.onload = function(){
		for (var i = 0; i < score ; i++) {
		const img = document.createElement("img");
		img.classList.add("starimg");
		
		inStar.before(img);
		
		img.src = '${ pageContext.servletContext.contextPath}/resources/common-Img/star.svg';
		}		
	};
	
	
 </script>



  <!-- --------------------------------------------------------------------------------------------- -->
  
  <jsp:include page="../common/footer.jsp"/>
  
</body>
</html>