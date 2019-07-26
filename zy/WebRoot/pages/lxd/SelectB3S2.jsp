<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SelectB3S3.jsp' starting page</title>
    
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
    <div class="formtitle">
		<table border="1px" bordercolor="#EFEFEF" cellspacing="0px">
			<tr bgcolor="#E9EDF1">
				<td>订单号</td>
				<td>支付金额</td>
				<td>结账时间</td>
			</tr>
    		<c:forEach items="${a}" var="zl">     
			<tr id="closes32">
				<td width="100">${zl.id}</td>
				<td width="100">${zl.realpay}</td>
				<td width="100">${zl.paytime}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
  </body>
</html>
