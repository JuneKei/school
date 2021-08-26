$(function(){
// 찜 한개 제거
	$('.remove').click(function(){
		if(confirm("찜 목록에서 제거하시겠습니까?") == true){
    		
    		alert(wishNum);
    		$.ajax({
      			 type : "post",
      			 url : "dropWishlist.do",
      			 contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
      			 data : {memId : memId, wishNum : wishNum},
      			 success:function(result){
      				 // 성공시 페이지 리로딩
      				 alert(result);
      				location.reload();
      				
      			 }
    		});
		}
	})
})


	// 찜 목록 전체 제거
    function drop_wishlist(){
    	if(confirm("찜 목록을 전부 삭제하시겠습니까?") == true){
    		var memId = $('input[name="memId"]').val();
    		
    		$.ajax({
      			 type : "post",
      			 url : "dropWishlist.do",
      			 contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
      			 data : {memId : memId},
      			 success:function(result){
      				 // 성공시 페이지 리로딩
      				 alert(result);
      				location.reload();
      				
      			 }
    		});
    	}
    }