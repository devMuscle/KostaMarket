<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/signup.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="./js/signup.js"></script>

<meta charset="UTF-8">
<title>홍켓컬리 :: 그냥 마트 가라</title>
</head>
<body>
	<div class="tit_page">
		<h2 class="tit">회원가입</h2>
	</div>
	<div id="content">
		<div class="page_article">
			<div class="type_form_member_join"">
				<form method="post" aciton="./signup">
					<p class="page_sub">
						<span class="ico">*</span>필수입력사항
					</p>
					<table class="tbl_comm">
						<tbody>
							<tr class="fst">
								<th>아이디<span class="ico">*<span class="screen_out">필수항목</span></span></th>
								<td><input type="text" name="m_id" id="id_input" value=""
									maxlength="16" required="" fld_esssential="" option="regId"
									label="아이디" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합"
									data-validator="true" data-id="hongxis"> <input
									type="hidden" name="chk_id" required="" fld_esssential=""
									label="아이디중복체크" value=""> <a class="btn default"
									href="javascript:chkId()">중복확인</a>
									<p class="txt_guide square" id="id_text" style="display: none">
										<span class="txt txt_case1 good" id="id_text1">6자 이상의
											영문 혹은 영문과 숫자를 조합</span> <span class="txt txt_case2 bad">아이디
											중복확인</span>
									</p></td>
							</tr>
							<tr>
								<th>비밀번호<span class="ico">*<span class="screen_out">필수항목</span></span></th>
								<td><input type="password" name="password" required=""
									fld_esssential="" option="regPass" label="비밀번호" maxlength="16"
									class="reg_pw bad" placeholder="비밀번호를 입력해주세요" id="pw_input">
									<p class="txt_guide square" style="display: none" id="pw_txt">
										<span class="txt txt_case1" id=pw_chk1>10자 이상 입력</span> <span
											class="txt txt_case2" id=pw_chk2>영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상
											조합</span> <span class="txt txt_case3" id=pw_chk3>동일한 숫자 3개 이상 연속 사용 불가</span>
									</p></td>
							</tr>
							<tr class="member_pwd">
								<th>비밀번호확인<span class="ico">*<span
										class="screen_out">필수항목</span></span></th>
								<td><input type="password" name="password2" required=""
									fld_esssential="" option="regPass" label="비밀번호" maxlength="16"
									class="confirm_pw" placeholder="비밀번호를 한번 더 입력해주세요"
									id="pw2_input">
									<p class="txt_guide square" id="pw2_txt" style="display: none">
										<span class="txt txt_case1">동일한 비밀번호를 입력해주세요.</span>
									</p></td>
							</tr>
							<tr>
								<th>이름<span class="ico">*<span class="screen_out">필수항목</span></span></th>
								<td><input type="text" name="name" value="" required=""
									fld_esssential="" label="이름" placeholder="이름을 입력해주세요"></td>
							</tr>
							<tr>
								<th>이메일<span class="ico">*<span class="screen_out">필수항목</span></span></th>
								<td><input type="text" name="email" value="" data-email=""
									size="30" required="" fld_esssential="" option="regEmail"
									label="이메일" placeholder="예: marketkurly@kurly.com"> <input
									type="hidden" name="chk_email" required="" fld_esssential=""
									label="이메일중복체크"> <a href="javascript:void(0)"
									onclick="chkEmail()" class="btn default">중복확인</a></td>
							</tr>
							<tr class="field_phone">
								<th>휴대폰<span class="ico">*<span class="screen_out">필수항목</span></span></th>
								<td>
									<div class="phone_num">
										<input type="text" value="" pattern="[0-9]*" name="mobileInp"
											placeholder="숫자만 입력해주세요" class="inp">
									</div>

									<p class="txt_guide">
										<span class="txt txt_case1"></span>
									</p>
								</td>
							</tr>
							<tr>
								<th>주소<span class="ico">*<span class="screen_out">필수항목</span></span></th>
								<td class="field_address"><input type="hidden"
									name="zonecode" id="zonecode" size="5" value=""> <a
									href="#none" id="addressSearch" class="search"> <span
										id="addressNo" class="address_no" data-text="재검색">주소 검색</span>
								</a>
									<p class="txt_guide">
										<span class="txt txt_case1">배송지에 따라 상품 정보가 달라질 수 있습니다.</span>
									</p></td>
							</tr>
							<tr class="select_sex">
								<th>성별</th>
								<td><label class=""> <input type="radio" name="sex"
										value="m"> <span class="ico"></span>남자
								</label> <label class=""> <input type="radio" name="sex"
										value="w"> <span class="ico"></span>여자
								</label> <label class="checked"> <input type="radio" name="sex"
										value="n" checked="checked"> <span class="ico"></span>선택안함
								</label></td>
							</tr>
							<tr class="birth field_birth">
								<th>생년월일</th>
								<td>
									<div class="birth_day">
										<input type="text" name="birth_year" id="birth_year"
											pattern="[0-9]*" value="" label="생년월일" size="4" maxlength="4"
											placeholder="YYYY"> <span class="bar"></span> <input
											type="text" name="birth[]" id="birth_month" pattern="[0-9]*"
											value="" label="생년월일" size="2" maxlength="2" placeholder="MM">
										<span class="bar"></span> <input type="text" name="birth[]"
											id="birth_day" pattern="[0-9]*" value="" label="생년월일"
											size="2" maxlength="2" placeholder="DD">
									</div>
									<p class="txt_guide">
										<span class="txt bad"></span>
									</p>
								</td>
							</tr>
							<tr class="route" id="selectRecommend">
								<th>추가입력 사항</th>
								<td>
									<div class="group_radio">
										<span class="radio_wrapper"> <label class="checked">
												<input type="radio" name="recommend" id="recommendId"
												label="추천인아이디"> <span class="ico"></span>추천인 아이디
										</label>
										</span> <span class="radio_wrapper"> <label class="">
												<input type="radio" name="recommend" id="eventName"
												label="참여이벤트명"> <span class="ico"></span>참여 이벤트명
										</label>
										</span>
									</div>
									<div class="input_wrapper selected">
										<input type="text" name="recommid" value="" class="inp"
											placeholder="추천인 아이디를 입력해주세요." id="recommid">
										<p class="txt_guide">
											추천인 아이디와 참여 이벤트명 중 하나만 선택 가능합니다. <br> 가입 이후, 수정이 불가합니다.
											<br> 대소문자 및 띄어쓰기에 유의해주세요.
										</p>
									</div>
								</td>
							</tr>
							<tr class="reg_agree">
								<th>이용약관동의 <span class="ico">*<span
										class="screen_out">필수항목</span></span></th>
								<td>
									<div class="bg_dim" style="display: none;"></div>
									<div class="check">
										<label class="check_agree label_all_check label_block">
											<input type="checkbox" name="agree_allcheck" id="check_all"> <span
											class="ico"></span>전체 동의합니다.
										</label>
										<p class="sub">선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수
											있습니다.</p>
									</div>
									<div class="check_view">
										<label class="check_agree label_block"> <input
											type="checkbox" value="" name="check" required=""
											label="이용약관" id="check_1"> <span class="ico"></span>이용약관 동의 <span
											class="sub">(필수)</span>
										</label><a href="#none" class="link btn_link btn_agreement">약관보기>
										</a>
									</div>


									<div class="layer layer_agreement"
										style="display: none; margin-top: -299.5px;">
										<div class="inner_layer">
											<h4 class="tit_layer">
												이용약관 <span class="sub">(필수)</span>
											</h4>
										</div>
									</div>
									<div class="check_view">
										<label class="check_agree label_block"> <input
											type="checkbox" id="check_2" name="check" value=""
											required="" label="개인정보 수집·이용" > <span class="ico"></span>개인정보
											수집·이용 동의 <span class="sub">(필수)</span>
										</label> <a href="#none" class="link btn_link btn_essential">약관보기>
										</a>
									</div>
									<div class="check_view">
										<input type="hidden" id="consentHidden" name="consent[1]"
											value=""> <label class=" check_agree label_block">
											<input type="checkbox" name="hiddenCheck" id="check_3" name="check"> <span
											class="ico"></span>개인정보 수집·이용 동의 <span class="sub">(선택)</span>
										</label> <a href="#none" class="link btn_link btn_choice">약관보기> </a>
									</div>
									<div class="check_view">
										<label class="label_block check_agree "> <input
											type="checkbox" name="marketing" id="check_4" name="check"> <span class="ico"></span>무료배송,
											할인쿠폰 등 혜택/정보 수신 동의 <span class="sub">(선택)</span>
										</label>
										<div class="check_event email_sms">
											<label class="label_block check_agree "> <input
												type="checkbox" name="check" value="n" id="check_5"> <span
												class="ico"></span>SMS
											</label> <label class="label_block check_agree "> <input
												type="checkbox" name="check" value="n" id="check_6"> <span
												class="ico"></span>이메일
											</label>
										</div>
										<p class="sms_info">
											동의 시 한 달간 [5% 적립] + [무제한 무료배송] <span class="sub">(첫 주문
												후 적용)</span>
										</p>
									</div>
									<div class="check_view">
										<label class=" check_agree label_block"> <input
											type="checkbox" value="n" name="check" required=""
											label="만 14세 이상"  id="check_7"> <span class="ico" id="check_6"></span>본인은 만 14세
											이상입니다. <span class="sub">(필수)</span>
										</label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div id="formSubmit" class="form_footer">
						<button type="button" class="btn active btn_join"
							onclick="formJoinSubmit()">가입하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>