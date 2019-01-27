<%@page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
		  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>课程设计－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
        <script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
        <script language="javascript" type="text/javascript">
             
          var flag1 = false;
          var flag2 = false;
          var flag3 = false;
          var flag4 = false;
          
          function save(){
          		if(flag1&&flag2&&flag3&&flag4){
          			document.form[0].submit();
          		}
          }
             
             function check_name(){
           		var name = $("#name").val();
           		if(name==""){
           			$("#name_msg").text("不能为空").addClass("error_msg");
           			return;
           		}
           		var reg=/^[\u4E00-\u9FA5A-Za-z0-9_]{2,50}$/;
           		if(!reg.test(name)){
           			$("#name_msg").text("请输入50长度的字母、数字、汉字和下划线的组合").addClass("error_msg");
           			return;
           		}
           		$("#name_msg").text("有效资费名称").removeClass("error_msg");
           		var flag1 = true;
           }
           
           
           function check_base_duration(){
           		var $s =$("input:checked").val();
           		if($s==1 || $s==3){
           			$("#base_duration_msg").text("1-600之间的整数").removeClass("error_msg");
           			$("#base_duration").val("");
           			flag2 = true;
           			return;
           		}else if($s==2){
           			var base_duration = $("#base_duration").val();
           			if(base_duration==""){
           				$("#base_duration_msg").text("不能为空").addClass("error_msg");
           				return;
           			}
           			var reg=/^([1,5]\d{0,2}|600)$/;
           			if(!reg.test(base_duration)){
           				$("#base_duration_msg").text("请输入1-600之间的整数").addClass("error_msg");
           				return;
           			}
           			$("#base_duration_msg").text("有效基本时长").removeClass("error_msg");
           			flag2 = true;
           		}
           }
           
           
           function check_base_cost(){
          		var $s =$("input:checked").val();
           		if($s==1 || $s==2){
	           		var base_cost = $("#base_cost").val();
	           		if(base_cost==""){
	           			$("#base_cost_msg").text("不能为空").addClass("error_msg");
	           			return;
	           		}
	           		var reg=/^\d{1,5}(\.\d{1,2})?$/;
	           		if(!reg.test(base_cost)){
	           			$("#base_cost_msg").text("请输入0-99999.99之间的数值").addClass("error_msg");
	           			return;
	           		}
	           		$("#base_cost_msg").text("有效基本费用").removeClass("error_msg");
	           		flag3 = true;
          		 }else if($s==3){
          		 	$("#base_cost_msg").text("0-99999.99之间的数值").removeClass("error_msg");
          		 	$("#base_cost").val("");
          		 	flag3 = true;
          		 }
           	}

           function check_unit_cost(){
           		var $s =$("input:checked").val();
          		if($s==2 || $s==3){
	           		var unit_cost = $("#unit_cost").val();
	           		if(unit_cost==""){
	           			$("#unit_cost_msg").text("不能为空").addClass("error_msg");
	           			return;
	           		}
	           		var reg=/^\d{1,5}(\.\d{1,2})?$/;
	           		if(!reg.test(unit_cost)){
	           			$("#unit_cost_msg").text("请输入0-99999.99之间的数值").addClass("error_msg");
	           			return;
	           		}
	           		$("#unit_cost_msg").text("有效单位费用").removeClass("error_msg");
	           		flag4 = true;
          		 }else{
          			$("#unit_cost_msg").text("0-99999.99之间的数值").removeClass("error_msg");
          		 	$("#unit_cost").val("");
          		 	flag4 = true;
          		 }
           }
            
            function check_descr(){
          		var descr = $("#descr").val();
          		if(descr == ""){
          			$("#descr_msg").text("100长度的字母、数字、汉字和下划线的组合").removeClass("error_msg");
          			return;
          		}
           		var reg=/^[\u4E00-\u9FA5A-Za-z0-9_]{0,100}$/;
           		if(!reg.test(descr)){
           			$("#descr_msg").text("请输入100长度的字母、数字、汉字和下划线的组合").addClass("error_msg");
           			return;
           		}
           		$("#descr_msg").text("有效资费说明").removeClass("error_msg");
           }

            //切换资费类型
            function feeTypeChange(type) {
            	var inputArray = document.getElementById("main").getElementsByTagName("input");
                if (type == 1) {
                    inputArray[5].readOnly = true;
                    inputArray[5].value = "";
                    inputArray[5].className += " readonly";
                    inputArray[6].readOnly = false;
                    inputArray[6].className = "width100";
                    inputArray[7].readOnly = true;
                    inputArray[7].className += " readonly";
                    inputArray[7].value = "";
                }
                else if (type == 2) {
                    inputArray[5].readOnly = false;
                    inputArray[5].className = "width100";
                    inputArray[6].readOnly = false;
                    inputArray[6].className = "width100";
                    inputArray[7].readOnly = false;
                    inputArray[7].className = "width100";
                }
                else if (type == 3) {
                    inputArray[5].readOnly = true;
                    inputArray[5].value = "";
                    inputArray[5].className += " readonly";
                    inputArray[6].readOnly = true;
                    inputArray[6].value = "";
                    inputArray[6].className += " readonly";
                    inputArray[7].readOnly = false;
                    inputArray[7].className = "width100";
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
            	<!-- 文本框上的value属性只是用来设置其默认值的，提交表单时确实提交的是文本框的value值，
            		但是需要按照文本框的name属性值作为key来传参，因此表单提交必须写name属性 -->
            <form action="updateCost.do" method="post" class="main_form">
                <div class="text_info clearfix"><span>资费ID：</span></div>
                <div class="input_info"><input type="text" name="cost_id" class="readonly" readonly value="${cost.cost_id}" /></div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info">
                    <input type="text" class="width300" name="name" value="${cost.name}" 
                    		id="name" onblur="check_name();"/>
                    <span class="required">*</span>
                    <div class="validate_msg_short" id="name_msg">50长度的字母、数字、汉字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info fee_type">
               
               		<!-- radio提交的是value属性值，因此不要忘了写value属性；
               					radio提交需要使用name属性进行匹配赋值，不要忘了写name属性。 -->
                    <input type="radio" name="cost_type" value="1" <c:if test="${cost.cost_type==1}">checked</c:if> id="monthly" onclick="feeTypeChange(1);" />
                    <label for="monthly">包月</label>
                    <input type="radio" name="cost_type" value="2" <c:if test="${cost.cost_type==2}">checked</c:if> id="package" onclick="feeTypeChange(2);" />
                    <label for="package">套餐</label>
                    <input type="radio" name="cost_type" value="3" <c:if test="${cost.cost_type==3}">checked</c:if> id="timeBased" onclick="feeTypeChange(3);" />
                    <label for="timeBased">计时</label>
                </div>
                <div class="text_info clearfix"><span>基本时长：</span></div>
                <div class="input_info">
                    <input type="text" name="base_duration" value="${cost.base_duration}" class="width100" 
                    			id="base_duration" onblur="check_base_duration();"/>
                    <span class="info">小时</span>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="base_duration_msg">1-600之间的整数</div>
                </div>
                <div class="text_info clearfix"><span>基本费用：</span></div>
                <div class="input_info">
                    <input type="text" name="base_cost" value="${cost.base_cost}" class="width100" 
                    			id="base_cost" onblur="check_base_cost();"/>
                    <span class="info">元</span>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="base_cost_msg">0-99999.99之间的数值</div>
                </div>
                <div class="text_info clearfix"><span>单位费用：</span></div>
                <div class="input_info">
                    <input type="text" name="unit_cost" value="${cost.unit_cost}" class="width100" 
                    		id="unit_cost" onblur="check_unit_cost();"/>
                    <span class="info">元/小时</span>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="unit_cost_msg">0-99999.99之间的数值</div>
                </div>   
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea class="width300 height70" name="descr" id="descr" onblur="check_descr();">${cost.descr}</textarea>
                    <div class="validate_msg_short" id="descr_msg">100长度的字母、数字、汉字和下划线的组合</div>
                </div>                    
                <div class="button_info clearfix">
                    <input type="submit" value="保存" class="btn_save"  />
                    <input type="button" value="取消" class="btn_save" onclick="history.back()"/>
                </div>
            </form>
        </div>
    </body>
</html>

