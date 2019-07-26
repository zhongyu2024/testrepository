<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ajaxTJ.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="/ZhongyuSystem/js/jquery-1.8.3.js"></script>
  </head>
  
  <body>
    <table>
		<tr>
			<td>姓名</td>
			<td>会员类型</td>
			<td>卡号</td>
			<td>消费单数</td>
			<td>消费金额</td>
			<td>充值金额</td>
			<td>会员余额</td>
		</tr>
		<c:forEach items="${cc }" var="cc">
		<tr>
			<td>${cc.vname}</td>
			<td>${cc.vtype}</td>
			<td>${cc.vcardid}</td>
			<td>${cc.xfnum}</td>
			<td>${cc.xfmoney}</td>
			<td>${cc.czmoney}</td>
			<td>${cc.money}</td>
		</tr>
		</c:forEach>
	</table>
  </body>
</html>
