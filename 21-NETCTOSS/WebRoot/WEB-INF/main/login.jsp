<%@page pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>课程设计－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" /> 
    	<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
    	<script type="text/javascript">
    		//登录校验
    		function check_login() {
    			var reg = /^\w{1,30}$/;
    			//校验账号格式
    			var admin_code = $("#adminCode").val();
    			if(!reg.test(admin_code)) {
    				$("#code_msg").text("请输入1-30位的字母、数字、下划线");
    				return;
    			}
    			//校验密码格式
    			var password = $("#password").val();
    			if(!reg.test(password)) {
    				$("#password_msg").text("请输入1-30位的字母、数字、下划线");
    				return;
    			}
    			//校验验证码不能为空
    			var userCode = $("#userCode").val();
    			if(userCode=="") {
    				$("#user_code_msg").text("请输入验证码.");
    				return;
    			}
    			//校验账号密码是否正确
    			$.post(
    				"checkLogin.do",
    				{"adminCode":admin_code,
    					"password":password,
    					"userCode":userCode},
    				function(data) {
    					if(data==0) {
    						//校验通过
    						location.href = "toIndex.do";
    					} else if(data==1) {
    						//账号错误
    						$("#code_msg").text("账号不存在.");
    					} else if(data==2) {
    						//密码错误
    						$("#password_msg").text("密码错误.");
    					} else {
    						//验证码错误
    						$("#user_code_msg").text("验证码错误.");
    					}
    				}
    			);
    		}
    		//清空提示信息
    		function clear_msg(id) {
    			$("#"+id).text("");
    		}
    	</script>
    </head>
    <body class="index">
        <div class="login_box">
            <table>
                <tr>
                    <td class="login_info">账号：</td>
                    <td colspan="2">
                    <input name="admin_code" id="adminCode" type="text" onfocus="clear_msg('code_msg');" class="width150" /></td>
                    <td class="login_error_info"><span class="required" id="code_msg"></span></td>
                </tr>
                <tr>
                    <td class="login_info">密码：</td>
                    <td colspan="2"><input name="password" id="password" type="password" onfocus="clear_msg('password_msg');" class="width150" /></td>
                    <td><span class="required" id="password_msg"></span></td>
                </tr>
                <tr>
                    <td class="login_info">验证码：</td>
                    <td class="width70"><input name="" id="userCode" type="text" onfocus="clear_msg('user_code_msg');" class="width70" /></td>
                    <td>
                    <img src="createImage.do" alt="验证码" title="点击更换" onclick="this.src='createImage.do?date=' + new Date().getTime()"/>
                    </td>  
                    <td><span class="required" id="user_code_msg"></span></td> 
                </tr>            
                <tr>
                    <td></td>
                    <td class="login_button" colspan="2">
                        <a href="javascript:check_login();"><img src="../images/login_btn.png" /></a>
                    </td>    
                    <td><span class="required"></span></td>                
                </tr>
            </table>
        </div>
    </body>
</html>