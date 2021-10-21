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

  <jsp:include page="../common/header.jsp"/>
  <!-- --------------------------------------------------------------------------------------------- -->



  <main class="container-fluid">
     


    <div class="row">
    
        <jsp:include page="../mypage/mypage-side.jsp"/>

        <div class="col-sm-9" >
          <div class="card" style="width: 50rem;">
            <div class="card-body">
              <h2 class="card-title">신고 하기</h2><br><br>
              <form action="${ pageContext.servletContext.contextPath }/report" method="post" id="reportForm">
                <div style="border: 1px solid black;">
                  <br>
                  <div style="margin-left: 20px; margin-right: 20px;">
                  <label for="reportHead">제목 : <input type="text" id="reportHead" style="width: 600px"></label>
                  </div>
                  <br>
                  <div id="preview"></div>
                  <textarea name="reportText" id="reportText" cols="40" rows="20" style="margin: 20px; width: 95%;"></textarea>
                  <input type="radio" name="reserveCode" value="${ requestScope.reserveCode }" style="display: none;" checked="checked">
                  <button type="reset" class="reviewB" id="reportCancle">취소</button> <button type="button" class="reviewB" id="reportOk">확인</button>
                </div>
               
              </form>
            </div>
          </div>
        </div>
      </div>
      <script>
      var reportHeadFlag = false;
      var retextFlag = false;
      	
      $("#reportOk").click(function(){
    	    const reportHead = $('#reportHead').val();
	        const reportArea = $('#reportText').val();
	        
	        if(reportHead != ""){
	        	reportHeadFlag = true;
	        }
        	
	        if(reportArea != ""){
	        	retextFlag = true;
	        }
	        
        	if(!reportHeadFlag){
        		alert('신고사유를 작성해주세요');
        	} else if(!retextFlag){
        		alert('사유를 작성해주세요');
        	} else {
        		document.getElementById("reportForm").submit();
        	}
        });
      </script>
      
</main>
</body>
</html>