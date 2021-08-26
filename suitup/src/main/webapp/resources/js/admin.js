    // 카테고리 이벤트 바인딩 
	 $("#category").change(function(e) {
		 console.log("change")
		 
		 //2차분류 옵션을 불러와서 1차분류와 다른값은 숨김 처리
		 document.querySelectorAll("#dtcategory option").forEach(elem=>{
			 
			 //1차분류와 2차분류가 같지 않을 때
			 if(e.target.value != elem.getAttribute("pro-value")){
				 console.log("hide: ",elem)
				 
				 //2차분류의 값이 -1(전체) 일 때는 숨김처리 하지 않음
				 if(elem.getAttribute("pro-value") == -1){
					 document.getElementById("dtcategory").value = -1
				 }
				 
				 //2차분류에서 -1(전체)를 제외하고 1차분류와 다른값은 전부 숨김 처리
				 else{
					 elem.setAttribute("style","display:none;")
				 } 
			 }
			 
		 	 //1차분류와 값이 같은 2차분류는 숨김처리 삭제
			 else{
				 elem.removeAttribute("style","display:none;")
			 }		 
		})
	})
        
		
	
	
			 // 상품 삭제
function dlBtn(proNum){
	 var con = confirm("정말로 삭제하시겠습니까?");
	 if(con) { 
		$('#mdProNum').val(proNum);
		
		var modForm = document.testForm;
		modForm.action = "productDelete.do";
	 }
	return; 

}							
				
			 // 상품 수정
function mdBtn(proNum){

	$('#mdProNum').val(proNum);
	
	var modForm = document.testForm;
	modForm.action = "product-modify.do";

	return;

}
	
				 
			 //뒤로가기 기능
			 $("#backBtn").click(function(){
			  history.back();
			 }) 
  