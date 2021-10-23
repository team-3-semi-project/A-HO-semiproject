<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">
<title>아이디 찾기 | A-HO HOTEL</title>
</head>
<body>
	<section>
        <div class="main text-center">
            <a class="blog-header-logo text-dark" href="${ pageContext.servletContext.contextPath }" id="mainLogo">A-HO</a>
            <br><br><br>
            <h2 class="idfind-text" id="idfind">아이디 찾기</h2>
            <form class="idfind-form" action="#" method="POST">
                <input required type="text" name="email" id="email" class="form-control" placeholder="이메일 주소 입력" autofocus>
                <label id="idfind-label">이메일 주소를 통해 본인확인을 해주세요</label>
                <div class="submit">
                    <button type="submit" id="findidbtn" class="btn btn-primary btn-lg btn-block" value="이메일 요청">요청 보내기</button>
                    <label class="error" id="error"></label>
                </div>
            </form>
        </div>
    </section>
    
     <script>
    $('#findidbtn').click(function() {
		const useremail = $('#email').val();
		
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/user/findid",
			type: "post",
			data: { email : useremail },
			success: function(data) {
				if(data == "입력하신 이메일로 해당 아이디를 보내드렸습니다. 확인 부탁드립니다.") {
					alert(data);
					location.replace("${ pageContext.servletContext.contextPath }/user/login");
				} else {
					alert(data);
					window.location.href = '${ pageContext.servletContext.contextPath }/user/findid';
				}
			},
			error: function(request, status, error){
				alert("code:" + request.status + "\n" 
						+ "message:" + request.responseText + "\n"
						+ "error:" + error);
			}
			
		})
	});
    
    </script>
    
</body>
</html>