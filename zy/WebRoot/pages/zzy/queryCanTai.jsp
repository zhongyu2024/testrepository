<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'queryCanTai.jsp' starting page</title>
    
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
  
  <body style="margin: 0px;">

    	<c:forEach items="${querytables}" var="t">
    		<c:if test="${t.state==0}">
			<div id="${t.id }" class="d"  style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: A9EB6A;border-radius:5px 5px 5px 5px;cursor: pointer;">
				<input class="ddcantai" type="hidden" value="${ddcantai}"/>
				<input class="ddstate" type="hidden" value="${ddstate}"/>
				<input class="ddarea" type="hidden" value="${ddarea}"/>	 			
	 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
	 				${t.name }
	 			</div>
	 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
	 				可供${t.seatsize}人
	 			</div>
	 		</div>
	 		</c:if>
	 		<c:if test="${t.state==1 }">
	 		<c:if test="${t.hetai==0}">
			 	<div id="${t.id }" class="d" style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: #F9D6B6;border-radius:5px 5px 5px 5px;cursor:pointer;">
				<input class="ddcantai" type="hidden" value="${ddcantai}"/>
				<input class="ddstate" type="hidden" value="${ddstate}"/>
				<input class="ddarea" type="hidden" value="${ddarea}"/>	 		 		
		 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
		 				${t.name }
		 			</div>
		 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
		 				消费：${t.zlist.paymoney } 
		 			</div>
		 		</div> 
		 	</c:if>
		 	<c:if test="${t.hetai==1}">
		 		<div id="${t.id }" class="d" style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: FF6666;border-radius:5px 5px 5px 5px;cursor: pointer;">
		 			<input class="ddcantai" type="hidden" value="${ddcantai}"/>
				<input class="ddstate" type="hidden" value="${ddstate}"/>
				<input class="ddarea" type="hidden" value="${ddarea}"/>	 
		 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
		 				<div style="position: absolute;;margin-left: 0px;margin-top: 0px;"><span class="layui-badge">并</span></div>
		 				${t.name }
		 			</div>
		 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
		 				总消费：${t.htmoney}
		 			</div>
		 		</div>
		 	</c:if>
		 	<c:if test="${t.hetai==2}">
				 <div id="${t.id }" class="d" style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: #F9D6B6;border-radius:5px 5px 5px 5px;cursor: pointer;">
		 			<input class="ddcantai" type="hidden" value="${ddcantai}"/>
				<input class="ddstate" type="hidden" value="${ddstate}"/>
				<input class="ddarea" type="hidden" value="${ddarea}"/>	 
		 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
		 				<div style="position: absolute;;margin-left: 0px;margin-top: 0px;"><span class="layui-badge">子</span></div>
		 				${t.name }
		 			</div>
		 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
		 				消费：${t.zlist.paymoney }
		 			</div>
		 		</div> 
		 	</c:if>	
	 		</c:if>
	 		<c:if   test="${t.state==2}">
		 		<div  id="${t.id }" class="d" style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: A9EB6A;border-radius:5px 5px 5px 5px;cursor: pointer;">
				<input class="ddcantai" type="hidden" value="${ddcantai}"/>
				<input class="ddstate" type="hidden" value="${ddstate}"/>
				<input class="ddarea" type="hidden" value="${ddarea}"/>	 		 			
		 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
		 				${t.name }
		 			</div>
		 			<div style="height: 26px;width: 100%;float: left;color:white;background-color: FF7900;">
		 				 预定&nbsp;${t.yutime} 
		 			</div>
		 		</div> 	 			
	 		</c:if>
	 	</c:forEach>  
<!--  		<div style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: #F9D6B6;border-radius:5px 5px 5px 5px;">
 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
 				案发生大师
 			</div>
 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
 				消费：1000.00
 			</div>
 		</div> 
 		<div style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: #F9D6B6;border-radius:5px 5px 5px 5px;">
 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
 				<div style="position: absolute;;margin-left: 0px;margin-top: 0px;"><span class="layui-badge">子</span></div>
 				案发生大师
 			</div>
 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
 				消费：1000.00
 			</div>
 		</div> 
 		<div style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: FF6666;border-radius:5px 5px 5px 5px;">
 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
 				<div style="position: absolute;;margin-left: 0px;margin-top: 0px;"><span class="layui-badge">并</span></div>
 				案发生大师
 			</div>
 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
 				消费：1000.00
 			</div>
 		</div> 
 		<div style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: FF6666;border-radius:5px 5px 5px 5px;">
 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
 			<div style="position: absolute;margin-left: 0px;margin-top: 0px;"><span class="layui-badge">并</span></div>
 				<div style="position: absolute;margin-left: 114px;margin-top: -21px;"><i class="layui-icon" style="color: green;">&#x1005;</i></div>
 				案发生大师
 			</div>
 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
 				消费：1000.00
 			</div>
 		</div> 
 		<div style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: #F9D6B6;border-radius:5px 5px 5px 5px;">
 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
 				<div style="position: absolute;;margin-left: 0px;margin-top: 0px;"><span class="layui-badge">子</span></div>
 				<div style="position: absolute;margin-left: 114px;margin-top: -21px;"><i class="layui-icon" style="color: green;">&#x1005;</i></div>
 				案发生大师
 			</div>
 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
 				消费：1000.00
 			</div>
 		</div> 
 		<div style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: A9EB6A;border-radius:5px 5px 5px 5px;">
 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
 				案发生大师
 			</div>
 			<div style="height: 26px;width: 100%;float: left;color:white;background-color: FF7900;">
 				预定&nbsp;10-18 17:00
 			</div>
 		</div> 
 		<div style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: A9EB6A;border-radius:5px 5px 5px 5px;">
 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
 				案发生大师
 			</div>
 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
 				消费：1000.00
 			</div>
 		</div> 
 		<div style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: A9EB6A;border-radius:5px 5px 5px 5px;">
 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
 				案发生大师
 			</div>
 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
 				消费：1000.00
 			</div>
 		</div> 
 		<div style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: A9EB6A;border-radius:5px 5px 5px 5px;">
 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
 				案发生大师
 			</div>
 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
 				消费：1000.00
 			</div>
 		</div>  -->
 		 	

  </body>
</html>
