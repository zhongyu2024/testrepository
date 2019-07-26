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
    
    <title>厂商设置</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" href="css/zj/gys.css" />
		<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

  </head>
     <body>
		 <table border="0px" cellspacing="0px" cellpadding="0px" cellspacing="0px" id="ajaxcpinn">
					<tr id="list">
						<td style="width: 80px;color: #B6BBC3;background-color: #354148;">&nbsp;&nbsp;&nbsp;&nbsp;编号</td>
						<td style="width: 130px;color: #B6BBC3;background-color: #354148;">&nbsp;&nbsp;&nbsp;&nbsp;材料类型</td>
						<td style="width: 80px;color: #B6BBC3;background-color: #354148;">材料名称</td>
						<td style="width: 100px;color: #B6BBC3;background-color: #354148;">数量</td>
					</tr>
					</table>
	</body>
	<script>
	   
		 
	</script>

</html>