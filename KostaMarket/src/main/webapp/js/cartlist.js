//일부 선택 & 해제
function checkDetailAll()  {
    
    const checkboxes 
      = document.querySelectorAll('input[name="chkbox"]');
    
    const checked 
      = document.querySelectorAll('input[name="chkbox"]:checked');
    
    const checkAll1
      = document.querySelector('input[name="checkAll1"]');

    const checkAll2
      = document.querySelector('input[name="checkAll2"]');
    
    if(checkboxes.length === checked.length)  {
      checkAll1.checked = true;
      checkAll2.checked = true;
    }else {
      checkAll1.checked = false;
      checkAll2.checked = false;
    }
  
  }

//전체선택 & 해제  
function checkAll(checkAll)  {
    const checkboxes 
       = document.getElementsByName('chkbox');
    
    const checkAll1
      = document.getElementsByName('checkAll1');

    const checkAll2
      = document.getElementsByName('checkAll2');
    

    checkAll1.forEach((checkbox) => {
      checkbox.checked = checkAll.checked
    });

    checkAll2.forEach((checkbox) => {
        checkbox.checked = checkAll.checked
      });

    checkboxes.forEach((checkbox) => {
        checkbox.checked = checkAll.checked
    });
  }

//체크박스 선택된 상품 개수 가져오기
function getCheckedCnt()  {
  // 선택된 목록 가져오기
  const query = 'input[name="chkbox"]:checked';
  const selectedElements = 
      document.querySelectorAll(query);
  
  // 선택된 목록의 갯수 세기
  const selectedElementsCnt =
        selectedElements.length;
  
  // 출력
  document.getElementById('chkNum').innerText
    = selectedElementsCnt;
}

//체크박스 선택한 품목 상품코드 받아오기
function chkPCode() {
	var arr = [];
 	var id = document.getElementById('aD1').getAttribute('value');
 	var checkBoxes = document.getElementsByName("chkbox");

	for (var i = 0; i < checkBoxes.length; i++) {
		if (checkBoxes[i].checked) {
			arr.push(checkBoxes[i].value);
		}
	}
	arr.push(id);

}

//선택삭제데이터 보내기
function deleteSend() {
	//배열 생성
	let arr = [];
	
	//id 값 받기
 	let idValue = document.getElementById('aD1').getAttribute('value');

	//배열엥 id 값 추가
	arr.push(idValue);
	
	//checkbox 값 가져오기
	let checkBoxes = document.getElementsByName("chkbox");
	
	//배열에 checkbox 값 추가
	for (var i = 0; i < checkBoxes.length; i++) {
		if (checkBoxes[i].checked) {
			arr.push(checkBoxes[i].value);
		}
	}
	
	//경고창 후 servlet으로 정보전달
	if(arr.length == 1) {
		alert("선택한 상품이 없습니다.");
	} else {
		var select = confirm("선택한 상품을 삭제하시겠습니까?");
		if(select){
			$.ajax({
		        url: "./deletecart",
		        method: "post",
		        data: {db: arr},
				traditional: true,
		        success:function(data){
		         
		        },error:function(){
		            alert("응답실패");
		        } 
		    });
		}
	}
	
	//jQuery 새로고침
	setTimeout(function(){
		location.reload();
	},1000);
}

//개별삭제
function deleteOneSend(flagI) {
	//배열 생성
	let arr = [];
	
	//id, productcode 값 받기
 	let idValue = document.getElementById('aD1').getAttribute('value');
	let productValue = document.getElementById('code'+flagI).getAttribute('value');
	
	//id, productcode 값 배열에 추가
	arr.push(idValue);
	arr.push(productValue);
	
	//경고창 후 servlet에 정보 전달
	var select = confirm("삭제하시겠습니까?");
	if(select){
		$.ajax({
	        url: "./deletecart",
	        method: "post",
	        data: {db: arr},
			traditional: true,
	        success:function(data){
	         
	        },error:function(){
	            alert("응답실패");
	        } 
	    });
	}
	
	//jQuery 새로고침
	setTimeout(function(){
		location.reload();
	},1000);
}

//수량 변경
function modifyCount(type, flagI)  {
    // 결과를 표시할 element
    const resultElement = document.getElementById('count'+flagI);
    
    // 현재 화면에 표시된 값
    let number = resultElement.innerText;
    
	//id, productcode 받기
	let idValue = document.getElementById('aD1').getAttribute('value');
	let productValue = document.getElementById('code'+flagI).getAttribute('value');
	
    // 더하기/빼기
    if(type === 'plus') {
      number = parseInt(number) + 1;
    }else if(type === 'minus')  {
        if(number > 1) {
            number = parseInt(number) - 1;
        }
    }
	
	//변경된 상품 수량 servlet으로 전송
	$.ajax({
        url: "./modifycart",
        method: "post",
        data: {id: idValue, productCode: productValue, productCount: number},
        success:function(data){
	
        },error:function(){
            alert("응답실패");
        } 
    });
	
    // 결과 출력
    resultElement.innerText = number;

	//jQuery 새로고침
	setTimeout(function(){
		location.reload();
	}, 1000);
  }

//배송지 변경, 주문하기
function helpMe() {
	alert("구현되지 않은 기능입니다.");
}

function moveOrder(flag) {
	if(flag == 0) {
		alert("장바구니에 상품이 없습니다.");
	} else {
		location.href = "./payment";
	}
}