<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/website.css">
  
  <title>회사소개</title>
</head>  

	<jsp:include page="../common/header.jsp"/>
  <!-- --------------------------------------------------------------------------------------------- -->



  <main class="container-fluid">
 	<div class="row">
 		
 		<!-- 이 사이에 넣어야 틀이 망가지지 않음 -->
    	<jsp:include page="website-side.jsp"/>
  
 		 <div class="col-sm-9">
          <div class="col-sm-1"></div>
          <div class="card col-sm-10">
            <div class="card-body">
              <h2 class="card-title">회사소개</h2><br><br>
              <div class="container">
                
                <hr class="featurette-divider">
                
	      <div class="row featurette">
	        <div class="col-md-7">
	          <h2 class="featurette-heading">A-HO 호텔소개 </h2>
	          <br>
	          <h4 class="webHotel">가족여행을 갔을 때 혼자있을 반려동물이 걱정되십니까?<br>
	            여러분의 또 다른 가족, 반려동물과 함께 하기 위한 호텔입니다. <br>
	            저희 호텔에서는 반려동물과 고객여러분들이 같이 쉴수 있도록 최고의 서비스를 제공합니다.</h4>
	        </div>
	        <div class="col-md-5">
	          <img src="${ pageContext.servletContext.contextPath }/resources/common-Img/A-HO.png" alt="A-HO 로고" id="companyImg">
	  
	        </div>
	      </div>
	  
	      <hr class="featurette-divider">
	  
	      <div class="row featurette">
	        <div class="col-md-6 order-md-2">
	          <h2 class="featurette-heading">다양한 지역에 위치!</h2>
	          <br>
	          <h4 class="webHotel">서울, 인천, 부산, 강원, 제주 지역에 위치하여 각 호텔별로 특별한 서비스를 제공하고 있습니다. <br>
	            또한 호텔 인근의 동물병원과 제휴를 맺어 긴급상황에 대처할 수 있으며 반려동물과 함께할수 있는 지역을 안내하고 있습니다.
	            <button style="float: right; width: 30%;" id="goHotel">바로가기</button></h4>
	            
	        </div>
	        <div class="col-md-5 order-md-1">
	          <div id="demo" class="carousel slide" data-ride="carousel">
	            <ul class="carousel-indicators">
	              <li data-target="#demo" data-slide-to="0" class="active"></li>
	              <li data-target="#demo" data-slide-to="1"></li>
	              <li data-target="#demo" data-slide-to="2"></li>
	              <li data-target="#demo" data-slide-to="3"></li>
	              <li data-target="#demo" data-slide-to="4"></li>
	            </ul>
	            <div class="carousel-inner">
	              <div class="carousel-item active">
	                <img src="img/A-HO.png" alt="A-Ho 서울점">
	                <div class="carousel-caption">
	                  <h3>A-HO 서울</h3>
	                  <p>We had such a great time in LA!</p>
	                </div>   
	              </div>
	              <div class="carousel-item">
	                <img src="img/A-HO-icon.png" alt="A-Ho 인천점">
	                <div class="carousel-caption">
	                  <h3>A-Ho 인천점</h3>
	                  <p>Thank you, Chicago!</p>
	                </div>   
	              </div>
	              <div class="carousel-item">
	                <img src="img/A-HO.png" alt="A-HO 부산점">
	                <div class="carousel-caption">
	                  <h3>A-HO 부산점</h3>
	                  <p>We love the Big Apple!</p>
	                </div>   
	              </div>
	              <div class="carousel-item">
	                <img src="img/A-HO.png" alt="A-HO 강원점">
	                <div class="carousel-caption">
	                  <h3>A-HO 강원점</h3>
	                  <p>We love the Big Apple!</p>
	                </div>   
	              </div>
	              <div class="carousel-item">
	                <img src="img/star-fill.svg" alt="A-HO 제주점">
	                <div class="carousel-caption">
	                  <h3>A-HO 제주점</h3>
	                  <p>We love the Big Apple!</p>
	                </div>   
	              </div>
	            </div>
	            <a class="carousel-control-prev" href="#demo" data-slide="prev">
	              <span class="carousel-control-prev-icon"></span>
	            </a>
	            <a class="carousel-control-next" href="#demo" data-slide="next">
	              <span class="carousel-control-next-icon"></span>
	            </a>
	          </div>
	  
	        </div>
	      </div>
	  
	      <hr class="featurette-divider">
	  
	      <div class="row featurette">
	        <div class="col-md-7">
	          <h2 class="featurette-heading">A-HO의 이념</h2>
	          <br>
	          <h4 class="webHotel">Animal - Hotel 반려동물을 위한 친화적인 호텔입니다. <br>
	            A Rank - Hotel 최상의 서비스를 제공할 것을 약속드립니다. <br>
	            Appealing - Hotel 고객분들과 반려동물에게 충분히 매력적인 호텔이 될 것입니다.
	
	          </h4>
	        </div>
	        <div class="col-md-5">
	          <img src="img/A-HO.png" alt="" id="companyImg">
	  
	        </div>
	      </div>
	  
	      <hr class="featurette-divider">
	               
	              </div>
	              
	            </div>
	          </div>
	        </div>
	      </div>

      
  </main>

  <!-- --------------------------------------------------------------------------------------------- -->
  
  
  <jsp:include page="../common/footer.jsp"/>
</body>
</html>