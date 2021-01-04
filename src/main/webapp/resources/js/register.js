//모든공백 정규
var empJ = /\s/g;
//아이디 정규식
var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
//패스워드 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;
// 이름 정규식 
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 이메일 검사 정규식 
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰 번호 정규식 
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

var birthJ = false;
var emailAuthKey;


$(document).ready(function () {
	var address = $('#member_secondaddr');


	$('.authkeyhide').hide();
	
	//이메일 인증 관련

//이메일 인증 보내기


//이메일 인증하고 인증키랑 같다면 레지스터 아니라면 가입안됨
	$('#authkeysend').click(function(){
		var email = $('#member_email').val();
		if (mailJ.test(email)) {
				$.ajax({
					type:"post",
					url :"varifyemail.do?email="+email,
					contentType : "application/json",
					success:function(msg){
							$('.authkeyhide').show();
							timer();
							$('#authkeysend').attr('disabled',true);
							$('#authkey').attr('disabled',false);
						alert('인증번호를 입력해 주세요.');
						emailAuthKey = msg.authkey;
						
			},
			error:function(err){
				alert(err);
			}
	
		});
			
        } else {
           alert('이메일을 입력해주세용!')
        }
	   
	
	});
	 $('#authkey').blur(function () {
		console.log(emailAuthKey)
		console.log($('#authkey').val())
        if (emailAuthKey == $('#authkey').val()) {
            console.log('true');
            $('#auth_check').text('인증되었습니다.');
			$('#authkeycheck').val("true");
        } else {
            console.log('false');
            $('#auth_check').text('인증번호가 맞지않습니다. 다시 시도해주세요 .');
            $('#auth_check').css('color', 'red');
        }
    });
	
  	 //아이디 중복확인 
    $("#idchk").click(function () {
        if ($('#member_id').val() == '') {
            $('#id_check').text('아이디를 입력하세요.');
            $('#id_check').css('color', 'red');
        } else if (idJ.test($('#member_id').val()) != true) {
            $('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
            $('#id_check').css('color', 'red');
        } else if ($('#member_id').val() != '') {
            var member_id = $('#member_id').val();
console.log(member_id);
            $.ajax({
				
                type: 'POST',
                url: 'idcheck.do?member_id='+member_id,
                contentType: "application/json",
                success: function (msg) {
                    if (msg.value>0) {
                        $('#id_check').text('중복된 아이디 입니다.');
                        $('#id_check').css('color', 'red');
                        $("#usercheck").attr("disabled", true);
                    } else {
                        if (idJ.test(member_id)) {
                            $('#id_check').text('사용가능한 아이디 입니다.');
                            $('#id_check').css('color', 'blue');
                            $("#usercheck").attr("disabled", false);
                        } else if (member_id == '') {
                            $('#id_check').text('아이디를 입력해주세요.');
                            $('#id_check').css('color', 'red');
                            $("#usercheck").attr("disabled", true);
                        } else {
                            $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
                            $('#id_check').css('color', 'red');
                            $("#usercheck").attr("disabled", true);
                        }
                    }
                }
            }); //ajax/// 
        } //else if 
    }); //blur 
    $('form').on('submit', function () {
        var inval_Arr = new Array(8).fill(false);
        if (idJ.test($('#member_id').val())) {
            inval_Arr[0] = true;
        } else {
            inval_Arr[0] = false;
            alert('아이디를 확인하세요.');
            return false;
        }
        // 비밀번호가 같은 경우 && 비밀번호 정규식 
        if (($('#member_pw').val() == ($('#member_pw2').val())) && pwJ.test($('#member_pw').val())) {
            inval_Arr[1] = true;
        } else {
            inval_Arr[1] = false;
            alert('비밀번호를 확인하세요.');
            return false;
        }
        // 이름 정규식 
        if (nameJ.test($('#member_name').val())) {
            inval_Arr[2] = true;
        } else {
            inval_Arr[2] = false;
            alert('이름을 확인하세요.');
            return false;
        }
        // 생년월일 정규식 
        if (birthJ) {
            console.log(birthJ);
            inval_Arr[3] = true;
        } else {
            inval_Arr[3] = false;
            alert('생년월일을 확인하세요.');
            return false;
        }
        // 이메일 정규식 
        if (mailJ.test($('#member_email').val())) {
            console.log(phoneJ.test($('#member_email').val()));
            inval_Arr[4] = true;
        } else {
            inval_Arr[4] = false;
            alert('이메일을 확인하세요.');
            return false;
        }
        // 휴대폰번호 정규식 
        if (phoneJ.test($('#member_phone').val())) {
            console.log(phoneJ.test($('#member_phone').val()));
            inval_Arr[5] = true;
        } else {
            inval_Arr[5] = false;
            alert('휴대폰 번호를 확인하세요.');
            return false;
        }
       
        //주소확인 
        if (address.val() == '') {
            inval_Arr[6] = false;
            alert('주소를 확인하세요.');
            return false;
        } else inval_Arr[6] = true;
     
		if($('#authkeycheck'.val()=='false'||$('#authkey').val().trim()=="")){
			inval_Arr[7] =false;
			alert('이메일 인증을 해주세요');
			return false;
		}else{
			inval_Arr[7] = true;
		}
		
		   //전체 유효성 검사 
        var validAll = true;
        for (var i = 0; i < inval_Arr.length; i++) {
            if (inval_Arr[i] == false) {
                validAll = false;
            }
        }

        if (validAll == true) {
            // 유효성 모두 통과 
            alert('감사합니다.');
        } else {
            alert('정보를 다시 확인하세요.')
        }
    });

    $('#member_id').blur(function () {
        if (idJ.test($('#member_id').val())) {
            console.log('true');
            $('#id_check').text('');
        } else {
            console.log('false');
            $('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
            $('#id_check').css('color', 'red');
        }
    });
    $('#member_pw').blur(function () {
        if (pwJ.test($('#member_pw').val())) {
            console.log('true');
            $('#pw_check').text('');
        } else {
            console.log('false');
            $('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
            $('#pw_check').css('color', 'red');
        }
    });
    //1~2 패스워드 일치 확인 
    $('#member_pw2').blur(function () {
        if ($('#member_pw').val() != $(this).val()) {
            $('#pw2_check').text('비밀번호가 일치하지 않습니다.');
            $('#pw2_check').css('color', 'red');
        } else {
            $('#pw2_check').text('비밀번호가 일치합니다.');
        }
    });
    //이름에 특수문자 들어가지 않도록 설정 
    $("#member_name").blur(function () {
        if (nameJ.test($(this).val())) {
            console.log(nameJ.test($(this).val()));
            $("#name_check").text('');
        } else {
            $('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
            $('#name_check').css('color', 'red');
        }
    });
    $("#member_email").blur(function () {
        if (mailJ.test($(this).val())) {
            $("#email_check").text('');
        } else {
            $('#email_check').text('이메일 양식을 확인해주세요.');
            $('#email_check').css('color', 'red');
        }
    });
    // 생일 유효성 검사 
    var birthJ = false;
    // 생년월일 birthJ 유효성 검사 
    $('#member_birthday').blur(function () {
        var dateStr = $(this).val();
        var year = Number(dateStr.substr(0, 4));
        // 입력한 값의 0~4자리까지 (연) 
        var month = Number(dateStr.substr(4, 2));
        // 입력한 값의 4번째 자리부터 2자리 숫자 (월) 
        var day = Number(dateStr.substr(6, 2));
        // 입력한 값 6번째 자리부터 2자리 숫자 (일) 
        var today = new Date();
        // 날짜 변수 선언 
        var yearNow = today.getFullYear();
        // 올해 연도 가져옴 
        if (dateStr.length <= 8) {
            // 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다. 
            if (year > yearNow || year < 1900) {
                $('#birth_check').text('생년월일을 확인해주세요');
                $('#birth_check').css('color', 'red');
            } else if (month < 1 || month > 12) {
                $('#birth_check').text('생년월일을 확인해주세요 ');
                $('#birth_check').css('color', 'red');
            } else if (day < 1 || day > 31) {
                $('#birth_check').text('생년월일을 확인해주세요 ');
                $('#birth_check').css('color', 'red');
            } else if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
                $('#birth_check').text('생년월일을 확인해주세요 ');
                $('#birth_check').css('color', 'red');
            } else if (month == 2) {
                var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
                if (day > 29 || (day == 29 && !isleap)) {
                    $('#birth_check').text('생년월일을 확인해주세요 ');
                    $('#birth_check').css('color', 'red');
                } else {
                    $('#birth_check').text('');
                    birthJ = true;
                }
            } else {
                $('#birth_check').text('');
                birthJ = true;
            }
            //end of if 
        } else {
            //1.입력된 생년월일이 8자 초과할때 : auth:false 
            $('#birth_check').text('생년월일을 확인해주세요 ');
            $('#birth_check').css('color', 'red');
        }
    }); //End of method 
    // 휴대전화 
    $('#member_phone').blur(function () {
        if (phoneJ.test($(this).val())) {
            console.log(nameJ.test($(this).val()));
            $("#phone_check").text('');
        } else {
            $('#phone_check').text('휴대폰번호를 확인해주세요 ');
            $('#phone_check').css('color', 'red');
        }
    });

	//이메일 인증 유효성 검사 	
	
	
});
//우편번호 찾기 버튼 클릭시 발생 이벤트 
function execPostCode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 
            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다. 
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
            var fullRoadAddr = data.roadAddress;
            // 도로명 주소 변수 
            var extraRoadAddr = '';
            // 도로명 조합형 주소 변수 
            // 법정동명이 있을 경우 추가한다. (법정리는 제외) 
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다. 
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다. 
            if (data.buildingName !== '' && data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다. 
            if (extraRoadAddr !== '') {
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다. 
            if (fullRoadAddr !== '') {
                fullRoadAddr += extraRoadAddr;
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다. 
            console.log(data.zonecode);
            console.log(fullRoadAddr);
            /* var a = console.log(data.zonecode); 
            var b = console.log(fullRoadAddr); 
            if(a == null || b = null){ 
                alert("주소를 확인하세요."); return false; }
                 */
            $("input[name=member_zipcode]").val(data.zonecode);
            $("input[name=member_firstaddr]").val(fullRoadAddr);
            document.getElementById('member_zipcode').value = data.zonecode;
            //5자리 새우편번호 사용 
            document.getElementById('member_firstaddr').value = fullRoadAddr;
            //document.getElementById('member_detailaddress').value = data.jibunAddress; 
        }
    }).open();
}


//시간제한

function timer(){
	//타이머 
 	var time = 240; //  4분시간 제한
 	var min = "";
 	var sec = ""; 
 	
 	//1초씩 실행되는 함수 
 	var x = setInterval(function(){
 		min = parseInt(time/60) ;//몫계산
 		sec1 = time%60;               //나머지 계산
		sec=(sec1==0|| sec1<10)? '0'+sec1: sec1;
 		
 		document.getElementById("countdown").innerHTML = min + ':' +sec ;
 		time--;
 		if(time<0){
 			clearInterval(x); 
 			document.getElementById("countdown").innerHTML = "인증시간이 초과되었습니다. 다시 시도해주세요.";
 			$('#authkey').attr("disabled",true);
			$('#authkeysend').attr("disabled",false);
	}
 	},1000);

}


