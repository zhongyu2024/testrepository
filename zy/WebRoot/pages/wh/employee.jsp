<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//Dspan HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Yuangong.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>
<script src="layui/layui.js"></script>
  </head>
  
	<style>
		#box{
			font-family: "微软雅黑";
			font-size: 16px;
		}table tr span{
			border-bottom: 1px #F5F5F5 solid;
		}tr{
			height: 40px;
		}
	</style>
	<body>
		<div id="box" style="width: 90%;">
				<div id="top" style="background-color:#EAEEF1;height: 40px;font-size: 26px;">
					<div style="float: left;">
						<a href="pages/wh/w-1.jsp"><img src="images/wh/w-cantai1.png"></a>
					</div>|员工管理
					<div style="float: right;">
						<input id="Button1" type="button" value="导出EXCEL"  onclick="javascript:method1('ta')" />
					</div>
				</div>
				
				<div id="addpower" style="display: none;width:300px ;height: 200px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
					<div style="width: 300px;height: 40px;background-color: #F5F5F5;border-bottom: 1PX solid lightgray;text-align: center;">新增菜品分类</div>
					<div style="width: 300px;height: 160px;">
						<span>职级名称</span>
						<span><input type="text" id="addpower-1"></span><br/><br/>
						<span id="addpower-error"></span>
						<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;cursor: pointer;margin-left: 50px;" id="q1"><input type="image" src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 80px;cursor: pointer;" id="q2"><input type="image" src="images/wh/w-quxiao.png"></div>
							</div>
					</div>
				
				</div>
				
				<div id="editpower" style="display: none;width:300px ;height: 200px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
					<div style="width: 300px;height: 40px;background-color: #F5F5F5;border-bottom: 1PX solid lightgray;text-align: center;">编辑菜品分类</div>
					<div style="width: 300px;height: 160px;">
						<span>职级名称</span>
						<span><input type="text" id="editpower-1"></span><br/>
						<span id="editpower-error"></span><br/>
						
						<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;cursor: pointer;margin-left: 50px;" id="q3"><input type="image"  src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 80px;cursor: pointer;" id="q4"><input type="image"  src="images/wh/w-quxiao.png"></div>
							</div>
					</div>
				</div>
				
				<div id="deletepower" style="display:none;width: 300px;height: 200px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
					<div style="background-color: #F5F5F5;width: 300px;height:36px ;">
						<div style="float: left;margin-left: 40px;">提醒</div>
						<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>	
					</div>
					<div style="margin-top: 50px;margin-left: 50px;">确定删除？</div>
					<div>
					<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;margin-left:40px;cursor: pointer;" id="q5"><input type="image"  src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 80px;cursor: pointer;" id="q6"><input type="image"  src="images/wh/w-quxiao.png"></div>
					</div>
					</div>
				</div>
				
				<div id="addYuangong" style="display:none;width: 400px;height: 400px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
						<div style="background-color: #F5F5F5;height: 36px;width: 400px;">
							<div style="float: left;margin-left: 10px;">新增员工</div>
							<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>
						</div>
						<div style="margin-top: 50px;clear: both;margin-left: 50px;">
			
									<span>姓名名称</span>
									<span><input type="text" id="i1"></span> 
									<span id="cpe1" ></span><br/>
									
									<span>职级</span>
									<span style="margin-left:32px;">
										<select style="width:153px;" id="power1" >
										<c:forEach items="${power }" var="o">
											<option>${o.name }</option>
										</c:forEach>
										</select>
									</span><br/>
								
									<span>登录姓名</span>
									<span><input type="text" id="ename1"></span>
									<span id="cpe2" ></span><br/>
									
									<span>登录密码</span>
									<span><input type="text" id="pass"></span>
									<span id="mima" ></span><br/>
									
									<span>性别</span>
									<span style="margin-left:32px;" ><select style="width:153px;" id="sex1">
										<option>男</option>
										<option>女</option>
									</select></span><br/>
								
									<span>出生日期</span>
									<span><input type="text" class="layui-input" id="test1"></span>
									<span id="birth1" ></span><br/>
								
									<span>手机号码</span>
									<span><input type="text" id="tel1"></span>
									<span id="cpe3" ></span><br/>
							<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;cursor: pointer;" id="c1"><input type="image"  src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 80px;cursor: pointer;" id="c2"><input type="image"  src="images/wh/w-quxiao.png"></div>
							</div>
						</div>
				</div>
				
				<div id="editYuangong" style="display:none;width: 400px;height: 400px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
						<div style="background-color: #F5F5F5;height: 36px;width: 400px;">
						<div style="float: left;margin-left: 10px;">编辑员工</div>
						<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>
						</div>
						<div style="margin-top: 50px;clear: both;margin-left: 50px;">
								
									<span>姓名名称</span>
									<span><input type="text" id="x1"></span>
									<span id="dpe1"></span><br/>
									
									<span>职级</span>
									<span style="margin-left:32px;">
										<select id="x2" style="width:153px;">
										<c:forEach items="${power }" var="o">
											<option>${o.name }</option>
										</c:forEach>
										</select>
									</span><br/>
								
									<span>登录姓名</span>
									<span><input type="text" id="x3"></span><br/>
									
									<span>登录密码</span>
									<span><input type="text" id="x4"></span><br/>
									
									<span>性别</span>
									<span style="margin-left:32px;"><select style="width:153px;" id="x5">
										<option>男</option>
										<option>女</option>
									</select></span><br/>
								
									<span>出生日期</span>
									<span><input type="text" class="layui-input" id="x6"></span>
									<span id="dpe2"></span><br/>
								
									<span>手机号码</span>
									<span><input type="text" id="x7"></span>
									<span id="dpe3" ></span><br/>
							<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;cursor: pointer;" id="c3"><input type="image" src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 80px;cursor: pointer;" id="c4"><input type="image" src="images/wh/w-quxiao.png"></div>
							</div>
						</div>
				</div>
				
				<div id="deleteYuangong" style="display:none;width: 300px;height: 200px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
					<div style="background-color: #F5F5F5;width: 300px;height:36px ;">
						<div style="float: left;margin-left: 40px;">提醒</div>
						<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>	
					</div>
					<div style="margin-top: 50px;margin-left: 50px;">确定删除？</div>
					<div>
					<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;margin-left:40px;cursor: pointer;" id="c5"><input type="image" src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 80px;cursor: pointer;" id="c6"><input type="image" src="images/wh/w-quxiao.png"></div>
					</div>
					</div>
				</div>
				
				<div id="middle" style="clear: both;">
					<div id="left" style="float: left;width:15%;background-color: #F5F5F5;">
						
						<div style="clear: both;">						
							<div style="color: indianred;cursor: pointer;height: 30px;" class="addT">新增职级</div>
							<div style="color: indianred;cursor: pointer;height: 30px;" class="editT">编辑职级</div>
							<div style="color: indianred;cursor: pointer;height: 30px;" class="deleteT">删除职级</div>
							<div id="showtype">
							<c:forEach var="d" items="${power}">
							<div style="cursor: pointer;height: 30px;" class="all" align="center" >${d.name}</div>
							</c:forEach>
							</div>
						</div>
					</div>
					
					<div id="right" style="float: left;background-color: white;width:1000px;margin-left: 20px;">
						<div style="height: 30px;float: left;">员工设置</div>
						<div style="float: right;"></div>
						<div style="clear: both;background-color: #F5F5F5;">
							<div style="float: left;cursor: pointer;" class="add"><img src="images/wh/w-yuangong-1.png"></div>
							<div style="float: left;cursor: pointer;" class="edit"><img src="images/wh/w-yuangong-2.png"></div>
							<div style="float: left;cursor: pointer;" class="delete"><img src="images/wh/w-yuangong-3.png"></div>
							<div style="float: right;"></div>
						</div>
						<div id="showInfo"  style="clear: both;width:1000px ;">
							<table cellpadding="0" cellspacing="0" style="width:1000px;" id="ta">
								<tr style="background-color: lightgray;height: 40px;">
									<td width="50">编号</td>
									<td width="100">姓名</td>
									<td width="100">登录账号</td>
									<td width="100">职级</td>
									<td width="100">性别</td>
									<td width="100">出生日期</td>
									<td width="100">入职日期</td>
									<td width="100">手机号码</td>
								</tr>
								<c:forEach items="${yuangong }" var="c">
								<tr class="ccc">
									<td width="50">${c.id }</td>
									<td width="100">${c.name }</td>
									<td width="100">${c.username }</td>
									<td width="100">${c.mode.name }</td>
									<c:if test="${c.sex==0 }" >
									<td width="100">男</td>
									</c:if>
									<c:if test="${c.sex==1 }" >
									<td width="100">女</td>
									</c:if>
									<td width="100">${c.birthday }</td>
									<td width="100">${c.hiredate }</td>
									<td width="100">${c.tel }</td>
								</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
		</div>
	</body>
	<script>
	
	
		$(function(){
		//layui
			layui.use('laydate', function(){
	 		 var laydate = layui.laydate;
	  
	 		 //执行一个laydate实例
			  laydate.render({
	 		   elem: '#test1' //指定元素
	 		 });
	 		  laydate.render({
	 		   elem: '#x6' //指定元素
	 		 });
	 		 
			});
			
			$(".ccc").live('click',function(){
			$(this).css({"background":"gold"}).attr("id","select");
			$(".ccc").not(this).css({"background":"white"}).attr("id","");
			});
			$(".cha").click(function(){
				$(this).parent().parent().css("display","none");
			});
			$(".quxiao").click(function(){
				$(this).parent().parent().parent().css("display","none");
			});
			//不同职级
			$(".all").live('click',function(){
				var d=$(this).html();
				var c=$(this);
				//alert(d);
				$.ajax({
					method:"get",//请求方式
  					url:"Yuangong/findOthers.do",//请求地址
  					dataType:"html",
  					data:{"name":d},
  					success:function(result){
  					if(result){
  						$("#showInfo").html(result);
  						c.css("background","gold");
  						c.siblings().css("background","");
  						}else{
  							alert("错误");
  						}
  					}
				});
			});
			//新增职级
			var c="";
			var typeerror=$("#addpower-error").html();//显示错误信息
			//$("#q1 input").removeattr("disabled");
			$("#q1").click(function(){
				c=$("#addpower").find("input").val();
				//alert(c);
				if(c!=""){
				//alert(111);
				$.ajax({
					method:"get",//请求方式
  					url:"Yuangong/addPower.do",//请求地址
  					dataType:"html",
  					data:{"name":c},
  					success:function(result){
  						$("#showtype").html(result);
  						$("#addpower").css("display","none");
  						$.ajax({
  							method:"get",//请求方式
	  						url:"Yuangong/finds.do",//请求地址
	  						dataType:"html",
	  						success:function(result){
	  							$("#showInfo").html(result);
	  							
	  						}
  						});
  					}
				});
				}else{
				//alert(2);
					typeerror.html("请输入种类名称");
					$("#q1 input").attr("disabled","disabled");
				}
			});
			/* $("#x2").click(function(){
				$.ajax({
									method:"get",//请求方式
									url:"Yuangong/findAll1.do",//请求地址
									data:{},
									dataType:"html",
									success:function(result){
										$("#x2").html(result);
										
									}
								});
			});
			$("#xx2").click(function(){
				$.ajax({
									method:"get",//请求方式
									url:"Yuangong/findAll1.do",//请求地址
									data:{},
									dataType:"html",
									success:function(result){
										$("#xx2").html(result);
										
									}
								});
			}); */
			//添加职级的光标验证
			var typeerror=$("#addpower-error").html();
			$("#addpower-1").blur(function(){
				var c=$(this).val();
				//alert(c);
				if(c==""){
					typeerror="请输入名称";
					$("#addpower-error").html("请输入名称");
					$("#q1 input").attr("disabled","disabled");
					//alert(1);
				}else{
					//alert(1);
					//$("#q1 input").removeattr("disabled");
					$("#addpower-error").html("");
					//alert("typeerror");
					$.ajax({
						method:"get",//请求方式
	  					url:"Yuangong/searchPower.do",//请求地址
	  					dataType:"html",
	  					data:{"name":c},
	  					success:function(result){
	  					if(result=="111"){
	  						$("#q1 input").attr("disabled","disabled");
	  						$("#addpower-error").html("已经有此品种");
	  					}else{
	  						$("#q1 input").attr("disabled",false);
	  					}
	  					//typeerror="ssss";
	  					}
					});
				}
			});
			//编辑职级的光标验证
			var editpowererror=$("#editpower-error").html();
			$("#editpower-1").blur(function(){
				var c=$(this).val();
				//alert(c);
				if(c==""){
					//editpowererror="请输入名称";
					$("#editpower-error").html("请输入名称");
					$("#q3 input").attr("disabled","disabled");
					//alert(1);
				}else{
					//alert(c);
					//alert(1);
					//$("#q3 input").removeattr("disabled");
					$("#editpower-error").html("");
					//alert("typeerror");
					$.ajax({
						method:"get",//请求方式
	  					url:"Yuangong/searchPower.do",//请求地址
	  					dataType:"html",
	  					data:{"name":c},
	  					success:function(result){
	  					if(result=="111"){
	  						$("#q3 input").attr("disabled","disabled");
	  						$("#editpower-error").html("已经有此品种");
	  					}else{
	  						$("#q3 input").attr("disabled",false);
	  					}
	  					//typeerror="ssss";
	  					}
					});
				}
			});
			//删除职级
			$(".all").live('click',function(){
					$(this).attr("id","select");
					$(".all").not(this).attr("id","");
				});
			$(".ccc").live('click',function(){
					$(this).attr("id","boo");
					$(".ccc").not(this).attr("id","");
				});
			$("#q5").click(function(){
				var d="";
				var s=true;
				$(".all").each(function(){
					if($(this).attr("id")=="select"){
						d=$(this).html();
						s=false;
						//alert(d);					
						//return;
					}
				});
				if(s){
					alert("请选择要编辑的菜单");
					$("#deletepower").css("display","none");
				}else{
				//alert("aaa");
				//alert(aaa);
				$.ajax({
					method:"get",
					url:"Yuangong/deletePower.do",
					data:{"name":d},
					dataType:"html",
					success:function(result){
						$("#showtype").html(result);
  						$.ajax({
  							method:"get",//请求方式
	  						url:"Yuangong/finds.do",//请求地址
	  						dataType:"html",
	  						success:function(result){
	  							$("#showInfo").html(result);
	  							$("#deletepower").css("display","none");
	  						}
  						});
					}
				});
			}
			});
			//编辑职级
			$("#q3").live('click',function(){
					var d="";
					var s=true;
					var r=true;
					var m=$("#editpower").find("input").val();
					//alert(m);
					$(".all").each(function(){
						if($(this).attr("id")=="select"){
							d=$(this).html();
							s=false;					
							return;
						}
					});
					if(s){
					alert("请选择要编辑的菜单");
					$("#editpower").css("display","none");
					}
					if(m!=""){
						r=false;
					}
					if(!r&&!s){
					//$("#q3 input").removeattr("disabled");
						$.ajax({
							method:"get",
							url:"Yuangong/editPower.do",
							data:{"name":d,"name1":m},
							dataType:"html",
							success:function(result){
								$("#showtype").html(result);
		  						$.ajax({
		  							method:"get",//请求方式
			  						url:"Yuangong/finds.do",//请求地址
			  						dataType:"html",
			  						success:function(result){
			  							$("#showInfo").html(result);
			  							$("#editpower").css("display","none");
			  						}
		  						});
							}
						});
					}else{
						//alert(aaa);
						//alert("请选中要编辑的内容或者输入名称！");
					}
			});
			//添加员工的姓名光标验证
			var cpe1=$("#cpe1").html();
			$("#i1").blur(function(){
				var c=$(this).val();
				//alert(c);
				if(c==""){
					$("#cpe1").html("不能为空");
				}else{
					var test1=/[^\u0000-\u00FF]/;
					if(!test1.test(c)){
						$("#cpe1").html("输入不正确");
					}else{
						$("#cpe1").html("");
					}
				}
			});
			//日期非空验证
			var birth1=$("#birth1").html();
			$("#test1").blur(function(){
				if($(this).val()==""){
					$("#birth1").html("请选择日期");
				}else{
					$("#birth1").html("");
				}
			});
			//手机号码验证
			var tel1=$("#cpe3").html();
			$("#tel1").blur(function(){
			var c=$(this).val();
				if(c==""){
					$("#cpe3").html("不能为空");
				}else{
					var test2=/^1[34578]\d{9}$/;
					if(!test2.test(c)){
						$("#cpe3").html("输入不正确");
					}else{
						$("#cpe3").html("");
					}
				}
			});
			//新增员工
			$("#c1").live('click',function(){
					//alert(0);
					var i1=$("#i1").val();
					var power1=$("#power1").val();
					var ename1=$("#ename1").val();
					var pass1=$("#pass").val();
					var sex1=$("#sex1").val().trim();
					var sex=0;
					var test1=$("#test1").val();
					var tell=$("#tel1").val();
					if(sex1=="男"){
						sex=0;
					}else{
						sex=1;
					}
					if($("#i1").val()!=""&&$("#test1").val!=""&&$("#tel1").val()!=""){
						if(cpe1==""&&birth1==""&&tel1==""){
						//alert(1);
						$.ajax({
							method:"get",//请求方式
		  					url:"Yuangong/addEmp.do",//请求地址
		  					dataType:"html",
		  					data:{"name":i1,"powername":power1,"username":ename1,"userpass":pass1,"sex":parseInt(sex),"birthday":test1,"tel":tell},
		  					success:function(result){
		  					//alert(1);
		  						$.ajax({
		  							method:"get",//请求方式
		  							url:"Yuangong/finds.do",//请求地址
		  							dataType:"html",
		  							success:function(result){
		  								$("#showInfo").html(result);
		  								$("#addYuangong").css("display","none");
		  							}
		  						});
		  					}
						});
					}
					}
					
			});
			$(".edit").click(function(){
			//alert(1);
				$.ajax({
							method:"post",//请求方式
							url:"Yuangong/findAll1.do",//请求地址
							dataType:"html",
							success:function(result){
								$("#x2").html(result);
							}
						});
			});
			$(".add").click(function(){
			//alert(1);
				$.ajax({
							method:"post",//请求方式
							url:"Yuangong/findAll1.do",//请求地址
							dataType:"html",
							success:function(result){
								$("#power1").html(result);
							}
						});
			});
			//编辑员工的姓名光标验证
			var dpe1=$("#dpe1").html();
			$("#x1").blur(function(){
				var c=$(this).val();
				//alert(c);
				if(c==""){
					$("#dpe1").html("不能为空");
				}else{
					var test1=/[^\u0000-\u00FF]/;
					if(!test1.test(c)){
						$("#dpe1").html("输入不正确");
					}else{
						$("#dpe1").html("");
					}
				}
			});
			//日期非空验证
			var dpe2=$("#dpe2").html();
			$("#x6").blur(function(){
				if($(this).val()==""){
					$("#dpe2").html("请选择日期");
				}else{
					$("#dpe2").html("");
				}
			});
			//手机号码验证
			var dpe3=$("#dpe3").html();
			$("#x7").blur(function(){
			var c=$(this).val();
				if(c==""){
					$("#dpe3").html("不能为空");
				}else{
					var test2=/^1[34578]\d{9}$/;
					if(!test2.test(c)){
						$("#dpe3").html("输入不正确");
					}else{
						$("#dpe3").html("");
					}
				}
			});
			//编辑员工
			$("#c3").live('click',function(){
					var s=true;
					var i1=$("#x1").val();
					var power1=$("#x2").val();
					var ename1=$("#x3").val();
					var pass1=$("#x4").val();
					var sex1=$("#x5").val().trim();
					var sex=0;
					var test1=$("#x6").val();
					var tell=$("#x7").val();
					//alert(sex1);
					if(sex1=="男"){
						sex=0;
					}else{
						sex=1;
					}
				//	alert(sex);
					$(".ccc").each(function(){
						if($(this).attr("id")=="boo"){
							d=$(this).find("td:eq(0)").html();//原来的id
							//alert(d);
							s=false;					
							return;
						}
					});
					if(s){
						alert("请选择要编辑的菜单");
						$("#editYuangong").css("display","none");
					}
					if($("#x1").val()!=""&&$("#x6").val!=""&&$("#x7").val()!=""){
						if(dpe1==""&&dpe2==""&&dpe3==""){
						//alert(1);
						$.ajax({
							method:"get",//请求方式
		  					url:"Yuangong/editEmp.do",//请求地址
		  					dataType:"html",
		  					data:{"id":d,"name":i1,"powername":power1,"username":ename1,"userpass":pass1,"sex":parseInt(sex),"birthday":test1,"tel":tell},
		  					success:function(result){
		  					//alert(1);
		  						$.ajax({
		  							method:"get",//请求方式
		  							url:"Yuangong/finds.do",//请求地址
		  							dataType:"html",
		  							success:function(result){
		  								$("#showInfo").html(result);
		  								$("#editYuangong").css("display","none");
		  							}
		  						});
		  					}
						});
					}
					}
					
			});
			//删除员工
			$("#c5").live('click',function(){
				var d="";
				var s=true;
				$(".ccc").each(function(){
					if($(this).attr("id")=="boo"){
						d=$(this).find("td:eq(0)").html();
						//alert(d);
						s=false;					
						return;
					}
				});
				if(s){
					alert("请选择要编辑的菜单");
					$("#deleteYuangong").css("display","none");
				}else{
				//alert(d);
				$.ajax({
					method:"get",
					url:"Yuangong/deleteEmp.do",
					data:{"id":d},
					dataType:"html",
					success:function(result){
						$("#showInfo").html(result);
						$("#deleteYuangong").css("display","none");
					}
				});
			}
			});
			
		
			$(".add").click(function(){
				$("#addpower-error").html("");
				$("#editpower-error").html("");
				$("#addYuangong").find("input").val("");
				$("#addYuangong").css("display","block");
				$("#editYuangong").css("display","none");
				$("#deleteYuangong").css("display","none");
				$("#addpower").css("display","none");
				$("#editpower").css("display","none");
				$("#deletepower").css("display","none");
		});
		$(".edit").click(function(){
			//alert(1);
			$("#addpower-error").html("");
			$("#editpower-error").html("");
			$("#editYuangong").find("input").val("");
			$("#addYuangong").css("display","none");
			$("#deleteYuangong").css("display","none");
			$("#editYuangong").css("display","block");
			$("#addpower").css("display","none");
			$("#editpower").css("display","none");
			$("#deletepower").css("display","none");
		});
		$(".delete").click(function(){
			//alert(1);
			$("#addpower-error").html("");
			$("#editpower-error").html("");
			$("#addYuangong").css("display","none");
			$("#editYuangong").css("display","none");
			$("#deleteYuangong").css("display","block");
			$("#addpower").css("display","none");
			$("#editpower").css("display","none");
			$("#deletepower").css("display","none");
		});
		$(".addT").click(function(){
			$("#addpower-error").html("");
			$("#editpower-error").html("");
			$("#addpower").find("input").val("");
			$("#addpower").css("display","block");
			$("#editpower").css("display","none");
			$("#deletepower").css("display","none");
			$("#addYuangong").css("display","none");
			$("#editYuangong").css("display","none");
			$("#deleteYuangong").css("display","none");
		});
		$(".editT").click(function(){
			$("#addpower-error").html("");
			$("#editpower-error").html("");
			$("#editpower").find("input").val("");
			$("#editpower").css("display","block");
			$("#addpower").css("display","none");
			$("#deletepower").css("display","none");
			$("#addYuangong").css("display","none");
			$("#editYuangong").css("display","none");
			$("#deleteYuangong").css("display","none");
		});
		$(".deleteT").click(function(){
			$("#addpower-error").html("");
			$("#editpower-error").html("");
			$("#deletepower").css("display","block");
			$("#addYuangong").css("display","none");
			$("#editYuangong").css("display","none");
			$("#deleteYuangong").css("display","none");
			$("#addpower").css("display","none");
			$("#editpower").css("display","none");
		});
		
		});
		
		
	</script>
	<script type="text/javascript" language="javascript">
        var idTmr;
        function  getExplorer() {
            var explorer = window.navigator.userAgent ;
            //ie 
            if (explorer.indexOf("MSIE") >= 0) {
                return 'ie';
            }
            //firefox 
            else if (explorer.indexOf("Firefox") >= 0) {
                return 'Firefox';
            }
            //Chrome
            else if(explorer.indexOf("Chrome") >= 0){
                return 'Chrome';
            }
            //Opera
            else if(explorer.indexOf("Opera") >= 0){
                return 'Opera';
            }
            //Safari
            else if(explorer.indexOf("Safari") >= 0){
                return 'Safari';
            }
        }
        function method1(tableid) {//整个表格拷贝到EXCEL中
            if(getExplorer()=='ie')
            {
                var curTbl = document.getElementById(tableid);
                var oXL = new ActiveXObject("Excel.Application");

                //创建AX对象excel 
                var oWB = oXL.Workbooks.Add();
                //获取workbook对象 
                var xlsheet = oWB.Worksheets(1);
                //激活当前sheet 
                var sel = document.body.createTextRange();
                sel.moveToElementText(curTbl);
                //把表格中的内容移到TextRange中 
                sel.select;
                //全选TextRange中内容 
                sel.execCommand("Copy");
                //复制TextRange中内容  
                xlsheet.Paste();
                //粘贴到活动的EXCEL中       
                oXL.Visible = true;
                //设置excel可见属性

                try {
                    var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
                } catch (e) {
                    print("Nested catch caught " + e);
                } finally {
                    oWB.SaveAs(fname);

                    oWB.Close(savechanges = false);
                    //xls.visible = false;
                    oXL.Quit();
                    oXL = null;
                    //结束excel进程，退出完成
                    //window.setInterval("Cleanup();",1);
                    idTmr = window.setInterval("Cleanup();", 1);

                }

            }
            else
            {
                tableToExcel('ta')
            }
        }
        function Cleanup() {
            window.clearInterval(idTmr);
            CollectGarbage();
        }
        var tableToExcel = (function() {
              var uri = 'data:application/vnd.ms-excel;base64,',
              template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',
                base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
                format = function(s, c) {
                    return s.replace(/{(\w+)}/g,
                    function(m, p) { return c[p]; }) }
                return function(table, name) {
                if (!table.nodeType) table = document.getElementById(table)
                var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
                window.location.href = uri + base64(format(template, ctx))
              }
            })()
    </script>
	
</html>
