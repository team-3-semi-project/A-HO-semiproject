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
          <div class="card-body">
          	<br>
            <h1 class="card-title">1:1 문의</h1><br><br>
            <c:if test="${ empty requestScope.inquiry.inquiryAnswer }">
            <div style="text-align: right;">
          		<a href=""><button type="button" class="btn btn-primary btn-lg">수정하기</button></a>
          		<button type="submit" class="btn btn-outline-danger btn-lg">삭제하기</button>
        	</div>
          	</c:if>
        	<div>
          		<label>&nbsp;&nbsp;작성일 : </label>&nbsp; <c:out value="${ requestScope.inquiry.inquiryDate }"/>
        	</div>
            <div class="card w-90">
            <div class="card-body">
                <div class="card-body">
                  <div class="col-sm-5">
                    <div class="form-group">
                      <label for="exampleFormControlSelect1"><strong>문의 유형</strong></label>
                      <select class="form-control" id="exampleFormControlSelect1">
                        <option <c:if test="${ requestScope.inquiry.inquiryCategory eq '개인정보' }">selected</c:if>>개인정보</option>
                        <option <c:if test="${ requestScope.inquiry.inquiryCategory eq '포인트' }">selected</c:if>>포인트</option>
                        <option <c:if test="${ requestScope.inquiry.inquiryCategory eq '예약 및 결제' }">selected</c:if>>예약 및 결제</option>
                        <option <c:if test="${ requestScope.inquiry.inquiryCategory eq '환불' }">selected</c:if>>환불</option>
                        <option <c:if test="${ requestScope.inquiry.inquiryCategory eq '기타' }">selected</c:if>>기타</option>
                      </select>
                    </div>
                  </div>
                  <br>
                  <div>
                      <label for="inquiryTitle"><strong>문의 제목</strong></label>  
                      <input type="text" class="form-control" id="title" name="title" value="${ requestScope.inquiry.inquiryTitle }" readonly><br>
                  </div>
                  <div>
                      <label for="inquiryContent"><strong>문의 내용</strong></label>  
                      <textarea class="form-control" rows="10px" aria-label="With textarea" readonly>${ requestScope.inquiry.inquiryContent }</textarea><br>
                  </div>
                  <div>
                      <label for="inquiryFile"><strong>첨부파일</strong></label>  
                      <div class="input-group mb-3">
                          <div class="custom-file">
                              <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
                              <label class="custom-file-label" for="inputGroupFile01">파일 추가 시 이곳을 클릭하세요</label>
                          </div>
                      </div>
                  </div>
                </div>
            </div>
          </div>
          <br><br>
          <c:if test="${ !empty requestScope.inquiry.inquiryAnswer }">
          <div>
          	<label for="inquiryContent"><strong>문의 답변</strong></label>  
          	<textarea class="form-control" aria-label="With textarea" readonly>${ requestScope.inquiry.inquiryAnswer }</textarea><br>
          </div>
          </c:if>
          </div>
        </div>
          <br><br>
    	<div style="text-align: center;">
      		<button type="button" class="btn btn-dark btn-lg" onclick="location.href='${ pageContext.servletContext.contextPath }/mypage/inquiry'">목록으로</button>
    	</div>
      </div>
    </div>
  </main>
	<br><br><br>

  <!-- --------------------------------------------------------------------------------------------- -->
  
  <jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>