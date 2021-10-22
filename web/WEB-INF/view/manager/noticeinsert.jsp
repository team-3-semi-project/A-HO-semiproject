<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../manager/managerheader.jsp"></jsp:include>
	
	<div id="plusdiv" class="section col-md-auto ml-sm-auto col-lg-2 px-md-4"></div>
	<section id="maindiv" class="userdetail col-md-auto ml-sm-auto col-lg-6 px-md-4" style="padding-top: 7px !important;">
            <article id="noticeDetail">
            	<div class="main">
		          <form class="notice-form" id="notice-form" action="${ pageContext.servletContext.contextPath }/manager/noticeinsert" method="POST">
					<h3 class="text-center">제목</h3>
		            <input required type="text" name="title" style="height: 50px;" id="title" class="form-control">
		            <br>
		            <h3 class="text-center">내용</h3>
		            <textarea required name="content" id="content" style="height: 400px" form="notice-form" >
		            </textarea>
		            <br>
		            <button type="submit" id="insertbtn" class="btn btn-primary btn-lg btn-block" value="insert">등록</button>
		          </form>
		        </div>
            </article>
        </section>
        <div id="plusdiv" class="section col-md-auto ml-sm-auto col-lg-2 px-md-4"></div>
        
</body>
</html>