<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'vipinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
  </head>
  <style>
  	#aj{text-align: center;font-family: "幼圆";font-weight: bold;}
  	#aj td{width:180px;border-bottom:1px solid white;height:40px;}
  </style>
  <body>
     <table id="aj">
    <c:forEach items="${avip }" var="avip">
    	<tr id="${avip.id}" class="hang">
	    	<td>${avip.name}</td>
	    	<td>${avip.typename}</td>
	    	<td>${avip.id}</td>
	    	<td>${avip.money}</td>
	    	<td>${avip.tel}</td>
	    	<td>
	    		<c:if test="${avip.state==0}">
					<c:out value="正常"></c:out>
				</c:if>
				<c:if test="${avip.state==1}">
					<c:out value="停用"></c:out>
				</c:if>
	    	<br></td>
	    	<td>${avip.allpay}</td>
	    	<td>${avip.count}</td>
    	</tr>
    </c:forEach>
    </table>
	    <div id="fenye" style="width:300px;height:100px;position: absolute;left:40%;top:86%">
	    <c:if test="${pageno>1 }">
		  			<input type="button" class="btn btn-default fanhuib"  id="forward" value="上一页"  >
		  			</c:if>
		 <c:if test="${pageno<3 }">
		  			<input type="button" class="btn btn-default fanhuib"  id="back" value="下一页"  >
		  			</c:if>
		  			<input type="hidden" value="${pageNum}" id="pageNum">
		  			 <input type="hidden" value="${pageno}" id="pageno"> 
		</div>
  </body>
  <script>
  </script>
  
</html>
