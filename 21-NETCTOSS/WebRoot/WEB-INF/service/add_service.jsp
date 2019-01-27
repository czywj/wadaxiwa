<%@page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>课程设计－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
        <script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
        <script language="javascript" type="text/javascript">
        
         //自动查询账务账号
         function searchAccounts(txtObj) {
             //document.getElementById("a1").innerHTML = txtObj.value;
         }
        
        //查询帐务帐号
        function search_account(){
       		//重置
       		$("#account_id").val("");
       		$("#login_name").val("");
       		var idcard_no = $("#idcard_no").val();
       		//校验是否为空
       		if(idcard_no==""){
       			$("#idcard_no_msg").text("身份证号不能为空").addClass("error_msg");
       			return;
       		}
       		//校验身份证号格式
       		var reg = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;
       		if(!reg.test(idcard_no)){
       			$("#idcard_no_msg").text("身份证号格式不正确").addClass("error_msg");
       			return;
       		}
       		//查询帐务帐号
       		$.post(
       			"searchAccount.do",
       			{"idcardNo":idcard_no},
       			function(data){
       				if(data==""){//此处返回字符串，不会为null
       					//没有查询到数据给予错误提示
       					$("#idcard_no_msg").text("没有此帐号").addClass("error_msg");
       				}else{
       					//查询到数据，设置默认值
       					//将account_id存入hidden
       					$("#account_id").val(data.account_id);
       					//将login_name存入帐务帐号框
       					$("#login_name").val(data.login_name);
       					//给予正确的提示，并移除错误的样式
       					$("#idcard_no_msg").text("有效的身份证号").removeClass("error_msg");
       				}
       			}	
       		);
        }
        
        //校验ip
        function check_unix_host(){
        	 var unix_host = $("#unix_host").val();
        	 if(unix_host==""){
        		 $("#unix_host_msg").text("不能为空").addClass("error_msg");
        		 return;
        	 }
        	 var reg = /^\d+\.\d+\.\d+\.\d+$/;
        	 if(!reg.test(unix_host)){
        		 $("#unix_host_msg").text("请输入15 长度，符合IP的地址规范").addClass("error_msg");
        		 return;
        	 }
        	 $("#unix_host_msg").text("有效IP的地址").removeClass("error_msg");
        }
        
        //校验os账号
        function check_os_username(){
        	 var os_username = $("#os_username").val();
        	 if(os_username==""){
        		 $("#os_username_msg").text("不能为空").addClass("error_msg");
        		 return;
        	 }
        	 var reg = /^[A-Za-z0-9_]{1,8}$/;
        	 if(!reg.test(os_username)){
        		 $("#os_username_msg").text("请输入8长度以内的字母、数字和下划线的组合").addClass("error_msg");
        		 return;
        	 }
        	 $("#os_username_msg").text("有效os账号").removeClass("error_msg");
        }
        
        //校验登录密码
        function check_login_passwd(){
        	 var login_passwd = $("#login_passwd").val();
        	 if(login_passwd==""){
        		 $("#login_passwd_msg").text("不能为空").addClass("error_msg");
        		 return;
        	 }
        	 var reg = /^[A-Za-z0-9_]{3,16}$/;
        	 if(!reg.test(login_passwd)){
        		 $("#login_passwd_msg").text("请输16长度以内的字母、数字和下划线的组合").addClass("error_msg");
        		 return;
        	 }
        	 $("#login_passwd_msg").text("有效密码格式").removeClass("error_msg");
        }
        
        //校验重复密码
        function checkedPassword(){
        	 var login_passwd = $("#login_passwd").val();
        	 var check_password = $("#check_password").val();
        	 if(login_passwd==""){
        	 	$("#check_password_msg").text("请输入密码").addClass("error_msg");
        	 	return;
        	 }
        	 if(login_passwd != check_password){
        		$("#check_password_msg").text("两次密码必须相同").addClass("error_msg");
        		return;
        	}else{
        		$("#check_password_msg").text("密码正确").removeClass("error_msg");
        	}
        }
        
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
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
        <!--主要区域开始-->
        <div id="main">
            <!--保存操作的提示信息-->
            <div id="save_result_info" class="save_fail">保存失败！192.168.0.23服务器上已经开通过 OS 账号 “mary”。</div>
            <form action="addService.do" method="post" class="main_form">
                <!--内容项-->
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                		<!-- 身份证是用来查找account_id的，不需要保存，不用写name属性。 -->
                    <input type="text" id="idcard_no" class="width180" />
                    <input type="button" value="查询账务账号" class="btn_search_large" onclick="search_account()"/>
                    <span class="required">*</span>
                    <div class="validate_msg_short" id="idcard_no_msg"></div>
                </div>
                <div class="text_info clearfix"><span>账务账号：</span></div>
                <div class="input_info">
                	     <!-- 保存时需要提交account_id -->
                    <input type="hidden" name="account_id" id="account_id"/>
                         <!-- 帐务帐号只是用来核实身份证查询的结果是否正确，不需要提交。不用写name属性 -->
                    <input type="text"  id="login_name" readonly="readonly" class="readonly" onkeyup="searchAccounts(this);" />
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="login_name_msg"></div>
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info">
                    <select name="cost_id">
                    	 <c:forEach items="${costs}" var="c">
                        		<option value="${c.cost_id}">${c.name}</option>
                        </c:forEach>
                    </select>                        
                </div> 
                <div class="text_info clearfix"><span>服务器 IP：</span></div>
                <div class="input_info">
                    <input type="text" name="unix_host" id="unix_host" onblur="check_unix_host();"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="unix_host_msg">15 长度，符合IP的地址规范</div>
                </div>                   
                <div class="text_info clearfix"><span>登录 OS 账号：</span></div>
                <div class="input_info">
                    <input type="text" name="os_username" id="os_username" onblur="check_os_username();"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="os_username_msg">8长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>密码：</span></div>
                <div class="input_info">
                    <input type="password" name="login_passwd" id="login_passwd" onblur="check_login_passwd();"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="login_passwd_msg">16长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>重复密码：</span></div>
                <div class="input_info">
                    <input type="password" id="check_password" onblur="checkedPassword();"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="check_password_msg">两次密码必须相同</div>
                </div>     
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="submit" value="保存" class="btn_save"  />
                    <input type="button" value="取消" class="btn_save" onclick="history.back()"/>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
    </body>
</html>





