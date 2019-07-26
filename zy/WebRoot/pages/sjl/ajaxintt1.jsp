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
    
    <title>My JSP 'ajaxintt1.jsp' starting page</title>
    
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
    <table cellspacing="0" cellpadding="0">
		<tr>
			<td><div class="stitle" style="float: left;">流水号</div>
				<input type="text" value="${bianma }" disabled="disabled" name="id" style="float: left;width: 125px;" id="in-id"/>
			</td>
			<td><div class="stitle" style="float: left;" >仓库</div>
				<select name="cangkuid" style="float: left;" id="in-ckname">
					<option value="0">-请选择-</option>
				<c:forEach items="${ck }" var="ck">
					<option value="${ck.id }">${ck.name }</option>
				</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td><div class="stitle" style="float: left;">日期</div>
				<input type="text" value="${date }" disabled="disabled" name="intime" style="float: left;width: 125px;" id="in-intime"/>
			</td>
			<td><div class="stitle" style="float: left;" >供应商</div>
				<select name="giverid" style="float: left;" id="givername">
					<option value="0">-请选择-</option>
				<c:forEach items="${giver }" var="giver">
					<option value="${giver.id }">${giver.name }</option>
				</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td><div class="stitle" style="float: left;">采购员</div>
				<select name="buyman" style="float: left;" id="buyman">
					<option value="0">-请选择-</option>
				<c:forEach items="${emp }" var="emp">
					<option value="${emp.id }">${emp.name }</option>
				</c:forEach>
				</select>
			</td>
			<td><div class="stitle" style="float: left;">收货员</div>
				<select name="inman" style="float: left;" id="inman">
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
				<textarea name="info" placeholder="请输入备注" cols="45" rows="5" class="info" style="margin-top: -20px;margin-left: 70px;" id="in-clinfo"></textarea>
			</td>
		</tr>
	</table>
  </body>
</html>
