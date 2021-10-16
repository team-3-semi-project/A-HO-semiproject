window.onload=function(){
	
	/* 정규표현식을 이용 */
        $("#id").change(function() {
		  idFlag = false;	
          var idExp = /^(?=.*[a-zA-Z])(?!=.*[$@$!%*?&])(?=.*[0-9]).{4,12}$/;
  
          if(!idExp.test($(this).val())) {
            $("#id-error").text("영문,숫자를 포함한 4~12글자로 작성 해 주세요(영문 대소문자 구분)").css("color", "red");
            $(this).val("").focus();
          } else {
            $("#id-error").text("")
          }
        })
  
        $("#password").change(function() {
          var passwordEmp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!.%*?&])[A-Za-z\d$@$!.%*?&]{8,16}/;
  
          if(!passwordEmp.test($(this).val())) {
            $("#password-error").text("영문, 숫자, 특수문자를 포함한 8~16글자로 작성 해 주세요(영문 대소문자 구분)").css("color", "red");
            $(this).focus();
			pwFlag = false;
          }else {
            $("#password-error").text("");
			pwFlag = true;
          }
        })
  
        $("#passwordCheck").change(function() {
          if ($("#password").val() != $(this).val()) {
            $("#passwordchek-error").text("비밀번호가 일치하지 않습니다.").css("color", "red");
            $(this).focus();
			pwCheckFlag = false;
          } else {
            $("#passwordchek-error").text("");
			pwCheckFlag = true;
          }
        })
  
        $("#name").change(function() {
  
          /* 한글자만 최소 2자 이상 */
          var nameExp = /^[가-힣]{2,}$/;
  
          if (!nameExp.test($(this).val())) {       // 사용자가 한글 2자 이상을 여겼을 때
              $("#name-error").text("한글로 2자 이상 입력하세요").css("color", "red");
              $(this).val("").focus();
			  nameFlag=false;
          } else {
              $("#name-error").text("");
              $(this).css("background", "white");
			  nameFlag=true;
          }
        })

        $("#birthday").change(function() {

          /* 1900 년대 또는 2000 년대생 이면서, 1월~12월 사이 1일~31일 사이 */
          var birthdayExp = /^(19|20)[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

          if (!birthdayExp.test($(this).val())) {       // 사용자가 한글 2자 이상을 여겼을 때
                $("#birthday-error").text("올바르지 않은 생년월일입니다.").css("color", "red");
                $(this).val("").focus();
				birthFlag=false;
          } else {
                $("#birthday-error").text("");
                $(this).css("background", "white");
				birthFlag=true;
          }
        })
  
        $("#phone").change(function() {
          // var phoneExp = /^[0-9]{11}$/;    // - 없이
          var phoneExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;   // - 포함
  
          if(!phoneExp.test($(this).val())) {
            $("#phone-error").text("올바르지 않은 휴대폰 번호입니다.").css("color", "red");
            $(this).focus();
			phoneFlag=false;
          }else {
            $("#phone-error").text("");
			phoneFlag=true;
          }
        })
  
        $("#email").change(function() {
          var emailExp = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/
  
          if(!emailExp.test($(this).val())) {
            $("#email-error").text("올바르지 않은 이메일입니다.").css("color", "red");
            $(this).focus();
			emailFlag=false;
          }else {
            $("#email-error").text("");
			emailFlag=true;
          }
        })

		$("#same-address").change(function() {
			if($("#same-address").is(":checked")){
				checkFlag=true;
			} else {
				checkFlag=false;
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

	 	
		if(document.getElementsByTagName("td")) {
			
			const $tds = document.getElementsByTagName("td");
			for(let i = 0; i < $tds.length; i++) {
				
				$tds[i].onmouseenter = function() {
					this.parentNode.style.backgroundColor = "lightgrey";
					this.parentNode.style.cursor = "pointer";
				}
				
				$tds[i].onmouseout = function() {
					this.parentNode.style.backgroundColor = "white";
				}
			}
		}
	
		
	
}


		
        