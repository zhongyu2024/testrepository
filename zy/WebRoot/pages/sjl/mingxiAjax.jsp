<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mingxiAjax.jsp' starting page</title>
    
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
			<td style="text-align: center;background:#B6BBC3;" width="140">材料</td>
			<td style="text-align: center;background:#B6BBC3;" width="100">单位</td>
			<td style="text-align: center;background:#B6BBC3;">数量</td>
			<!-- <td style="text-align: center;background:#B6BBC3;">单价</td>
			<td style="text-align: center;background:#B6BBC3;">金额</td> -->
		</tr>
		<c:forEach items="${cck }" var="cck">
		<tr class="mx-out">
			<td width="140">
				<input type="hidden" value="${cck.id }" class="outcid"/>
				<input type="hidden" value="${cck.materialsid }" class="outmid"/>
				<input type="hidden" value="${cck.outcangkuid }" class="outckid"/>
				<div>${cck.mname }</div>
			</td >
			<td width="100">${cck.mtype }</td>
			<td class="outcknum">${cck.num }</td>
		</tr>
		</c:forEach>
	</table>
  </body>
  <script type="text/javascript">
 	var mxcid=$(".mx-out").eq(0).find(".outcid").val();
	var mxmid=$(".mx-out").eq(0).find(".outmid").val();
	var mxckid=$(".mx-out").eq(0).find(".outckid").val();
	var mxnum=$(".mx-out").eq(0).find(".outcknum").text();
	/* alert(mxcid+"---"+mxmid+"---"+mxckid+"---"+mxnum) */
  $(".mx-out").css("background","#D3D3D3");
  $(".mx-out").eq(0).css("background","#A5BCD2");
  $(".mx-out").click(function(){
  $(this).css("background","#A5BCD2");
  $(this).siblings().css("background","#D3D3D3");
  mxcid=$(this).find(".outcid").val();
  mxmid=$(this).find(".outmid").val();
  mxckid=$(this).find(".outckid").val();
  mxnum=$(this).find(".outcknum").text();
  
  });
  
  
  
  
  </script>
</html>
