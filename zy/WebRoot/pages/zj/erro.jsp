<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'gysajax.jsp' starting page</title>
    
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
  
    <table border="0px" cellspacing="0px" cellpadding="0px" cellspacing="0px" id="detailjjax">
					<tr id="list">
						<td style="width: 400px;color: #B6BBC3;background-color: #354148;"align="center">操作日期</td>
						<td style="width: 320px;color: #B6BBC3;background-color: #354148;"align="center">仓库</td>
						<td style="width: 300px;color: #B6BBC3;background-color: #354148;"align="center">编号</td>
						<td style="width: 400px;color: #B6BBC3;background-color: #354148;"align="center">名称</td>
						<td style="width: 300px;color: #B6BBC3;background-color: #354148;"align="center">类型</td>
						<td style="width: 80px;color: #B6BBC3;background-color: #354148;"align="center">数量</td>
						<td style="width: 300px;color: #B6BBC3;background-color: #354148;"align="center">单位</td>
						<td style="width: 300px;color: #B6BBC3;background-color: #354148;"align="center">操作类型</td> 
					</tr>
				</table>
  </body>
   <script type="text/javascript"></script>
 
</html>
