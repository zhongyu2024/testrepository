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
    
    <title>My JSP 'ajaxMX.jsp' starting page</title>
    
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
    <table style="border: 0px;">
		<tr>
			<td width="60">会员名</td> 
			<td width="60">会员类型</td>
			<td width="60">卡号</td>
			<td width="60">金额</td>
			<td width="60">类型</td>
			<td width="60">余额</td>
			<td width="60">时间</td>
			<td width="60">操作员</td>
			<td width="60">订单号</td>
		</tr>
		<c:forEach items="${cll }" var="cll">
		<tr>
			<td width="60">${cll.vipname }</td>
			<td width="60">${cll.viplevel }</td>
			<td width="60">${cll.vipid }</td>
			<td width="60">${cll.earnmoney }</td>
			<td width="90">
			<c:if test="${cll.xiaofei==1 }">
			消费
			</c:if>
			<c:if test="${cll.xiaofei==0 }">
			充值
			</c:if>
			</td>
			<td width="60">${cll.mymoney }</td>
			<td width="60">${cll.time }</td>
			<td width="60">${cll.doman }</td>
			<td width="60">${cll.listid }</td>
		</tr>
		</c:forEach>
	</table>
  </body>
</html>
