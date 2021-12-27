<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/login.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./js/login.js"></script>
<script>
	$(function() {
		loginClick();
		$("#includedContent").load("footer.html");
		$("#includedHeader").load("header.jsp");
	});
</script>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./images/favicon.ico" />
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<div id="includedHeader"></div>
</head>
<body>
	<div id="main">
		<div id="content">

			<div id="qnb" class="quick-navigation"></div>
			<div class="section_login">
				<h3 class="tit_login">로그인</h3>
				<div class="write_form">
					<div class="write_view login_view">
						<form method="post" name="form" id="form" action="./login">
							<input type="text" name="id" size="20" tabindex="1" value=""
								placeholder="아이디를 입력해주세요"> <input type="password"
								name="password" size="20" tabindex="2"
								placeholder="비밀번호를 입력해주세요">
							<div class="checkbox_save">
								<div class="login_search">
									<a class="link" href="#none"></a>
									<a class="link" href="#none"></a>
								</div>
							</div>
							<button class="btn_type1" type="submit" id="login_butotn">
								<span class="txt_type">로그인</span>
							</button>
						</form>
						<a class="btn_type2 btn_member" href="./signup"> <span
							class="txt_type">회원가입</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<footer>
	<div id="includedContent"></div>
</footer>
</html>