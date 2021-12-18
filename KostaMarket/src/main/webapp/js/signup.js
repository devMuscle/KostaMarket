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

	$("#address").click(function() {
		$("#sample6_postcode").css("display", "inline-block");
		$("#sample6_address").css("display", "inline-block");
		$("#sample6_detailAddress").css("display", "inline-block");

	});

	/*
	let $formObj = $("#signup");
	
	$formObj.submit(function(){
		
		let ajaxUrl = $(this).attr("action");
		let ajaxMethod = $(this).attr("method");
		let sendData = $(this).serialize();
		
		alert("전송데이터:35" + sendData);
		
		$.ajax({
			url: ajaxUrl,
			method:ajaxMethod,
			data: {sendData},
			
			
		})
		
		return false;
	})
*/
});

	
		