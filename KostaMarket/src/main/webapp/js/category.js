function count(type)  {
    // 결과를 표시할 element
    const countResultElement = document.getElementById('result');
    
    // 현재 화면에 표시된 값
    let number = countResultElement.innerText;
    
    // 더하기/빼기
    if(type === 'plus') {
      number = parseInt(number) + 1;
    }else if(type === 'minus')  {
		if(parseInt(number) >=1){
			number = parseInt(number) - 1;	
		}
    }
    
    // 결과 출력
    countResultElement.innerText = number;
  }

function sum(type) {
	const priceElement = document.getElementById('price');
    const sumResultElement = document.getElementById('totalPrice');	
	const countResultElement = document.getElementById('result');
	
	let price = priceElement.innerText;
	let number = countResultElement.innerText;
	let totalPrice = 0;
		
	totalPrice = parseInt(price) * parseInt(number);
	
	sumResultElement.innerText = totalPrice; 	
}

function fresh(code) {
	
	let codeValue = code;
	
	$.ajax({
        url: "./category",
        method: "get",
        data: {productCode: codeValue},
        success:function(data){
			console.log("응답성공" + data);
			$('div.list-goods ul.list').empty();
			$('div.list-goods ul.list').html(data);
        },error:function(){
            alert("응답실패");
        } 
    });
	return false;
}