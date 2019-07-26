<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'twotable.jsp' starting page</title>
    
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
    <c:forEach items="${flist1}" var="foodtable">
					<div style="width:115px;height:80px;border:1px solid #DADADA;background:#EFF3F6;float:left;margin-left:30px;margin-top:20px;">
					<span style="position:relative;top:20px;left:30px;font-size:18px;font-weight:bold;">${foodtable.name}</span>
					<span style="position:relative;top:50px;left:-50px;font-size:10px;">${foodtable.seatsize}人桌</span>	
					</div>
				</c:forEach>
  </body>
</html>
