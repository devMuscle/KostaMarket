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
						<form method="post" name="form" id="form"
							onsubmit="return checkReCaptcha();"
							action="/shop/member/login_ok.php">
							<input type="hidden" name="returnUrl"
								value="https://www.kurly.com/shop/main/index.php?utm_source=1055&amp;utm_medium=2112&amp;utm_campaign=home_hashtag&amp;utm_term=&amp;gclid=EAIaIQobChMI0djj0urp9AIVC553Ch1-bQy3EAAYAiAAEgJtX_D_BwE">
							<input type="hidden" name="return_url" value=""> <input
								type="hidden" name="close" value=""> <input type="text"
								name="m_id" size="20" tabindex="1" value=""
								placeholder="아이디를 입력해주세요"> <input type="password"
								name="password" size="20" tabindex="2"
								placeholder="비밀번호를 입력해주세요">
							<div class="checkbox_save">
								<label class="label_checkbox"> <input type="checkbox"
									id="chk_security" name="chk_security" value="y"
									checked="checked"
									onchange="if( this.checked){$(this).parent().addClass('checked')}else{$(this).parent().removeClass('checked')} ">
									보안접속
								</label>

								<div class="login_search">
									<a class="link"
										onclick="KurlyTrackerLink('/member/find/id', 'select_find_id')"
										href="#none"> 아이디 찾기 </a> <span class="bar"></span> <a
										class="link"
										onclick="KurlyTrackerLink('/member/find/password', 'select_find_password')"
										href="#none"> 비밀번호 찾기 </a>
								</div>
							</div>
							<button class="btn_type1" type="submit"
								onclick="KurlyTracker.setScreenName('login').setAction('select_login_button', { join_path: 'kurly' }).sendData()"
								kurlytracker="">
								<span class="txt_type">로그인</span>
							</button>
						</form>
						<a class="btn_type2 btn_member"
							onclick="KurlyTrackerLink('/shop/member/join.php', 'select_join_button', {join_path: 'kurly'})"
							href="#none"> <span class="txt_type">회원가입</span>
						</a>
					</div>
				</div>
			</div>
			<script>
				window.onload = function() {
					document.form.m_id.focus();
				}

				function checkReCaptcha() {
					var $captcha = $("input[name=captcha]");
					if ($captcha.length > 0) {
						if (!$captcha.val()) {
							alert("인증번호를 입력해 주세요");
							$captcha.focus();
							return false;
						}
					} else {
						return true;
					}
				}

				// KM-1483 Amplitude
				KurlyTracker.setScreenName('login').setTabName('my_kurly');
			</script>
		</div>
	</div>
</body>
</html>