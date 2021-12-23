function testVisibility() {
	$("#id_input").on("click", function() {
		$("#id_text").css("display", "block");
	})

	$("#pw_input").on("click", function() {
		$("#pw_txt").css("display", "block");
	})

	$("#pw2_input").on("click", function() {
		$("#pw2_txt").css("display", "block");
	})
}

function idCondition() {
	$("#id_input").keyup(function() {
		const uid = $("#id_input").val();

		if (!/^[a-zA-Z0-9]{6,16}$/.test(uid)) {
			$("#id_text1").css("color", "red");

			return false;
		} else {
			$("#id_text1").css("color", "green");
		}
	});
};

function pwCondition() {
	$("#pw_input").keyup(function() {

		var pw_val = $("#pw_input").val();
		var pattern = /\s/g;
		var num = pw_val.search(/[0-9]/g);
		var eng = pw_val.search(/[a-z]/ig);
		var spe = pw_val.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		var count = 0;

		count = num < 0 ? count + 1 : count;
		count = eng < 0 ? count + 1 : count;
		count = spe < 0 ? count + 1 : count;

		$("#pw_chk2").css("color", "black");

		if (pw_val.length < 10) {
			$("#pw_chk1").css("color", "red");
		} else {
			$("#pw_chk1").css("color", "green");
		}

		if (pw_val.match(pattern) || count >= 2) {
			$("#pw_chk2").css("color", "red");
		} else {
			$("#pw_chk2").css("color", "green");
		}
	});
}

function checkbox() {
	$("#check_all").change(function() {
		if ($("#check_all").is(":checked")) {
			$checklist.prop("checked", true);
		} else {
			$checklist.prop("checked", false);
		}
	});

	$("#check_4").change(function() {
		if ($("#check_4").is(":checked")) {
			$("#check_5").prop("checked", true);
			$("#check_6").prop("checked", true);
		} else {
			$("#check_5").prop("checked", false);
			$("#check_6").prop("checked", false);
		}
	});

	let $checklist = $("input[name=check]");
	let $checkAll = $("#check_all");

	$checklist.change(function() {
		if (!$(this).is(":checked")) {
			$checkAll.prop("checked", false);
		}
	});
};

function addressVisibility() {
	$("#address").click(function() {
		$("#sample6_postcode").css("display", "inline-block");
		$("#sample6_address").css("display", "inline-block");
		$("#sample6_detailAddress").css("display", "inline-block");

	});
};

function pwConfirm() {
	$("#pw_input").keyup(function() {
		let pwVal1 = $("#pw_input").val();
		let pwVal2 = $("#pw2_input").val();

		if (pwVal1 != pwVal2) {
			$("#pw2_txt").css("color", "red");
		} else {
			$("#pw2_txt").css("color", "black");
		}
	});

	$("#pw2_input").keyup(function() {
		let pwVal1 = $("#pw_input").val();
		let pwVal2 = $("#pw2_input").val();

		if (pwVal1 != pwVal2) {
			$("#pw2_txt").css("color", "red");
		} else {
			$("#pw2_txt").css("color", "green");
		}
	});

};

function idDupCheck() {
	let color = $("#id_text1").css("color");
	
	if (color == "rgb(255, 0, 0)") {
		alert("아이디는 6자 이상의 영문 혹은 영문과 숫자 조합만 가능합니다");
		$("#id_input").focus();
		return false;
	}

	let $idObj = $("#id_input");

	if ($idObj.val().trim() == "") {
		alert("아이디를 입력하세요");
		$idObj.focus();
		return false;
	}

	let ajaxUrl = "./idcheck";
	let ajaxMethod = "get";
	let idValue = $idObj.val().trim();
	$.ajax({
		url: ajaxUrl,
		method: ajaxMethod,
		data: { id: idValue },
		success: function(responseObj) {
			if (responseObj.status == 0) {
				alert("이미 사용중인 아이디입니다.");
			} else if (responseObj.status == 1) {
				alert("사용가능한 이이디입니다.");
				$("#id_text2").css("color", "green");

			}
		},
	});
};

function emailDupCheck() {
	let $emailCheckObj = $("#email_check");

	$emailCheckObj.click(function() {
		let $emailObj = $("#email_input");

		if ($emailObj.val().trim() == "") {
			alert("이메일을 입력하세요");
			$emailObj.focus();
			return false;
		}

		let ajaxUrl = "./emailcheck";
		let ajaxMethod = "get";
		let emailValue = $emailObj.val().trim();
		$.ajax({
			url: ajaxUrl,
			method: ajaxMethod,
			data: { email: emailValue },
			success: function(responseObj) {
				if (responseObj.status == 0) {
					alert("이미 사용중인 이메일.");
				} else if (responseObj.status == 1) {
					alert("사용가능한 이메일.");
				}
			},
		});
	});
};

//전송 전 체크사항들 
function submitConfirm() {
	
	//입력란 공백 있는지 확인 start
	let idVal = $("#id_input").val();
	let pwVal = $("#pw_input").val();
	let pwCheckVal = $("#pw2_input").val();
	let nameVal = $("#name_input").val();
	let emailVal = $("#email_input").val();
	let phonenumberVal = $("#phonenumber_input").val();
	let zonecodeVal = $("sample6_postcode").val();
	let addressVal = $("#sample6_address").val();

	if (idVal == "") {
		alert("아이디를 입력하세요")
		$("#id_input").focus();
		return false;
	}
	if (pwVal == "") {
		alert("비밀번호를 입력하세요")
		$("#pw_input").focus();
		return false;
	}
	
	if (pwCheckVal == "") {
		alert("비밀번호를 한번더 입력하세요")
		$("#pw2_input").focus();
		return false;
	}
	
	if (nameVal == "") {
		alert("이름을 입력하세요")
		$("#name_input").focus();
		return false;
	}
	if (emailVal == "") {
		alert("이메일을 입력하세요")
		$("#email_input").focus();
		return false;
	}
	if (phonenumberVal == "") {
		alert("휴대폰번호를 입력하세요")
		$("#phonenumber_input").focus();
		return false;
	}
	if (zonecodeVal == "") {
		alert("주소를 입력하세요");
		$("sample6_postcode").focus();
		return false;
	}
	
	if(addressVal == ""){
		alert("주소를 입력하세요");
		$("#sample6_address").focus();
		return false;
	}
	//입력란 공백 있는지 확인 end
	
	//아이디 조건, 중복체크 했는지 확인 start
	let idColor = $("#id_text1").css("color");
	let idCheckColor = $("#id_text2").css("color");
	
	
	if (idColor == "rgb(255, 0, 0)") {
		alert("아이디는 6자 이상의 영문 혹은 영문과 숫자 조합만 가능합니다");
		$("#id_input").focus();
		return false;
	}

	if (idCheckColor != "rgb(0, 128, 0)") {
		alert("아이디 중복확인을 해 주세요");
		$("#id_input").focus();
		return false;
	}
	//아이디 조건, 중복체크 했는지 확인 end

	//비밀번호 조건 확인 start
	let pwColor = $("#pw_chk1").css("color");
	let pwColor2 = $("#pw_chk2").css("color");
	
	if (pwColor != "rgb(0, 128, 0)") {
		alert("비밀번호를 입력하세요");
		$("#pw_input").focus();
		return false;
	}
	
	if (pwColor2 != "rgb(0, 128, 0)") {
		alert("비밀번호를 입력하세요");
		$("#pw_input").focus();
		return false;
	}
	//비밀번호 조건 확인 end

	//비밀번호 확인란 확인 start
	let pw2Color = $("#pw2_txt").css("color");
	
	if (pw2Color != "rgb(0, 128, 0)") {
		alert("비밀번호를 입력하세요");
		$("#pw2_input").focus();
		return false;
	}	
	//비밀번호 확인란 확인 end

	return true;
}


