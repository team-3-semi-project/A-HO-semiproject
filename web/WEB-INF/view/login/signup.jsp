<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
    /* section */
    section {
    padding-top: 120px;
    }
    .main {
    width: 600px;
    margin-bottom: 5em;
    margin-left: auto;
    margin-right: auto;
    }
    .signup-text {
    text-align: center;
    font-weight: bold;
    }
    .logo {
    width: 15 0px;
    height: auto;
    }
    .id-error, .password-error, .name-error, .phone-error, .birthday-error .email-error {
    margin-top: 1px;
    font-size: 15px;
    }
    .signup-form > textarea {
    width: 100%;
    height: 10em;
    }
    .signup-form > h5 {
    text-align: left;
    font-weight: bold;
    }
    .gender {
        width: 15px;
        height: 15px;
    }
    #gender {
        text-align: center;
    }
    #id {
      width: 82%;
      float: left;
      margin-bottom: 20px;
      margin-right: 10px;
    }
    #idbtn {
      width: 100px;
      float: left;
    }
    textarea {
      width: 600px;
      height: 150px;
    }
</style>
<title>회원가입</title>
</head>
<body>
    <section>
        <div class="main">
          <img class="logo rounded mx-auto d-block" src="img/A-HO-icon.PNG">
          <br><br><br>
          <h2 class="signup-text">회원 가입</h2>
          <br>
          <form class="signup-form" action="${ pageContext.servletContext.contextPath }/user/signup" method="POST">
            <div class="idcheck-form">
              <input required type="text" name="id" id="id" class="form-control" placeholder="사용할 ID 입력" autofocus/>
              <button class="btn btn-primary" name="idbtn" type="button" onclick="idchecker()">중복확인</button>
              <label class="id-error" id="id-error"></label>
            </div>
            <br>
            <input required type="password" name="pw" id="password" class="form-control" placeholder="패스워드 (영문 대 소문+숫자+특수문자 8~12자리)">
            <br>
            <input required type="password" name="pwCheck" id="passwordCheck" class="form-control" placeholder="패스워드 재입력">
            <label class="password-error" id="password-error"></label>
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
            <textarea readonly>중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을 제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다.제3항의 승인을 얻지 못한 때에는 그 처분 또는 명령은 그때부터 효력을 상실한다. 이 경우 그 명령에 의하여 개정 또는 폐지되었던 법률은 그 명령이 승인을 얻지 못한 때부터 당연히 효력을 회복한다. 감사원의 조직·직무범위·감사위원의 자격·감사대상공무원의 범위 기타 필요한 사항은 법률로 정한다. 국가는 농수산물의 수급균형과 유통구조의 개선에 노력하여 가격안정을 도모함으로써 농·어민의 이익을 보호한다. 국가는 균형있는 국민경제의 성장 및 안정과 적정한 소득의 분배를 유지하고, 시장의 지배와 경제력의 남용을 방지하며, 경제주체간의 조화를 통한 경제의 민주화를 위하여 경제에 관한 규제와 조정을 할 수 있다. 선거와 국민투표의 공정한 관리 및 정당에 관한 사무를 처리하기 위하여 선거관리위원회를 둔다. 법관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니하며, 징계처분에 의하지 아니하고는 정직·감봉 기타 불리한 처분을 받지 아니한다.모든 국민은 고문을 받지 아니하며, 형사상 자기에게 불리한 진술을 강요당하지 아니한다. 대통령·국무총리·국무위원·행정각부의 장·헌법재판소 재판관·법관·중앙선거관리위원회 위원·감사원장·감사위원 기타 법률이 정한 공무원이 그 직무집행에 있어서 헌법이나 법률을 위배한 때에는 국회는 탄핵의 소추를 의결할 수 있다. 공개하지 아니한 회의내용의 공표에 관하여는 법률이 정하는 바에 의한다. 제2항과 제3항의 처분에 대하여는 법원에 제소할 수 없다. 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며, 재판관은 대통령이 임명한다. 모든 국민은 신속한 재판을 받을 권리를 가진다. 형사피고인은 상당한 이유가 없는 한 지체없이 공개재판을 받을 권리를 가진다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 국교는 인정되지 아니하며, 종교와 정치는 분리된다. 국무총리는 국회의 동의를 얻어 대통령이 임명한다. 이 헌법시행 당시에 이 헌법에 의하여 새로 설치될 기관의 권한에 속하는 직무를 행하고 있는 기관은 이 헌법에 의하여 새로운 기관이 설치될 때까지 존속하며 그 직무를 행한다. 국무총리는 국무위원의 해임을 대통령에게 건의할 수 있다. 모든 국민은 법률이 정하는 바에 의하여 선거권을 가진다. 국민의 자유와 권리는 헌법에 열거되지 아니한 이유로 경시되지 아니한다. 대통령의 임기는 5년으로 하며, 중임할 수 없다. 재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다. 대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다. 평화통일정책의 수립에 관한 대통령의 자문에 응하기 위하여 민주평화통일자문회의를 둘 수 있다. 누구든지 체포 또는 구속을 당한 때에는 적부의 심사를 법원에 청구할 권리를 가진다. 국가는 사회보장·사회복지의 증진에 노력할 의무를 진다. 모든 국민은 거주·이전의 자유를 가진다. 국민경제자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 국가안전보장회의는 대통령이 주재한다. 국군의 조직과 편성은 법률로 정한다. 타인의 범죄행위로 인하여 생명·신체에 대한 피해를 받은 국민은 법률이 정하는 바에 의하여 국가로부터 구조를 받을 수 있다. 학교교육 및 평생교육을 포함한 교육제도와 그 운영, 교육재정 및 교원의 지위에 관한 기본적인 사항은 법률로 정한다. 나는 헌법을 준수하고 국가를 보위하며 조국의 평화적 통일과 국민의 자유와 복리의 증진 및 민족문화의 창달에 노력하여 대통령으로서의 직책을 성실히 수행할 것을 국민 앞에 엄숙히 선서합니다. 대통령은 취임에 즈음하여 다음의 선서를 한다. 대통령은 법률이 정하는 바에 의하여 훈장 기타의 영전을 수여한다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다.</textarea>
            <div class="custom-control custom-checkbox">
              <input required type="checkbox" class="custom-control-input" id="same-address">
              <label class="custom-control-label" id="checkbox-ok" for="same-address"> 이용약관 동의</label>
            </div>
  
            <br><br>
            <button type="submit" class="btn btn-primary btn-lg btn-block" value="signup">회원가입</button>
          </form>
        </div>
      </section>
  
      <script>
        /* 정규표현식을 이용 */
        $("#id").change(function() {
          var idExp = /^(?=.*[a-zA-Z])(?!=.*[$@$!%*?&])(?=.*[0-9]).{4,12}$/;
  
          if(!idExp.test($(this).val())) {
            $("#id-error").text("영문,숫자를 포함한 4~12글자로 작성 해 주세요(영문 대소문자 구분)").css("color", "red");
            $(this).val("").focus();
          } else {
            $("#id-error").text("")
          }
        })
  
        $("#password").change(function() {
          var passwordEmp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,16}/;
  
          if(!passwordEmp.test($(this).val())) {
            $("#password-error").text("영문, 숫자, 특수문자를 포함한 8~16글자로 작성 해 주세요(영문 대소문자 구분)").css("color", "red");
            $(this).focus();
          }else {
            $("#password-error").text("");
          }
        })
  
        $("#passwordCheck").change(function() {
          if ($("#password").val() != $(this).val()) {
            $("#password-error").text("비밀번호가 일치하지 않습니다.").css("color", "red");
            $(this).focus();
          } else {
            $("#password-error").text("");
          }
        })
  
        $("#name").change(function() {
  
          /* 한글자만 최소 2자 이상 */
          var nameExp = /^[가-힣]{2,}$/;
  
          if (!nameExp.test($(this).val())) {       // 사용자가 한글 2자 이상을 여겼을 때
              $("#name-error").text("한글로 2자 이상 입력하세요").css("color", "red");
              $(this).val("").focus();
          } else {
              $("#name-error").text("");
              $(this).css("background", "white");
          }
        })

        $("#birthday").change(function() {

          /* 1900 년대 또는 2000 년대생 이면서, 1월~12월 사이 1일~31일 사이 */
          var birthdayExp = /^(19|20)[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

          if (!birthdayExp.test($(this).val())) {       // 사용자가 한글 2자 이상을 여겼을 때
                $("#birthday-error").text("올바르지 않은 생년월일입니다.").css("color", "red");
                $(this).val("").focus();
          } else {
                $("#birthday-error").text("");
                $(this).css("background", "white");
          }
        })
  
        $("#phone").change(function() {
          // var phoneExp = /^[0-9]{11}$/;    // - 없이
          var phoneExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;   // - 포함
  
          if(!phoneExp.test($(this).val())) {
            $("#phone-error").text("올바르지 않은 휴대폰 번호입니다.").css("color", "red");
            $(this).focus();
          }else {
            $("#phone-error").text("");
          }
        })
  
        $("#email").change(function() {
          var emailExp = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/
  
          if(!emailExp.test($(this).val())) {
            $("#email-error").text("올바르지 않은 이메일입니다.").css("color", "red");
            $(this).focus();
          }else {
            $("#email-error").text("");
          }
        })

        /* 휴대전화 하이픈 자동 입력 */
        function autoHypenPhone(str){
            str = str.replace(/[^0-9]/g, '');
            var tmp = '';
            if( str.length < 4){
                return str;
            }else if(str.length < 7){
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3);
                return tmp;
            }else if(str.length < 11){
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 3);
                tmp += '-';
                tmp += str.substr(6);
                return tmp;
            }else{              
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 4);
                tmp += '-';
                tmp += str.substr(7);
                return tmp;
            }
            return str;
        }

        var cellPhone = document.getElementById('phone');
        cellPhone.onkeyup = function(event){
                event = event || window.event;
                var _val = this.value.trim();
                this.value = autoHypenPhone(_val) ;
        }
        
        function idcheker() {
        	
        	if ($('#id').val() == '') {
        	      alert('아이디를 입력해주세요.')
        	      return;
        	    }
        	
        	id_overlap_input = document.querySelector('input[name="id"]');
        	
        	$.ajax({
        	      url: "{% url 'lawyerAccount:id_overlap_check' %}",
        	      data: {
        	        'id': id_overlap_input.value
        	      },
        	      datatype: 'json',
        	
        	
		}
      </script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

</body>
</html>