<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	<title>A-HO</title>
</head>  
<body>
  <jsp:include page="../../common/header.jsp"></jsp:include>
  <!-- --------------------------------------------------------------------------------------------- -->

	<main class="container-fluid">
    	<div class="row">
      
      		<jsp:include page="../mypage-side.jsp"/>
      
      		<div class="col-sm-9">
        		<div class="col-sm-1"></div>
        		<div class="card col-sm-11">
          			<form action="${ pageContext.servletContext.contextPath }/mypage/inquiry/insert" method="post" encType="multipart/form-data">
          				<div class="card-body">
          				<br>
            			<h1 class="card-title">1:1 문의 작성</h1><br><br>

            			<div class="card w-90">
            				<div class="card-body">
                				<div class="card-body">
                  					<div class="col-sm-5">
                    					<div class="form-group">
                      						<label for="exampleFormControlSelect1"><strong>문의 유형</strong></label>
                      						<select class="form-control" id="inquiryCategory" name="inquiryCategory">
                        						<option>개인정보</option>
                        						<option>포인트</option>
                        						<option>예약 및 결제</option>
                        						<option>환불</option>
                        						<option>기타</option>
                      						</select>
                    					</div>
                  					</div>
                  					<br>
                  					<div>
                      					<label for="inquiryTitle"><strong>문의 제목</strong></label>  
                      					<input type="text" class="form-control" value="" id="inquiryTitle" name="inquiryTitle"><br>
                  					</div>
                  					<div>
                      					<label for="inquiryFile"><strong>첨부파일</strong></label>  
                      					<div class="input-group mb-3">
                          					<div class="custom-file">
                              					<input type="file" id="inquiryFile" name="inquiryFile" aria-describedby="inputGroupFileAddon01" multiple>
                          					</div>
                      					</div>
                 					</div>
                 					<br>
                  					<div>
                      					<label for="inquiryContent"><strong>문의 내용</strong></label>  
                      					<textarea class="form-control" rows="10px" aria-label="With textarea" id="inquiryContent" name="inquiryContent"></textarea><br>
                  					</div>
                				</div>
            				</div>
          				</div>
          				<br><br>
    	  				<div style="text-align: right;">
            				<button type="submit" class="btn btn-primary btn-lg">작성 완료</button>
        				</div>
          				<br><br>
          			</div>
          			</form>
        		</div>
      		</div>
 		</div>
	</main>
<br><br><br>

  <!-- --------------------------------------------------------------------------------------------- -->
  
 	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>