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
    
    <title>My JSP 'specialInfo.jsp' starting page</title>
    
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
   
		<table cellpadding="0" cellspacing="0" width="1000px">
			<tr style="background-color: lightgray;height: 40px;cursor: default;">
				<td width="50">编号</td>
				<td width="100">要求</td>
			</tr>
			<c:forEach items="${info }" var="t">
			<tr class="ccc">
				<td width="50">${t.id }</td>
				<td width="100">${t.name }</td>
			</tr>
			</c:forEach>
		</table>

  </body>
</html>
