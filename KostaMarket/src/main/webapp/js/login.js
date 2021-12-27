function loginClick() {
	let $loginFormObj = $("#form");

	//localStroage에서 id값 찾기
	let savedIdValue = localStorage.getItem("savedid");
	let savedPwValue = localStorage.getItem("savedpw");

	if (savedIdValue != null) { //localStorage에 id값 있는경우
		$loginFormObj.find("input[name=id]").val(savedIdValue);
		$loginFormObj.find("input[name=password]").val(savedPwValue);
	}

	$loginFormObj.submit(function() {

		let ajaxUrl = $(this).attr("action");
		let ajaxMethod = $(this).attr("method");
		let idValue = $(this).find("input[name=id]").val();
		let pwdValue = $(this).find("input[name=password]").val();

		$.ajax({
			url: ajaxUrl,
			method: ajaxMethod,
			data: { id: idValue, pwd: pwdValue },
			success: function(responseObj) {
				if (responseObj.status == 0) {
					//로그인실패
					alert("아이디 또는 비밀번호 정보가 잘못되었습니다");
				} else if (responseObj.status == 1) {
					//로그인성공
					localStorage.setItem("savedid", idValue);
					localStorage.setItem("savedpw", pwdValue);
					location.href = "./main";
				}
			},
			error: function(xhr) {
				alert("응답실패 status:" + xhr.status);
			},
		});
		return false; //기본이벤트핸들러 금지 + 이벤트전파 중지
	});

};