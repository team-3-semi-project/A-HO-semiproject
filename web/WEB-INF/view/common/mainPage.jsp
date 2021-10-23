<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=">
    
    <title>메인홈페이지</title>

    <!-- Bootstrap core CSS -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	  <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/website.css">

    <style type="text/css">

		@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		}
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      #mainLogo {
        font-size: 3em;
        font-style: italic;
        font-weight: 800;
        text-decoration: none;
      }
      #cen {
        text-align: left;
        margin-left: 40%;
      }
      #col{
        background-color: white;
      }
      #ddd {
        
        border: 1px solid black;
      }
      .nav-link{
        color: black;
      }

      #mainLogo {
        font-size: 3em;
        font-style: italic;
        font-weight: 800;
        text-decoration: none;
      }
      #logoleft {
        float: left;
      }
      
      .slider{
		    width: 640px;
		    height: 480px;
		    position: relative;
		    margin: 0 auto;
		}
	 .slider input[type=radio]{
	      display: none;
	  }
	  
	  ul.imgs{
		    padding: 0;
		    margin: 0;
	  }
	  ul.imgs li{
		    position: absolute; /* 슬라이드가 겹쳐서 모여야 하므로 absolute 속성으로 배치 */
		    opacity: 0; /* 체크한 라디오박스 순서의 슬라이드만 표시되도록 기본 투명도 설정 */
		    list-style: none;
		    padding: 0;
		    margin: 0;
	  }
	  .bullets{
		    position: absolute;
		    left: 50%; /* 가로로 가운데 정렬 */
		    transform: translateX(-50%);
		    bottom: 20px; /* 슬라이드 밑에서 20px 간격 띄움 */
		    z-index: 2; /* 슬라이드 위에 보이도록 레이어 순위를 높임 */
		}
		.bullets label{
		    display: inline-block; /* 한 줄로 불릿 나열*/
		    border-radius: 50%; /* 원형 불릿으로 처리 */
		    background-color: rgba(0,0,0,0.55);
		    width: 20px; /* 불릿 너비 */
		    height: 20px; /* 불릿 높이 */
		    cursor: pointer;
		}
		.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
		    background-color: #fff;
		}
		.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
		    background-color: #fff;
		}
		.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
		    background-color: #fff;
		}
		.slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
		    background-color: #fff;
		}
		.slider input[type=radio]:nth-child(5):checked~.bullets>label:nth-child(5){
		    background-color: #fff;
		}
		.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
		    opacity: 1;
		    transition: 1s;
		    z-index: 1;
		}
		.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
		    opacity: 1;
		    transition: 1s;
		    z-index: 1;
		}
		.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
		    opacity: 1;
		    transition: 1s;
		    z-index: 1;
		}
		.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
		    opacity: 1;
		    transition: 1s;
		    z-index: 1;
		}
		.slider input[type=radio]:nth-child(5):checked~ul.imgs>li:nth-child(5){
		    opacity: 1;
		    transition: 1s;
		    z-index: 1;
		}
		ul.imgs li{
		    position: absolute;
		    opacity: 0;
		    list-style: none;
		    padding: 0;
		    margin: 0;
		    transition-delay: 0.9s; /* 트랜지션 지연 시간 지정 */
		}

    </style>
   
	<jsp:include page="header.jsp"/>
  </head>
  
  <body>
  <div class="container"> 

 

  <div id="ddd" style="font-family: 'Pretendard-Regular';">

    <ul class="nav justify-content-center">
      <li class="nav-item mt-auto">
        <a class="nav-link active" href="${ pageContext.servletContext.contextPath }/hotel/list?no=1">호텔목록</a>
      </li>
      <li class="nav-item mt-auto">
        <a class="nav-link" href="${ pageContext.servletContext.contextPath }/roomList">룸목록</a>
      </li>
      <li class="nav-item mt-auto">
        <a class="nav-link" href="${ pageContext.servletContext.contextPath }/hotelserch" style="font-size: 20px"><strong>호텔예약</strong></a>
      </li>
      <li class="nav-item mt-auto">
        <a class="nav-link" href="${ pageContext.servletContext.contextPath }/notice">공지사항</a>
      </li>
<!--       <li class="nav-item mt-auto">
        <a class="nav-link" href="book">test(예약 연습용)</a>
      </li> -->
    </ul>
  </div>
  <br>

  	<div>
	          <div id="demo" class="carousel slide" data-ride="carousel" style="font-family: 'Pretendard-Regular';">
	            <ul class="carousel-indicators">
	              <li data-target="#demo" data-slide-to="0" class="active"></li>
	              <li data-target="#demo" data-slide-to="1"></li>
	              <li data-target="#demo" data-slide-to="2"></li>
	              <li data-target="#demo" data-slide-to="3"></li>
	              <li data-target="#demo" data-slide-to="4"></li>
	            </ul>
	            <div class="carousel-inner">
	              <div class="carousel-item active">
	                <img src="${ pageContext.servletContext.contextPath }/resources/common-Img/서울.jpg;" alt="A-Ho 서울점">
	                <div class="carousel-caption">
	                  <h3>A-HO 서울점</h3>
	                  <p>아름다운 야경이 일품인 서울점</p>
	                </div>   
	              </div>
	              <div class="carousel-item">
	                <img src="${ pageContext.servletContext.contextPath }/resources/common-Img/인천.jpg;" alt="A-Ho 인천점">
	                <div class="carousel-caption">
	                  <h3>A-Ho 인천점</h3>
	                  <p>서해와 인접해있고 항구를 한눈에 내려다 볼 수 있는 것이 장점인 인천점</p>
	                </div>   
	              </div>
	              <div class="carousel-item">
	                <img src="${ pageContext.servletContext.contextPath }/resources/common-Img/부산.jpg;" alt="A-HO 부산점">
	                <div class="carousel-caption">
	                  <h3>A-HO 부산점</h3>
	                  <p>해운대 해수욕장과 인접해 있어 바다에서 즐기기 딱 좋은 부산점</p>
	                </div>   
	              </div>
	              <div class="carousel-item">
	                <img src="${ pageContext.servletContext.contextPath }/resources/common-Img/강원.jpg;" alt="A-HO 강원점">
	                <div class="carousel-caption">
	                  <h3>A-HO 강원점</h3>
	                  <p>산속 맑은 공기를 마시며 휴양하기 좋은 강원점</p>
	                </div>   
	              </div>
	              <div class="carousel-item">
	                <img src="${ pageContext.servletContext.contextPath }/resources/common-Img/제주.jpg;" alt="A-HO 제주점">
	                <div class="carousel-caption">
	                  <h3>A-HO 제주점</h3>
	                  <p>한라산과 제주 앞바다를 모두 즐길 수 있는 제주점</p>
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
<hr>
	      </div>
  <br>
<main role="main" class="container" style="font-family: 'Pretendard-Regular';">
  <div class="row">
    <div class="blog-main">
		<h2 class="blog-post-title" style="color:#D6B534">ABOUT</h2>
      <div class="blog-post" style="background-color:rgb(73, 73, 73);">
		
		<table style="text-align:center;">
			<td style="color:white"><p>&nbsp;&nbsp;&nbsp;A-HO 호텔은 반려동물과 함께 소중한 추억을 쌓을 수 있는 호텔입니다.&nbsp;&nbsp;<br>
				   활발한 아이들을 위한 넓은 활동 공간과 조용한 아이들을 위한 <br>휴식 공간이 마련되어 있습니다.<br>
				   호텔 주변의 멋진 자연과 함께 소중한 추억을 선사해드립니다.</p></td>
			<td><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/로비.jpg;" style="width: 130%; height: 50; vertical-align:middle;" ></td>
		</table>

	</div>
   </div>
  </div>
        <hr>
</main>
<main role="main" class="container" style="font-family: 'Pretendard-Regular';">
  <div class="row">
    <div class="blog-main">
      <div class="blog-post">
        <h2 class="blog-post-title" style="color:#D6B534">HOTEL SERVICE</h2>
        <h5 class="blog-post-meta" style="color:#D6B534"><strong>A-HO 호텔에서 얻을 수 있는 특별한 경험</strong></h5>

        <p>A-HO 호텔은 고객분들에게 최고의 경험을 제공하기 위해 다음과 같은 서비스를 제공하고 있습니다.</p>

        <table style="text-align: center;">
        	<tr style="vertical-align:top">
	        	<td><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/반려동물.jpg;" style="width: 93%; height: auto;"></td>
	        	<td><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/클래식.jpg;" style="width: 85%; height: auto;"></td>
	        	<td><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/수영장헬스장.png;" style="width: 80%; height: auto;"></td>
        	</tr>
        	<tr>
		        <td><h2 style="color:#D6B534">WITH PET</h2></td>
		        <td><h2 style="color:#D6B534">CLASSIC</h2></td>
		        <td><h2 style="color:#D6B534">FACILITIES</h2></td>
		    </tr>
		    <tr>
		    	<td><p>소중한 경험을 반려동물과 함께 보내세요</p></td>
		    	<td><p>매주 토요일 아름다운 클래식 연주를 들어보세요</p></td>
		    	<td><p>최고의 시설에서 휴양을 즐겨보세요</p></td>
		    </tr>
		</table>
        <hr>
	</div>
   </div>
  </div>
</main>
	<main role="main" class="container" style="font-family: 'Pretendard-Regular';">
	 <div class="row">
    <div class="col-md-8 blog-main">
      <div class="blog-post">
        <h2 style="color:#D6B534"><strong>다이닝</strong></h2>
        <table cellspacing="0" cellpadding="0" border="0">
        	<tr>
        		<td  style="line-height:0;"colspan="2"><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/셰프.jpg;" style="width: 100%; height: auto;">
        		<td  style="line-height:0;"colspan="2" rowspan="2"><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/다이닝.jpg;" style="width: 310%; height: auto;"></td>
        	</tr>
        	<tr>
        		<td style="line-height:0;"><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/요리.jpg;" style="width: 100%; height: auto;"></td>
        		<td style="text-align:center; background-color:rgb(73, 73, 73); color:white;"><p>세븐스퀘어<br>
							&nbsp;&nbsp;세븐스퀘어는 각국의 음식을 통해&nbsp;
							&nbsp;&nbsp;다양한 세대가 만나는 '삶'의 공간을&nbsp;
							&nbsp;&nbsp;지향하는 라이프스타일 레스토랑입니다.&nbsp;</p>
			</tr>
        </table>
        
        
      </div><!-- /.blog-post -->
      </div>
      </div>
<hr>
      </main>
 
<main role="main" class="container" style="font-family: 'Pretendard-Regular';">
	 <div class="row">
    <div class="col-md-8 blog-main">
      <div class="p-4">
        <h2 class="font-italic" style="color:#D6B534">A-HO HOTEL OFFICIAL</h2>
        <p>A-HO의 다양한 소식을 받아보세요.</p>
        <ol class="list-unstyled">
        <br>
	        <table>
	        	<tr>
	         		 <td><a href="https://www.instagram.com/shillahotels/"><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/인스타그램.png;" style="width: 30%; height: auto;"></td></a>
	         		 <td><a href="https://www.facebook.com/theshillahotels"> <img src="${ pageContext.servletContext.contextPath }/resources/common-Img/페이스북.png;" style="width: 30%; height: auto;"></td></a>
	         		 <td><a href="https://twitter.com/Twitter"><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/트위터.png;" style="width: 30%; height: auto;"></td></a>
	          	</tr>
	          	<tr>
	          		  <td><a href="https://www.instagram.com/shillahotels/">Instagram</a></td>
	          		  <td><a href="https://www.facebook.com/theshillahotels">Facebook</a></td>
	          		  <td><a href="https://twitter.com/Twitter">Twitter</a></td>
	          	</tr>
	        </table>
          
        </ol>
      </div>

      

    </div><!-- /.blog-main -->
</main>

	<main role="main" class="container" style="font-family: 'Pretendard-Regular';">
<hr>
		<div class="col-md-8 blog-main">
      <div class="blog-post">
        <h2 class="blog-post-title" style="color:#D6B534"><strong>코로나19 방역 안내</strong></h2>
        <p>A-HO호텔은 고객분들의 안전을 위해 최선을 다하고 있습니다.</p>
		<img src="${ pageContext.servletContext.contextPath }/resources/common-Img/코로나19.jpg;" style="width: 150%; height: auto;">
       
      </div><!-- /.blog-post -->
	</main>
	

	<jsp:include page="footer.jsp"/>

	
  </body>
 
  
</html>
