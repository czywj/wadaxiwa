<%@page  contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>课程设计－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
        <script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
        <script language="javascript" type="text/javascript">
         //校验姓名
       	 function check_name(){
       		var name = $("#name").val();
       		if(name == ""){
       			$("#name_msg").text("不能为空").addClass("error_msg");
       			return;
       		}
       		var reg=/^[\u4E00-\u9FA5A-Za-z0-9]{1,20}$/;
       		if(!reg.test(name)){
       			$("#name_msg").text("请输入20长度以内的汉字、字母和数字的组合").addClass("error_msg");
       			return;
       		}
       		$("#name_msg").text("有效姓名").removeClass("error_msg");
          }
            
          //校验管理员账号
          function check_admin_code(){
       		var admin_code = $("#admin_code").val();
       		if(admin_code==""){
       			$("#admin_code_msg").text("不能为空").addClass("error_msg");
       			return;
       		}
       		var reg=/^[A-Za-z0-9_]{1,30}$/;
       		if(!reg.test(admin_code)){
       			$("#admin_code_msg").text("请输入30长度以内的字母、数字和下划线的组合").addClass("error_msg");
       			return;
       		}
       		$("#admin_code_msg").text("有效管理员账号").removeClass("error_msg");
          }
            
         //校验密码
         function checkpassword(){
        	 var password = $("#password").val();
        	 if(password==""){
        		 $("#password_msg").text("不能为空").addClass("error_msg");
        		 return;
        	 }
        	 var reg = /^[A-Za-z0-9_]{3,16}$/;
        	 if(!reg.test(password)){
        		 $("#password_msg").text("请输16长度以内的字母、数字和下划线的组合").addClass("error_msg");
        		 return;
        	 }
        	 $("#password_msg").text("有效密码格式").removeClass("error_msg");
        }
        
        //校验重复密码
        function checkedPassword(){
        	 var password = $("#password").val();
        	 var check_password = $("#check_password").val();
        	 if(password==""){
        	 	$("#check_password_msg").text("请输入密码").addClass("error_msg");
        	 	return;
        	 }
        	 if(password != check_password){
        		$("#check_password_msg").text("两次密码必须相同").addClass("error_msg");
        		return;
        	}else{
        		$("#check_password_msg").text("密码正确").removeClass("error_msg");
        	}
        }
        
        //校验电话
        function check_telephone(){
        	var telephone = $("#telephone").val();
       		if(telephone==""){
       			$("#telephone_msg").text("不能为空").addClass("error_msg");
       			return;
       		}
       		var reg=/^(1[3,5,8][0-9]{9})|(\d{3}-\d{8}|\d{4}-\d{7})$/;
       		if(!reg.test(telephone)){
       			$("#telephone_msg").text("请输入正确的电话号码格式：手机或固话").addClass("error_msg");
       			return;
       		}
       		$("#telephone_msg").text("有效电话号码").removeClass("error_msg");
        }
            
        //校验email
      	 function check_email(){
      		var email = $("#email").val();
      		if(email==""){
      			$("#email_msg").text("不能为空").addClass("error_msg");
      			return;
      		}
      		var reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
      		if(!reg.test(email)){
      			$("#email_msg").text("请输入50长度以内，正确的 email 格式").addClass("error_msg");
      			return;
      		}
      		$("#email_msg").text("有效email").removeClass("error_msg");
         }
            
         //校验是否选中模块
         function check_module(){
         	var checkObjs = $(":checkbox[name='moduleIds']:checked");
         	if(checkObjs.length == 0){
         		$("#module_msg").text("请至少选择一个模块").addClass("error_msg");
         		return;
         	}else{
         		$("#module_msg").text("").removeClass("error_msg");
         	}
         }
            
          //保存成功的提示消息
          function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 5000);
                document.forms[0].submit();
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
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form action="addAdmin.do" method="" class="main_form">
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input type="text" name="name" id="name" onblur="check_name();"/>
                        <span class="required">*</span>
                        <div class="validate_msg_long" id="name_msg">20长度以内的汉字、字母、数字的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>管理员账号：</span></div>
                    <div class="input_info">
                        <input type="text" name="admin_code" id="admin_code" onblur="check_admin_code();"/>
                        <span class="required">*</span>
                        <div class="validate_msg_long" id="admin_code_msg">30长度以内的字母、数字和下划线的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>密码：</span></div>
                    <div class="input_info">
                        <input type="password" name="password" id="password" onblur="checkpassword();"/>
                        <span class="required">*</span>
                        <div class="validate_msg_long" id="password_msg">16长度以内的字母、数字和下划线的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>重复密码：</span></div>
                    <div class="input_info">
                        <input type="password" id="check_password" onblur="checkedPassword();"/>
                        <span class="required">*</span>
                        <div class="validate_msg_long" id="check_password_msg">两次密码必须相同</div>
                    </div>      
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input type="text" name="telephone" class="width200" id="telephone" onblur="check_telephone();"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium" id="telephone_msg">正确的电话号码格式：手机或固话</div>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" name="email" class="width200" id="email" onblur="check_email();"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium" id="email_msg">50长度以内，正确的 email 格式</div>
                    </div>
                    <div class="text_info clearfix"><span>角色：</span></div>
                    <div class="input_info_high">
                        <div class="input_info_scroll">
                             <ul>
                                <c:forEach items="${roles }" var="r">
                            		<li><input type="checkbox" value="${r.role_id }" name="roleIds"/>${r.name }</li>
                            	</c:forEach>
                            </ul>
                        </div>
                        <span class="required">*</span>
                        <div class="validate_msg_tiny" id="module_msg">至少选择一个</div>
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
