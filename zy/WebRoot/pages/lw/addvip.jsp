<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addvip.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script>
$(function(){
	$("#b").click(function(){
		window.location="vip/ms.do";
	});
});

/* function change()
{
	alert($("#s").val());
} */
</script>
  </head>
  	
  	
  <body>
    <div id="a"><button id="b">进入</button></div>
<!--     <select id="s" onchange="change()">
    	<option value="1">111111</option>
    	<option value="2">22222</option>
    	<option value="3">3333</option>
    	<option value="4">44444</option>
    </select> -->
  </body>
</html>
