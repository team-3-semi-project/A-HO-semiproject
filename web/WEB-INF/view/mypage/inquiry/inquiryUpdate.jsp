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
          			<form action="${ pageContext.servletContext.contextPath }/mypage/inquiry/update" method="post" encType="multipart/form-data">
          				<input type="text" id="inquiryCode" name="inquiryCode" value="${ requestScope.inquiry.inquiryCode }" hidden="true">
          				<div class="card-body">
          				<br>
            			<h1 class="card-title">1:1 문의 수정</h1><br><br>
						<div>
          					<label>&nbsp;&nbsp;작성일 : </label>&nbsp; <c:out value="${ requestScope.inquiry.inquiryDate }"/>
        				</div>
            			<div class="card w-90">
            				<div class="card-body">
                				<div class="card-body">
                  					<div class="col-sm-5">
                    					<div class="form-group">
                      						<label for="exampleFormControlSelect1"><strong>문의 유형</strong></label>
                      						<select class="form-control" id="inquiryCategory" name="inquiryCategory">
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
                      					<input type="text" class="form-control" id="inquiryTitle" name="inquiryTitle" value="${ requestScope.inquiry.inquiryTitle }"><br>
                  					</div>
                  					<br>
                  					<div>
                      					<label for="inquiryFile"><strong>기존 첨부파일</strong></label> <br>
                      					<c:if test="${ empty requestScope.inquiry.inquiryFileList }">첨부파일이 없습니다.</c:if>
                  							<%-- <c:forEach items="${ requestScope.inquiry.inquiryFileList }" var="inquiryPhoto">
                  							<p>${ inquiryPhoto.qOriginalFile }</p>
                  						</c:forEach> --%>
                  						<c:forEach items="${ requestScope.inquiry.inquiryFileList }" var="inquiryPhoto">
                  							<img width="300" height="200" src="${ pageContext.servletContext.contextPath }/resources/inquiry-img/${ inquiryPhoto.qFileName }"/>
                  						</c:forEach>
                  						<br><br>
                      					<!-- <div>
                  							<input type="checkbox" id="isDeleteInquiryFile" name="isDeleteInquiryFile" value="true" style="">
                  							<label>기존에 업로드한 사진 삭제하기</label>
                  						</div> -->
                  						<div class="input-group mb-3" style="width: 30%">
										  	<div class="input-group-prepend">
										 	    	<input type="radio" id="DeleteInquiryFileIsFalse" name="isDeleteInquiryFile" value="0" checked hidden="true">
										    	<div class="input-group-text">
										    		<input type="radio" id="DeleteInquiryFileIsTrue" name="isDeleteInquiryFile" value="1">
									    		</div>
									  		</div>
											<input type="text" class="form-control" value="기존 업로드 파일 삭제">
										</div>
                 					</div>
                 					<br>
                 					<div>
                      					<label for="inquiryFile"><strong>새로운 파일 첨부</strong></label> <br>
                      					<div class="input-group mb-3">
                          					<div class="custom-file">
                              					<input type="file" id="inquiryFile" name="inquiryFile" aria-describedby="inputGroupFileAddon01" multiple>
                          					</div>
                      					</div>
                 					</div>
                 					<br>
                  					<div>
                      					<label for="inquiryContent"><strong>문의 내용</strong></label>
                      					<textarea class="form-control" rows="10px" aria-label="With textarea" id="inquiryContent" name="inquiryContent">${ requestScope.inquiry.inquiryContent }</textarea><br>
                  					</div>
                				</div>
            				</div>
          				</div>
          				<br><br>
    	  				<div style="text-align: right;">
            				<button type="submit" class="btn btn-primary btn-lg">수정 완료</button>
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