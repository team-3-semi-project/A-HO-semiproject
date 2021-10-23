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
<title>A-HO</title>

<style>
  input[type="radio"]+label {
  
  width: 24px;
  height: 24px;
  background: url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain;
}

.star {
display: none;
}

.obj {
  margin-left: 20px;
  width: 100px;
  height: 100px;
}

.reviewB {
  margin-bottom: 20px;
  margin-right: 20px;
  float: right;
}
</style>  
</head>
<body>

  <jsp:include page="../../common/header.jsp"/>
  <!-- --------------------------------------------------------------------------------------------- -->



  <main class="container-fluid">
     


    <div class="row">
    
        <jsp:include page="../mypage-side.jsp"/>

        <div class="col-sm-9" >
          <div class="card" style="width: 50rem;">
            <div class="card-body">
              <h2 class="card-title">리뷰 수정</h2><br><br>
              <form action="${ pageContext.servletContext.contextPath }/review/update" method="post" id="reviewForm" encType="multipart/form-data">
                <div style="border: 1px solid black;">
                  <br>
                  <div style="margin-left: 20px; margin-right: 20px;"><h4><c:out value="${ reserve.hotel.hoName } ${ reserve.room.roomName } Room"/></h4></div><br>
                  <div style="margin-left: 20px;">
                    <input type="radio" name="score" id="1" class="star" value="1"><label for="1"></label>
                    <input type="radio" name="score" id="2" class="star" value="2"><label for="2"></label>
                    <input type="radio" name="score" id="3" class="star" value="3"><label for="3"></label>
                    <input type="radio" name="score" id="4" class="star" value="4"><label for="4"></label>
                    <input type="radio" name="score" id="5" class="star" value="5"><label for="5"></label>
                    <p class="card-text" style="float: right; margin-right: 20px;"><small class="text-muted"><fmt:formatDate value="${ reserve.startDate }" type="date" pattern="yyyy-MM-dd 15시"/> ~ <fmt:formatDate value="${ reserve.endDate }" type="date" pattern="yyyy-MM-dd 11시"/></small>
                  	<br clear="both">
                  </div>
                  	<label for="imgup" style="margin-left: 20px;">파일 : &nbsp; </label><input type="file" name="uploadImg" id="imgup" multiple="multiple" onchange="loadImg()">
                  <br>
                  <div id="preview"></div>
                  <textarea name="reviewText" id="reviewText" cols="40" rows="20" style="margin: 20px; width: 95%;"></textarea>
                  <input type="radio" name="reserveCode" value="${ reserve.reserveCode }" style="display: none;" checked="checked">
                  <button type="reset" class="reviewB" id="reviewCancle">취소</button> <button type="button" class="reviewB" id="reviewOk">확인</button>
                  <br clear="both">
                </div>
               
              </form>
            </div>
          </div>
        </div>
      </div>

      <script>
        var chStarFlag = false;
        var textFlag = false;
        
        $("#1").click(function(){
          $("#1+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#2+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
          $("#3+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
          $("#4+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
          $("#5+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
        });
        $("#2").click(function(){
          $("#1+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#2+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#3+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
          $("#4+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
          $("#5+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
        });
        $("#3").click(function(){
          $("#1+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#2+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#3+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#4+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
          $("#5+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
        });
        $("#4").click(function(){
          $("#1+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#2+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#3+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#4+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#5+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star.svg') no-repeat 0 0px / contain");
        });
        $("#5").click(function(){
          $("#1+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#2+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#3+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#4+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
          $("#5+label").css("background","url('${ pageContext.servletContext.contextPath }/resources/common-Img/star-fill.svg') no-repeat 0 0px / contain");
        });
        
        $("#reviewCancle").click(function(){
        	location.href = "${ pageContext.servletContext.contextPath}/mypage/reserve";
        })
        
        
        $("#reviewOk").click(function(){
	        const reviewArea = $('#reviewText').val();
    	    
	        if(reviewArea != ""){
	        	textFlag = true;
	        }
        	
	        if($(".star").is(":checked")){
	        	chStarFlag = true;
	        }
        	if(!chStarFlag){
        		alert('별점을 선택해 주세요');
        	} else if(!textFlag){
        		alert('리뷰를 작성해 주세요');
        	} else {
        		document.getElementById("reviewForm").submit();
        	}
        });
        
		function loadImg() {
        	
        	var fileInput = document.querySelector("#imgup");
        	var files = fileInput.files;
          	var preview = document.getElementById("preview");
        	
        	if (files){
        		
	        	for (var i = 0; i < files.length; i++) {
	        	  var file = files[i];
	              const img = document.createElement("img");
	              img.classList.add("obj");
	              img.file = file;
              

             	  preview.appendChild(img);

             	  const reader = new FileReader();
              
             	  reader.onload = function(e) {
                
                  img.src = e.target.result;
              }
              
              reader.readAsDataURL(file);
              
	        	}
	        	
            $("#imgup").click(function(){
              $("#preview").children().remove();
            })
        	}
        };
        
      </script>
  </main>





  <!-- --------------------------------------------------------------------------------------------- -->
  
  
  <jsp:include page="../../common/footer.jsp"/>

  
</body>
</html>