<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tianjiaajax.jsp' starting page</title>
    
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
   <table cellspacing="0" cellpadding="0">
		<tr>
			<td><div class="stitle" style="float: left;">流水号</div>
				<input type="text" value="${bianma }" disabled="disabled" name="id" style="float: left;width: 120px;" id="out-lsid"/>
			</td>
			<td><div class="stitle" style="float: left;" >仓库</div>
				<select name="cangkuid" style="float: left;" id="ckname">
					<option value="0">-请选择-</option>
					<c:forEach items="${ck }" var="ck">
					<option value="${ck.id }">${ck.name }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td><div class="stitle" style="float: left;">日期</div>
				<input type="text" value="${date11 }" disabled="disabled" name="intime" id="outtime" style="float: left;width: 120px;"/>
			</td>
			<td><div class="stitle" style="float: left;">操作员</div>
				<select name="buyman" style="float: left;" id="buyman">
					<option value="0">-请选择-</option>
					<c:forEach items="${emp }" var="emp">
					<option value="${emp.id }">${emp.name }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="stitle">备注</div>
				<textarea name="info" placeholder="请输入备注"  cols="45" rows="6" class="outinfo" style="margin-top: -20px;margin-left: 70px;" id="out-outinfo"></textarea>
			</td>
		</tr>
	</table>
  </body>
</html>
