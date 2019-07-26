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
    
    <title>My JSP 'foodinfo.jsp' starting page</title>
    
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
    <c:forEach items="${foods}" var="f">
		<c:if test="${f.isguqing==0 }">
			<div class="cai">
 			<div style="font-weight: bold;font-size:16px; height:35px ;padding-top: 20px; ">${f.name}</div>
 			<div style="font-size: 12px;">￥${f.price }0</div>
 		</div>
		</c:if>
		<c:if test="${f.isguqing==1 }">
			<div class="cai1">
 			<div style="font-weight: bold;font-size:16px; height:35px ;padding-top: 20px; ">${f.name}</div>
 			<div style="font-size: 12px;">￥${f.price }0</div>
 		</div>
		</c:if>
	</c:forEach>
  </body>
</html>
