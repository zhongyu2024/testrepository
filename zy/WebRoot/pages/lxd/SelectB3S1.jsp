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
    
    <title>My JSP 'SelectB3S1.jsp' starting page</title>
    
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
				<td>菜品名称</td>								
				<td>菜品类别</td>	
				<td>点单数量</td>
				<td>实付金额</td>					
			</tr>
    		<c:forEach items="${s31}" var="lif">     
			<tr id="closes31">
				<td width="100">${lif.cainame}</td>
				<td width="100">${lif.caitype}</td>
				<td width="100">${lif.num}</td>
				<td width="100">${lif.money}</td>				
			</tr>
			</c:forEach>
		</table>
	</div>
  </body>
</html>
