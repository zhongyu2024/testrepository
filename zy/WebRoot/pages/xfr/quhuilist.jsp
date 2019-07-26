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
    
    <title>My JSP 'quhuilist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- <script type="text/javascript" src="js/jquery-1.8.3.js"></script> -->
  </head>
  
  <body> 
  	<input type="hidden" id="url" value="${url }">
    <table class="layui-table" lay-skin="line">
	  <colgroup>
	    <col width="150">
	    <col width="100">
	    <col width="150">
	    <col width="150">
	    <col>
	  </colgroup>
	  <thead>
	    <tr>
	      <th>单号</th>
	      <th>牌号</th>
	      <th>消费金额</th>
	      <th>下单时间</th>
	      <th>操作</th>
	    </tr> 
	  </thead>
	  <tbody id="body">
	  <c:forEach items="${zls.list }" var="zl">
	    <tr>
	      <td>${zl.id }</td>
	      <td>${zl.tableid }</td>
	      <td>${zl.paymoney }</td>
	      <td>${zl.ordertime }</td>
	      <td id="${zl.id }">
	      	<input type="button" style="background: #1E9FFF;" class="btn info" value="详情">
	      	<input type="button" style="background: #00B944;" class="btn jie" value="结账">
	      	<input type="button" style="background: #FF5722;" class="btn laji" value="作废">
	      </td>
	    </tr>
	   </c:forEach>	
	   <tr>
	   		<td colspan="5">
	   		<c:if test="${zls.totalPage!=1 &&zls.totalPage!=0 }">
	   			<div class="pagelist">
	        		<input type="button" id="1" value="首页"> 
	             	<%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
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
	             <%--尾页 --%>
	             <input type="button" value="尾页" id="${zls.totalPage}">
		        </div>
		        </c:if>
		        <c:if test="${zls.totalPage==0 }">
		        	<label style="color:red">没有找到相关信息！</label>
		        </c:if>
	   		</td>
	   </tr>			    
	  </tbody>
	</table>
  </body>  
</html>
