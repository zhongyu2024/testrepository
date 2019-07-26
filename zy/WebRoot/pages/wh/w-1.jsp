<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'w-1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>
  </head>
  <style>
  	#box{
	background-color: #f5f5f5;
	font-family: "微软雅黑";
	font-size: 24px;
}
  </style>
 <body>
		<div id="box">
			<table cellpadding="1" cellspacing="1">
				<tr>
					<td>基础数据</td>
					<td class="dd"><a href="cantai/findAll.do"><div class="choose"><img src="images/wh/w-1.png"></div></a></td>
					<td class="dd"><a href="caiPin/findAllCookType.do"><div class="choose"><img src="images/wh/w-3.png"></div></a></td>
					<td class="dd"><a href="Yuangong/findAll.do"><div class="choose"><img src="images/wh/w-5.png"></div></a></td>
					<td class="dd"><a href="whCanPai/showCanPai.do"><div class="choose"><img src="images/wh/w-7.png"></div></a></td>
					<td class="dd"><a href="special/findAll.do"><div class="choose"><img src="images/wh/w-9.png"></div></a></td>
					<td class="dd"><a href="liYou/findAll.do"><div class="choose"><img src="images/wh/w-21.png"></div></a></td>
					<td class="dd"><a href="time/findAll.do"><div class="choose"><img src="images/wh/w-13.png"></div></a></td>
				</tr>
				<tr>
					<td>个人设置</td>
					<td><div class="choose" id="change"><img src="images/wh/w-17.png"></div></td>
				</tr>
			</table>
			<div id="addpaihao" style="display:none;width: 400px;height: 200px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
						<div style="background-color: #F5F5F5;height: 36px;width: 400px;">
							<div style="float: left;margin-left: 10px;">新增理由</div>
							<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>
						</div>
						<div style="margin-top: 20px;clear: both;margin-left: 50px;">
							
									<lable style="font-size:16px;">原密码:</label>
									<label><input type="text" id="name1"></label>
									<span id="ae1"></span><br/>
									
									<lable>新密码:</lable>
									<lable><input type="text" id="name2"></lable>
									<span id="ae2"></span><br/>
								
							<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;cursor: pointer;" id="i1"><input type="image" src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 50px;cursor: pointer;"><input type="image" src="images/wh/w-quxiao.png"></div>
							</div>
						</div>
				</div>
		</div>
	</body>
	<script>
		var url;
		var ur;
		$(function(){
			
			$(".choose").mouseenter(function(){
				url=$(this).find("img").attr("src").substr(0,$(this).find("img").attr("src").indexOf('.'));
				//alert($(this).find("img").attr("src").indexOf('.')-8);
				//alert(url);
				//ur=url+1;
				//alert(ur);
				$(this).find("img").attr("src",url+'1'+".png");
			}).mouseleave(function(){
				$(this).find("img").attr("src",url+".png");
			});
			//点击出修改密码界面
			$("#change").click(function(){
				$("#addpaihao").find("span").html("");
				$("#addpaihao").find("input").val("");
				$("#addpaihao").css("display","block");
			});
			//验证密码是否正确
			$("#name1").blur(function(){
			var pass1=$("#name1").val();
			//alert(pass1);
				$.ajax({
					method:"get",
					url:"Mimayz/yzMima.do",
					data:{"userpass":pass1},
					dataType:"html",
					success:function(result){
						if(result=="111"){
							$("#ae1").html("密码正确");
							$("#i1").attr("disabled",false);
						}else{
							$("#ae1").html("密码错误");
							$("#i1").attr("disabled","disabled");
						}
					}
				});
			});
			$(".cha").click(function(){
				$(this).parent().parent().css("display","none");
			});
			$(".quxiao").click(function(){
				$("#addpaihao").css("display","none");
			});
			//修改密码
			
			$("#i1").click(function(){
			var pass1=$("#name1").val();
			var pass2=$("#name2").val();
			var  c=$("#ae1").html();
				if(c=="密码正确"){
					//alert(1);
					$.ajax({
					method:"get",
					url:"Mimayz/changePass.do",
					data:{"userpass":pass2},
					dataType:"html",
					success:function(result){
					if(result){
						alert("更改成功");
						$("#addpaihao").css("display","none");
					}else{
						alert("更改失败");
						$("#addpaihao").css("display","none");
					}
						
					}
				});	
				}else{
					$("#ae1").html("请确认密码");
				}
				
			});
		});
		
	</script>
</html>
