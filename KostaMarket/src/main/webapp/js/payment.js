function pay(flag) {
   	//배열 생성
	let arr = [];
	
	let idValue = document.getElementById('nameId').getAttribute('value');
	let point = document.getElementById('expectAmount').getAttribute('value');
	for (var i = 0; i < flag; i++) {
		let product = document.getElementById("aa" + i).getAttribute('value');
		arr.push(product);
	}

	//경고창 후 servlet에 정보 전달
	var select = confirm("주문하시겠습니까?");
	if(select){
		$.ajax({
	        url: "./payment",
	        method: "get",
	        data: {id: idValue, point: point, db: arr},
			traditional: true,
	        success:function(data){
	        	alert("주문성공하였습니다.")
	         	location.href = "./main";
	        },error:function(){
	            alert("주문실패하였습니다.");
	        } 
	    });	
	}
}