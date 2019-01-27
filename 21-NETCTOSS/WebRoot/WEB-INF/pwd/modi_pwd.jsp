<%@page pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>课程设计－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />  
        <script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
        <script language="javascript" type="text/javascript">
       //保存成功的提示信息
       function showResult() {
	       if(check_password() && check_pwd() && checkedPassword()){
	       	   showResultDiv(true);
	           window.setTimeout("showResultDiv(false);", 5000);
	           document.forms[0].submit();
	       }else{
	       	   document.forms[0].submit();
	       }
       }
       function showResultDiv(flag) {
           var divResult = document.getElementById("save_result_info");
           if (flag)
               divResult.style.display = "block";
           else
               divResult.style.display = "none";
       }
            
       function check_password(){
       		var password = $("#password").val();
       		var reg = /^\w{1,16}$/;
       		if(!reg.test(password)){
   				$("#password_msg").text("请输入1-16位的字母、数字、下划线").addClass("error_msg");
   				return false;
    		}
    		$.post(
   				"checkPwd.do",
   				 {"password":password},
   				 function(data) {
   					if(data==0) {
   						//校验通过
   						$("#password_msg").text("密码正确").removeClass("error_msg");
   						return true;
   					} else if(data==1 || data==2){
   						//密码错误
   						$("#password_msg").text("原始密码不正确").addClass("error_msg");
   						return false;
   					}
   				}
    		);
       }
         //校验密码
         function check_pwd(){
        	 var password = $("#password").val();
        	 var pwd = $("#pwd").val();
        	 if(pwd==""){
        		 $("#pwd_msg").text("不能为空").addClass("error_msg");
        		 return false;
        	 }
        	 var reg = /^[A-Za-z0-9_]{3,16}$/;
        	 if(!reg.test(pwd)){
        		 $("#pwd_msg").text("请输16长度以内的字母、数字和下划线的组合").addClass("error_msg");
        		 return false;
        	 }
        	 if(pwd != password){
        		 $("#pwd_msg").text("有效密码格式").removeClass("error_msg");
        		 return true;
        	 }else{
        	 	 $("#pwd_msg").text("新旧密码必须不同").addClass("error_msg");
        	 	 return false;
        	 }
        }
    	 //校验重复密码
        function checkedPassword(){
        	 var pwd = $("#pwd").val();
        	 var pwd2 = $("#pwd2").val();
        	 if(pwd2==""){
        	 	$("#pwd2_msg").text("请输入密码").addClass("error_msg");
        	 	return false;
        	 }
        	 if(pwd != pwd2){
        		$("#pwd2_msg").text("两次密码必须相同").addClass("error_msg");
        		return false;
        	}else{
        		$("#pwd2_msg").text("密码正确").removeClass("error_msg");
        		return true;
        	}
        }
       
        </script>      
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
             <jsp:include page="/WEB-INF/main/menu.jsp"/>  
        </div>
        <!--导航区域结束-->
        <div id="main">      
            <!--保存操作后的提示信息：成功或者失败-->      
            <div id="save_result_info" class="save_success">保存成功！</div><!--保存失败，旧密码错误！-->
            <form action="updatePwd.do" method="post" class="main_form">
                <div class="text_info clearfix"><span>旧密码：</span></div>
                <div class="input_info">
                    <input type="password" class="width200" id="password" onblur="check_password()"/>
                    <span class="required">*</span>
                    <div class="validate_msg_medium" id="password_msg">16长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>新密码：</span></div>
                <div class="input_info">
                    <input type="password"  class="width200" name="password" id="pwd" onblur="check_pwd()"/> 
                    <span class="required">*</span>
                    <div class="validate_msg_medium" id="pwd_msg">16长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>重复新密码：</span></div>
                <div class="input_info">
                    <input type="password" class="width200" id="pwd2" onblur="checkedPassword()"/>
                    <span class="required">*</span>
                    <div class="validate_msg_medium" id="pwd2_msg">两次新密码必须相同</div>
                </div>
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="showResult();" />
                    <input type="button" value="取消" class="btn_save" onclick="history.back();"/>
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
    </body>
</html>
