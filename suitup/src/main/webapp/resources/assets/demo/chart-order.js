window.onload = function(){
	
	 $('button').click(function () {
		 var num = $(this).attr("id");
		 
		 $.ajax({
			 type:"post",
			 url:"deliveryStart.do",
			 contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			 data:{ orderNum : num},
		 		success: function(result){
		 			if(result == "성공"){
		 				window.location.reload()
		 			}
		 	}
		 })
		 
	 });
	 

}