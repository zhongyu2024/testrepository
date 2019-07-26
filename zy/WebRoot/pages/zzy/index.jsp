<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/zzy/indexstyle.css" rel="stylesheet"  type="text/css" /> 

 	<link href="layui/css/layui.css" rel="stylesheet"  type="text/css" /> 
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="js/custominput.js"></script>
 	<script type="text/javascript" src="layui/layui.js"></script> 
	<link href="css/zzy/TangShistyle.css" rel="stylesheet"  type="text/css" /> 
</head>

<body>
	<div style="height: 808px;width: 100%;">
		<div id="dg"
			style="float:left;background-color: #f2f2f2;width: 65px;height: 100%;background-image:url('images/kuangjia/bg.jpg');color: white;">
			<div  
				style="float: left;width: 65px;height: 50px;margin-top: 10px;"
				>
				<img src="images/kuangjia/tubioao.jpg" style="margin-left: 8px;"></img>
				</div>
			<div  class="dd"
				style="float: left;width: 65px;height: 80px;color: green;"

				>
				<a href="tangshi/findAllCanTai.do" target="rright"><img src="images/kuangjia/left-tangshi-y.jpg"></img></a>

				</div>
			<div class="dd"
				style="float: left;width: 65px;height: 80px;"
				id="kuaican"
				>
				<a href="Kuaican/showKuaican.do" target="rright"><img src="images/kuangjia/left-kuaican.jpg"></img></a>

				</div>
			<div	class="dd"
				style="float: left;width: 65px;height: 80px;"

				>
				<a href="Waimai/showWaimai.do" target="rright"><img src="images/kuangjia/left-waimai.jpg"></img></a>
				
				</div>
			<div	class="dd"
				style="float: left;width: 65px;height: 80px;"

				>
				<a href="qingdan/findAllQingDan.do?pageNum=1&t=1" target="rright"><img src="images/kuangjia/left-qingdan.jpg"></img></a>
				
				</div>
			<div	class="dd"
				style="float: left;width: 65px;height: 80px;"

				>
				<a href="user/reserve.do" target="rright"><img src="images/kuangjia/left-yuding.jpg"></img></a>
				
				</div>
			<div	class="dd"
				style="float: left;width: 65px;height: 80px;"

				>
				<a href="vip/ms.do" target="rright"><img src="images/kuangjia/left-huiyuan.jpg"></img></a>
				
				</div>
		<c:if test="${loginUser.powerid==1}">
			<div	class="dd"
				style="float: left;width: 65px;height: 80px;"

				>
				<a href="pages/sjl/more.jsp" target="rright"><img src="images/kuangjia/left-genduo.jpg"></img></a>
				
				</div>
			<div	class="dd"
				style="float: left;width: 65px;height: 80px;"

				>
				<a href="pages/wh/w-1.jsp" target="rright"><img src="images/kuangjia/left-shezhi.jpg"></img></a>
				
				</div>
		</c:if>
		</div>
		<div style="float:left;height: 40px;width: 1335px;background-color: #393D49;">
			<div style="float:right;height: 40px;width: 400px;background-color: #393D49;position:relative;margin-right: -35px;">

					<div class="layui-form-item">
						<label class="layui-form-label" style="color: #01AAED;">${loginUser.username }</label>

						 <a href="user/loginout.do"><button class="layui-btn" lay-submit >退出登录</button></a>
					</div>

	
	
	
			</div>
		</div>
		<div id="index_content" style="width: 1358px;height: 750px;float: left;/* background-color: #dddddd; */">
			<iframe scrolling="auto" rameborder="0" src="tangshi/findAllCanTai.do" name="rright" width="100%" height="100%"></iframe>		
		</div>
	</div>
</body>
<script type="text/javascript">
	
	
	var url="images/kuangjia/left-tangshi";
	var url1; 
	var index=1;
$(".dd").click(function(){
	if(index!=$(this).index())
	{
		url1=url;
		url=$(this).find("img").attr("src").substr(0,$(this).find("img").attr("src").indexOf('.'));
		$(this).find("img").attr("src",url+'-y'+".jpg");
		$(".dd").eq(index-1).find("img").attr("src",url1+".jpg");
		if($(this).index()!=1)
		{
			$(".dd").eq(0).find("img").attr("src","images/kuangjia/left-tangshi"+".jpg");
		}else
		{
			$(".dd").eq(0).find("img").attr("src","images/kuangjia/left-tangshi-y"+".jpg");
		}
		index=$(this).index();
	}
});
	//Demo
	layui.use('form', function() {
		var form = layui.form;

		//监听提交
		form.on('submit(formDemo)', function(data) {
			layer.msg(JSON.stringify(data.field));
			return false;
		});
	});
	
</script>
</html>
