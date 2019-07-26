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
    
    <title>My JSP 'caipin.jsp' starting page</title>
    
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
					</div>|菜品设置
					<div style="float: right;">
						<input id="Button1" type="button" value="导出EXCEL"  onclick="javascript:method1('ta')" />
					</div>
				</div>
				
				<div id="addtype" style="display: none;width:300px ;height: 200px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
					<div style="width: 300px;height: 40px;background-color: #F5F5F5;border-bottom: 1PX solid lightgray;text-align: center;">新增菜品分类</div>
					<div style="width: 300px;height: 160px;">
						<span>分类名称</span>
						<span><input type="text" id="addtype-1"></span><br/><br/>
						<span id="addtype-error"></span>
						<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;cursor: pointer;margin-left: 50px;" id="q1"><input type="image" src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 80px;cursor: pointer;" id="q2"><input type="image" src="images/wh/w-quxiao.png"></div>
							</div>
					</div>
				
				</div>
				
				<div id="editType" style="display: none;width:300px ;height: 200px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
					<div style="width: 300px;height: 40px;background-color: #F5F5F5;border-bottom: 1PX solid lightgray;text-align: center;">编辑菜品分类</div>
					<div style="width: 300px;height: 160px;">
						<span>分类名称</span>
						<span><input type="text" id="edittype-1"></span><br/>
						<span id="edittype-error"></span><br/>
						
						<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;cursor: pointer;margin-left: 50px;" id="q3"><input type="image"  src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 80px;cursor: pointer;" id="q4"><input type="image"  src="images/wh/w-quxiao.png"></div>
							</div>
					</div>
				</div>
				
				<div id="deleteType" style="display:none;width: 300px;height: 200px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
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
				
				<div id="addcaipin" style="display:none;width: 400px;height: 300px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
						<div style="background-color: #F5F5F5;height: 36px;width: 400px;">
							<div style="float: left;margin-left: 10px;">新增菜品</div>
							<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>
						</div>
						<div style="margin-top: 50px;clear: both;margin-left: 50px;">
			
									<span>菜品名称</span>
									<span><input type="text" id="i1"></span>
									<span id="cpe1"></span><br/>
									
									<span>菜品种类</span>
									<span id="bn">
										<select id="s1" style="width:153px;">
										<c:forEach items="${type }" var="o">
											<option >${o.name }</option>
										</c:forEach>
										</select>
									</span>
									<span id="cpe3"></span><br/>
								
									<span>菜品价格</span>
									<span><input type="text" id="i2"></span><br/>
									<span id="cpe2"></span><br/>
								
							<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;cursor: pointer;" id="c1"><input type="image"  src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 80px;cursor: pointer;" id="c2"><input type="image"  src="images/wh/w-quxiao.png"></div>
							</div>
						</div>
				</div>
				
				<div id="editcaipin" style="display:none;width: 400px;height: 300px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
						<div style="background-color: #F5F5F5;height: 36px;width: 400px;">
						<div style="float: left;margin-left: 10px;">编辑菜品</div>
						<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>
						</div>
						<div style="margin-top: 50px;clear: both;margin-left: 50px;">
									<span>菜品名称</span>
									<span><input type="text" id="i3"></span>
									<span id="cpe3"></span><br/>
								
									<span>菜品价格</span>
									<span><input type="text" id="i4"></span><br/>
									<span id="cpe4"></span><br/>
								
							<div style="margin-top: 30px;"> 
							<div class="trust" style="float: left;cursor: pointer;" id="c3"><input type="image" src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 80px;cursor: pointer;" id="c4"><input type="image" src="images/wh/w-quxiao.png"></div>
							</div>
						</div>
				</div>
				
				<div id="deletecaipin" style="display:none;width: 300px;height: 200px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
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
							<div style="color: indianred;cursor: pointer;height: 30px;" class="addT">新增种类</div>
							<div style="color: indianred;cursor: pointer;height: 30px;" class="editT">编辑种类</div>
							<div style="color: indianred;cursor: pointer;height: 30px;" class="deleteT">删除种类</div>
							<div id="showtype">
							<c:forEach var="d" items="${type}">
							<div style="cursor: pointer;height: 30px;" class="all" align="center" >${d.name}</div>
							</c:forEach>
							</div>
						</div>
					</div>
					
					<div id="right" style="float: left;background-color: white;width:950px;margin-left: 20px;">
						<div style="height: 30px;float: left;">精致冷菜</div>
						<div style="float: right;"></div>
						<div style="clear: both;background-color: #F5F5F5;">
							<div style="float: left;cursor: pointer;" id="add"><img src="images/wh/w-caipin-addcaiming.png" id="add1"></div>
							<div style="float: left;cursor: pointer;" id="edit"><img src="images/wh/w-caipin-editcaiming.png"></div>
							<div style="float: left;cursor: pointer;" id="delete"><img src="images/wh/w-caipin-deletecaiming.png"></div>
							<div style="float: right;"></div>
						</div>
						<div id="showInfo"  style="clear: both;width:900px ;">
							<table cellpadding="0" cellspacing="0" style="width:900px;">
								<tr style="background-color: lightgray;height: 40px;">
									<td width="50">编号</td>
									<td width="300">菜品名称</td>
									<td width="100">菜品分类</td>
									<td width="100">售价</td>
								</tr>
								<c:forEach items="${food }" var="c">
								<tr class="ccc">
									<td width="50">${c.id}</td>
									<td width="100" id="foodname">${c.name }</td>
									<td width="100">${c.mode.name }</td>
									<td width="100">${c.price }</td>
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
			//不同种类
			$(".all").live('click',function(){
				var d=$(this).html();
				var c=$(this);
				//alert(d);
				$.ajax({
					method:"get",//请求方式
  					url:"caiPin/showOthers.do",//请求地址
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
			//新增种类
			var c="";
			var typeerror=$("#addtype-error").html();//显示错误信息
			//$("#q1 input").removeattr("disabled");
			$("#q1").click(function(){
				c=$("#addtype").find("input").val();
				//alert(c);
				if(c!=""){
				//alert(111);
				$.ajax({
					method:"get",//请求方式
  					url:"caiPin/addCookType.do",//请求地址
  					dataType:"html",
  					data:{"name":c},
  					success:function(result){
  						$("#showtype").html(result);
  						$("#addtype").css("display","none");
  						
  					}
				});
				}else{
				//alert(2);
					typeerror.html("请输入种类名称");
					$("#q1 input").attr("disabled","disabled");
				}
			});
			//添加种类的光标验证
			var typeerror=$("#addtype-error").html();
			$("#addtype-1").blur(function(){
				var c=$(this).val();
				//alert(c);
				if(c==""){
					typeerror="请输入名称";
					$("#addtype-error").html("请输入名称");
					$("#q1 input").attr("disabled","disabled");
					//alert(1);
				}else{
					//alert(1);
					//$("#q1 input").removeattr("disabled");
					$("#addtype-error").html("");
					//alert("typeerror");
					$.ajax({
						method:"get",//请求方式
	  					url:"caiPin/searchType.do",//请求地址
	  					dataType:"html",
	  					data:{"name":c},
	  					success:function(result){
	  					if(result=="111"){
	  						$("#q1 input").attr("disabled","disabled");
	  						$("#addtype-error").html("已经有此品种");
	  					}else{
	  						$("#q1 input").attr("disabled",false);
	  					}
	  					//typeerror="ssss";
	  					}
					});
				}
			});
			//编辑种类的光标验证
			var edittypeerror=$("#edittype-error").html();
			$("#edittype-1").blur(function(){
				var c=$(this).val();
				//alert(c);
				if(c==""){
					//edittypeerror="请输入名称";
					$("#edittype-error").html("请输入名称");
					$("#q3 input").attr("disabled","disabled");
					//alert(1);
				}else{
					//alert(c);
					//alert(1);
					//$("#q3 input").removeattr("disabled");
					$("#edittype-error").html("");
					//alert("typeerror");
					$.ajax({
						method:"get",//请求方式
	  					url:"caiPin/searchType.do",//请求地址
	  					dataType:"html",
	  					data:{"name":c},
	  					success:function(result){
	  					if(result=="111"){
	  						$("#q3 input").attr("disabled","disabled");
	  						$("#edittype-error").html("已经有此品种");
	  					}else{
	  						$("#q3 input").attr("disabled",false);
	  					}
	  					//typeerror="ssss";
	  					}
					});
				}
			});
			//删除种类
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
					$("#editType").css("display","none");
				}else{
				//alert("aaa");
				//alert(aaa);
				$.ajax({
					method:"get",
					url:"caiPin/deleteCookType.do",
					data:{"name":d},
					dataType:"html",
					success:function(result){
						$("#showtype").html(result);
						$.ajax({
  							method:"get",//请求方式
  							url:"caiPin/finds.do",//请求地址
  							dataType:"html",
  							success:function(result){
  								$("#showInfo").html(result);
  								$("#deleteType").css("display","none");
  							}
  						});
					}
				});
			}
			});
			//编辑种类
			$("#q3").click(function(){
					var d="";
					var s=true;
					var r=true;
					var m=$("#editType").find("input").val();
					//alert(m);
					$(".all").each(function(){
						if($(this).attr("id")=="select"){
							d=$(this).html();
							s=false;					
							return;
						}
					});
					if(m!=""){
						r=false;
					}
					if(s){
					alert("请选择要编辑的菜单");
					$("#editType").css("display","none");
				}
					if(!r&&!s){
					//$("#q3 input").removeattr("disabled");
						$.ajax({
							method:"get",
							url:"caiPin/editCookType.do",
							data:{"name":d,"name1":m},
							dataType:"html",
							success:function(result){
								$("#showtype").html(result);
								$.ajax({
		  							method:"get",//请求方式
		  							url:"caiPin/finds.do",//请求地址
		  							dataType:"html",
		  							success:function(result){
		  								$("#showInfo").html(result);
		  								$("#editType").css("display","none");
		  							}
		  						});
							}
						});
					}else{
						//alert(aaa);
						//alert("请选中要编辑的内容或者输入名称！");
					}
			});
			//添加菜品的光标验证
			var cpe1=$("#cpe1").html();
			$("#i1").blur(function(){
				var c=$(this).val();
				//alert(c);
				if(c!=""){
				//alert("不为空");
						$("#cpe1").html("");
						//alert("typeerror");
						$.ajax({
							method:"get",//请求方式
		  					url:"caiPin/searchCai.do",//请求地址
		  					dataType:"html",
		  					data:{"name":c},
		  					success:function(result){
		  					if(result=="111"){
		  						$("#c1 input").attr("disabled","disabled");
		  						$("#cpe1").html("已经有此菜名");
		  					}else{
		  						$("#c1 input").attr("disabled",false);
		  					}
		  					//typeerror="ssss";
		  					}
						});
				}else{
					//alert(1);
					//$("#q1 input").removeattr("disabled");
					//cpe1="请输入名称";
					$("#cpe1").html("请输入名称");
					$("#c1 input").attr("disabled","disabled");
					//alert(1);
				}
			});
			
				/* $.ajax({
						method:"get",//请求方式
	  					url:"caiPin/findAllCookType1.do",//请求地址
	  					dataType:"html",
	  					data:{},
	  					success:function(){
	  						alert(1);
	  						/* $("#bn").html(result); */
	  					//typeerror="ssss";
	  				/* 	},
	  					error: function(XMLHttpRequest, textStatus, errorThrown) {
	  						alert(1);
	  					}});
					}); */ 
			
			/* $("#s1").click(function(){
			$.ajax({
							method:"post",//请求方式
		  					url:"caiPin/findAllCookType1.do",//请求地址
		  					data:{},
		  					dataType:"html",
		  					success:function(result){
		  					alert(1);
		  					$("#s1").val(result);
		  					},
		  					 error: function(result){
		  					 
		  					$("#s1").val(result);
		  					}
						});
				
			}); */
			//新增菜品
			$("#c1").click(function(){
					var c1=true;
					$("#cpe2").html("");
					//var d=$("#i2").val();//
					var m=$("#i1").val();
					var n=$("#s1").val();
					var b=$("#i2").val();
					var pricetest=/^\d{1,}$/; 
					if(n==""){
						$("#cpe3").html("请选择");
					}
					if(!pricetest.test(b)){
						$("#cpe2").html("请输入正确的价格");
						c1=false;
						return;
					}else{
						$("#cpe2").html("");
						$("#c1 input").attr("disabled",false);
					}
					//alert(m+n+b);
					if(c1){
					//alert(1);
						$.ajax({
							method:"get",//请求方式
		  					url:"caiPin/addFood.do",//请求地址
		  					dataType:"html",
		  					data:{"name":m,"type":n,"price":b},
		  					success:function(result){
		  						$("#showInfo").html(result);
		  						$("#addcaipin").css("display","none");
		  					}
						});
					}
			});
			//编辑菜品的光标验证
			var cpe3=$("#cpe3").html();
			$("#i3").blur(function(){
				var c=$(this).val();
				//alert(c);
				if(c==""){
					//cpe1="请输入名称";
					$("#cpe3").html("请输入名称");
					$("#c3 input").attr("disabled","disabled");
					//return;
					//alert(1);
				}else{
					//alert(1);
					//$("#q1 input").removeattr("disabled");
					$("#cpe3").html("");
					//alert("typeerror");
					$.ajax({
						method:"get",//请求方式
	  					url:"caiPin/searchCai.do",//请求地址
	  					dataType:"html",
	  					data:{"name":c},
	  					success:function(result){
	  					if(result=="111"){
	  						$("#c3 input").attr("disabled","disabled");
	  						$("#cpe3").html("已经有此菜名");
	  					}else{
	  						$("#c3 input").attr("disabled",false);
	  					}
	  					//typeerror="ssss";
	  					}
					});
				}
			});
			//编辑菜品
			$("#c3").click(function(){
					var d="";
					var s=true;
					var r=true;
					var pricetest=/^\d{1,}$/; 
					var m=$("#i3").val();
					//var n=$("#editcaipin").find("input:eq(1)").val();
					var b=$("#i4").val();
					//alert(m);
					//alert(m+b);
					$(".ccc").each(function(){
						if($(this).attr("id")=="boo"){
							d=$(this).find("td:eq(1)").html();//原来的名称
							//alert(d);
							s=false;					
							return;
						}
					});
					if(s){
					alert("请选择要编辑的菜单");
					$("#editcaipin").css("display","none");
					}
					if(!pricetest.test(b)){
						$("#cpe4").html("请输入正确的价格");
						r=false;
						return;
					}
					if(r&&!s){
					//alert(1);
						 $.ajax({
							method:"get",
							url:"caiPin/editFood.do",
							data:{"name":d,"name1":m,"price":b},
							dataType:"html",
							success:function(result){
								$("#showInfo").html(result);
								$("#editcaipin").css("display","none");
							}
						}); 
					}
			});
			//删除菜品
			$("#c5").click(function(){
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
					$("#editcaipin").css("display","none");
				}else{
				//alert(aaa);
				$.ajax({
					method:"get",
					url:"caiPin/deleteFood.do",
					data:{"id":d},
					dataType:"html",
					success:function(result){
						$("#showInfo").html(result);
						$("#deletecaipin").css("display","none");
					}
				});
			}
			});
			
		
			$("#add").click(function(){
			 		$.ajax({
						method:"get",//请求方式
	  					url:"caiPin/findAllCookType1.do",//请求地址
	  					dataType:"html",
	  					success:function(result){
	  						$("#s1").html(result); 
	  						//typeerror="ssss";
	  					}
	  					});
			$("#cpe1").html("");
			$("#cpe2").html("");
			$("#addcaipin").find("input").val("");
			$("#addcaipin").css("display","block");
			$("#editcaipin").css("display","none");
			$("#deletecaipin").css("display","none");
			$("#addtype").css("display","none");
			$("#editType").css("display","none");
			$("#deleteType").css("display","none");
		});
		$("#edit").click(function(){
			//alert(1);
			$("#cpe3").html("");
			$("#cpe4").html("");
			$("#editcaipin").find("input").val("");
			$("#addcaipin").css("display","none");
			$("#deletecaipin").css("display","none");
			$("#editcaipin").css("display","block");
			$("#addtype").css("display","none");
			$("#editType").css("display","none");
			$("#deleteType").css("display","none");
		});
		$("#delete").click(function(){
			//alert(1);
			$("#addcaipin").css("display","none");
			$("#editcaipin").css("display","none");
			$("#deletecaipin").css("display","block");
			$("#addtype").css("display","none");
			$("#editType").css("display","none");
			$("#deleteType").css("display","none");
		});
		$(".addT").click(function(){
			$("#addtype-error").html("");
			$("#addtype").find("input").val("");
			$("#addtype").css("display","block");
			$("#editType").css("display","none");
			$("#deleteType").css("display","none");
			$("#addcaipin").css("display","none");
			$("#editcaipin").css("display","none");
			$("#deletecaipin").css("display","none");
		});
		$(".editT").click(function(){
			$("#edittype-error").html("");
			$("#editType").find("input").val("");
			$("#editType").css("display","block");
			$("#addtype").css("display","none");
			$("#deleteType").css("display","none");
			$("#addcaipin").css("display","none");
			$("#editcaipin").css("display","none");
			$("#deletecaipin").css("display","none");
		});
		$(".deleteT").click(function(){
			$("#deleteType").css("display","block");
			$("#addcaipin").css("display","none");
			$("#editcaipin").css("display","none");
			$("#deletecaipin").css("display","none");
			$("#addtype").css("display","none");
			$("#editType").css("display","none");
		});
		
		
		});
		
		
		/*$(".dating").click(function(){
			$(this).css("background-color","darkgrey");
		});
		$(".baoxiang").click(function(){
			$(this).css("background-color","darkgrey");
		});*/
		
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
