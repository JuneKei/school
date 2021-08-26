

var rname = document.getElementById("regiMemName");
var rphone = document.getElementById("regiMemPhone");
var rphoneCheck =  /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
var rnameCheck =  /^[가-힣]{2,15}$/;
//====================================수정====================================
	
function modify_check(){

	// 이름
	if(rname.value==""){
		alert("이름을 입력하세요.")
		rname.focus();
		return false;
		
	}
	
	if(!rnameCheck.test(rname.value)){
		alert("이름은 한글로 2글자 이상 입력해주세요.")
		rname.focus();
		return false;
	}
	
	if(rphone.value.length>=1){
		if(!rphoneCheck.test(rphone.value)){
			alert("휴대폰 번호는 "+"-"+" 를 포함한 숫자로 작성해주세요 ")
			rphone.focus();
			return false;
		}
	}
	
	alert("회원정보가 변경 되었습니다.")
	document.getElementById("modifyForm").submit();
}

//====================================주소====================================
function AddrFunction(){
	alert("주소 입력 수정은 주소찾기를 이용해주세요.")
}
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	var pop = window.open("jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
}
function jusoCallBack(roadFullAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.

		document.memModify.memAddr.value = roadFullAddr;
	
	
}