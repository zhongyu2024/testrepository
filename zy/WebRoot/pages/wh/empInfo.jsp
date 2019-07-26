<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'empInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   							<table cellpadding="0" cellspacing="0" style="width:1000px;">
								<tr style="background-color: lightgray;height: 40px;">
									<td width="50">编号</td>
									<td width="100">姓名</td>
									<td width="100">登录账号</td>
									<td width="100">职级</td>
									<td width="100">性别</td>
									<td width="100">出生日期</td>
									<td width="100">入职日期</td>
									<td width="100">手机号码</td>
								</tr>
								<c:forEach items="${yuangong }" var="c">
								<tr class="ccc">
									<td width="50">${c.id }</td>
									<td width="100">${c.name }</td>
									<td width="100">${c.username }</td>
									<td width="100">${c.mode.name }</td>
									<c:if test="${c.sex==0 }" >
									<td width="100">男</td>
									</c:if>
									<c:if test="${c.sex==1 }" >
									<td width="100">女</td>
									</c:if>
									<td width="100">${c.birthday }</td>
									<td width="100">${c.hiredate }</td>
									<td width="100">${c.tel }</td>
								</tr>
								</c:forEach>
							</table>
  </body>
</html>
