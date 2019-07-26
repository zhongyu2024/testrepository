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
    
    <title>中宇国际餐饮业务平台</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/ck_css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/ck_css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="css/ck_css/component.css" />
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
  </head>

  <body>
    		<div class="container demo-1">
	    		
			<div class="content">
				<div id="large-header" class="large-header" style="	background-image:url(images/ck_images/l_demo-1-bg.jpg);">
					<canvas id="demo-canvas"></canvas>
					<input type="text" id=a 	style="visibility: hidden;">
					<input type="password" id=b 	style="visibility: hidden;">					
					<div class="logo_box">
						<form action="user/login.do" name="f" method="post">
							<div class="input_outer">
								
								<span class="u_user" style="width: 25px;height: 25px;background: url(images/ck_images/login_ico.png);background-position:  -125px 0;position: absolute;margin: 10px 13px;"></span>
								<input name="username" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户"><br>
								<span style="color:red;top:50px;position:absolute;left:50px;">${error1}</span>
							</div>
							<div class="input_outer">
								<span class="us_uer" style="width: 25px;height: 25px;background-image: url(images/ck_images/login_ico.png);background-position: -125px -34px;position: absolute;margin: 10px 13px;"></span>
								<input name="userpass" id="user_password" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码"><br>
								<span style="color:red;top:50px;position:absolute;left:50px;">${error2}</span>
							</div>
							<div class="mb2"><input type="submit" class="act-but submit"  style="color: #FFFFFF;width:325px;" value="登录"></div>
						</form>
					</div>
				</div>
			</div>
		</div><!-- /container -->
		<script src="js/ck_js/TweenLite.min.js"></script>
		<script src="js/ck_js/EasePack.min.js"></script>
		<script src="js/ck_js/rAF.js"></script>
		<script src="js/ck_js/demo-1.js"></script>
		<div style="text-align:center;">
		
</div>
  </body>
</html>
