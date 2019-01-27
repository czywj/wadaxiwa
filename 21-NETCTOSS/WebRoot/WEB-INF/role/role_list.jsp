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
            function toDeleteRole(id){
                var r = window.confirm("确定要删除此角色吗？");
                if(r){
              		 location.href = "deleteRole.do?id="+id;
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
            <form action="" method="post">
                <!--查询-->
                <div class="search_add">
                    <input type="button" value="增加" class="btn_add" onclick="location.href='toAddRole.do';" />
                </div>  
                <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功！
                </div> <!--删除错误！该角色被使用，不能删除。-->
                <!--数据区域：用表格展示数据-->     
                <div id="data">                      
                    <table id="datalist">
                        <tr>                            
                            <th>角色 ID</th>
                            <th>角色名称</th>
                            <th class="width600">拥有的权限</th>
                            <th class="td_modi"></th>
                        </tr> 
                        <c:forEach items="${roles}" var="r">                    
	                        <tr>
	                            <td>${r.role_id}</td>
	                            <td>${r.name}</td>
	                            <td>
		                            <c:forEach items="${r.modules}" var="m" varStatus="s">
			                            	<c:choose>
			                            	<c:when test="${s.last}">${m.name}</c:when>
			                            	<c:otherwise>${m.name}、</c:otherwise>
			                            	</c:choose>
		                            </c:forEach>
								</td>
	                            <td>
	                                <input type="button" value="修改" class="btn_modify" onclick="location.href='toUpdateRole.do?id=${r.role_id}';"/>
	                                <input type="button" value="删除" class="btn_delete" onclick="toDeleteRole(${r.role_id});"/>
	                            </td>
	                        </tr>
                        </c:forEach> 
                    </table>
                </div> 
                <!--分页-->
                <div id="pages">
                <c:choose>
                    <c:when test="${rolePage.currentPage==1}"> 
                		<a href="#">上一页</a>
                    </c:when>
        	     		 <c:otherwise>
        	     		 	<a href="findRole.do?currentPage=${rolePage.currentPage-1}">上一页</a>
        	     		 </c:otherwise>
        	     	</c:choose>
        	     	
        	     	<c:forEach begin="1" end="${rolePage.totalPage}" var="p">
        	     		<c:choose>
        	     			<c:when test="${p==rolePage.currentPage}">
        	     				<a href="findRole.do?currentPage=${p}" class="current_page">${p}</a>
        	     			</c:when>
        	     			<c:otherwise>
        	     				<a href="findRole.do?currentPage=${p}">${p}</a>
        	     			</c:otherwise>
        	     		</c:choose>
        	     	</c:forEach>
                    
                <c:choose>
                	<c:when test="${rolePage.currentPage==rolePage.totalPage}">
                		<a href="#">下一页</a>
                	</c:when>
                	<c:otherwise>
                	 	<a href="findRole.do?currentPage=${rolePage.currentPage+1}">下一页</a>
                	</c:otherwise>
               	</c:choose>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
    </body>
</html>


