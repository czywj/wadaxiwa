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
        <script language="javascript" type="text/javascript">
           
           //自动加载
        	$(function(){
        		var baseDurationSort = $("#baseDurationSort").val();
        		var baseCostSort = $("#baseCostSort").val();
        		if(baseDurationSort != "") {
	        		$("#baseDuration").attr("class","sort_"+baseDurationSort);
        		}
        		if(baseCostSort != "") {
	        		$("#baseCost").attr("class","sort_"+baseCostSort);
        		}
        	});
            //排序按钮的点击事件
            function sort(btnObj) {
                if (btnObj.className == "sort_desc") {
                    //btnObj.className = "sort_asc";
                	$("#"+btnObj.id+"Sort").val("asc");
                } else {
                    //btnObj.className = "sort_desc";
                	$("#"+btnObj.id+"Sort").val("desc");
                }
                $("#costForm").submit();
            }
           
            //启用
            function startFee(id) {
                var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
                if(r){
                	location.href="startCost.do?id="+id;
                }
            }
            //删除
            function deleteFee(id) {
                var r = window.confirm("确定要删除此资费吗？");
                if(r){
                	location.href="deleteCost.do?id="+id;
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
            <form action="findCost.do" method="post" id="costForm">
                <div class="search_add">
                   <div>
                    	<input type="hidden" name="currentPage" value="1"/>
                    	<input type="hidden" name="baseDurationSort" id="baseDurationSort" value="${costPage.baseDurationSort}"/>
                    	<input type="hidden" name="baseCostSort" id="baseCostSort" value="${costPage.baseCostSort}"/>
                    
                        <!--<input type="button" value="月租" class="sort_asc" onclick="sort(this);" />
                        <input type="button" value="基费" id="baseDuration" class="sort_asc" onclick="sort(this);" />
                        <input type="button" value="时长" id="baseCost" class="sort_asc" onclick="sort(this);" />-->
                    </div>
                    <!-- 
				                    当前页面的访问路径是/NETCTOSS/cost.findCost.do
				                    增加页面的访问路径是/NETCTOSS/cost.toAddCost.do
				                    由于都在/cost路径下，因此用相对路径来引用新增页面时，可以省略路径中相同的部分，即/NETCTOSS/cost/
                     -->
                    <input type="button" value="增加" class="btn_add" onclick="location.href='toAddCost.do';" />
                </div> 
                <!--启用操作的操作提示-->
              <!--  <div id="operate_result_info" class="operate_success">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功！
                </div>  -->    
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th>资费ID</th>
                            <th class="width100">资费名称</th>
                            <th>基本时长</th>
                            <th>基本费用</th>
                            <th>单位费用</th>
                            <th>创建时间</th>
                            <th>开通时间</th>
                            <th class="width50">状态</th>
                            <th class="width200"></th>
                        </tr>                      
                        <c:forEach items="${costs}" var="c">
                        <tr>
                            <td>${c.cost_id}</td>
                            <td><a href="fee_detail.html">${c.name}</a></td>
                            <td>${c.base_duration}</td>
                            <td>${c.base_cost}</td>
                            <td>${c.unit_cost}</td>
                            <td><fmt:formatDate value="${c.creatime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${c.startime}</td>
                            <td>
                            		<c:if test="${c.status==0}">
                            			开通
                            		</c:if>
                            		<c:if test="${c.status==1}">
                            			暂停
                            		</c:if>
                            </td>
                            <td>      
                                <c:if test="${c.status==0}">
		                               <input type="button" value="暂停" class="btn_pause"  />
		                               <input type="button" value="修改" class="btn_modify" />
		                               <input type="button" value="删除" class="btn_delete" />
                                </c:if>
                                <c:if test="${c.status==1}">
		                               <input type="button" value="启用" class="btn_start" onclick="startFee(${c.cost_id});" />
		                               <input type="button" value="修改" class="btn_modify" onclick="location.href='toUpdateCost.do?id=${c.cost_id}';" />
		                               <input type="button" value="删除" class="btn_delete" onclick="deleteFee(${c.cost_id});" />
                                </c:if>            
                               
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                    <p>业务说明：<br />
                    1、创建资费时，状态为暂停，记载创建时间；<br />
                    2、暂停状态下，可修改，可删除；<br />
                    3、开通后，记载开通时间，且开通后不能修改、不能再停用、也不能删除；<br />
                    4、业务账号修改资费时，在下月底统一触发，修改其关联的资费ID（此触发动作由程序处理）
                    </p>
                </div>
                <!--分页-->
                <div id="pages">
                		<!-- 当前页是首页则不能点上一页 -->
                		<c:if test="${costPage.currentPage==1}">
                				<a href="#">上一页</a>
                		</c:if>
                		<c:if test="${costPage.currentPage!=1}">
                				<a href="findCost.do?currentPage=${costPage.currentPage-1}">上一页</a>
                		</c:if>
        	        	<!-- 注意：页数不是按照集合循环！ -->
        	        	<c:forEach begin="1" end="${costPage.totalPage}" var="i">
        	     			<c:if test="${i==costPage.currentPage}">
        	     				<a href="findCost.do?currentPage=${i}" class="current_page">${i}</a><!-- 当前选中页添加样式 -->
        	     			</c:if>
        	        		<c:if test="${i!=costPage.currentPage}">
        	     				<a href="findCost.do?currentPage=${i}">${i}</a>
        	     			</c:if>
        	        	</c:forEach>
        	        	<!-- 当前页是最后一页，则不能点 -->
        	        	<c:if test="${costPage.currentPage==costPage.totalPage}">
                		<a href="#">下一页</a>
                	</c:if>
                	<c:if test="${costPage.currentPage!=costPage.totalPage}">
                		<a href="findCost.do?currentPage=${costPage.currentPage+1}">下一页</a>
                	</c:if>
                </div>
            </form>
        </div>
        
    </body>
</html>
