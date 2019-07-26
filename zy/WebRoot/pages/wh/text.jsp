<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'runtime.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <link rel="stylesheet" href="layui/css/layui.css" media="all">
	 <script type="text/javascript" src="js/jquery-1.8.3.js" ></script>
	 <script type="text/javascript" src="layui/layui.js" ></script>
	<!--  <script type="text/javascript" src="layui/lay/modules/laydate.js" ></script> -->
  </head>
<body>
 
<div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
  <input type="text" class="layui-input" id="test1">
</div>
 
<script>
layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  //时间选择器
laydate.render({ 
  elem: '#test1'
  ,type: 'time'
});
});
</script>
</body>
</html>
