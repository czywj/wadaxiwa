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
            
            //校验角色名
            var nameResult;
            function check_name(){
            	nameResult = null;
            	var name = $("#name").val();
            	//校验名称格式
            	var reg = /^[\u4E00-\u9FA5A-Za-z0-9]{1,20}$/;
            	if(!reg.test(name)){
            		$("#name_msg").text("1-20长度的字母、数字和汉字的组合").addClass("error_msg");
            		nameResult = false;	
            		return;
            	}
            	//校验名称是否重复
            	$.post(
            		"checkRoleName.do",
            		{"name":name},
            		function(data){
            			if(data){
            				//如果校验通过，给予正确的提示
            				$("#name_msg").text("角色名有效").removeClass("error_msg");
            				nameResult = true;
            			}else{
            				$("#name_msg").text("角色名已存在").addClass("error_msg");
            				nameResult = false;
            			}
            		}
            	);
            }
            
            //校验是否选中模块
            function check_module(){
            	var checkObjs = $(":checkbox[name='moduleIds']:checked");
            	if(checkObjs.length == 0){
            		$("#module_msg").text("请至少选择一个模块").addClass("error_msg");
            		return false;
            	}else{
            		$("#module_msg").text("已选中模块有效").removeClass("error_msg");
            		return true;
            	}
            }
            
            //保存
            function save(){
            	//先调用非异步请求的校验方法
            	if(!check_module()){
            		return ;
            	}
            	//再调用异步请求的校验方法
            	//check_name();
            	//每隔100ms执行一次function
            	var timer = setInterval(function(){
            		//判断nameResult，看check_name是否执行完毕
            		if(nameResult != null){
            			//如果标志非空，则说明check_name已经执行完毕，结束循环
            			clearInterval(timer);
            			if(nameResult){
            				//校验通过，提交表单
            				showResultDiv(true);
               				window.setTimeout("showResultDiv(false);", 3000);
            				document.forms[0].submit();
            			}
            			//校验失败，不提交表单
            		}
            		//如果标志为空，说明check_name没结束，不做任何处理，继续等待下次判断
            	},100);
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
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_success">保存成功！</div><!--保存失败，角色名称重复！-->
            <form action="addRole.do" method="post" class="main_form">
                <div class="text_info clearfix"><span>角色名称：</span></div>
                <div class="input_info">
                    <input type="text" name="name" id="name" class="width200" onblur="check_name()"/>
                    <span class="required">*</span>
                    <div class="validate_msg_medium" id="name_msg">1-20长度的字母、数字和汉字的组合</div>
                </div>                    
                <div class="text_info clearfix"><span>设置权限：</span></div>
                <div class="input_info_high">
                    <div class="input_info_scroll">
                        <ul>
                        	<c:forEach items="${modules}" var="m">
                            <li><input type="checkbox" name="moduleIds" value="${m.module_id}" onclick="check_module()"/>${m.name}</li>
                         </c:forEach>
                        </ul>
                    </div>
                    <span class="required">*</span>
                    <div class="validate_msg_tiny" id="module_msg">至少选择一个模块</div>
                </div>
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="save()" />
                    <input type="button" value="取消" class="btn_save" onclick="history.back()" />
                </div>
            </form>
        </div>
        <!--主要区域结束-->
    </body>
</html>
