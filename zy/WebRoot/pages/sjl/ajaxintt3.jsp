<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ajaxintt3.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>
  </head>
  
  <body>
    <table cellpadding="1" cellspacing="1" id="matertable" style="text-align: center;">
		<tr>
			<td style="text-align: center;background:#B6BBC3;">材料</td>
			<td style="text-align: center;background:#B6BBC3;">单位</td>
			<td style="text-align: center;background:#B6BBC3;">数量</td>
			<td style="text-align: center;background:#B6BBC3;">单价</td>
			<td style="text-align: center;background:#B6BBC3;">金额</td>
		</tr>
		<c:forEach items="${cl }" var="cl">
		<tr class="in-tr">
			<td width="80">
			<input type="hidden" class="in-ajaxid" value="${cl.id }"/>
			${cl.mname }
			</td >
			<td width="60">${cl.typename }</td>
			<td width="60">${cl.num }</td>
			<td width="60">${cl.price }</td>
			<td width="80"><fmt:formatNumber type="number" value="${cl.num*cl.price}" pattern="0.00" maxFractionDigits="2"/>
			</td>
		</tr>
		</c:forEach>
	</table>
  </body>
  <script type="text/javascript">
  	$(".in-tr").css("background","#D3D3D3");
	$(".in-tr").eq(0).css("background","#9FB9D6");
	var mid=$(".in-tr").eq(0).find(".in-ajaxid").val();
	$(".in-tr").click(function(){
	$(this).css("background","#9FB9D6");
	$(this).siblings().css("background","#D3D3D3");
	mid=$(this).find(".in-ajaxid").val();
	});
  </script>
</html>
