
function count(type) {
	// 寃곌낵瑜� ������ element
	const countResultElement = document.getElementById('result');

	// ���� ��硫댁�� ������ 媛�
	let number = countResultElement.innerText;

	// ����湲�/鍮쇨린
	if (type === 'plus') {
		number = parseInt(number) + 1;
	} else if (type === 'minus') {
		if (parseInt(number) > 1) {
			number = parseInt(number) - 1;
		}
	}

	// 寃곌낵 異���
	countResultElement.innerText = number;
}

function sum(type) {
	const price = document.getElementById('totalPrice').getAttribute('value');
	const sumResultElement = document.getElementById('totalPrice');
	const countResultElement = document.getElementById('result');


	let number = countResultElement.innerText;
	let totalPrice = 0;

	totalPrice = parseInt(price) * parseInt(number);
	totalPrice = totalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

	sumResultElement.innerText = totalPrice;

}
function onDisplay() {

	$('#shareLayer').toggle();

} // 怨듭����湲� 踰��� �대┃�� 蹂댁�닿� ��蹂댁�닿�

function addCartList(productCode,customerId) {
	const countResultElement = document.getElementById('result');
	
	let id = customerId;
	let Code = productCode;
	let number = countResultElement.innerText;
	
	alert(id);			//if==null 은 어쨰서 동작하지 않지?
	if(id=='null'){			
		alert("로그인 후 이용 할수 있습니다.");
		location.reload()
	} else{
		$.ajax({
			url: "addCartList",
			method: "Get",
			data: { id: id, productCode: Code, productCount: number },
			success: function(data) {
				alert("요청하신 상품 "+ number + "개가 장바구니에 추가되었습니다.");

			}, error: function() {
				alert("failed");
			}
		});
	}
}






