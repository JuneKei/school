

	
	// 결제하기 버튼 누를때 유효성 검사
	function payment_check() {
		
		
		// 수령인
		if($('#receiver').val()=='' && $("input[name=add]:checked").val() == "new"){
			alert("받으실 분의 성함을 입력해주세요")
			$('#receiver').focus();
			return false;
		} 
		
		// 수령인 연락처
		if($('#phone').val()=='' && $("input[name=add]:checked").val() == "new"){
			alert("받으실 분의 연락처를 입력해주세요")
			$('#phone').focus();
			return false;
		} 
		
		// 배송지
		if($('#address').val()=='' && $("input[name=add]:checked").val() == "new"){
			alert("배송지를 입력해주세요")
			$('#address').focus();
			return false;
		} 
		
		$("#payment").submit();   // 유효성 검사 후 submit
		
		}
	

		 
	    // 라디오버튼 클릭시 이벤트 발생
	    $("input:radio[name=add]").click(function(){
	    	
	    	// 기존 배송지 체크시 기존 배송지 보여줌
	        if($("input[name=add]:checked").val() == "default"){
	            $("input.new").attr("disabled",true);
	            $("input.new").attr("type", "hidden");
	            $("input.default").attr("disabled",false);
	            $("input.default").attr("type", "text");
	            
	         // 직접 입력 체크시 직접 입력함
	        }else if($("input[name=add]:checked").val() == "new"){
	        	$("input.default").attr("disabled",true);
	        	$("input.default").attr("type", "hidden");
	              $("input.new").attr("disabled",false);
	              $("input.new").attr("type", "text");
	            
	        }
	    });



