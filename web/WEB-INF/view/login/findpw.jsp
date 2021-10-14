<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/js/event.js"></script>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">
<title>비밀번호 찾기 | A-HO HOTEL</title>
</head>
<body>
	<section>
		<article id="findpw">
			<div class="main text-center">
	            <a class="blog-header-logo text-dark" href="${ pageContext.servletContext.contextPath }" id="mainLogo">A-HO</a>
	            <br><br>
	            <h2 class="passwordfind-text" id="passwordfind">비밀번호 찾기</h2>
	            <form class="passwordfind-form" action="#" method="POST">
	                <input required type="text" name="id" id="findpwid" class="form-control" placeholder="아이디 입력">
	                <label id="passwordfind-label">아이디에 등록된 이메일로 인증번호가 발송됩니다.</label>
	                <div class="submit">
	                    <button type="button" id="findpwbtn" class="btn btn-primary btn-lg btn-block" value="이메일 요청">요청 보내기</button>
	                </div>
	            </form>
	        </div>
		</article>
        <article id="inputcode">
	        <div class="main text-center">
	            <a class="blog-header-logo text-dark" href="${ pageContext.servletContext.contextPath }" id="mainLogo">A-HO</a>
	            <br><br>
	            <h2 class="passwoerdcode-text" id="passwordfind">비밀번호 찾기</h2>
	            <form class="passwoerdcode-form" action="#" method="POST">
	                <input required type="text" name="passwoerdcode" id="passwoerdcode" class="form-control" placeholder="인증코드 입력">
	                <label id="passwoerdcode-label">이메일에 발송된 인증코드(10자)를 입력하세요</label>
	                <div class="submit">
	                    <button type="button" id="codebtn" class="btn btn-primary btn-lg btn-block" value="이메일 요청">인증코드 인증</button>
	                </div>
	            </form>
	        </div>
    	</article>
    	<article id ="resetpassword">
    		<div class="main">
	        	<div class="text-center">
	        		<a class="mainlogo blog-header-logo text-dark" href="${ pageContext.servletContext.contextPath }" id="mainLogo">A-HO</a>
	        	</div>
		        <br>
		        <h2 class="signup-text">비밀번호 재설정</h2>
		        <br>
		        <form class="resetpassword-form" id="resetpassword-form" action="${ pageContext.servletContext.contextPath }/user/resetpassword" method="POST">
		          <input required type="password" name="pw" id="password" class="form-control" placeholder="패스워드 (영문 대 소문+숫자+특수문자 8~12자리)">
		          <label class="password-error" id="password-error"></label>
		          <br>
		          <input required type="password" name="passwordCheck" id="passwordCheck" class="form-control" placeholder="패스워드 재입력">
		          <label class="passwordchek-error" id="passwordchek-error"></label>
		          <br>
		          <input type="hidden" name="userid" class="form-control" value=""/>
		          <button type="button" id="resetpasswordbtn" class="btn btn-primary btn-lg btn-block" value="resetpassword">비빌번호 재설정</button>
		        </form>
        	</div>
    	</article>
    </section>
    
    
    <script>
    $("#inputcode").hide();
    $("#resetpassword").hide();
    var code = null;
    var pwFlag = false;
	var pwCheckFlag = false;
	var userid = null;
    
    $('#findpwbtn').click(function() {
    	userid = $('#findpwid').val();
	
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/user/findpw",
			type: "post",
			data: { id : userid },
			success: function(data) {
				if(data == "입력하신 아이디는 존재하지 않습니다.") {
					alert(data);
					window.location.href = '${ pageContext.servletContext.contextPath }/user/findpw';
				} else {
					$("#inputcode").show();
					$("#findpw").hide();
					code = data;
					console.log(code);
				}
			},
			error: function(request, status, error){
				alert("code:" + request.status + "\n" 
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
		});
    });
    
    $("#codebtn").click(function() {
    	const passwoerdcode = $('#passwoerdcode').val();
    	
    	if(passwoerdcode == code) {
    		$("#inputcode").hide();
    		$("#resetpassword").show();
    		    		
    	} else {
    		alert("인증코드가 일치하지 않습니다. 다시 인증 부탁드립니다.");
    		window.location.href = '${ pageContext.servletContext.contextPath }/user/login';
    	}
	}); 
	
	$("#resetpasswordbtn").click(function() {
		if(pwFlag && pwCheckFlag) {
			alert("비밀번호가 재설정 되었습니다.")
			$('input[name=userid]').attr('value', userid);
			$("#resetpassword-form").submit();
		} else {
			alert("비밀번호 형식이 일치하지 않습니다. 다시 입력 해주세요");
		}
	});
    
    </script>
</body>
</html>