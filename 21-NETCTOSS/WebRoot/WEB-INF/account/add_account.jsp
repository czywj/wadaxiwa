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
       	 //校验姓名
       	 function check_real_name(){
       		var real_name = $("#real_name").val();
       		if(real_name==""){
       			$("#real_name_msg").text("不能为空").addClass("error_msg");
       			return;
       		}
       		var reg=/^[\u4E00-\u9FA5A-Za-z0-9]{1,20}$/;
       		if(!reg.test(real_name)){
       			$("#real_name_msg").text("请输入20长度以内的汉字、字母和数字的组合").addClass("error_msg");
       			return;
       		}
       		$("#real_name_msg").text("有效资费名称").removeClass("error_msg");
          }
          
         //校验身份证号
         function check_idcard_no(){
        	 $("#brithdate").val("");
        	 var idcard = $("#idcard_no").val();
        	 if(idcard==""){
        		 $("#idcard_no_msg").text("身份证号不能为空").addClass("error_msg");
        		 return;
        	 }
        	 var reg = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;
        	 if(!reg.test(idcard)){
        		 $("#idcard_no_msg").text("身份证号格式不正确").addClass("error_msg");
        		 return;
        	 }
        	 $("#idcard_no_msg").text("有效身份证号").removeClass("error_msg");
        	 var year = idcard.substring(6,10);
        	 var month = idcard.substring(10,12);
        	 var day = idcard.substring(12,14);
        	 var birthdate = year+"-"+month+"-"+day;
        	 $("#birthdate").val(birthdate);
         }
         
         //校验登录账号
          function check_login_name(){
       		var login_name = $("#login_name").val();
       		if(login_name==""){
       			$("#login_name_msg").text("不能为空").addClass("error_msg");
       			return;
       		}
       		var reg=/^[A-Za-z0-9_]{1,30}$/;
       		if(!reg.test(login_name)){
       			$("#login_name_msg").text("请输入30长度以内的字母、数字和下划线的组合").addClass("error_msg");
       			return;
       		}
       		$("#login_name_msg").text("有效资费名称").removeClass("error_msg");
          }
        
        //校验登录密码
        function check_login_password(){
        	 var login_password = $("#login_password").val();
        	 if(login_password==""){
        		 $("#login_password_msg").text("不能为空").addClass("error_msg");
        		 return;
        	 }
        	 var reg = /^[A-Za-z0-9_]{3,16}$/;
        	 if(!reg.test(login_password)){
        		 $("#login_password_msg").text("请输16长度以内的字母、数字和下划线的组合").addClass("error_msg");
        		 return;
        	 }
        	 $("#login_password_msg").text("有效密码格式").removeClass("error_msg");
        }
        
        //校验重复密码
        function checkedPassword(){
        	 var login_password = $("#login_password").val();
        	 var check_password = $("#check_password").val();
        	 if(login_password=="" || login_password==null){
        	 	$("#check_password_msg").text("请输入密码").addClass("error_msg");
        	 	return;
        	 }
        	 if(login_password != check_password){
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
        
            //保存成功的提示信息
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

            //显示选填的信息项
           function showOptionalInfo(imgObj) {
                var div = document.getElementById("optionalInfo");
                if (div.className == "hide") {
                    div.className = "show";
                    imgObj.src = "../images/hide.png";
                }
                else {
                    div.className = "hide";
                    imgObj.src = "../images/show.png";
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
        <!--主要区域开始-->
        <div id="main">       
            <!--保存成功或者失败的提示消息-->     
            <div id="save_result_info" class="save_fail">保存失败，该身份证已经开通过账务账号！</div>
            <form action="addAccount.do" method="post" class="main_form">
                <!--必填项-->
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info">
                    <input type="text" name="real_name" id="real_name" onblur="check_real_name();"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="real_name_msg">20长度以内的汉字、字母和数字的组合</div>
                </div>
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                    <input type="text" name="idcard_no" id="idcard_no" onblur="check_idcard_no();" />
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="idcard_no_msg">正确的身份证号码格式</div>
                </div>
                <div class="text_info clearfix"><span>登录账号：</span></div>
                <div class="input_info">
                    <input type="text" name="login_name"  id="login_name" onblur="check_login_name();"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="login_name_msg">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>密码：</span></div>
                <div class="input_info">
                    <input type="password" name="login_passwd" id="login_password" onblur="check_login_password();"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="login_password_msg">16长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>重复密码：</span></div>
                <div class="input_info">
                    <input type="password" id="check_password" onblur="checkedPassword();"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="check_password_msg">两次密码必须相同</div>
                </div>     
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <input type="text" class="width200" name="telephone" id="telephone" onblur="check_telephone();"/>
                    <span class="required">*</span>
                    <div class="validate_msg_medium" id="telephone_msg">正确的电话号码格式：手机或固话</div>
                </div>                
                <!--可选项-->
               
               <div class="text_info clearfix"><span>可选项：</span></div>
                <div class="input_info">
                    <img src="../images/show.png" alt="展开" onclick="showOptionalInfo(this);" />
                </div>
                <div id="optionalInfo" class="hide">
                    <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                    <div class="input_info">
                        <input type="text"/>
                        <div class="validate_msg_long">正确的身份证号码格式</div>
                    </div>
                    <div class="text_info clearfix"><span>生日：</span></div>
                    <div class="input_info">
                        <input type="text" name="birthdate" id="birthdate" readonly class="readonly" />
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info"> 
                        <input type="text" name="email" class="width350" />
                        <div class="validate_msg_tiny" >50长度以内，合法的 Email格式</div>
                    </div> 
                    <div class="text_info clearfix"><span>职业：</span></div>
                    <div class="input_info">
                        <select name="occupation">
                        	  <option value=""></option>
                            <option value="0">干部</option>
                            <option value="1">学生</option>
                            <option value="2">技术人员</option>
                            <option value="3">其他</option>
                        </select>                        
                    </div>
                    <div class="text_info clearfix"><span>性别：</span></div>
                    <div class="input_info fee_type">
                        <input type="radio" name="gender" value="1" checked="checked" id="female" />
                        <label for="female">女</label>
                        <input type="radio" name="gender" value="0" id="male" />
                        <label for="male">男</label>
                    </div> 
                    <div class="text_info clearfix"><span>通信地址：</span></div>
                    <div class="input_info">
                        <input type="text" name="mailaddress" class="width350" />
                        <div class="validate_msg_tiny">50长度以内</div>
                    </div> 
                    <div class="text_info clearfix"><span>邮编：</span></div>
                    <div class="input_info">
                        <input type="text" name="zipcode" />
                        <div class="validate_msg_long">6位数字</div>
                    </div> 
                    <div class="text_info clearfix"><span>QQ：</span></div>
                    <div class="input_info">
                        <input type="text" name="qq"/>
                        <div class="validate_msg_long">5到13位数字</div>
                    </div>                
               </div>
               
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="submit" value="保存" class="btn_save" />
                    <input type="button" value="取消" class="btn_save" onclick="history.back()"/>
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
    </body>
</html>
