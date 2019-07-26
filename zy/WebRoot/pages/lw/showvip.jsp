<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showvip.jsp' starting page</title>
     
     
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script>
	</script>
  </head>
  
  <body>
	<div id="info" style="font-family: 幼圆">
		<table id="vipt">
			<tr>
				<td><img src="images/vip/t0173be811f6b9e0f0f.jpg" width="50" height="50" style="border-radius:50%;"></img></td>
				<td><p id="ccc">${vip1.name}</p></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><c:if test="${vip1.sex==0}">
						<c:out value="男"></c:out>
					</c:if>
					<c:if test="${vip1.sex==1}">
						<c:out value="女"></c:out>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>电话：</td>
				<td id="vt">${vip1.tel}</td>
			</tr>
			<tr>
				<td>生日：</td>
				<td id="vbir">${fn:substring(vip1.birthday,0,10)}</td>
			</tr>
			<tr>
				<td>会员卡号：</td>
				<td id="cid">${vip1.id}</td>
			</tr>
			<tr>
				<td>会员类型：</td>
				<td id="viptype">${vlevel1.name}</td>
			</tr>
			<tr>
				<td>办卡日期：</td>
				<td>
					${fn:substring(vip1.createtime,0,10)}
				</td>
			</tr>
			<tr>
				<td>会员折扣：</td>
				<td>${vlevel1.count}折</td>
			</tr>
			<tr>
				<td>卡内余额：</td>
				<td id="red">${vip1.money}</td>
			</tr>
			<tr>
				<td>卡状态：</td>
				<td id="kas">
					<c:if test="${vip1.state==0}">
						<c:out value="正常"></c:out>
					</c:if>
					<c:if test="${vip1.state==1}">
						<c:out value="停用"></c:out>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>累计消费：</td>
				<td>${vip1.allpay}</td>
			</tr>
		</table>
	</div>
	<div id="opt">
    			<div class="optbtn" id="chongbtn">
    				充值
    			</div>
    			<div class="optbtn" id="chongjibtn">
    				充值记录
    			</div>
    			<div class="optbtn" id="xiaojibtn">
    				消费记录
    			</div>
    			<div class="optbtn" id="bianbtn">
    				编辑
    			</div>
    			
    			<div class="optbtn" id="tingbtn">
    				停用
    			</div>
    			<div class="optbtn" id="shanbtn">
    				删除
    			</div>
    		</div>
  </body>
</html>
