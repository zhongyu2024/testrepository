<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'QingDanquhui.jsp' starting page</title>
    
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

    	<input type="hidden" id="url" value="${url }">
    	 	<table id="showtable" class="layui-table" lay-even lay-size="sm">
				<colgroup>
				    <col width="180">
				    <col width="150">
				    <col width="70">
				    <col width="80">
				    <col width="130">
				    <col width="90">
				    <col width="90">
				    <col width="100">
				    <col width="90">
				    <col width="80">
				    <col width="80">
				    <col width="150">
				    <col width="200">
				    <col width="100">
				    <col width="150">
				    <col width="270">
				  </colgroup>
				  <thead>
				    <tr>
				      <th>单号</th>
				      <th>消费时间</th>
				      <th>类型</th>
				      <th>状态</th>
				      <th>餐位名字</th>
				      <th>消费金额</th>
				      <th>就餐人数</th>
				      <th>折扣金额</th>
				      <th>实际付款</th>
				      <th>服务员</th>
				      <th>收银员</th>
				      <th>结账时间</th>
				      <th>会员</th>
				      <th>送餐员</th>
				      <th>送餐时间</th>
				      <th>外卖信息</th>
				    </tr> 
				  </thead>
				  <tbody>
				  <c:forEach items="${zls.list}" var="zl">
				    <tr>
				      <td>${zl.id}<br/><span style="color: red;">${zl.aid} </span></td>
				      <td>${zl.ordertime }</td>
				      <td>${zl.typename}</td>
				      <td>${zl.statename}</td>
				      <td>${zl.tablename }</td>
				      <td>${zl.paymoney }</td>
				      <td>${zl.eatnum}</td>
				      <td>${zl.dazhemoney}</td>
				     <td>${zl.realpay }</td>
				      <td>${zl.waitername }</td>
				      <td>${zl.cashiername }</td>
				      <td>${zl.paytime}</td>
				      <td>${zl.vipname}</td>
				      <td>${zl.sendname }</td>
				      <td>${zl.sendtime }</td>
				      <td>${zl.sendmsg }</td>
				    </tr>				  
				  </c:forEach>

 				   <tr>
				   		<td colspan="16">
				   			<div class="pagelist">
				        		<input type="button" id="1" value="首页"> 
				             
				             	<c:if test="${zls.pageNum !=1}">
				             		<input type="button" id="${zls.pageNum-1}" value="上一页">
				              	</c:if>
				                  <c:forEach begin="${zls.start}" end="${zls.end}" step="1" var="i">
				                      <c:if test="${zls.pageNum == i}">
				                         <input type="button" value="${i }" style="background: #EDEDED" disabled="disabled">
				                     </c:if>                
				                     <c:if test="${zls.pageNum != i}">   
				                         <input type="button" value="${i }" id="${i }">                                   
				                     </c:if> 	                                             
				                 </c:forEach> 
								 <c:if test="${zls.totalPage !=zls.pageNum}">
				                	<input type="button" value="下一页" id="${zls.pageNum+1}">
				                 </c:if>
				             
				             <input type="button" value="尾页" id="${zls.totalPage}">
					        </div>					       
				   		</td>
				   </tr>	 
				  </tbody>    			
    		</table> 
  </body>
</html>
