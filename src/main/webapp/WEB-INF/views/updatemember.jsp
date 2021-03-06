<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업뎃창 </title>
<link rel="stylesheet" href="resources/css/updatemember.css">

</head>
<body>



	<!-- 팝업 시작 -->
	<div class="wrapper bg-white mt-sm-5" id="update_popup" style="display: none;">
    <h1 class="pb-4 border-bottom">회원정보 수정</h1>
    <div class="py-2">
        <div class="row py-2">
            <div class="col-md-6"> <label for="firstname">이름</label> <input type="text" class="bg-light form-control" id="member_name" name="member_name" value="${login.member_name }" readonly="readonly"> </div>
            <div class="col-md-6"> <label for="firstname">생년월일</label> <input type="text" class="bg-light form-control" id="member_birthday" name="member_birthday"  value= "${login.member_birthday }" > </div>
        </div>
        <div class="row py-2">
            <div class="col-md-6"> <label for="email">이메일 주소</label> <input type="text" class="bg-light form-control" id="member_email" name="member_email"  value="${login.member_email }"> </div>
            <div class="col-md-6 pt-md-0 pt-3"> <label for="phone">휴대폰번호</label> <input type="tel" class="bg-light form-control" id="member_phone" name="member_phone" value="${login.member_phone }"> </div>
        </div>
     	<div class="row py-2">
            <div class="col-md-6"> <label for="email">주소</label> <input type="text" class="bg-light form-control" placeholder="우편번호"  value= "${login.member_zipcode  }"name="member_zipcode" id="member_zipcode"  readonly="readonly">
            <button type="button" class="btn btn-outline-secondary" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button> </div>
              <div class="col-md-12"> <label for="phone">도로명 주소</label> <input type="tel" class="bg-light form-control" name="member_firstaddr" id="member_firstaddr"  readonly="readonly" value="${login.member_firstaddr }"> </div>
            <div class="col-md-12"> <label for="phone">상세 주소</label> <input type="tel" class="bg-light form-control" name="member_secondaddr" id="member_secondaddr" value="${login.member_secondaddr }"> </div>
        </div>
 
        <div class="py-3 pb-4 border-bottom"> <button class="updatesubmitbtn btn btn-danger mr-3">정보 수정 저장</button> <button onclick="close_updatepopup();" class="btn border button">취소</button> </div>
        
    </div>
</div>
	<div class="update_background"></div>

	<script type="text/javascript">
	var member_name ,member_birthday,member_email,member_phone,member_zipcode,member_firstaddr,member_secondaddr;
	member_no= ${login.member_no};
	member_name = $('#member_name').val().trim();
	member_birthday= $('#member_birthday').val().trim();
	member_email = $('#member_email').val().trim();
	member_phone= $('#member_phone').val().trim();
	member_zipcode = $('#member_zipcode').val().trim();
	member_firstaddr=$('#member_firstaddr').val().trim();
		member_secondaddr=$('#member_secondaddr').val().trim();
	
	$('#member_name').val 
	
	var updateValue ={
			'member_no' : member_no,
			'member_name': member_name,
			'member_birthday': member_birthday,
			'member_email' :member_email ,
			'member_phone': member_phone, 
			'member_zipcode': member_zipcode, 
			'member_firstaddr': member_firstaddr,
			'member_secondaddr': member_secondaddr					
	};
	
	
	
		$('.updatesubmitbtn').click(function(){
			$.ajax({
				url: 'updatemember.do' ,
				type: 'POST',
				data : JSON.stringify(updateValue),
				contentType : "application/json",
				success: function(msg){
					if(msg.result=='OK'){
						alert('회원정보 수정 완료되었습니다. ');
					}else{
						alert('회원정보 하는 도중 문제가 발생하였네요..\n 다시 시도해 주세요 !')
					}
				},
				error: function(err){
					alert('업데이트 실패하였습니다.다시 시도해 주세요!');
				}
			});
		});
		
		//클릭시 팝업창 닫기
		function close_updatepopup(){
			$("#update_popup").hide();
			$('.update_background').hide();
		}
		

		var member_no = $("input[name='member_no']").val;
		function updatemember(){
			$("#update_popup").show();
			$('.update_background').show();
			
		}
		
		
	
		var empJ = /\s/g;
		// 이름 정규식 
		var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		// 이메일 검사 정규식 
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 휴대폰 번호 정규식 
		var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

		var birthJ = false;
		
		$('form').on('submit', function () {
		        var inval_Arr = new Array(4).fill(false);
		       
		      
		        // 생년월일 정규식 
		        if (birthJ) {
		            console.log(birthJ);
		            inval_Arr[0] = true;
		        } else {
		            inval_Arr[0] = false;
		            alert('생년월일을 확인하세요.');
		            return false;
		        }
		        // 이메일 정규식 
		        if (mailJ.test($('#member_email').val())) {
		            console.log(phoneJ.test($('#member_email').val()));
		            inval_Arr[1] = true;
		        } else {
		            inval_Arr[1] = false;
		            alert('이메일을 확인하세요.');
		            return false;
		        }
		        // 휴대폰번호 정규식 
		        if (phoneJ.test($('#member_phone').val())) {
		            console.log(phoneJ.test($('#member_phone').val()));
		            inval_Arr[2] = true;
		        } else {
		            inval_Arr[2] = false;
		            alert('휴대폰 번호를 확인하세요.');
		            return false;
		        }
		       
		        //주소확인 
		        if (address.val() == '') {
		            inval_Arr[3] = false;
		            alert('주소를 확인하세요.');
		            return false;
		        } else inval_Arr[3] = true;
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
		</script>


</body>
</html>

