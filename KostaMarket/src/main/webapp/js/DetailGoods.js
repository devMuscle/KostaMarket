
function count(type) {
	// 결과를 표시할 element
	const countResultElement = document.getElementById('result');

	// 현재 화면에 표시된 값
	let number = countResultElement.innerText;

	// 더하기/빼기
	if (type === 'plus') {
		number = parseInt(number) + 1;
	} else if (type === 'minus') {
		if (parseInt(number) > 1) {
			number = parseInt(number) - 1;
		}
	}

	// 결과 출력
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

} // 공유하기 버튼 클릭시 보이고 안보이고

function addCartList(productCode) {
	const countResultElement = document.getElementById('result');

	let number = countResultElement.innerText;

	$.ajax({
		url: "./addCartList",
		method: "Get",
		data: { id: "id1", productCode: "p01", productCount: number },
		success: function(data) {

		}, error: function() {
			alert("failed");
		}
	});


}






