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
				<div style="font-size: 16px;text-align: center;margin-top: 10px;">采购入库单</div>
				<div class="neirong1">
					<div id="inckt">
					<table cellspacing="0" cellpadding="0">
						<tr>
							<td><div class="stitle" style="float: left;">流水号</div>
								<input type="text" value="${inc.id }" disabled="disabled" style="float: left;width: 125px;"/>
							</td>
							<td><div class="stitle" style="float: left;" >仓库</div>
								<input type="text" value="${inc.ckname }" disabled="disabled" style="float: left;width: 125px;"/>
							</td>
						</tr>
						<tr>
							<td><div class="stitle" style="float: left;">日期</div>
								<input type="text" value="${inc.intime }" disabled="disabled" style="float: left;width: 125px;"/>
							</td>
							<td><div class="stitle" style="float: left;" >供应商</div>
								<input type="text" value="${inc.givername }" disabled="disabled" style="float: left;width: 125px;"/>
							</td>
						</tr>
						<tr>
							<td><div class="stitle" style="float: left;">采购员</div>
								<input type="text" value="${inc.byman }" disabled="disabled" style="float: left;width: 125px;"/>
							</td>
							<td><div class="stitle" style="float: left;">收货员</div>
								<input type="text" value="${inc.inman }" disabled="disabled" style="float: left;width: 125px;"/>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="stitle">备注</div>
								<textarea name="info" cols="45" rows="5" style="margin-top: -20px;margin-left: 70px;"disabled="disabled">${inc.info }</textarea>
							</td>
						</tr>
					</table>
					</div>
					<!--入库货物明细框-->
					<div class="materials">
						<div style="font-size: 14px;text-align: center;background: #A5BCD2;">入库货物明细</div>
						<table cellpadding="1" cellspacing="1" id="matertable">
							<tr>
								<td style="text-align: center;background:#B6BBC3;">材料</td>
								<td style="text-align: center;background:#B6BBC3;">单位</td>
								<td style="text-align: center;background:#B6BBC3;">数量</td>
								<td style="text-align: center;background:#B6BBC3;">单价</td>
								<td style="text-align: center;background:#B6BBC3;">金额</td>
							</tr>
							<c:forEach items="${ic }" var="ic">
							<tr>
								<td style="text-align: center;">${ic.mname }</td>
								<td style="text-align: center;">${ic.typename }</td>
								<td style="text-align: center;">${ic.num }</td>
								<td style="text-align: center;">${ic.price }</td>
								<td style="text-align: center;">
								<fmt:formatNumber type="number" value="${ic.num*ic.price}" pattern="0.00" maxFractionDigits="2"/>
								</td>
							</tr>
							</c:forEach>
						</table>
					</div>
					<br />
					<input type="button" value="确定" id="tkqd" style="margin-left: 25px;padding-left:5px;padding-right:5px;"/>
				</div>
		</div>	
  </body>
  <script type="text/javascript">
  $("#rbody2 #tkqd").click(function(){
	$("#rbody2 #in-shuangji").css("display","none");
	});
  
  </script>
</html>
