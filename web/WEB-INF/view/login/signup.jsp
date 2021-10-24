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
<title>회원가입</title>
</head>
<body>
    <section>
        <div class="main">
        	<div class="text-center">
        		<a class="mainlogo blog-header-logo text-dark" href="${ pageContext.servletContext.contextPath }" id="mainLogo">A-HO</a>
        	</div>
          <br>
          <h2 class="signup-text">회원 가입</h2>
          <br>
          <form class="signup-form" id="signup-form" action="${ pageContext.servletContext.contextPath }/user/signup" method="POST">
          	<div class="idcheck-form">
              <input required type="text" name="id" id="id" class="form-control" placeholder="사용할 ID 입력" autofocus/>
              <button class="btn btn-primary" name="idbtn" id="idchekbtn" type="button">중복확인</button>
              <label class="id-error" id="id-error"></label>
            </div>
            <br>
            <input required type="password" name="pw" id="password" class="form-control" placeholder="패스워드 (영문 대 소문+숫자+특수문자 8~12자리)">
            <label class="password-error" id="password-error"></label>
            <br>
            <input required type="password" name="passwordCheck" id="passwordCheck" class="form-control" placeholder="패스워드 재입력">
            <label class="passwordchek-error" id="passwordchek-error"></label>
            <br>
            <input required type="text" name="name" id="name" class="form-control" placeholder="이름(한글만)">
            <label class="name-error" id="name-error"></label>
            <br>
            <input required type="text" name="birthday" id="birthday" class="form-control" placeholder="생년월일(8자)">
            <label class="birthday-error" id="birthday-error"></label>
            <br>
            <input required type="text" name="phone" id="phone" class="form-control" placeholder="휴대폰 번호 '-' 없이 입력" maxlength="13">
            <label class="phone-error" id="phone-error"></label>
            <br>
            <input required type="text" name="email" id="email" class="form-control" placeholder="이메일   예)user01@greedy.com">
            <label class="email-error" id="email-error"></label>
            <div id="gender">
                <p style="float: left;">성별 : </p>
                <div style="float: left; margin-left: 4em;">
                    <input type="radio" name="gender" id="male" value="남" class="gender m-0" checked>
                    <label for="male">남자</label>
                </div>
                <div>
                    <input type="radio" name="gender" id="female" value="여" class="gender">
                    <label for="female">여자</label>
                </div>
            </div>
            <br>
            <h5>이용약관</h5>
            <textarea readonly>제 1 조 (목적)본 약관은A-HO(이하 "회사")이 운영하는 웹사이트(이하 "사이트")에서 제공하는 인터넷 관련 서비스를 이용함에 있어, 사이트와 회원 간의 이용 조건 및 제반 절차, 기타 필요한 사항을 규정함을 목적으로 한다. 제 2 조 (용어의 정의) 이 약관에서 사용하는 용어의 정의는 아래와 같다. 1."사이트"라 함은 "회사"가 서비스를 "회원"에게 제공하기 위하여 컴퓨터 등 정보 통신 설비를 이용하여 설정한 가상의 영업장 또는 "회사"가 운영하는 웹사이트를 말한다. "서비스"라 함은 "회사"가 운영하는 사이트를 통해 개인이 등록한 자료를 관리하여 기업 정보를 제공하는 서비스, 구직 등의 목적으로 등록하는 자료를 DB화하여 각각의 목적에 맞게 분류 가공, 집계하여 정보를 제공하는 서비스와 사이트에서 제공하는 모든 부대 서비스를 말한다. "회원"이라 함은 서비스를 이용하기 위하여 동 약관에 동의하거나 페이스북 등 연동 된 서비스를 통해 "회사"와 이용 계약을 체결한 "개인회원"을 말한다. "아이디"라 함은 회원의 식별과 회원의 서비스 이용을 위하여 "회원"이 가입 시 사용한 이메일 주소를 말한다. "비밀번호"라 함은 "회사"의 서비스를 이용하려는 사람이 아이디를 부여 받은 자와 동일인임을 확인하고 "회원"의 권익을 보호하기 위하여 "회원"이 선정한 문자와 숫자의 조합 또는 이와 동일한 용도로 쓰이는 “사이트”에서 자동 생성된 인증코드를 말한다. "비회원"이라 함은 "회원"에 가입하지 않고 "회사"가 제공하는 서비스를 이용하는 자를 말한다. 제 3 조 (약관의 명시와 개정) "회사"는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처 등을 "회원"이 알 수 있도록 초기 화면에 게시하거나 기타의 방법으로 "회원"에게 공지해야 한다. "회사"는 약관의규제등에관한법률, 전기통신기본법, 전기통신사업법, 정보통신망이용촉진등에관한법률, 개인정보보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있다. "회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 그 개정약관의 적용일자 7일 전부터 적용일자 전일까지 공지한다. 단 "회원"의 권리, 의무에 중대한 영향을 주는 변경의 경우에는 적용일자 30일 전부터 공지하도록 한다. "회원"은 변경된 약관에 대해 거부할 권리가 있다. "회원"은 변경된 약관이 공지된 지 15일 이내에 거부의사를 표명할 수 있다. "회원"이 거부하는 경우 본 서비스 제공자인 "회사"는 15일의 기간을 정하여 "회원"에게 사전 통지 후 당해 "회원"과의 계약을 해지할 수 있다. 만약, "회원"이 거부의사를 표시하지 않거나, 전항에 따라 시행일 이후에 "서비스"를 이용하는 경우에는 동의한 것으로 간주한다. 제 4 조 (약관의 해석) 이 약관에서 규정하지 않은 사항에 관해서는 약관의규제등에관한법률, 전기통신기본법, 전기통신사업법, 정보통신망이용촉진등에관한법률 등의 관계법령에 따른다. "회원"이 "회사"와 개별 계약을 체결하여 서비스를 이용하는 경우에는 개별 계약이 우선한다. 제 5 조 (이용계약의 성립) “회사”는 "회사"의 서비스를 이용하고자 하는 자가 본 약관과 개인정보취급방침을 읽고 이에 대하여 "동의" 또는 "확인" 버튼을 누르는 경우 이를 서비스 이용에 대한 신청으로 간주한다. 제 6 조 (이용신청의 승낙과 제한) "회사"는 전조의 규정에 의한 이용신청 고객에 대하여 업무수행 상 또는 기술상 지장이 없는 경우에는 원칙적으로 접수 순서에 따라 서비스 이용을 승낙한다. "회사"는 아래 사항에 해당하는 경우에 대해서는 이용 신청을 승낙하지 아니하며, 추후 아래 사항에 해당함이 확인된 경우 “회사”는 이용계약을 해지한다.  가. 실명이 아니거나 타인의 명의를 이용하여 신청한 경우  나. 이용계약 신청서의 내용을 허위로 기재한 경우  다. 만 15세 미만의 아동이 신청한 경우 "회사"는 아래 사항에 해당하는 경우에는 그 신청에 대하여 승낙 제한 사유가 해소될 때까지 승낙을 유보할 수 있다.   가. "회사"가 설비의 여유가 없는 경우   나. "회사"의 기술상 지장이 있는 경우   다. 기타"회사"의 귀책사유로 이용승낙이 곤란한 경우 제 7 조 (서비스 이용시간) "회사"는 특별한 사유가 없는 한 연중무휴, 1일 24시간 서비스를 제공한다. 다만, "회사"는 서비스의 종류나 성질에 따라 제공하는 서비스 중 일부에 대해서는 별도로 이용시간을 정할 수 있으며, 이 경우 "회사"는 그 이용시간을 사전에 "회원"에게 공지 또는 통지하여야 한다. "회사"는 자료의 가공과 갱신을 위한 시스템 작업시간, 장애해결을 위한 보수작업 시간, 회선 장애 등이 발생한 경우 일시적으로 서비스를 중단할 수 있으며 계획된 작업의 경우 공지란에 서비스 중단 시간과 작업 내용을 알려야 한다. 다만, "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있다. 제 9 조 (서비스 제공의 중지) "회사"는 다음 각호에 해당하는 경우 서비스의 제공을 중지할 수 있다. 설비의 보수 등 "회사"의 필요에 의해 사전에 "회원"들에게 통지한 경우 기간통신사업자가 전기통신서비스 제공을 중지하는 경우 기타 불가항력적인 사유에 의해 서비스 제공이 객관적으로 불가능한 경우 제 10 조 (회사의 의무) "회사"는 본 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다해야 한다. "회사"는 서비스와 관련한 "회원"의 불만사항이 접수되는 경우 이를 즉시 처리하여야 하며, 즉시 처리가 곤란한 경우에는 그 사유와 처리일정을 서비스 화면 또는 기타 방법을 통해 동 "회원"에게 통지하여야 한다. 천재지변 등 예측하지 못한 일이 발생하거나 시스템의 장애가 발생하여 서비스가 중단될 경우 이에 대한 손해에 대해서는 "회사"가 책임을 지지 않는다. 다만 자료의 복구나 정상적인 서비스 지원이 되도록 최선을 다할 의무를 진다. 제 11 조 (회원의 의무) "회원"은 관계법령과 본 약관의 규정 및 기타 "회사"가 통지하는 사항을 준수하여야 하며, 기타 "회사"의 업무에 방해되는 행위를 해서는 안 된다. "회원"은 서비스를 이용하여 얻은 정보를 "회사"의 사전동의 없이 복사, 복제, 번역, 출판, 방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없다. "회원"은 본 서비스를 기업정보 확인 및 건전한 취업이외의 목적으로 사용해서는 안되며 이용 중 다음 각 호의 행위를 해서는 안 된다. 가. 다른 회원의 아이디를 부정 사용하는 행위 나. 범죄행위을 목적으로 하거나 기타 범죄행위와 관련된 행위 다. 타인의 명예를 훼손하거나 모욕하는 행위 라. 타인의 지적재산권 등의 권리를 침해하는 행위 마. 해킹행위 또는 바이러스의 유포 행위 바. 타인의 의사에 반하여 광고성 정보등 일정한 내용을 계속적으로 전송하는 행위 사. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있다고 판단되는 행위 아. 사이트의 정보 및 서비스를 이용한 영리행위 자. 그밖에 선량한 풍속, 기타 사회질서를 해하거나 관계법령에 위반하는 행위 제 12 조 (회원의 개인정보보호) "회사"는 "회원"의 개인정보보호를 위하여 노력해야 한다. "회원"의 개인정보보호에 관해서는 정보통신망이용촉진 및 정보보호 등에 관한 법률에 따르고, "사이트"에 "개인정보취급방침"을 고지한다. 제 13 조 (분쟁의 해결) "회사"와 "회원"은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 한다. 전항의 노력에도 불구하고, 동 분쟁에 관한 소송발생시 소송은 "회사"의 주소지 관할법원으로 한다.</textarea>
            <div class="custom-control custom-checkbox">
              <input required type="checkbox" class="custom-control-input" id="same-address">
              <label class="custom-control-label" id="checkbox-ok" for="same-address"> 이용약관 동의</label>
            </div>
  
            <br><br>
            <button type="button" id="signupbtn" class="btn btn-primary btn-lg btn-block" value="signup">회원가입</button>
          </form>
        </div>
      </section>
      
      <script>
      var idFlag = false;
      var pwFlag = false;
      var nameFlag = false;
      var birthFlag = false;
      var phoneFlag = false;
      var emailFlag = false;
      var checkFlag = false; 
      
      $("#idchekbtn").click(function() {
    	  var idExp = /^(?=.*[a-zA-Z])(?!=.*[$@$!%*?&])(?=.*[0-9]).{4,12}$/;
    	  const userid = $("#id").val();
    	  
          if(!idExp.test(document.getElementById("id").value)) {
            $("#id-error").text("영문,숫자를 포함한 4~12글자로 작성 해 주세요(영문 대소문자 구분)").css("color", "red");
            $("#id").val("").focus();
          } else {
        	  $.ajax({
  				
  				url: "${pageContext.servletContext.contextPath}/idcheck",
  				type: "get",
  				data: { id : userid },
  				success: function(data) {
  					if(data == "사용 가능한 아이디입니다.") {
  						$("#id-error").text(data).css("color", "green");
  						idFlag = true;
  					} else {
  						$("#id-error").text(data).css("color", "red");
  						$("#id").focus();
  					}
  				},
  				error: function(request, status, error){
  					alert("code:" + request.status + "\n" 
  							+ "message:" + request.responseText + "\n"
  							+ "error:" + error);
  				}
  			});	            
          }
		});
      
      $("#signupbtn").click(function() {
  	  if(!idFlag){
  		alert('아이디 중복확인을 진행해주세요');
  	  } else if(!pwFlag) {
  		alert('패스워드가 형식에 알맞지 않습니다. 다시 입력해주세요');
  	  } else if(!nameFlag) {
  		alert('이름이 형식에 알맞지 않습니다. 다시 입력해주세요');  
  	  } else if(!birthFlag) {
  		alert('생일이 형식에 알맞지 않습니다. 다시 입력해주세요');  
  	  } else if(!phoneFlag) {
  		alert('핸드폰번호가 형식에 알맞지 않습니다. 다시 입력해주세요');
  	  } else if(!emailFlag) {
  		alert('이메일이 형식에 알맞지 않습니다. 다시 입력해주세요');
  	  } else if(!checkFlag) {
  		alert('이용약관 동의를 하지 않았습니다.');
  	  } else {
  		document.getElementById("signup-form").submit();
  	  }
  		  
    });
      </script>
      
</body>
</html>