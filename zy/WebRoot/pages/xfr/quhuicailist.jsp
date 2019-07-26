<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'quhuicailist.jsp' starting page</title>
    
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
    <div class="list" >
		<div class="m1l1" style="font-size: 16px;color: red">
			<div class="in" style="width:50%">菜名</div>
			<div class="in" style="width:25%">数量</div>
			<div class="in" style="width:25%">总金额</div>
		</div>
	</div>
	<c:forEach items="${foods }" var="cai">
	 <div class="list">
		<div class="m1l1">
			<div class="in" style="width:50%"><img src="images/xfr/8.jpg">${cai.cainame }</div>
			<div class="in" style="width:25%"><label class="num">${cai.num }</label>*份</div>
			<div class="in" style="width:25%"><label class="pay">${cai.money }0</label></div>
		</div>
		<div class="beizhu1">${cai.info }</div>
	</div> 
	</c:forEach>
	<div style="margin-top: 20px;">
		<p>总数量：<label id="allnum" style="color:red"></label></p>
		<p>总金额：<label id="allpay" style="color:red"></label></p>
	</div>
	<input type="button" id="close" value="关闭">
  </body>
</html>
