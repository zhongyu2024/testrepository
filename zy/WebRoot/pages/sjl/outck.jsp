<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'outck.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/sjl/cangwei.css" />
		<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>
		
		<script type="text/javascript" src="calendar/demo.js" ></script>
		<script type="text/javascript" src="calendar/jquery-1.7.1.min.js" ></script>
		<script type="text/javascript" src="calendar/lhgcalendar.min.js" ></script>
		<script type="text/javascript" src="calendar/prettify.js" ></script>
		<link rel="stylesheet" href="calendar/prettify.css" />
		<link rel="stylesheet" href="calendar/lhgcalendar.css" />
		<link rel="stylesheet" href="calendar/common.css" />
	</head>
	<body style="font-family: '微软雅黑';background: white;">
		<div id="rbody3">
		<div id="out-shuangji" style="display:none">
			</div>
			<table>
				<tr>
				<td>
				
			<div id="rtop1" style="width: 400px;float: left;">
				<div class="change"><img src="images/sjl/添加.jpg" width="35" height="35" align="center"/>&nbsp;添加</div>
				<!--<div class="change"><img src="images/sjl/修改.jpg" width="35" height="35" align="center"/>&nbsp;修改</div>
				<div class="change"><img src="images/sjl/删除.jpg" width="35" height="35" align="center"/>&nbsp;删除</div>-->
			</div>
				</td>
				<td>
				
			<div id="search" style="width: 350px;height: 50px;margin-top:6px;float: right;">
				<form>
					<div id="timesearch">
						时间区间：
						<input type="button" name="time1" style="width: 100px;background: white;" class="time" id="time1"/>--
						<input type="button" name="time1" style="width: 100px;background: white;" class="time" id="time2"/>
					</div>
					<div id="typesearch"style="float: left;margin-top: 3px;">
						<select name="type" style="width: 90px;" id="typez">
							<option value="0">-请选择-</option>
							<option value="1">流水号</option>
							<option value="2">仓库名</option>
							<option value="3">操作员</option>
						</select>
						<input type="text" name="text" placeholder="请输入搜索的关键字" style="width: 180px;" id="textz"/>
					</div>
					<input type="button" class="searchsub" value="搜索" style="width: 60px;margin-right: 6px; float: right;margin-top: 3px;" id="topsub"/>
				</form>
			</div>
				</td>
				</tr>
			</table>
			
			
			<div></div>
			<div id="rtitle">
				<table cellpadding="0" cellspacing="0" >
					<tr height="30">
						<td style="background: #354148;color: #B6BBC3;text-align: center;" width="140" >流水号</td>
						<td style="background: #354148;color: #B6BBC3;text-align: center;" width="90" >仓库</td>
						<td style="background: #354148;color: #B6BBC3;text-align: center;" width="90" >操作员</td>
						<td style="background: #354148;color: #B6BBC3;text-align: center;" width="180" >出库时间</td>
						<td style="background: #354148;color: #B6BBC3;">&nbsp;&nbsp;备注</td>
					</tr>
				</table>
				<div id="out-zhut">
				<table class="ddd" cellpadding="0" cellspacing="0" >
				<c:forEach items="${oc }" var="oc">
					<tr height="30" style="background:#DBE4ED;">
						<td style="text-align: center;" width="140" >${oc.id }</td>
						<td style="text-align: center;" width="90" >${oc.ckname }</td>
						<td style="text-align: center;" width="90" >${oc.doname }</td>
						<td style="text-align: center;" width="180" >${oc.outtime }</td>
						<td>${oc.info }</td>
					</tr>
				</c:forEach>
				</table>
				<div id="pages">
					<input type="button" value="首页" id="pagetop" />
					<input type="button" value="上一页" id="pagebefor"/>
					<!--循环出页数-->
					<c:forEach begin="1" end="${zy }" var="i">
					<input type="button" value="${i }" class="pagenum"/>
					</c:forEach>
					<!---->
					<input type="button" value="下一页" id="pageafter"/>
					<input type="button" value="末页" id="pagedown"/>
				</div>
				
				</div>
			</div>
			<!--覆盖层-->
			<div id="hidden1"></div>
			<!--添加框-->
			<div id="change1" class="tankuang1">
				<div style="font-size: 16px;text-align: center;margin-top: 10px;">领用出库单</div>
				
				<div class="neirong1">
				<form action="" method="post" >
				<div id="out-tj">
					<table cellspacing="0" cellpadding="0">
						<tr>
							<td><div class="stitle" style="float: left;">流水号</div>
								<input type="text" value="" disabled="disabled" name="id" style="float: left;width: 120px;" id="out-id"/>
							</td>
							<td><div class="stitle" style="float: left;" >仓库</div>
								<select name="cangkuid" style="float: left;" id="ckname">
									<option value="0">-请选择-</option>
									<option value="1">111</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><div class="stitle" style="float: left;">日期</div>
								<input type="text" value="日期显示" disabled="disabled" name="intime" style="float: left;width: 120px;"/>
							</td>
							<td><div class="stitle" style="float: left;">操作员</div>
								<select name="buyman" style="float: left;" id="buyman">
									<option value="0">-请选择-</option>
									<option value="1">111</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="stitle">备注</div>
								<textarea placeholder="请输入备注" cols="45" rows="6" class="outinfo" style="margin-top: -20px;margin-left: 70px;" id="out-outinfo">dsfsdfsdf</textarea>
							</td>
						</tr>
					</table>
				</div>
					<br/>
					<!--出库货物明细框-->
					<div class="materials">
						<div style="font-size: 14px;text-align: center;background: #A5BCD2;">出库货物明细</div>
						<input type="button" value="增加"  class="sub" id="sub4"/>
						<input type="button" value="删除"  class="res" id="res4"/>
						<div id="out-mx">
						<table cellpadding="1" cellspacing="1" id="matertable">
							<tr>
								<td style="text-align: center;background:#B6BBC3;" width="140">材料</td>
								<td style="text-align: center;background:#B6BBC3;" width="100">单位</td>
								<td style="text-align: center;background:#B6BBC3;">数量</td>
								<!-- <td style="text-align: center;background:#B6BBC3;">单价</td>
								<td style="text-align: center;background:#B6BBC3;">金额</td> -->
							</tr>
							
						</table>
						</div>
					</div>
					<br />
					<input type="button" value="确定"  class="sub" id="sub1" style="margin-left: 25px;"/>
					<input type="button" value="放弃"  class="res" id="res1"/>
				</form>
				</div>
			</div>
			<!--新增货物框-->
			<div id="newmater" class="tankuang" style="width: 200px;" >
				<div style="text-align: center;font-size: 15px;margin-top: 5px;">新增货物</div>
				<form action="" method="post">
				
				<div class="neirong" style="font-size: 15px;line-height: 30px;width: 150px;">
					<div>材料：
						<input type="button" name="num" style="width: 78px;background: white;" class="cailiao"/>
						<input type="hidden" class="cailiaoid"/>
					</div>
					<div>单位：
						<input type="text" name="name" style="width: 75px;" disabled="disabled" class="cailiaodw"/>
					</div>
					<div>余量：
						<input type="text" name="price" style="width: 75px;" id="clmoney" disabled="disabled"/>
					</div>
					<div>数量：
						<input type="text" name="num" style="width: 75px;" id="clnum"/>
					</div>
					
					<br />
					<input type="button" value="确定"  class="sub" id="sub5"/>
					<input type="reset" value="放弃"  class="res" id="res5"/>
				</div>
				</form>
			</div>
			<!--选择材料框-->
			<div id="choose" style="display: none;">
				<div id="chtop">
					<input type="button" value="确认" style="width: 60px;margin-left: 20px; float: left;margin-top: 10px;" class="queren"/>
					<form>
					<div id="typechoose"style="float: left;margin-top: 10px;margin-left: 40px;">
						<select name="type" style="width: 90px;" class="type">
							<option value="0">-请选择-</option>
							<option value="1">名称</option>
							<option value="2">类型</option>
						</select>
						<input type="text" name="text" placeholder="请输入搜索的关键字" style="width: 180px;" class="text"/>
					</div>
					<input type="button" class="searchsub" value="搜索" style="width: 60px;margin-right: 30px; float: right;margin-top: 10px;" id="sscl"/>
					</form>
				</div>
				
				<div id="chtable1" style="margin-top: 45px;text-align: center;font-size: 14px;">
					<table cellspacing="0" cellpadding="0" style="width: 500px;">
						<tr>
							<td style="background: #354148;color: #B6BBBF;text-align: center;font-size: 15px;">编号</td>
							<td style="background: #354148;color: #B6BBBF;text-align: center;font-size: 15px;" width="140">名称</td>
							<td style="background: #354148;color: #B6BBBF;text-align: center;font-size: 15px;">类型</td>
							<td style="background: #354148;color: #B6BBBF;text-align: center;font-size: 15px;">单位</td>
						</tr>
						<!-- <tr class="ccl" style="background:#E8E8E8">
							<td style="border-bottom: 0.5px solid #B6BBBF;border-right: 0.5px solid #B6BBBF;text-align: center;font-size: 14px;" class="hwid">1001</td>
							<td style="border-bottom: 0.5px solid #B6BBBF;border-right: 0.5px solid #B6BBBF;text-align: center;font-size: 14px;" width="140" class="hwname">5555</td>
							<td style="border-bottom: 0.5px solid #B6BBBF;border-right: 0.5px solid #B6BBBF;text-align: center;font-size: 14px;">44</td>
							<td style="border-bottom: 0.5px solid #B6BBBF;border-right: 0.5px solid #B6BBBF;text-align: center;font-size: 14px;" class="dw">kg</td>
						</tr>
						<tr class="ccl">
							<td style="border-bottom: 0.5px solid #B6BBBF;border-right: 0.5px solid #B6BBBF;text-align: center;font-size: 14px;" class="hwid">1002</td>
							<td style="border-bottom: 0.5px solid #B6BBBF;border-right: 0.5px solid #B6BBBF;text-align: center;font-size: 14px;" width="140" class="hwname">666</td>
							<td style="border-bottom: 0.5px solid #B6BBBF;border-right: 0.5px solid #B6BBBF;text-align: center;font-size: 14px;">44</td>
							<td style="border-bottom: 0.5px solid #B6BBBF;border-right: 0.5px solid #B6BBBF;text-align: center;font-size: 14px;" class="dw">kg</td>
						</tr> -->
					</table>
					<div id="cl-pages">
						<input type="button" value="首页"  />
						<input type="button" value="上一页" />
						<!--循环出页数-->
						<c:forEach begin="1" end="${zy1 }" var="i">
						<input type="button" value="${i }" />
						</c:forEach>
						<!---->
						<input type="button" value="下一页" />
						<input type="button" value="末页" />
					</div>
				</div>
			</div>
			<!--修改框-->
			<!--<div id="change2" class="tankuang1">
				<div class="neirong1">
				<form action="" method="post" >
					<table cellspacing="0" cellpadding="0">
						
					</table>
					<input type="button" value="确定"  class="sub" id="sub2"/>
					<input type="button" value="放弃"  class="res" id="res2"/>
				</form>
				</div>
			</div>-->
			<!--删除框-->
			<div id="change3">
				<div class="del">
				<p>是否确认删除！！</p>
				<a href="#"><input type="button" value="确定"  class="sub" /></a>
				<input type="button" value="放弃"  class="res" id="res3"/>
				</div>
			</div>
			
		</div>
	</body>
	<script type="text/javascript" src="js/sjl/outck.js" ></script>
	<script type="text/javascript">
	$("#rbody3 #pages").css("margin-top","10px");
	$("#rbody3 #pages input").css({"padding-left":"5px","padding-right":"5px"});
		if("${zy }"!=0){
			$("#rbody3 #pages input").eq("${page+1}").css({"background":"#00BC9B","color":"#ffffff"});
			$("#rbody3 #pages input").eq("${page+1}").attr("disabled","disabled");
			}
		$("#rbody3 #pages input").mouseenter(function(){
				$(this).css({"background":"#00BC9B","color":"white"});
			}).mouseleave(function(){
				if($(this).index()!="${page+1}")
				$(this).css({"background":"white","color":"#000000"});
			});
		
		if("${page}"==1){
		/* alert(1); */
			$("#rbody3 #pages input").eq(0).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq(0).attr("disabled","disabled");
			$("#rbody3 #pages input").eq(1).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq(1).attr("disabled","disabled");
		}else{
			$("#rbody3 #pages input").eq(0).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq(0).removeAttr("disabled");
			$("#rbody3 #pages input").eq(1).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq(1).removeAttr("disabled");
		}
		if("${page}"=="${zy }"){
			$("#rbody3 #pages input").eq("${zy+2}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#rbody3 #pages input").eq("${zy+3}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq("${zy+3}").attr("disabled","disabled");
		}else{
			$("#rbody3 #pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq("${zy+2}").removeAttr("disabled");
			$("#rbody3 #pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq("${zy+3}").removeAttr("disabled");
		}
		if("${zy }"==0){
			$("#rbody3 #pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#rbody3 #pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq("${zy+3}").attr("disabled","disabled");
		}
		$("#rbody3 #pages input").click(function(){
		
			var page;
				if($(this).val()=="首页"){
					page=1;
				}else if($(this).val()=="末页"){
					page="${zy}";
				}else if($(this).val()=="上一页"){
					page="${page-1}";
				}else if($(this).val()=="下一页"){
					page="${page+1}";
				}else{
					page=$(this).val();
				}
			/* 	alert(page) */
		$.ajax({
			url:"outCangku/addCangkucun.do",
	  		dataType:"html",
	  		data:{
	  			"id":id,
	  			"cangkuid":cangkuid,
	  			"outtime":outtime,
	  			"doman":doman,
	  			"info":info,
	  			"page":page
	  		},
	  		success:function(result){
	  			$("#rbody3 #out-zhut").html(result);
			}
		});
	});
	
	
	
	$("#rbody3 #cl-pages").css("margin-top","10px");
	$("#rbody3 #cl-pages input").css({"padding-left":"5px","padding-right":"5px"});
		if("${zy1 }"!=0){
			$("#rbody3 #cl-pages input").eq("${page1+1}").css({"background":"#00BC9B","color":"#ffffff"});
			$("#rbody3 #cl-pages input").eq("${page1+1}").attr("disabled","disabled");
			}
		$("#rbody3 #cl-pages input").mouseenter(function(){
				$(this).css({"background":"#00BC9B","color":"white"});
			}).mouseleave(function(){
				if($(this).index()!="${page1+1}")
				$(this).css({"background":"white","color":"#000000"});
			});
		
		if("${page1}"==1){
		/* alert(1); */
			$("#rbody3 #cl-pages input").eq(0).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody3 #cl-pages input").eq(0).attr("disabled","disabled");
			$("#rbody3 #cl-pages input").eq(1).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody3 #cl-pages input").eq(1).attr("disabled","disabled");
		}else{
			$("#rbody3 #cl-pages input").eq(0).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #cl-pages input").eq(0).removeAttr("disabled");
			$("#rbody3 #cl-pages input").eq(1).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #cl-pages input").eq(1).removeAttr("disabled");
		}
		if("${page1}"=="${zy1 }"){
			$("#rbody3 #cl-pages input").eq("${zy1+2}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody3 #cl-pages input").eq("${zy1+2}").attr("disabled","disabled");
			$("#rbody3 #cl-pages input").eq("${zy1+3}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody3 #cl-pages input").eq("${zy1+3}").attr("disabled","disabled");
		}else{
			$("#rbody3 #cl-pages input").eq("${zy1+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #cl-pages input").eq("${zy1+2}").removeAttr("disabled");
			$("#rbody3 #cl-pages input").eq("${zy1+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #cl-pages input").eq("${zy1+3}").removeAttr("disabled");
		}
		if("${zy1 }"==0){
			$("#rbody3 #cl-pages input").eq("${zy1+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #cl-pages input").eq("${zy1+2}").attr("disabled","disabled");
			$("#rbody3 #cl-pages input").eq("${zy1+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #cl-pages input").eq("${zy1+3}").attr("disabled","disabled");
		}
		$("#rbody3 #cl-pages input").click(function(){
		
			var page;
				if($(this).val()=="首页"){
					page=1;
				}else if($(this).val()=="末页"){
					page="${zy1}";
				}else if($(this).val()=="上一页"){
					page="${page1-1}";
				}else if($(this).val()=="下一页"){
					page="${page1+1}";
				}else{
					page=$(this).val();
				}
			/* 	alert(page) */
		$.ajax({
			url:"outCangku/cailiaoByType.do",
	  		dataType:"html",
	  		data:{"ckid":ckid,
	  			  "tt":tt,
	  			  "text":text,
	  			  "page":page
	  			},
	  		success:function(result){
	  			$("#rbody3 #chtable1").html(result);
			}
		});
	});
	
	/*  $("#rbody3 #out-qr").click(function(){
	$("#rbody3 #out-shuangji").css("display","none");
	});
   */
  	$("#rbody3 .ddd tr").dblclick(function(){
	/* alert($(this).find("td").eq(0).text())
	$(this).find("td").eq(0).text(); */
		/* 	alert(page) */
		$("#rbody3 #out-shuangji").css("display","block");
		$.ajax({
			url:"outCangku/tankuang.do",
	  		dataType:"html",
	  		data:{
	  		"id":$(this).find("td").eq(0).text()
	  		},
	  		success:function(result){
	  			$("#rbody3 #out-shuangji").html(result);
			}
		});
	 });
	
	</script>
</html>
