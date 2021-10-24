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

#reportCancle, #reportOk {
  margin-top: 20px;
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
          <div class="card col-sm-9">
            <div class="card-body">
              <h2 class="card-title">신고 하기</h2><br><br>
              <form action="${ pageContext.servletContext.contextPath }/report" method="post" id="reportForm">
                <div style="border: 1px solid black;">
                  <br>
                  <div style="margin-left: 20px; margin-right: 20px;">
                  <h2>리뷰내역</h2>
                  <textarea rows="40" cols="20" disabled="disabled" style="width: 100%"><c:out value="${ requestScope.reserve.review }"></c:out></textarea>
                  </div>
                  <br>
                  <div id="preview"></div>
                  <textarea name="reportText" id="reportText" cols="40" rows="20" style="margin: 20px; width: 95%;"></textarea>
                  <input type="radio" name="reserveCode" value="${ requestScope.reserve.reserveCode }" style="display: none;" checked="checked">
                  <br>
                  <button type="reset" class="btn btn-secondary" id="reportCancle">취소</button> <button type="button" class="btn btn-secondary" id="reportOk">확인</button>
                </div>
               
              </form>
            </div>
          </div>
        </div>
      </div>
      <script>
      var retextFlag = false;
      	
      $("#reportOk").click(function(){
	        const reportArea = $('#reportText').val();
        	
	        if(reportArea != ""){
	        	retextFlag = true;
	        }
	        
        	if(!retextFlag){
        		alert('신고사유를 작성해주세요');
        	} else {
        		document.getElementById("reportForm").submit();
        	}
        });
      
      $("#reportCancle").click(function(){
    	 
    	  location.href = "${ pageContext.servletContext.contextPath}/hotel/list?no=1"
      });
      </script>
      
</main>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>