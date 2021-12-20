<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/login.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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
							<input type="text" name="m_id" size="20" tabindex="1" value=""
								placeholder="아이디를 입력해주세요"> <input type="password"
								name="password" size="20" tabindex="2"
								placeholder="비밀번호를 입력해주세요">
							<div class="checkbox_save">
								<label class="label_checkbox"> <input type="checkbox"
									id="chk_security" name="chk_security" value="y"
									checked="checked"> 보안접속
								</label>
								<div class="login_search">
									<a class="link" href="#none"> 아이디 찾기 </a> <span class="bar"></span>
									<a class="link" href="#none"> 비밀번호 찾기 </a>
								</div>
							</div>
							<button class="btn_type1" type="submit">
								<span class="txt_type">로그인</span>
							</button>
						</form>
						<a class="btn_type2 btn_member" href="#none"> <span
							class="txt_type">회원가입</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>