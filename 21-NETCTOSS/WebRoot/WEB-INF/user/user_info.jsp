<%@page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
            	if(nameResult == true){
            	 	 showResultDiv(true);
               		 window.setTimeout("showResultDiv(false);", 5000);
               		 document.forms[0].submit();
                }else{
               		 document.forms[0].submit();
                }
            }
            function showResultDiv(flag) {
          		var divResult = document.getElementById("save_result_info");
                if (flag){
                 	divResult.style.display = "block";
                }
                else{
                	divResult.style.display = "none";
                }
            }
            
             var nameResult;
            function check_name(){
            	nameResult = null;
           		var name = $("#name").val();
           		if(name==""){
           			$("#name_msg").text("不能为空").addClass("error_msg");
           			return;
           		}
           		var reg=/^[\u4E00-\u9FA5A-Za-z0-9_]{1,20}$/;
           		if(!reg.test(name)){
           			$("#name_msg").text("请输入20长度的字母、数字、汉字和下划线的组合").addClass("error_msg");
           			return;
           		}
           		$("#name_msg").text("有效姓名").removeClass("error_msg");
           		nameResult = true;
           }
            
            //校验电话
         function check_telephone(){
         
         	  var reg= /^[1][358]\d{9}$/;  //验证手机号码 13,15,18开头的是一位电话号
     		  var m =/^\d{3}-\d{8}|\d{4}-\d{7}$/;//验证电话号码为7-8位数字并带有区号
	          var mobel=$("#telephone").val()
	          if((mobel.length==11)&&(reg.test(mobel))){
	             $("#telephone_msg").text("有效电话号码").removeClass("error_msg"); 
	          }else if(mobel.length>13||mobel.length<=8){
	          	 $("#telephone_msg").text("请输入正确的电话号码格式：手机或固话").addClass("error_msg");
	    	  }else if(!m.test(mobel)) {
	        	 $("#telephone_msg").text("请输入正确的电话号码格式：手机或固话").addClass("error_msg");
	          }else{
	          	 $("#telephone_msg").text("有效电话号码").removeClass("error_msg");
	          }   
         }
            
        //校验email
      	 function check_email(){
      		var email = $("#email").val();
      		var reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
      		if(!reg.test(email)){
      			$("#email_msg").text("请输入50长度以内，正确的 email 格式").addClass("error_msg");
      			return;
      		}
      		$("#email_msg").text("有效email").removeClass("error_msg");
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
            <div id="save_result_info" class="save_success">保存成功！</div><!--保存失败，数据并发错误！-->
            <form action="updateUser.do" method="post" class="main_form">
                <div class="text_info clearfix"><span>管理员账号：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${admin.admin_code}" /></div>
                <div class="text_info clearfix"><span>角色：</span></div>
                <div class="input_info">
                   	<c:forEach items="${admin.roles }" var="ar" varStatus="s">
                   		<c:choose>
		                     <c:when test="${s.last}">${ar.name}</c:when>
		                     <c:otherwise>${ar.name},</c:otherwise>
                  		</c:choose>
                    </c:forEach>
                </div>
                
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info">
                    <input type="text" name="name" value="${admin.name}" id="name" onblur="check_name()"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="name_msg">20长度以内的汉字、字母的组合</div>
                </div>
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <input type="text" class="width200" name="telephone" value="${admin.telephone}" 
                    		id="telephone" onblur="check_telephone();"/>
                    <div class="validate_msg_medium" id="telephone_msg">电话号码格式：手机或固话</div>
                </div>
                <div class="text_info clearfix"><span>Email：</span></div>
                <div class="input_info">
                    <input type="text" class="width200" name="email" value="${admin.email}" 
                    		id="email" onblur="check_email();"/>
                    <div class="validate_msg_medium" id="email_msg">50长度以内，符合 email 格式</div>
                </div>
                <div class="text_info clearfix"><span>创建时间：</span></div>
                <div class="input_info">
                	<fmt:formatDate value="${admin.enrolldate}" pattern="yyyy-MM-dd HH:mm:ss"/>
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
