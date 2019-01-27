<%@page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<ul id="menu">
	<!-- 每个人都可以访问首页 -->
   <c:choose>
		<c:when test="${currentModule==0 }">
			<li><a href="${pageContext.request.contextPath }/login/toIndex.do" class="index_on"></a></li>
		</c:when>
		<c:otherwise>
			<li><a href="${pageContext.request.contextPath }/login/toIndex.do" class="index_off"></a></li>
		</c:otherwise>
	</c:choose>
    
    <!-- 业务模块需要根据用户权限动态创建 -->
    <c:forEach items="${adminModules}" var="module"> 
    	<c:if test="${module.module_id==1 }">
			<c:choose>
				<c:when test="${currentModule==1 }">
					<li><a href="${pageContext.request.contextPath }/role/findRole.do?currentPage=1" class="role_on"></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath }/role/findRole.do?currentPage=1" class="role_off"></a></li>
				</c:otherwise>
			</c:choose>
		</c:if>
		<c:if test="${module.module_id==2 }">
			<c:choose>
				<c:when test="${currentModule==2 }">
					<li><a href="${pageContext.request.contextPath }/admin/findAdmin.do?currentPage=1" class="admin_on"></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath }/admin/findAdmin.do?currentPage=1" class="admin_off"></a></li>
				</c:otherwise>
			</c:choose>	
		</c:if>
		<c:if test="${module.module_id==3 }">
			<c:choose>
				<c:when test="${currentModule==3 }">
					<li><a href="${pageContext.request.contextPath }/cost/findCost.do?currentPage=1" class="fee_on"></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath }/cost/findCost.do?currentPage=1" class="fee_off"></a></li>
				</c:otherwise>
			</c:choose>
		</c:if>
		<c:if test="${module.module_id==4 }">
			<c:choose>
				<c:when test="${currentModule==4 }">
					<li><a href="${pageContext.request.contextPath }/account/findAccount.do?currentPage=1" class="account_on"></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath }/account/findAccount.do?currentPage=1" class="account_off"></a></li>
				</c:otherwise>
			</c:choose>
		</c:if>
		<c:if test="${module.module_id==5 }">
			<c:choose>
				<c:when test="${currentModule==5 }">
					<li><a href="${pageContext.request.contextPath }/service/findService.do?currentPage=1" class="service_on"></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath }/service/findService.do?currentPage=1" class="service_off"></a></li>
				</c:otherwise>
			</c:choose>
		</c:if>
    	<c:if test="${module.module_id==6}">
		    <li><a href="bill/bill_list.html" class="bill_off"></a></li>
    	</c:if>
    	<c:if test="${module.module_id==7}">
		    <li><a href="report/report_list.html" class="report_off"></a></li>
    	</c:if>
    </c:forEach>
    
    <!-- 每个人都可以访问个人信息，修改密码 -->
	<c:choose>
		<c:when test="${currentModule==8 }">
			<li><a href="${pageContext.request.contextPath }/user/findUser.do?currentPage=1" class="information_on"></a></li>
		</c:when>
		<c:otherwise>
			<li><a href="${pageContext.request.contextPath }/user/findUser.do?currentPage=1" class="information_off"></a></li>
		</c:otherwise>
	</c:choose>
    <c:choose>
		<c:when test="${currentModule==9 }">
			<li><a href="${pageContext.request.contextPath }/pwd/toUpdatePwd.do?currentPage=1" class="password_on"></a></li>
		</c:when>
		<c:otherwise>
			<li><a href="${pageContext.request.contextPath }/pwd/toUpdatePwd.do?currentPage=1" class="password_off"></a></li>
		</c:otherwise>
	</c:choose>
</ul>