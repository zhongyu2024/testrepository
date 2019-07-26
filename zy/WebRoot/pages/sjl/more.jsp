<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'more.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background: #F5F5F5;">
		<div>
			<a style="margin-left: 30px ;" href="pages/sjl/ckframe.jsp" target="_blank"><img src="images/sjl/ckgl.png" style="margin-top: 12px;"/></a>
			<a style="margin-left: 30px ;" href="YingyeAction/showyemian.do"><img src="images/sjl/yybb.png" style="margin-top: 10px;"/></a>
		</div>
	</body>
</html>
