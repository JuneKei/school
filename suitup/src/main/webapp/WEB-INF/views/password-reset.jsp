<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>비밀번호 리셋</title>
        <link href="resources/css/admin-styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/vendor/jquery-1.12.0.min.js"></script>
        <script type="text/javascript">
       		function check(obj){
       	        //정규식으로 특수문자 판별
       	        var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
       	        
       	        //배열에서 하나씩 값을 비교
       	        if( regExp.test(obj.value) ){
       	           //값이 일치하면 문자를 삭제
       	           obj.value = obj.value.substring( 0 , obj.value.length - 1 ); 
       	        }
       	      }
        	function pwdreset(){
        		
		    	var id = $('#inputId').val()
		    	var name = $('#inputName').val()
  				var pass = Math.random().toString(36).substr(2,11);
        		// 아이디
        	 	if(id==""){
        			alert("아이디를 입력하세요.")
        			id.focus();
        			return false;
        		}

        		// 이름
        		if(name==""){
        			alert("이름를 입력하세요.")
        			name.focus();
        			return false;
        		}
        		
         		$.ajax({
        			type:"post",
        			url:"pwdReset.do",
        			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
        			data:{
        				memId : id,
        				memName : name,
        				memPass : pass
        			},
        			success:function(ok){
        					if(ok=="일치하는 정보가 없습니다."){
       						alert(ok);        						
        					}else{
       						alert(ok);
							window.close();        						
        					}
        					
        			},error:function(){
        				alert(ok);
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">비밀번호 리셋</h3></div>
                                    <div class="card-body">
                                        <div class="small mb-3 text-muted">Enter your Id and Name.</div>
                                        <form  id="pwdReset" action="pwdReset.do" method="post" >
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputId" type="text" placeholder="아이디" onkeyup="check(this)" onkeydown="check(this)"/>
                                                <label for="inputEmail">아이디</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputName" type="text" placeholder="이름" onkeyup="check(this)" onkeydown="check(this)" />
                                                <label for="inputEmail">이름</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="login-register.do">로그인 페이지</a>
                                                <a class="btn btn-primary" href="#" onclick="pwdreset();" >비밀번호 리셋</a>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="login-register.do">회원가입</a></div>
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
