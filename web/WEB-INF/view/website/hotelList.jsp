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
      margin-left: 5px; 
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
        <a class="nav-link" href="notice">공지사항</a>
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
                <c:if test="${ requestScope.hotel.hoCode eq 1 }">
                  <h2>A-HO 서울 소개</h2>
                  <br>
                  <h4 class="introduceHotel">복잡한 서울 도심 속의 휴양지 서울은 전통적인 느낌이 물씬한 동시에 미래 지향적인 감각이 가득한 역동적인 도시입니다. 
                  
					A-HO 객실에서 밖을 내다보면, 서울의 역동적인 풍경이 한눈에 펼쳐집니다.
					
					서울 심장부의 우아하고 스타일리시한 매력을 느낄 수 있습니다.
					
					서울 도심 속 반려동물과 함께 편안하고 여유로운 시간을 선사합니다.
                   </h4>
                </c:if>
                <c:if test="${ requestScope.hotel.hoCode eq 2 }">
                  <h2>A-HO 부산 소개</h2>
                  <br>
                  <h4 class="introduceHotel">부산대교, 영도대교, 남항대교 뿐만아니라 부산항대교까지 모두 품은 A-HO 호텔 부산점 

                    어디서든 빠르게 닿을 수 있는 최적의 위치는 물론 부산의 야경을 한 눈에 담을 수 있는 최상의 뷰를 자랑합니다.

                    탁 트인 바다와 항구의 낭만이 있는 도시, 
                    부산에서 반려동물과 함께 소중한 추억이 될 여행을 즐기십시오.
                    </h4>
                </c:if>
                <c:if test="${ requestScope.hotel.hoCode eq 3 }">
                  <h2>A-HO 인천 소개</h2>
                  <br>
                  <h4 class="introduceHotel">A-HO 인천점은 송도 센트럴 파크를 바라보는 호텔로 송도의 중심부 국제무역 단지내에 위치하고 있습니다.
                  
				도심 속 공원인 센트럴 파크와 인천대교의 장관이 한눈에 들어와 A-HO 인천점에서만 경험할 수 있는 색다른 경관을 제공합니다.

                    </h4>
                </c:if>
                <c:if test="${ requestScope.hotel.hoCode eq 4 }">
                  <h2>A-HO 제주 소개</h2>
                  <br>
                  <h4 class="introduceHotel">환상의 섬 제주도에서 반려동물과 함께 낭만의 휴가를 만끽하세요.
                  
					당신의 꿈을 A-HO호텔 제주점이 실현시켜드립니다.
					
					싱그러운 북태평양의 푸르른 바다와 매혹적인 한라산이 우아한 자태를 뽐내는 환상의 섬,
					
					제주도 제주의 수려한 자연 경관과 아름다운 사람들이 한데 어울린 A-HO호텔 제주점에서 
					
					반려동물과 함께 삶의 여유와 넉넉함을 즐기며 추억으로 간직할 소중한 시간을 만드십시오.

                    </h4>
                </c:if>
                <c:if test="${ requestScope.hotel.hoCode eq 5 }">
                  <h2>A-HO 강원 소개</h2>
                  <br>
                  <h4 class="introduceHotel">고루포기산의 능경봉을 등지고 대관령을 바라보는 산자락에 위치한 호텔에서는 모든 객실에서 대관령의 아름다운 풍광을 조망할 수 있으며,

					저희 A-HO 호텔 강원점은 이런 자연속에서 휴식을 즐길 수 있도록 고객우선주의와 정성을 다하는 서비스로 고객 만족을 최우선으로 하는 호텔이 되겠습니다.

				녹음의 향과 청정함의 아름다움 눈을 뜨는 곳마다, 손에 닿을 듯 수려한 경관 하늘과 맞닿은 이곳, A-HO 호텔 강원점입니다.
                    </h4>
                </c:if>
                
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
                    <div style="border: 1px solid black; margin-left: 20px; margin-right: 20px; margin-bottom: 20px;">
                    <h5 style="float: left; margin-left: 20px; margin-top: 10px;"><c:out value="${ requestScope.hotel.hoName }"/></h5>
                    <h6 style="float: left; margin-left: 10px; margin-top: 10px;"><c:out value=" ${ review.room.roomName } ${ review.ahoUser.name }"/></h6>
                    
                    <c:if test="${ !empty sessionScope.loginUser }">
                    <button type="button" style="float: right; margin-right: 20px; margin-top: 10px;" class="btn btn-secondary" value="${ review.userCode }">신고하기</button>
                    </c:if>
                    <br clear="both">
                    <input style="display: none;" value="${ review.score }" id="starPosition" type="checkbox" checked="checked">
                    <img src="img/star-fill.svg" alt="" width="20px" height="20px" style="margin-left: 20px; margin-bottom: 10px;">
                    <div style="clear: both;">
                      <p style="float: right; margin-right: 20px;"><small><fmt:formatDate value="${ review.reviewDate }" type="date" pattern="yyyy-MM-dd"/></small></p>
                     
                      <c:if test="${ !empty review.reviewPhotoList }">
                      	<c:forEach var="reviewPhoto" items="${ review.reviewPhotoList }">
 	                     <img src="${ pageContext.servletContext.contextPath }/resources/upload/review-img/${ reviewPhoto.fileName }" alt="" style="width: 150px; height: 150px; margin-bottom: 20px; margin-left: 20px; float: left;">
                      	
                      	</c:forEach>
                      
                      </c:if>
                      
                      <br clear="both">
                      <div class="card" style="margin-left: 20px; margin-right: 20px; height: 140px; margin-bottom: 30px;">
                        <p style="margin-left: 10px; margin-top: 5px;" onchange="star()"><c:out value="${ review.review }"/></p>
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
 	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
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