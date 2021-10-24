<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title></title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    

    <style>
      #mainLogo {
        font-size: 3em;
        font-style: italic;
        font-weight: 800;
        text-decoration: none;
      }

		#ddd {
        
        border: 1px solid black;
      }

		.nav-link{
        color: black;
      }
	  
	  @font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		}
	  
      aside{
            width: 20%;
            height: 3000px;
            float: right;
            }
            nav{
            width: 20%;
            height: 3000px;
            float: left;
            }
            section{
            background-color: rgb(233, 233, 233);
            width: 60%;
            height: 3000px;
            position: center;
            float: left;
            text-align: center;
            }
            table{
            margin-top: 5%;
            margin-left:auto;
            margin-right:auto;
            width: 800px;
            }
            
        
    </style>

  </head>
  <body>

  <jsp:include page="../common/header.jsp"></jsp:include>
  <!-- ---------------------------- header --------------------------------- -->
  

    
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
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
    </ul>
  </div>
  
  <br>
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5" >
                <div>
                	<img src="${ pageContext.servletContext.contextPath }/resources/room-img/메인.PNG" style="display: block; margin-left: 0px; width:1100px; height:400px;"/>
                </div>
                <div class="col-lg-5">
                </div>
            </div>
            <hr>
            <br>
            
            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <table border="1">
                <div class="col-lg-7">
                	<img src="${ pageContext.servletContext.contextPath }/resources/room-img/스탠다드.PNG" " width="450px" height="300px"/>
                </div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">Standard</h1>
                    <br>
                    <p>아늑한 공간안에 편안한 휴식을 선사하는 </p>
                    <p>침구를 갖춘 객실입니다. 안락한 공간이 </p>
                    <p>주는 편안함과 함께 일상에서 벗어난듯한 </p>
                    <p>특별한 휴식을 경험해보시기 바랍니다. </p>
                  </div>
            </table>
            
            <table border="1">
              
              <div class="col-lg-7">
              	<img src="${ pageContext.servletContext.contextPath }/resources/room-img/디럭스.PNG" width="450px" height="300px"/>
              </div>
              <div class="col-lg-5">
                <h1 class="font-weight-light">Deluxe</h1>
                <br>
                <p>여유로운 휴식을 위한 공간 </p><br>
                <p> </p>
              </div>
            </table>

            <table border="1">
              
              <div class="col-lg-7"><img src="${ pageContext.servletContext.contextPath }/resources/room-img/패밀리.PNG" width="450px" height="300px"/></div>
              <div class="col-lg-5">
                <h1 class="font-weight-light">Family</h1>
                <br>
                <p> 거실과 침실이 연결된 공간과 넓은 </p>
                <p> 침대를 갖춘 객실입니다. 여유로운 공간이 </p>
                <p> 주는 안락함과 함께 가족들과 편안한 </p>
                <p> 휴식을 경험해보시기 바랍니다. </p>
              </div>
            </table>

            <table border="1">
              
              <div class="col-lg-7">
              	<img src="${ pageContext.servletContext.contextPath }/resources/room-img/스위트.PNG" width="450px" height="300px"/>
              </div>
              <div class="col-lg-5">
                <h1 class="font-weight-light">Suite</h1>
                <br>
                <p> 모던한 분위기의 고급스러운 공간으로  </p>
                <p> 여유로운 응접실과 다이닝 룸, 업무 공간 및  </p>
                <p> 침실로 구성된 객실입니다.</p>
                <p> </p>
              </div>
            </table>

            <table border="1">
          
              <div class="col-lg-7">
              	<img src="${ pageContext.servletContext.contextPath }/resources/room-img/vip.PNG" width="450px" height="300px"/>
              </div>
              <div class="col-lg-5">
                <h1 class="font-weight-light">VIP</h1>
                <br>
                <p>세상의 모든 품격과 럭셔리를 갖춘 공간이며 </p>
                <p>프라이빗 바와 세계적인 수준의 침구류와 함께  </p>
                <p>생애 최고의 휴식을 경험해보시기 바랍니다. </p>
              </div>
            </table>
          </div>
      </div>
          
  <!-- ---------------------------- footer --------------------------------- -->
  <jsp:include page="../common/footer.jsp"></jsp:include>

</body>


</html>
    