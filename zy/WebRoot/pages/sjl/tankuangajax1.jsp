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
    
    <title>My JSP 'tankuangajax.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/sjl/cangwei.css"/>
		<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>
	</head>
	<body>
		<div class="tankuang1">
				<div style="font-size: 16px;text-align: center;margin-top: 10px;">领用出库单</div>
				
				<div class="neirong1">
					<table cellspacing="0" cellpadding="0">
						<tr>
							<td><div class="stitle" style="float: left;">流水号</div>
								<input type="text" value="${ck.id }" disabled="disabled" style="float: left;width: 120px;" />
							</td>
							<td><div class="stitle" style="float: left;" >仓库</div>
								<input type="text" value="${ck.ckname }" disabled="disabled" style="float: left;width: 120px;" />
							</td>
						</tr>
						<tr>
							<td><div class="stitle" style="float: left;">日期</div>
								<input type="text" value="${ck.outtime }" disabled="disabled" style="float: left;width: 120px;" />
							</td>
							<td><div class="stitle" style="float: left;">操作员</div>
								<input type="text" value="${ck.doname }" disabled="disabled" style="float: left;width: 120px;" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="stitle">备注</div>
								<textarea name="info" cols="45" rows="6" disabled="disabled" style="margin-top: -20px;margin-left: 70px;">${ck.info }</textarea>
							</td>
						</tr>
					</table>
					<br/>
					<!--出库货物明细框-->
					<div class="materials">
						<div style="font-size: 14px;text-align: center;background: #A5BCD2;">出库货物明细</div>
						<table cellpadding="1" cellspacing="1" id="matertable">
							<tr>
								<td style="text-align: center;background:#B6BBC3;" width="140">材料</td>
								<td style="text-align: center;background:#B6BBC3;" width="100">单位</td>
								<td style="text-align: center;background:#B6BBC3;">数量</td>
							</tr>
							<c:forEach items="${cl }" var="cl">
							<tr>
								<td style="text-align: center;" width="140">${cl.mname }</td>
								<td style="text-align: center;" width="100">${cl.mtype }</td>
								<td style="text-align: center;">${cl.num }</td>
							</tr>
							</c:forEach>
						</table>
					</div>
					<br />
					<input type="button" value="确定"  class="sub" id="out-qr" style="margin-left: 25px;"/>
					</div>
			</div>
  </body>
  <script type="text/javascript">
  $("#rbody3 #out-qr").click(function(){
	$("#rbody3 #out-shuangji").css("display","none");
	});
  
  </script>
</html>
