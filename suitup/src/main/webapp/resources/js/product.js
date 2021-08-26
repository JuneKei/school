// 별점 주는 함수

	var s1 = document.getElementById('star1');
    var s2 = document.getElementById('star2');
    var s3 = document.getElementById('star3');
    var s4 = document.getElementById('star4');
    var s5 = document.getElementById('star5');
    var starCount = document.getElementById('starCount');

  function star1() {
        s1.className = "zmdi zmdi-star";
        s2.className = "zmdi zmdi-star-outline";
        s3.className = "zmdi zmdi-star-outline";
        s4.className = "zmdi zmdi-star-outline";
        s5.className = "zmdi zmdi-star-outline";
        starCount.setAttribute("value","1");
    }
    function star2() {
        s1.className = "zmdi zmdi-star";
        s2.className = "zmdi zmdi-star";
        s3.className = "zmdi zmdi-star-outline";
        s4.className = "zmdi zmdi-star-outline";
        s5.className = "zmdi zmdi-star-outline";
        starCount.setAttribute("value","2");
    }
    function star3() {
        s1.className = "zmdi zmdi-star";
        s2.className = "zmdi zmdi-star";
        s3.className = "zmdi zmdi-star";
        s4.className = "zmdi zmdi-star-outline";
        s5.className = "zmdi zmdi-star-outline";
        starCount.setAttribute("value","3");
    }
    function star4() {
        s1.className = "zmdi zmdi-star";
        s2.className = "zmdi zmdi-star";
        s3.className = "zmdi zmdi-star";
        s4.className = "zmdi zmdi-star";
        s5.className = "zmdi zmdi-star-outline";
        starCount.setAttribute("value","4");
    }
    function star5() {
        s1.className = "zmdi zmdi-star";
        s2.className = "zmdi zmdi-star";
        s3.className = "zmdi zmdi-star";
        s4.className = "zmdi zmdi-star";
        s5.className = "zmdi zmdi-star";
        starCount.setAttribute("value","5");
    }


// 장바구니 담기
    function product_check(){
    	
    	if ($("input[name=dtproColor]:radio:checked").length < 1) {
            alert("색상을 선택해주세요");
            
            return false;
          } 
    	
    	if ($("input[name=dtproSize]:radio:checked").length < 1) {
            alert("사이즈를 선택해주세요");
            return false;
          } 
    	if(parseInt($("input[name=cartCount]").val())> parseInt($("input[name=productCount]").val())){
    		alert("재고가 부족합니다");
    		return false;
    	}
    	
    	document.getElementById("insertCart").submit();
    }
    
 // 리뷰 작성하기 유효성 검사
    function review_check(){
    	
    	// 제목 체크
    	if ($("input[name=comTitle]").val() == "") {
            alert("제목을 입력해주세요");
            $("input[name=comTitle]").focus();
            var offset = $(".rating__wrap").offset();
            $('html, body').animate({scrollTop : offset.top-250}, 400);
            return false;
          } 
    	// 내용 체크
    	if ($("textarea[name=comContent]").val() == "") {
            alert("내용을 입력해주세요");
            $("textarea[name=comContent]").focus();
            var offset = $(".rating__wrap").offset();
            $('html, body').animate({scrollTop : offset.top-250}, 400);
            return false;
          } 
    	
    	// 구매내역 체크
    	var proNum = $('input[name="proNum"]').val();
		var memId = $('input[name="memId"]').val();
		var orderCount = 0;
    	
		$.ajax({
  			 type : "post",
  			 url : "orderCheck.do",
  			 contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
  			 data : {proNum : proNum, memId : memId},
  			 success:function(result){
  				orderCount = result;
  			 },
  			 error:function(){
  				 alert("로그인을 해주세요");
  			 }
  			
		});
		
		if(orderCount > 0){
			document.getElementById("insertReview").submit();
		}
		else if(orderCount = 0){
			 alert("해당 상품을 구매해야 리뷰 작성이 가능합니다");
			var offset = $(".rating__wrap").offset();
			$('html, body').animate({scrollTop : offset.top-250}, 400);
			return false;
		}
		else
			var offset = $(".rating__wrap").offset();
			$('html, body').animate({scrollTop : offset.top-250}, 400);
			return false;
    }

    // 찜목록 추가
    function insert_wish(){
    	
    	
    	if($('input[name="memId"]').val() == null)
    		alert("로그인을 해주세요");
    	else{
    		if(confirm("찜 목록에 추가하시겠습니까?") == true){
    		var proNum = $('input[name="proNum"]').val();
    		var memId = $('input[name="memId"]').val();
    		
    		$.ajax({
   			 type : "post",
   			 url : "insertWish.do",
   			 contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
   			 data : {proNum : proNum, memId : memId},
   			 success:function(result){
   				 // 성공시 페이지 리로딩
   				 alert(result);
   				location.reload();
   				
   			 }
   			 
   		 });
    	}
    	}
    }
    // 찜 제거
    function delete_wish(){
    	if(confirm("찜목록에서 제거하시겠습니까?") == true){
    		var proNum = $('input[name="proNum"]').val();
    		var memId = $('input[name="memId"]').val();
    		
    		$.ajax({
      			 type : "post",
      			 url : "deleteWish.do",
      			 contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
      			 data : {proNum : proNum, memId : memId},
      			 success:function(result){
      				 // 성공시 페이지 리로딩
      				 alert(result);
      				location.reload();
      				
      			 }
    		});
    	}
    }