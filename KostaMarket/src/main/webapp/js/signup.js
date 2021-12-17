$(document).ready(function() {
	$("#id_input").on("click", function() {
		$("#id_text").css("display", "block");
	})

	$("#pw_input").on("click", function() {
		$("#pw_txt").css("display", "block");
	})

	$("#pw2_input").on("click", function() {
		$("#pw2_txt").css("display", "block");
	})

	$("#id_input").keyup(function() {
		const uid = $("#id_input").val();

		if (!/^[a-zA-Z0-9]{6,16}$/.test(uid)) {
			$("#id_text1").css("color", "red");

			return false;
		} else {
			$("#id_text1").css("color", "black");
		}
	});

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
			$("#pw_chk1").css("color", "black");
		}

		if (pw_val.match(pattern) || count >= 2) {
			$("#pw_chk2").css("color", "red");
		} else {
			$("#pw_chk2").css("color", "black");
		}
	});

	/*
	function checkAll(){
	   if(document.getElementById("all").checked==true){  //id 를 사용하여 하나의 객체만을 호출
			 for(var i=0;i<3;i++) document.getElementsByName("checkBox")[i].checked=true;   //name 을 사용하여 배열 형태로 담아 호출
		  }
		  if(document.getElementById("all").checked==false){
			 for(var i=0;i<3;i++) document.getElementsByName("checkBox")[i].checked=false;  
		  }
	}
	*/

	$("#check_all").change(function() {
		if ($("#check_all").is(":checked")) {
			alert("체크박스 체크했음!");
			$("#check_1").prop("checked", true);
			$("#private1").prop("checked", true);
			$("#check_3").prop("checked", true);
			$("#check_4").prop("checked", true);
			$("#check_5").prop("checked", true);
			$("#check_6").prop("checked", true);
			$("#check_7").prop("checked", true);
		} else {
			alert("체크박스 체크 해제!");
			$("#check_1").prop("checked", false);
			$("#private1").prop("checked", false);
			$("#check_3").prop("checked", false);
			$("#check_4").prop("checked", false);
			$("#check_5").prop("checked", false);
			$("#check_6").prop("checked", false);
			$("#check_7").prop("checked", false);
		}
	});

	$("#check_4").change(function() {
		if ($("#check_4").is(":checked")) {
			alert("체크박스 체크했음!");

			$("#check_5").prop("checked", true);
			$("#check_6").prop("checked", true);
		} else {
			alert("체크박스 체크 해제!");
			$("#check_5").prop("checked", false);
			$("#check_6").prop("checked", false);
		}
	});


	/*
	function checkEvent(){
		let $checkAll = $("#check_all");
		
		$(this).change(function(){
			if($(this).prop("checked", true)){
				$checkAll.prop("checked", true);
			}else{
				$checkAll.prop("checked", false);
			}
		});
	};*/

	function checkEvent() {
		let $checkAll = $("#check_all");

		if ($(this).prop("checked", false)) {
			$checkAll.prop("checked", false);
		}
	};
	
	for (var i = 0; i < 7; i++) {
		document.getElementsByName("check")[i].addEventListener("change", checkEvent);
	}
});