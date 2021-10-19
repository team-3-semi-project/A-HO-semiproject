<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>메인홈페이지</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <style>
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
   
  </head>
  <body>
  
	<jsp:include page="header.jsp"/>
  <div class="container"> 

 

  <div id="ddd">

    <ul class="nav justify-content-center">
      <li class="nav-item mt-auto">
        <a class="nav-link active" href="#">호텔목록</a>
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

  	<div class="slider">
    <input type="radio" name="slide" id="slide1" checked>
    <input type="radio" name="slide" id="slide2">
    <input type="radio" name="slide" id="slide3">
    <input type="radio" name="slide" id="slide4">
    <input type="radio" name="slide" id="slide5">
    <ul id="imgholder" class="imgs">
        <li><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/강원.jpg;" width="700px"></li>
        <li><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/부산.jpg;" width="700px"></li>
        <li><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/서울.jpg;" width="700px"></li>
        <li><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/인천.jpg;" width="700px"></li>
        <li><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/제주.jpg;" width="700px"></li>
    </ul>
    <div class="bullets">
        <label for="slide1">&nbsp;</label>
        <label for="slide2">&nbsp;</label>
        <label for="slide3">&nbsp;</label>
        <label for="slide4">&nbsp;</label>
        <label for="slide5">&nbsp;</label>
    </div>
  </div>
  <br>
<hr>
<main role="main" class="container">
  <div class="row">
    <div class="blog-main">
      <div class="blog-post">
        <h2 class="blog-post-title" style="color:#D6B534">IntroDuce A-HO HOTEL</h2>
        <h5 class="blog-post-meta" style="color:#D6B534"><strong>A-HO 호텔에서 얻을 수 있는 특별한 경험</strong></h5>

        <p>A-HO 호텔은 고객분들에게 최고의 경험을 제공하기 위해 다음과 같은 서비스를 제공하고 있습니다.</p>
        <hr>
		<img src="${ pageContext.servletContext.contextPath }/resources/common-Img/반려동물.jpg;" style="width: 50%; height: auto;">
        <h2 style="color:#D6B534">WITH PET</h2>
        <p>소중한 경험을 반려동물과 함께 보내세요</p>
        <hr>
        <img src="${ pageContext.servletContext.contextPath }/resources/common-Img/클래식.jpg;" style="width: 50%; height: auto;">
        <h2 style="color:#D6B534">CLASSIC</h2>
        <p>매주 토요일 아름다운 클래식 연주를 들어보세요</p>
        <hr>
        <img src="${ pageContext.servletContext.contextPath }/resources/common-Img/수영장헬스장.png;" style="width: 50%; height: auto;">
        <h2 style="color:#D6B534">FACILITIES</h2>
        <p>최고의 시설에서 휴양을 즐겨보세요</p>
        <hr>
	</div>
   </div>
  </div>
</main>
	<main role="main" class="container"></main>
	 <div class="row">
    <div class="col-md-8 blog-main">
      <div class="blog-post">
        <ul>
          <li>Got a motel and built a fort out of sheets.</li>
          <li>Your kiss is cosmic, every move is magic.</li>
          <li>Suiting up for my crowning battle.</li>
        </ul>
        <p>Takes you miles high, so high, 'cause she’s got that one international smile.</p>
        <ol>
          <li>Scared to rock the boat and make a mess.</li>
          <li>I could have rewrite your addiction.</li>
          <li>I know you get me so I let my walls come down.</li>
        </ol>
        <p>After a hurricane comes a rainbow.</p>
      </div><!-- /.blog-post -->

      <div class="blog-post">
        <h2 class="blog-post-title">Another blog post</h2>
        <p class="blog-post-meta">December 23, 2013 by <a href="#">Jacob</a></p>

        <p>I am ready for the road less traveled. Already <a href="#">brushing off the dust</a>. Yeah, you're lucky if you're on her plane. I used to bite my tongue and hold my breath. Uh, She’s a beast. I call her Karma (come back). Black ray-bans, you know she's with the band. I can't sleep let's run away and don't ever look back, don't ever look back.</p>
        <blockquote>
          <p>Growing fast into a <strong>bolt of lightning</strong>. Be careful Try not to lead her on</p>
        </blockquote>
        <p>I'm intrigued, for a peek, heard it's fascinating. Oh oh! Wanna be a victim ready for abduction. She's got that international smile, oh yeah, she's got that one international smile. Do you ever feel, feel so paper thin. I’m gon’ put her in a coma. Sun-kissed skin so hot we'll melt your popsicle.</p>
        <p>This is transcendental, on another level, boy, you're my lucky star.</p>
      </div><!-- /.blog-post -->

      <div class="blog-post">
        <h2 class="blog-post-title">New feature</h2>
        <p class="blog-post-meta">December 14, 2013 by <a href="#">Chris</a></p>

        <p>From Tokyo to Mexico, to Rio. Yeah, you take me to utopia. I'm walking on air. We'd make out in your Mustang to Radiohead. I mean the ones, I mean like she's the one. Sun-kissed skin so hot we'll melt your popsicle. Slow cooking pancakes for my boy, still up, still fresh as a Daisy.</p>
        <ul>
          <li>I hope you got a healthy appetite.</li>
          <li>You're never gonna be unsatisfied.</li>
          <li>Got a motel and built a fort out of sheets.</li>
        </ul>
        <p>Don't need apologies. Boy, you're an alien your touch so foreign, it's <em>supernatural</em>, extraterrestrial. Talk about our future like we had a clue. I can feel a phoenix inside of me.</p>
      </div><!-- /.blog-post -->

    </div><!-- /.blog-main -->

    <aside class="col-md-4 blog-sidebar">
      <div class="p-4">
        <h5 class="font-italic">A-HO 소식 받기</h5>
        <ol class="list-unstyled">
          <li><a href="https://www.instagram.com/shillahotels/">Instagram</a></li>
          <li><a href="https://twitter.com/Twitter">Twitter</a></li>
          <li><a href="https://www.facebook.com/theshillahotels">Facebook</a></li>
        </ol>
      </div>
    </aside><!-- /.blog-sidebar -->

  </div><!-- /.row -->
	<br><br><br><br><br>
</main>

	<jsp:include page="footer.jsp"/>


    
  </body>
</html>
