$('#tel').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this);
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 3) {
            $text.val($text.val() + '-');
        }
        if ($text.val().length === 8) {
            $text.val($text.val() + '-');
        }
    }
 
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
});

const items = document.querySelectorAll('.question');

  function openCloseAnswer() {
    const answerId = this.id.replace('que', 'ans');

    if(document.getElementById(answerId).style.display === 'block') {
      document.getElementById(answerId).style.display = 'none';
      document.getElementById(this.id + '-toggle').textContent = '∧';
//      document.getElementById(this.id + '-toggle').textContent = '+';
    } else {
      document.getElementById(answerId).style.display = 'block';
      document.getElementById(this.id + '-toggle').textContent = '∨';
//      document.getElementById(this.id + '-toggle').textContent = '-';
    }
  }

  items.forEach(item => item.addEventListener('click', openCloseAnswer));
//===============================
//$("#create-btn").click(function inCheck(f){
function inCheck(f){
	if(f.id.value.length==0){
		alert("닉네임을 입력하세요");
		f.id.focus();
		return false;
	}
	if(f.password.value.length==0){
		alert("비밀번호를 입력하세요");
		f.password.focus();
		return false;
	}
	if(f.repassword.value.length==0){
		alert("비밀번호를 확인하세요");
		f.repassword.focus();
		return false;
	}
	if(f.password.value != f.repassword.value){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		f.password.value="";
		f.repassword.value="";
		f.password.focus();
		return false;
	}
	if(f.mname.value.length==0){
		alert("이름을 입력하세요");
		f.mname.focus();
		return false;
	}
	if(f.email.value.length==0){
		alert("이메일을 입력하세요");
		f.email.focus();
		return false;
	}
	
};  
//==================================
$(function(){
	var isCertification = false;
	var key = "";
$(".sendMail").click(function() {// 메일 입력 유효성 검사
		var email = $("#email").val(); //사용자의 이메일 입력값. 
		
		if (email == "") {
			alert("메일 주소가 입력되지 않았습니다.");
		} else {
			email = $("#email").val();
			console.log(email); //셀렉트 박스에 @뒤 값들을 더함.
			$.ajax({
				type : 'post',
				url : '/CheckMail',
				dataType:'json',
				async :"false",
				data : {
					email : email
					},
				success : function(data) {
					console.log("$$$$$$$$$");
					console.log("###::"+data);
					console.log(data.key);
					key = data;
				}
			});
			alert("해당 이메일로 인증번호가 전송되었습니다.");
//			$(".compare").css("display", "block");
//			$(".compare-text").css("display", "block");		
		}
	});
	

$(".compare").on("propertychange change keyup paste input", function() {
		if ($(".compare").val() == key) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
			$("#sendMail").attr('value','인증 완료')
			.css({"background-color":"#191A45","color":"white","font-weight":"bold","pointer-events":"none",
				  "width":"100px"});
//			$(".compare-text").text("인증 성공!").css("color", "black");
			isCertification = true;  //인증 성공여부 check
		} else {
			$("#sendMail").attr('value','인증코드 전송');
//			$(".compare-text").text("불일치!").css("color", "red");
			isCertification = false; //인증 실패
		}
	});

$("#create-btn").click(function submitCheck(){
	if (isCertification == false) {
		alert("메일 인증이 완료되지 않았습니다.");
		return false;
	} else{
		return true;
	}
	});
});