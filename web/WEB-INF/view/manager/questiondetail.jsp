<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style >
	#imgdiv{
		width: 600px;
		height: 250px;
		border: solid 1px;
	}
	
</style>
</head>
<body>
	<jsp:include page="../manager/managerheader.jsp"></jsp:include>
	
	<div id="plusdiv" class="section col-md-auto ml-sm-auto col-lg-2 px-md-4"></div>
	<section id="maindiv" class="userdetail col-md-auto ml-sm-auto col-lg-6 px-md-4" style="padding-top: 7px !important;">
            <article id="noticeDetail">
            	<div class="main">
		          <form class="question-form" id="question-form" action="${ pageContext.servletContext.contextPath }/manager/questiondetail" method="POST">
					<div id="secdiv">
						<h5 class="text-center">제목</h5>
		            	<input class="text-center" disabled style="width: 600px" value="${ question.inquiryTitle }">	
					</div>
		            <br>
		            <div id="secdiv">
		            	<h5 class="text-center">내용</h5>
		            	<textarea disabled style="height: 250px">${ question.inquiryContent }</textarea>
		            </div>
		            <br>
		            <div id="secdiv">
		            	<h5 class="text-center">카테고리</h5>
		            	<input class="text-center" disabled style="width: 600px" value="${ question.inquiryCategory }">
		            </div>
		            <br>
		            <div id="secdiv">
		            	<h5 class="text-center">이미지</h5>
			            <div id="imgdiv">
	           				<img id="titleImg" width="600" height="250" src="${ question.inquiryFileList[0].qFile }">
	           			</div>
		            </div>
		            <br>
		            <div id="secdiv">
		            	<h5 class="text-center">답변</h5>
	           			<textarea required name="answer" id="answer" style="height: 200px" form="question-form" >${ question.inquiryAnswer }</textarea>
		            </div>
		            <input type="hidden" name="code" id="code" value="${ question.inquiryCode }">
		            <button type="submit" id="updatebtn" class="btn btn-primary btn-lg btn-block" value="update">답변 달기</button>
		          </form>
		        </div>
            </article>
        </section>
        <div id="plusdiv" class="section col-md-auto ml-sm-auto col-lg-2 px-md-4"></div>
        
</body>
</html>