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
    
    <title>My JSP 'testCTstyle.jsp' starting page</title>
    
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
<!--  		<div style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: #F9D6B6;border-radius:5px 5px 5px 5px;">
 			<div style="height: 86px;width: 100%;float: left;text-align: center;line-height: 86px;">
 				<div style="position: absolute;margin-left: 110px;margin-top: -35px;"><i class="layui-icon" style="color: green;">&#x1005;</i></div>
 				案发生大师
 			</div>

 		</div>  -->
    <div  style="height: 100%;width: 100%;background-color: white;">
    	<div  style="height: 40px;width: 100%;float: left;border-bottom: 1px solid #eeeeee;">
			  <div  style="width: 390px;float: left;">
			   	<div class="left-seatnum" id="left-seatnum">
					<div id="all" style="background-color: #88849A;color: white;">全部</div>
					<div id="two">二人桌</div>
					<div id="four">四人桌</div>
					<div id="six">六人桌</div>
					<div id="eight" style="width:75px;float:left;cursor:pointer;height:40px;margin-left:20px;text-align: center;line-height: 40px;border-radius:5px 5px 5px 5px;">八人及以上</div>
				</div>
			  </div>   			
    	</div>
<!--     	<div class="layui-form" style="height: 50px;width: 100%;float: left; ">
			  <div class="layui-form-item" style="width: 200px;float: left;"> -->
			<div  style="height: 50px;width: 100%;float: left; ">
			  <div  style="width: 200px;float: left;"> 
			    <!-- <label class="layui-form-label" style="color: #01AAED;">位置</label> -->
<!-- 			    <div class="layui-input-block">
			      <select name="area" lay-verify="required">
			        <option value="2">全部</option>
			        <option value="0">大厅</option>
			        <option value="1">包厢</option>
			      </select>
			    </div> -->
			   	<div class="left-seatnum" id="left-seatnum">
					<div id="quan" style="background-color: #88849A;color: white;">全部</div>
					<div id="ting">大厅</div>
					<div id="bao">包厢</div>
				</div>			    
			  </div>     		
    	</div>
    	<div id="showtables" style="height: 718px;width: 100%;background-color: #f2f2f2;float: left;">
    	<c:forEach items="${tables}" var="t">

	 		<c:if test="${t.state==1}">
			 	<div id="${t.id }" class="d" style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: #F9D6B6;border-radius:5px 5px 5px 5px;cursor:pointer;">
				<input class="ddcantai" type="hidden" value="${initcantai}"/>
				<input class="ddstate" type="hidden" value="${initstate}"/>
				<input class="ddarea" type="hidden" value="${initarea}"/>			 		
		 			<div style="height: 86px;width: 100%;float: left;text-align: center;line-height: 86px;">
		 				${t.name }
		 			</div>
					
		 		</div> 
	 		</c:if>

	 	</c:forEach>	  
    	</div>
	</div>
  </body>
</html>
