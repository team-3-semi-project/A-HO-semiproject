<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<meta charset="UTF-8">
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  	<title>A-HO</title>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/event.js"></script>
</head>  
<body>
  <jsp:include page="../../common/header.jsp"/>
  <!-- --------------------------------------------------------------------------------------------- -->

  <main class="container-fluid">
    <div class="row">
    
		<jsp:include page="../mypage-side.jsp"></jsp:include>        

        <div class="col-sm-9">
          <div class="col-sm-1"></div>
          <div class="card col-sm-9">
            <div class="card-body">
              <h2 class="card-title">내 정보</h2><br><br>
              <form action="${ pageContext.servletContext.contextPath }/mypage/accountUpdate" method="POST">
                  <div class="col-sm-7">
                    <label for="userId">아이디</label>  
                    <input type="text" class="form-control" id="userId" name="userId" value="${ requestScope.userId }" readonly>
                    <br>
                    <label for="pw">비밀번호 <sub>&nbsp;&nbsp;영문 대 소문+숫자+특수문자 8~12자리</sub> </label>  
                    <input type="password" class="form-control" id="password" name="pw" value="" required>
                    <label class="password-error" id="password-error"></label>
                    <input type="password" class="form-control" name="passwordCheck" id="passwordCheck" value="" placeholder="비밀번호 확인" required="required">
                    <label class="passwordchek-error" id="passwordchek-error"></label>
                    <br>
                    <hr>
                    <label for="name">이름 <sub>&nbsp;&nbsp;한글로 입력</sub></label>  
                    <input type="text" class="form-control" id="name" name="name" value="${ requestScope.userName }" required>
                    <label class="name-error" id="name-error"></label>
                    <br>
                    <label for="email">이메일 <sub>&nbsp;&nbsp;예)user01@greedy.com</sub></label>  
                    <input type="text" class="form-control" id="email" name="email" value="${ requestScope.userEmail }" required>
                    <label class="email-error" id="email-error"></label>
                    <br>
                    <label for="birthday">생년월일</label>  
                    <input type="date" class="form-control" id="bday" name="birthday" value="${ requestScope.userBirth }" required>
                    <br>
                    <label for="phone">전화번호 <sub>&nbsp;&nbsp; '-' 없이 입력</sub></label>  
                    <input type="text" class="form-control" id="phone" name="phone" value="${ requestScope.userPhone }" required>
                    <label class="phone-error" id="phone-error"></label>
                    <br><br>
                  </div>
                  <div class="text-right">
                    <br><br>
                    <button type="submit" id="accountUpdatebtn" class="btn btn-warning" onclick="location.href='${ pageContext.servletContext.contextPath }/mypage/accountSelect'">수정하기</button>&nbsp;&nbsp;
                    <a href="${ pageContext.servletContext.contextPath }/mypage/accountDeleteCheck"><button type="button" class="btn btn-danger">탈퇴하기</button></a>&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
                  </div>
              </form>
            </div>
            <script>
      		var pwFlag = false;
      		var nameFlag = false;
      		var emailFlag = false;
      
      
      		$("#accountUpdatebtn").click(function() {
  	  		} if(!pwFlag) {
  				alert('패스워드가 형식에 알맞지 않습니다. 다시 입력해주세요');
  	  		} else if(!nameFlag) {
  				alert('이름이 형식에 알맞지 않습니다. 다시 입력해주세요');  
  	  		} else if(!phoneFlag) {
  				alert('핸드폰번호가 형식에 알맞지 않습니다. 다시 입력해주세요');
  	  		} else if(!emailFlag) {
  				alert('이메일이 형식에 알맞지 않습니다. 다시 입력해주세요');
  	  		} else {
  				document.getElementById("signup-form").submit();
  	  		}
  		  
    		});
      </script>
          </div>
        </div>
      </div>
  </main>

  <!-- --------------------------------------------------------------------------------------------- -->
  <jsp:include page="../../common/footer.jsp"/>
</body>
</html>