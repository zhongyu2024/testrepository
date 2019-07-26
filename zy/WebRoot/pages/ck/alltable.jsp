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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
  	<div style="height:493px;width:956px;border-bottom:1px solid #DADADA；" id="tlist">
				<c:forEach items="${ylist}" var="yudingfoodtable">
				<div style="width:115px;height:80px;border-radius:15px;border:1px solid #DADADA;
				background:#EFF3F6;float:left;margin-left:30px;margin-top:20px;cursor:pointer;
					<c:if test="${foodtable.state==0}">border:1px solid green</c:if>" id="${yudingfoodtable.id}">
					<span style="position:relative;top:20px;left:30px;font-size:18px;font-weight:bold;">${yudingfoodtable.name}</span>
					<span style="position:relative;top:50px;left:-50px;font-size:10px;">${yudingfoodtable.seatsize}人桌</span>	
					<input type="hidden" value="${yudingfoodtable.seatsize}" id="hum">
				</div> 
				</c:forEach>
  			</div>
  </body>
</html>
