<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cantaishow.jsp' starting page</title>
    
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
									<td width="100">餐台名</td>
									<td width="100">所在区域</td>
									<td width="100">座位数</td>
									<td width="100">最低消费</td>
									<td width="100">餐台状态</td>
								</tr>
								<c:forEach items="${cantai1}" var="c">
								<tr class="ccc">
									<td width="50">${c.id }</td>
									<td width="100">${c.name }</td>
									<c:if test="${c.area==0 }">
									<td width="100">大厅</td>
									</c:if>
									<c:if test="${c.area==1 }">
									<td width="100">包厢</td>
									</c:if>
									<td width="100">${c.seatsize }</td>
									<td width="100">${c.minpay }</td>
									<c:if test="${c.state==0 }">
									<td width="100">空闲</td>
									</c:if>
									<c:if test="${c.state==1 }">
									<td width="100">就餐</td>
									</c:if>
								</tr>
								</c:forEach>
							</table>
  </body>
</html>
