$(document).ready(function(){
	
	 
	 $('.cnt').change(function () { // input값이 변화가 있을 때 발생하는 이벤트
		 
		 var cartCount = $(this).val();		// 장바구니 수량 변수
		 var cartNum = $(this).attr("id");	// 장바구니 번호 변수

		 $.ajax({
			 type : "post",
			 url : "changeCart.do",
			 contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			 data : {cartCount : cartCount, cartNum : cartNum},
			 success:function(result){
				 // 성공시 페이지 리로딩
				 location.reload();
			 },
			 
		 });
	 });
	
});


function drop_cartlist(){
	
	if($('input[name="memId"]').val() == null)
		alert("로그인을 해주세요");
	else{
		if(confirm("장바구니를 전부 비우시겠습니까?") == true){
		var memId = $('input[name="memId"]').val();
		
		$.ajax({
			type:"post",
			url:"deleteCartlist.do",
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			data : {memId : memId},
			success:function(result){
  				 // 성공시 페이지 리로딩
  				 alert(result);
  				location.reload();
  				
  			 }
			
			
		})
		}
	}
	
}