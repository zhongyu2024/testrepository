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
    
    <title>My JSP 'queryQingDan.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="layui/css/layui.css" rel="stylesheet"  type="text/css" />
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="layui/layui.js"></script>
	<link href="css/zzy/TangShistyle.css" rel="stylesheet"  type="text/css" /> 
  </head>
  
  <body>
    <div class="layui-form" style="height: 765px;background-color: #dddddd;width: 100%;">
    	<div style="width: 100%;height: 50px; float: left;background-color: EAEEF1;">
    		<div style="width: 130px;height: 40px;float: left;border-right:1px solid black;margin-top: 5px;">
    			<div class="ss" style="width: 119px;height: 40px;background-image: url(images/zzy/btn_back.jpg);float: left;margin-left: 5px;cursor:pointer;">
    				
    			</div>
    		</div>
    		<div>
    			<div style="width: 161px;height: 40px;background-image: url(images/zzy/ddxq.jpg);float: left;margin-left: 10px;cursor: default;margin-top: 5px;">
    				
    			</div>		
    		</div>
    	</div>
    	<div style="width: 100%;height: 715px;float: left;background-color: white;cursor: default;">
    		<div style="height: 140px;width: 100%;float: left;border-bottom: 1px solid #666666;">
				<table class="layui-table"  lay-skin="nob" style="color: 666666;">
				  <colgroup>
				    <col width="80">
				    <col width="230">
				    <col width="80">
				    <col width="230">
				    <col width="80">
				    <col width="230">
				  </colgroup>
				  <thead>
				    <tr>
				      <td>消费单号：</td>
				      <td>${list.id }</td>
				      <td>开台时间：</td>
				      <td>${list.ordertime }</td>
				      <td>结账时间：</td>
				      <td>${list.paytime }</td>
				    </tr> 
				    <tr>
				      <td>消费类型：</td>
				      <td>${list.typename }-${list.eatnum }人</td>
				      <td>状态：</td>
				      <td><span class="layui-badge-rim" style="color: yellowgreen;">${list.statename }</span></td>
				      <td>收银员：</td>
				      <td>${list.cashiername }</td>
				    </tr>
				    <tr>
				      <td>餐台牌号：</td>
				      <td>${list.tablename }</td>
				      <td>所属班次：</td>
				      <td>ws111111111</td>
				   	  <td></td>
				      <td></td>
				    </tr>
				  </thead>
				</table>
    		</div>
    		<div style="width: 100%;height: 40px;">
    			<div style="height: 40px;width: 100px;font-size: 18px;float: left;">
    				菜单详情
    			</div>
    		</div>
    		<div style="width: 100%;">
    			<table class="layui-table"  lay-skin="nob" style="color: 666666;" >
    				<colgroup>
    					<col width="720">
    					<col width="120">
    					<col width="180">
    					<col width="120">
    					<col width="120">
    					<col width="120">
    				</colgroup>
    				<thead>
    					<tr>
    						<td>菜品</td>
    						<td>操作员</td>
    						<td>下单时间</td>
    						<td>数量</td>
    						<td>单价</td>
    						<td>小计</td>
    					</tr>
    				</thead>
    				<tbody>
    				<c:forEach items="${lss}" var="l">
       					<tr>
    						<td>${l.cainame}</td>
     						<c:if test="${list.state==4 }">
    						<td></td>
    						</c:if>
    						<c:if test="${list.state!=4 }">
    						<td>${list.cashiername }</td>
    						</c:if>
    						<c:if test="${list.state==4 }">
    						<td></td>
    						</c:if>
    						<c:if test="${list.state!=4 }">
    						<td>${list.ordertime }</td>
    						</c:if> 
    						
    						<td>${l.num }份</td>
    						<td>${l.price }</td>
    						<td>${l.money }</td>
    					</tr> 				
    				</c:forEach>

 
    					<tr>
    						<td></td>
    						<td></td>
    						<td></td>
    						<td>共项</td>
    						<td>消费金额：</td>
    						<td>￥${list.paymoney }</td>
    					</tr>
    					<tr>
    						<td></td>
    						<td></td>
    						<td></td>
    						<td>应付金额：</td>
    						<td></td>
    						<td>￥${list.paymoney-list.dazhemoney }</td>
    					</tr>
    					<tr>
    						<td></td>
    						<td></td>
    						<td></td>
    						<td>找零：</td>
    						<td></td>
    						<td>0.00</td>
    					</tr>
    				</tbody>
    			</table>
    		</div>
    	</div>
    </div>
  </body>
  <script type="text/javascript">
  	$(".ss").mouseover(function(){
  $(this).css("background-image","url(images/zzy/btn_back1.jpg)");
}).mouseout(function(){
  $(this).css("background-image","url(images/zzy/btn_back.jpg)");
});
$(".ss").click(function(){
	window.location.href="qingdan/findAllQingDan.do?pageNum=1&t=1";
});	
  </script>
</html>
