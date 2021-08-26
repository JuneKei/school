<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
     <c:if test="${cookie.SuitUpidCookie.value == null}">
     <c:if test="${sessionScope.SuitUpid != param.id}">
   	<c:redirect url="login-register.do"/>
     </c:if>
     </c:if>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>비밀번호 변경</title>
        <link href="resources/css/admin-styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/vendor/jquery-1.12.0.min.js"></script>
        <script type="text/javascript">
        	function pwdmodifyok(){
  
		    	var id = $('#inputId').val()
		    	var pass = $('#inputPass').val()
		    	var passConfirm = $('#inputPassConfirm').val()
		  		var rpwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/
		  		
        	 	if(pass==""){
        			alert("비밀번호를 입력하세요.")
        			pass.focus();
        			return false;
        		}
		    	if(pass!=passConfirm){
		    		alert("비밀번호가 일치하지 않습니다. ")
		    		passConfirm.focus();
		    		return false;
		    	}
		    	if(!rpwCheck.test(pass)){
		    		alert("비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요. ")
		    		pass.focus();
		    		return false;
		    	}

         		$.ajax({
        			type:"post",
        			url:"pwdModifyOk.do",
        			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
        			data:{
        				memId : id,
        				memPass : pass,
        			},
        			success:function(ok){
        				alert(ok);
        				window.close();
        			},error:function(){
        				alert("오류");
        			}
        			
	        		}) 
        	}
        </script>
    </head>
    
    <body class="bg-primary" style="background-color: #f8f9fa !important;}">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">비밀번호 변경</h3></div>
                                    <div class="card-body">
                                        <div class="small mb-3 text-muted"></div>
                                        <form  id="pwdReset" action="pwdModify.do" method="post" >
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputId" type="hidden" placeholder="아이디" value="${param.id}" />
                                                <label for="inputText">아이디</label>
                                            </div>
                                            
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPass" type="password" placeholder="비밀번호" />
                                                <label for="inputPassword">비밀번호</label>
                                            </div>                              
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassConfirm" type="password" placeholder="비밀번호 확인" />
                                                <label for="inputPassword">비밀번호 확인</label>
                                            </div>                              
                                                <a class="btn btn-primary" href="#" onclick="pwdmodifyok();" >비밀번호 변경</a>
                                          
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/js/scripts.js"></script>
    </body>
</html>
