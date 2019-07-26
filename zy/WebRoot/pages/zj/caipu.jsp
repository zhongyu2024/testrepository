<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>菜谱</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" href="css/zj/cben.css" />
		<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

  </head>
  
	<body style="font-family: '微软雅黑';">
		<div id="caixi">
		   <div>菜系如下：</div>
		    <table style="font-size: 13px;" id="">
		        <c:forEach items="${cxAll}" var="caipuall">
		    	<tr class="cxx">
		    		<td class="caixi1" style="cursor:pointer;width:100px;text-align:center;">${caipuall.name}</td>
		    	</tr>
		    	</c:forEach> 
		    </table>
		
		 
		</div>
		<div id="caiminbiao">
			<div style="background-color:#135A92;font-size:14px;color:#B6BBC3;">菜品列表</div>
			<table border="0px" cellspacing="0px" cellpadding="0px" cellspacing="0px" style="font-size: 13px;" id="caudabajax">
				<tr>
					<td style="background-color: #354148;"></td>
					<td style="width: 180px;color: #B6BBC3;background-color: #354148;"align="center">菜名</td>
					<td style="width: 130px;color: #B6BBC3;background-color: #354148;"align="center">编号</td>
					<td style="width: 130px;color: #B6BBC3;background-color: #354148;"align="center">单价</td>
					<td style="width: 130px;color: #B6BBC3;background-color: #354148;"align="center">状态</td>
				</tr>
				<c:forEach items="${cdAll}" var="caidangall">
				<tr class="caipin" style="color: black;border: 0.5px solid gainsboro;background-color: white;cursor:pointer;">
					<td class="fuhao" style="border: 0.5px solid gainsboro;" align="center"><input class="fh" type="button" value=">" style="width:20px;height: 20px; display:none;" > 
					</td>
					<td class="bmdu" style="width: 600px;height:25px; border: 0.5px solid gainsboro;" align="center">${caidangall.name}</td>
					<td class="mzdu" style="width: 100px;height:25px; border: 0.5px solid gainsboro;"align="center">${caidangall.id}</td>
					<td class="glxdu" style="width: 80px;height:25px; border: 0.5px solid gainsboro;"align="center">${caidangall.price}</td>
					<td class="jindu" style="width: 0px;height:25px; border: 0.5px solid gainsboro;"align="center">${caidangall.state}</td>
				</tr>
				 </c:forEach> 
			</table>

		</div>

		<div id="sbody" style="font-size: 14px;">
			<div id="kuang" style="height:80px;width:80px;">
				<div id="zsg">
					<div id="ck" style="float: left;height: 45px;width: 100px;margin-top: 10px;margin-left: 10px;background-color:white;">
						<div class="caozuo1" style="margin-top: 4px; margin-left: 4px; float: left; width: 100px; height: 35px;background-size: 35px; display: block;"><img src="images/zj/add.jpg" width="35px" height="35px" align="center" />&nbsp;添加</div>
					</div>
					<div id="ck3" style="float: left;height: 45px;width: 100px;margin-top: 10px;margin-left: 10px;background-color:white;">
						<div class="caozuo3" style="margin-top: 4px; margin-left: 4px; float: left; width: 100px; height: 35px;background-size: 35px; display: block;"><img src="images/zj/late.jpg" width="35px" height="35px" align="center" />&nbsp;修改</div>
					</div>
					<div id="ck2" style="float: left;height: 45px;width: 100px;margin-top: 10px;margin-left: 10px;background-color:white;">
						<div class="caozuo2" style="margin-top: 4px; margin-left: 4px; float: left; width: 100px; height: 35px;background-size: 35px; display: block;"><img src="images/zj/dele.jpg" width="35px" height="35px" align="center" />&nbsp;删除</div>
					</div>
				</div>
				<div id="rsg">
					<form action="#" method="post">
						<div id="rsearch">
							<select style="width: 65px;" id="aj1">
								<option value="编号">编号</option>
								<option value="名称">名称</option>
							</select>
							<input class="sousuocaipu" style="border-radius: 8px; background-color:#EBE9ED;" type="text" name="" placeholder="搜索" />
							<input class="chaxunciapu" type="button" value="查询" />
						</div>
					</form>
				</div>
			</div>

			<div id="search">
				<table border="0px" cellspacing="0px" cellpadding="0px" cellspacing="0px" id="ajaxcpinn">
					<tr id="list">
						<td style="width: 80px;color: #B6BBC3;background-color: #354148;">&nbsp;&nbsp;&nbsp;&nbsp;编号</td>
						<td style="width: 130px;color: #B6BBC3;background-color: #354148;">&nbsp;&nbsp;&nbsp;&nbsp;材料类型</td>
						<td style="width: 80px;color: #B6BBC3;background-color: #354148;">材料名称</td>
						<td style="width: 100px;color: #B6BBC3;background-color: #354148;">数量</td>
					</tr>
					
					<%-- <c:forEach items="${cdetail}" var="cscd">
					<tr class="guoshui" style="background-color:white; color: black;border: 0.5px solid gainsboro;">
						<td class="bm" style="width: 80px; border: 0.5px solid gainsboro;" align="center">${cscd.id}</td>
						<td class="mz" style="width: 130px; border: 0.5px solid gainsboro;">${cscd.j}</td>
						<td class="glx" style="width: 80px;  border: 0.5px solid gainsboro;">${cscd.n}</td>
						<td class="jin" style="width: 100px;  border: 0.5px solid gainsboro;">${cscd.num}</td>

					</tr>
					</c:forEach> --%>
				</table>
			</div>
			<!-- //添加 -->
			<div id="hidden" style="position: absolute;top:250px; border: 0px solid black; width: 510px;  border-radius: 5px;margin-left: -140px;display: none;z-index:3;">
				<form id="tijiao" action="#" method="post">
				<table style="border:1px solid #B5B4B8; background-color: #EBE9ED;">
					<tr>
						<td colspan="4" align="center" style="background-color: #D3D3D3;">成本卡信息</td>
					</tr>
					
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">编号</td>
							<td><input type="text" name="" placeholder="自动编号" disabled="disabled"></td>
							<td style="background-color: #D3D3D3; width: 40px;" align="center">名称</td>
							<td>
							<div id="zd_0" style="float:left;width:50px;"><input type="text" name="" class="clearname" style="width:143px;"></div>
							<div id="zd_1y0" style="float:left;margin-left:74px;"><input type="button" value="^" style="width:20px; heigth:20px;"/></div>
								<div id="mcad0" style="border: 1px solid #B5B4B8; width: 140px;position:absolute;top:50px;background: white; display:none;">
									<table cellpadding="0" cellspacing="0" border="0.5">
										<tr>
											<td colspan="2" style="padding-left:26px;background-color: #EBE9ED;border: 0.5px solid gainsboro;" align="center">名称</td>
										</tr> 
										   <c:forEach items="${clsecond}" var="yccse_1">
											<tr class="ckcad0" style="background-color:white;">
												<td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
												<td class="nameycliak0" width="140px" align="center" style="border: 0.5px solid gainsboro;">
												 <div class="clncl">${yccse_1.cln}</div>
												<input class="cdidd" type="hidden" value="${yccse_1.id}">
												<input class="dwnamewcd" type="hidden" value="${yccse_1.dwnamew}">
												<input class="namecd" type="hidden" value="${yccse_1.name}">
												</td> 
											</tr>
											</c:forEach>  
									</table>
								</div> 
							</td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">菜名编号</td>
							<td><input type="text" name="" placeholder="自动获取编号" class="clearcainame"></td>
							<td style="background-color: #D3D3D3; width: 40px;" align="center">材料编号</td>
							<td><input type="text" name="" placeholder="自动获取编号" class="clearcaname"></td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">类型</td>
							<td>
								 <input class="yuanleixin" type="text" name="" placeholder="自动获取类型" style="width:143px;"> 
							</td>

							<td style="background-color: #D3D3D3;width: 100px;" align="center">单位</td>
							<td>
								 <input class="danweilx" type="text" name="" placeholder="自动获取单位"  style="width:143px;"> 
							</td>

						</tr>
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">数量</td>
							<td colspan="3"><input type="text" name="" class="clearcount"></td> 
						</tr>
						<tr>
							<td style="background-color: #D3D3D3;width: 100px;" align="center">备注</td>
							<td colspan="3"><input type="text" style="width: 350px;height: 60px;" class="clearbeizhu"></td>
						</tr>
				</table>
				<div class="colo" style="background-color: #EBE9ED;">
					<div id="b1" style="float: left;background-color:#EBE9ED; "><input type="button" value="保存" style="width:100px;height:40px;margin-left: 296px;"></div>
					<div id="b2" style="float: left;background-color:#EBE9ED; "><input type="reset" value="放弃" style="width:100px;height:40px;margin-left: 0px;"></div>
					</form>
				</div>

			</div>
			<div id="addsty" style="position: absolute;top:500px;border: 1px solid #B5B4B8; left:300px; width: 260px;display: none;">
				<table style="background-color: #EBE9ED;">
					<tr>
						<td colspan="2" width="300px" align="center" style="background-color:#2D74AC;">添加信息</td>
					</tr>
					<form>
						<tr>
							<td style="background-color: #D3D3D3;">编号</td>
							<td width="100px"><input type="text" name="" placeholder="自动编号" disabled="disabled"></td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3;">名称</td>
							<td width="100px"><input  type="text" name="" class="lx" id="csst"></td>
						</tr>
						<tr height="70px">
							<td class="sure0"><input type="button" value="确定" style="width: 100px; height: 30px;"></td>
							<td class="give0"><input type="reset" value="放弃" style="width: 100px; height: 30px;margin-left: 30px;"></td>
						</tr>
					</form>
				</table>
			</div>

			<div id="addsty1" style="position: absolute;top:500px;border: 1px solid #B5B4B8; left:560px; width: 260px;display:none;">
				<table style="background-color: #EBE9ED;">
					<tr>
						<td colspan="2" width="300px" align="center" style="background-color:#2D74AC;">添加信息</td>
					</tr>
					<form>
						<tr>
							<td style="background-color: #D3D3D3;">编号</td>
							<td class="nun" width="100px"><input type="text" name="" placeholder="自动编号" disabled="disabled"></td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3;">单位</td>
							<td class="danwei" width="100px"><input type="text" name="name" class="dw"></td>
						</tr>
						<tr height="70px">
							<td><input class="sure1" type="button" value="确定" style="width: 100px; height: 30px;"></td>
							<td><input class="give1" type="reset" value="放弃" style="width: 100px; height: 30px;margin-left: 30px;"></td>
						</tr>
					</form>
				</table>
			</div>
			<!-- //修改 -->
			<div id="hiddenn" style="position: absolute;top:250px; border: 0px solid white; width: 500px;  border-radius: 5px;margin-left: -180px;display: none;z-index:3;">
				<form id="tijiao1" action="#" method="post">
				<table style="border:1px solid #B5B4B8; background-color: #EBE9ED;">
					<tr>
						<td colspan="4" align="center" style="background-color: #D3D3D3;">成本卡信息</td>
					</tr>
					
						<tr> 
							<td style="background-color: #D3D3D3; width: 100px;" align="center">编号</td>
							<td><input type="text" name="" placeholder="自动编号" disabled="disabled" id="biabkkkk"></td>
							<td style="background-color: #D3D3D3; width: 40px;" align="center">名称</td>
							<td> 
							<div id="zd_er" style="float:left;width:50px;"><input type="text" name="" class="clearname" style="width:143px;"></div>
							<div id="zd_1yer" style="float:left;margin-left:74px;"><input type="button" value="^" style="width:20px; heigth:20px;"/></div>
								<div id="mcader" style="border: 1px solid #B5B4B8; width: 140px;position:absolute;top:50px;background: white; display:none;">
									<table cellpadding="0" cellspacing="0" border="0.5">
										<tr>
											<td colspan="2" style="padding-left:26px;background-color: #EBE9ED;border: 0.5px solid gainsboro;" align="center">名称</td>
										</tr> 
										   <c:forEach items="${clsecond}" var="yccse_1">
											<tr class="ckcaer" style="background-color:white;">
												<td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
												<td class="nameycliaker" width="140px" align="center" style="border: 0.5px solid gainsboro;">
												 <div class="clncler">${yccse_1.cln}</div>
												<input class="cdidderee" type="hidden" value="${yccse_1.id}">
												<input class="dwnamewcder" type="hidden" value="${yccse_1.dwnamew}">
												<input class="namecder" type="hidden" value="${yccse_1.name}"> 
												<input class="coint" type="hidden" value="${yccse_1.coint}">
												<input class="info" type="hidden" value="${yccse_1.inftion}">
												</td> 
											</tr>
											</c:forEach>  
									</table>
								</div> 
							</td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">菜名编号</td>
							<td><input type="text" name="" placeholder="自动获取编号" class="clearcaimin1"></td>
							<td style="background-color: #D3D3D3; width: 40px;" align="center">材料编号</td>
							<td><input type="text" name="" placeholder="自动获取编号" class="clearcailiao1"></td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">类型</td>
							<td>
								 <input class="yuanleixin1" type="text" name="" style="width:143px;">
								<!-- <div id="chlicff" style="float:left;margin-left:74px;"><input type="button" value="^" style="width:20px; heigth:20px;"/></div>
								<div id="foodstyyl" style="border: 1px solid #B5B4B8; width: 260px;position:absolute;top:80px;background: white; display:none;">
									<table cellpadding="0" cellspacing="0" border="0.5">
										<tr>
											<td colspan="2" style="padding-left:26px;background-color: #EBE9ED;border: 0.5px solid gainsboro;" align="center">名称</td>
											<td width="100px" align="center" style="background-color: #EBE9ED;border: 0.5px solid gainsboro;">编号</td>
										</tr>
										 
											<tr class="ck" style="background-color:white;">
												<td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
												<td class="cname" width="140px" align="center" style="border: 0.5px solid gainsboro;">蔬菜</td>
												<td class="cnumber" width="100px" align="center" style="border: 0.5px solid gainsboro;">001</td>
											</tr>
											<tr class="ck">
												<td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
												<td class="cname" width="140px" align="center" style="border: 0.5px solid gainsboro;">蔬菜</td>
												<td class="cnumber" width="100px" align="center" style="border: 0.5px solid gainsboro;">001</td>
											</tr>
										 
										 

									</table>
								</div> -->
							</td>

							<td style="background-color: #D3D3D3;width: 100px;" align="center">单位</td>
							<td>
								 <input class="danweilx1" type="text" name="" style="width:143px;">
								<!-- <div id="cchlicf1" style="float:left;margin-left:74px;"><input type="button" value="^" style="width:20px; heigth:20px;"/></div>
								<div id="cfoodstyl1" style="border: 1px solid #B5B4B8; width: 260px;position:absolute;top:80px;left:350px; background: white; display:none;">
									<table cellpadding="0" cellspacing="0" border="0.5">
										<tr>
											<td colspan="2" style="padding-left:26px;background-color: #EBE9ED;border: 0.5px solid gainsboro;" align="center">单位</td>
											<td width="100px" align="center" style="background-color: #EBE9ED;border: 0.5px solid gainsboro;">编号</td>
										</tr>
										 
											<tr class="ck1">
												<td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
												<td class="cname1" width="140px" align="center" style="border: 0.5px solid gainsboro;">kg</td>
												<td class="cnumber1" width="100px" align="center" style="border: 0.5px solid gainsboro;">001</td>
											</tr>
											<tr class="ck1">
												<td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
												<td class="cname1" width="140px" align="center" style="border: 0.5px solid gainsboro;">g</td>
												<td class="cnumber1" width="100px" align="center" style="border: 0.5px solid gainsboro;">001</td>
											</tr>
										 
										 
									</table>
								</div> -->

							</td>

						</tr>
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">数量</td>
							<td colspan="3"><input type="text" name="" class="clearcount1" ></td> 
						</tr>
						<tr>
							<td style="background-color: #D3D3D3;width: 100px;" align="center">备注</td>
							<td colspan="3"><input type="text" style="width: 350px;height: 60px;" class="clearbeizhu1"></td>
						</tr>
				</table>
				<div class="colo" style="background-color: #EBE9ED;">
					<div id="bb1" style="float: left;background-color:#EBE9ED; "><input type="button" value="保存" style="width:100px;height:40px;margin-left: 296px;"></div>
					<div id="bb2" style="float: left;background-color:#EBE9ED; "><input type="button" value="放弃" style="width:100px;height:40px;margin-left: 0px;"></div>
					</form>
				</div>

			</div>
			 

			 

			<!-- 删除 -->
			<div id="shanchu" style="position:absolute;top:300px;border: 1px solid #B5B4B8; left:750px; width:220px;height:100px;display:none;background-color: #135A92;z-index:4;">
				<div style="color: white;background-color:#135A92;font-size: 13px;"><strong>提示</strong></div>
				<table style="background-color:#EBE9ED;margin-left: 4px;">
					<tr>
						<td colspan="2" style="font-size: 15px;" align="center">确定选中的行？</td>
					</tr>
					<tr>
						<td style="width: 100px;"><input type="button" value="是（Y）" style="width: 90px;height: 18px;border: 1px;margin-top: 20px;" class="Y"></td>
						<td style="width: 100px;"><input type="button" value="否（N）" style="width: 90px;height: 18px;border: 1px;margin-top: 20px;" class="N"></td>
					</tr>
				</table>
			</div>

		</div>
		<div id="hidden10" style="display:none"></div>
	</body>
	<script>
	   var value=$("#sbody .guoshui :eq(0)").find(".bm").text();
		var value1=$("#sbody .guoshui :eq(0)").find(".mz").text();
		var value2=$("#sbody .guoshui :eq(0)").find(".glx").text();
		var value3=$("#sbody .guoshui :eq(0)").find(".jin").text();
		var value4;
		var value5;
		var value6;
		var caixi_1=$(".cxx :eq(0)").find(".caixi1").text();
		//默认选中第一菜系
		 var ccaix=$(".cxx :eq(0)").find(".caixi1");
		 $(".cxx :eq(0)").find(".caixi1").css("background-color", "#3E9DE8"); 
		//菜品选择
		$(".cxx").click(function() {
			$(this).find(".caixi1").css("background-color", "#3E9DE8");
			$(this).siblings().find(".caixi1").css("background-color", "white");
			caixi_1=$(this).find(".caixi1").text(); 
			//alert(caixi_1);
			//清空
			 $.ajax({
  			url:"zcaipu//kongbai.do",
  			dataType:"html",
  			success:function(result){
  				$("#ajaxcpinn").html(result);
  			}, 
  		});  
			 $.ajax({
  			url:"zcaipu/findfoodcd.do",
  			dataType:"html",
  			data:{"cxname":caixi_1,"no":1},
  			success:function(result){
  				$("#caudabajax").html(result);
  			},error:function(result){
  		     alert("未查到该信息");
  		 }
  		}); 
			
		})
		 
		
		 
		
		//通过菜系选择菜品   caiminbiao    bmdu mzdu glxdu jindu
		var cp_1=$(".caipin :eq(0)").find(".bmdu").text();
		var cp_2=$(".caipin :eq(0)").find(".mzdu").text();
		var cp_3=$(".caipin :eq(0)").find(".glxdu").text();
		var cp_4=$(".caipin :eq(0)").find(".jindu").text();
		 $(".caipin :eq(0)").find(".fh").css("display","block");
		 $(".caipin:eq(0)").css("background-color", "#135A92");
		$(".caipin").click(function() {
			$(this).css("background-color", "#135A92");
			$(this).siblings().css("background-color", "white");
//			alert($(this).find(".bm").text()); 
            $(this).find(".fh").css("display", "block");
			$(this).siblings().find(".fh").css("display","none");
			cp_1=$(this).find(".bmdu").text();
			cp_2=$(this).find(".mzdu").text();
			cp_3=$(this).find(".glxdu").text();
			cp_4=$(this).find(".jindu").text();
			//alert(cp_3);
			//显示对应小菜详细信息
			  if(cp_4==0)
			 {
			     $.ajax({
  			url:"zcaipu/findallycl.do",
  			dataType:"html",
  			data:{"yclname":cp_1,"no":1},
  			success:function(result){
  				$("#ajaxcpinn").html(result);
  			},error:function(result){
  		     alert("未查到该信息");
  		 }
  		});
			 
			 alert("尚未配菜");
			 $(this).css("disabled","disabled");
			 }
			 else{
			 $.ajax({
  			url:"zcaipu/findallycl.do",
  			dataType:"html",
  			data:{"yclname":cp_1,"no":1},
  			success:function(result){
  				$("#ajaxcpinn").html(result);
  			},error:function(result){
  		     alert("未查到该信息");
  		 }
  		}); 
			 }
			 
		}) 
 
		 
		//按要求查询数据  sousuocaipu chaxunciapu
		$(".chaxunciapu").click(function() {
		   //alert(value);
		   //alert(cp_1);
		  //alert($("#aj1").val());
		  // alert(1);
		  //alert($(".sousuocaipu").val());
		  if($(".sousuocaipu").val().trim().length==0)
		  {
		   alert("未输入查询值")
		  }
		  else{
       //alert(t);
           $.ajax({
  			url:"zcaipu/chaxuncp.do",
  			dataType:"html",
  			data:{"caipty":$("#aj1").val(),"zhi":$(".sousuocaipu").val(),"caiming":cp_1,"no":1},
  			success:function(result){
  				$("#ajaxcpinn").html(result);
  			},error:function(result){
  		     alert("未查到该信息");
  		 }
  		}); 
		  }
		}) 
		
       
		 
		$("#sbody .caozuo1").click(function() {
			$("#sbody #hidden").css("display", "block");
			 $("#hidden10").css("display","block"); 
		})
		//选择原材料
		$("#sbody .guoshui").click(function() {
		 
			$(this).css("background-color", "#135A92");
			$(this).siblings().css("background-color", "white");
			value = $(this).find(".bm").text();
			 value1 = $(this).find(".mz").text();
		     value2 = $(this).find(".glx").text();
			 value3 = $(this).find(".jin").text();
			    
		})
		//修改原材料
		//zd_er  zd_1yer mcader ckcaer nameycliaker clncler cdidderee dwnamewcder namecder coint info
		 
		$("#sbody .ckcaer").click(function() {
			$(this).css("background-color", "#BCD68D");
			$(this).siblings().css("background-color", "white");
			$("#sbody #mcader").css("display", "none");
			$("#sbody .clearname").val($(this).find(".clncler").text());
			$("#sbody .clearcaimin1").val(cp_2);
			//alert($(this).find(".clncl").text());
			//菜名编号cp_2 材料编号 cdidd  单位dwnamewcd 类型namecd
			//alert($(this).find(".cdidd").attr("value"));
			$("#sbody .clearcailiao1").val($(this).find(".cdidderee").attr("value"));
			$("#sbody .yuanleixin1").val($(this).find(".namecder").attr("value"));
			$("#sbody .danweilx1").val($(this).find(".dwnamewcder").attr("value"));
			 $("#sbody .clearcount1").val($(this).find(".coint").attr("value"));
			 $("#sbody .clearbeizhu1").val($(this).find(".info").attr("value"));
		 
		}) 
		
		//clearname clearcaimin1 clearcailiao1 yuanleixin1 danweilx1 clearcount1 clearbeizhu1
		$("#sbody .caozuo3").click(function(){
		   
		  if(value){ 
		  $("#sbody #biabkkkk").val(value);
		  $("#sbody .clearcaimin1").val(cp_2);
		  $("#sbody .clearcailiao1").val(value4);
		   $("#sbody .clearname").val(value2);
		   $("#sbody .yuanleixin1").val(value1);
	       $("#sbody .danweilx1").val(value5);
	       $("#sbody .clearcount1").val(value3);
	       $("#sbody .clearbeizhu1").val(value6);
	      
			$("#sbody #hiddenn").css("display", "block");
			 $("#hidden10").css("display","block"); 
		  }
		  else{
		  alert("未选择食材");
		  }    
		})
        
		$("#sbody #chlicff").click(function() {
			$("#sbody #foodstyyl").css("display", "block");
		})
		$("#sbody #cchlicf1").click(function() {
			$("#sbody #cfoodstyl1").css("display", "block");
		})
         //zd_1  zd_1yc mcad clearname1 ckcad nameycliak
         //选材料名
         $("#sbody .ckcad").click(function() {
			$(this).css("background-color", "#BCD68D");
			$(this).siblings().css("background-color", "white");
			$("#sbody #mcad").css("display", "none");
			//alert(1);
			$("#sbody .clearname1").val($(this).find(".nameycliak").text());
			//alert($(this).find(".cname").text());
		}) 
         
          
         
		//获取类型
		$("#sbody .ck").click(function() {
			$(this).css("background-color", "#BCD68D");
			$(this).siblings().css("background-color", "white");
			$("#sbody #foodstyyl").css("display", "none");
			$("#sbody .yuanleixin1").val($(this).find(".cname").text());
			//alert($(this).find(".cname").text());
		})
		//新增类型
		$("#sbody .addto").click(function() {
			$("#sbody #aaddsty").css("display", "block");
			//alert($(this).find(".cname").text());
		})
		//确认添加类型
		$("#sbody .sure10").click(function() {
			//alert($(".lx").val()); 
			$("#sbody #aaddsty").css("display", "none");
			$("#sbody #foodstyyl").css("display", "none");

		})
		//放弃添加
		$("#sbody .give10").click(function() {
			$("#sbody #aaddsty").css("display", "none");
			$("#sbody #foodstyyl").css("display", "none");

		})
         
		//获取单位
		$("#sbody .ck1").click(function() {
			$(this).css("background-color", "#BCD68D");
			$(this).siblings().css("background-color", "white");
			$("#sbody #cfoodstyl1").css("display", "none");
			$("#sbody .danweilx1").val($(this).find(".cname1").text());
			//alert($(this).find(".cname1").text());
		})
		//新增单位
		$("#sbody .addtoo").click(function() {
			$("#sbody #aaddsty1").css("display", "block");
			//alert($(this).find(".cname1").text());
		})
		//确认添加单位
		$("#sbody .sure11").click(function() {
			//alert($(".dw").val());
			$("#sbody #aaddsty1").css("display", "none");
			$("#sbody #cfoodstyl1").css("display", "none");
		})
		//放弃添加
		$("#sbody .give11").click(function() {
			//alert($(".dw").val()); 
			$("#sbody #aaddsty1").css("display", "none");
			$("#sbody #cfoodstyl1").css("display", "none");
		})
		//保存添加数据
		//clearname clearcaimin1 clearcailiao1 yuanleixin1 danweilx1 clearcount1 clearbeizhu1
		var twoclear=1;
		 $("#sbody #bb1").click(function() {
		 if($("#sbody .clearname").val().length==0) {
				//空
				alert( "名称不能为空");
				twoclear = 0;
			   }
			  else if($("#sbody .yuanleixin1").val().trim().length==0) {
				alert("类型不能为空");
				twoclear = 0;
			} 
		
		  else if($("#sbody .danweilx1").val().trim().length==0)
		  {
		    alert("未选择单位");
				twoclear = 0;
		  }
		  else if($("#sbody .clearcount1").val().trim().length==0)
		  {
		    alert("未选择获取数量");
				twoclear = 0;
		  } 
		  else{
		   /* alert($("#sbody .clearname").val());
		   alert($("#sbody .clearcaimin1").val());
		   alert($("#sbody .clearcailiao1").val());
		   
		   alert($("#sbody .clearcount1").val());
		    
		   alert($("#sbody .yuanleixin1").val());
		   alert($("#sbody .danweilx1").val());
		   alert(cp_1); */
		   //alert(value);
		      $.ajax({
  			       url:"zcaipu/xiugaicaipuyc.do",
  			       dataType:"html",
  			       data:{"cdbiem":cp_1,"id":value,"caibianhao":$("#sbody .clearcaimin1").val(),"clbianhao":$("#sbody .clearcailiao1").val(),"shuliang":$("#sbody .clearcount1").val(),"no":1},
  			        success:function(result){
  				     $("#ajaxcpinn").html(result);
  				    alert("修改成功");
  			        },error:function(result){
  				    alert("修改失败");
  			        }
  		        });    
			 //alert($(this).find(".cname1").text());
			 //$("#sbody #tijiao1").submit(); 
			$("#sbody #hiddenn").css("display", "none");
			//alert($(this).find(".cname1").text());
			$("#sbody .clearname1").val("");
			//alert($(".clearname").text("").length);
			$("#sbody .clearbeizhu1").val("");
			$("#sbody .clearcaimin1").val("");
			$("#sbody .clearcount1").val("");
			$("#sbody .clearcailiao1").val("");
			$("#sbody .yuanleixin1").val("");
			$("#sbody .danweilx1").val("");
			$("#hidden10").css("display","none");
		  } 
		 })  
		  
		//放弃添加数据
		$("#sbody #bb2").click(function() {
			$("#sbody #hiddenn").css("display", "none");
			//alert($(this).find(".cname1").text());
			$("#sbody .clearname1").val("");
			//alert($(".clearname").text("").length);
			$("#sbody .clearbeizhu1").val("");
			$("#sbody .clearcaimin1").val("");
			$("#sbody .clearcount1").val("");
			$("#sbody .clearcailiao1").val("");
			$("#sbody .yuanleixin1").val("");
			$("#sbody .danweilx1").val("");
			$("#hidden10").css("display","none");
		})
		//删除数据
		$("#sbody .caozuo2").click(function() {
          if(value)
            {
            
			$("#sbody #shanchu").css("display", "block");
			 $("#hidden10").css("display","block"); 
            }
            else{
            alert("当前并未选中值！");
            } 
		})
		//删除数据成功
		$("#sbody .Y").click(function() {
		//alert(value2);
		//alert(cp_2); 
			$.ajax({
  			url:"zcaipu/delecaipuyuancl.do",
  			dataType:"html",
  			data:{"ccpuid":value,"cmdsa":cp_1,"no":1},
  			success:function(result){
  				$("#ajaxcpinn").html(result);
  			},error:function(result){
  		     alert("未查到该信息");
  		 }
  		}); 
  		$.ajax({
  			url:"zcaipu/genxinzhaugntai.do",
  			dataType:"html",
  			data:{"cmdsa":cp_1,"caixi":caixi_1,"no":1},
  			success:function(result){
  				$("#caudabajax").html(result);
  			},error:function(result){
  		     alert("未查到该信息");
  		 }
  		});   
			$("#sbody #shanchu").css("display", "none");
			$("#hidden10").css("display","none");
			 
			
		})
		//取消删除
		$("#sbody .N").click(function() {
			$("#sbody #shanchu").css("display", "none");
			$("#hidden10").css("display","none");

		})

		$("#sbody .caozuo1").mouseenter(function() {
			$("#sbody .caozuo1 img").attr("src", "images/zj/add1.jpg");
			$("#sbody #ck").css("background-color", "#C2C9CF");
			/*$("#ck").css("border","1px solid greenyellow");*/

		}).mouseleave(function() {
			$("#sbody .caozuo1 img").attr("src", "images/zj/add.jpg");
			$("#sbody #ck").css("background-color", "white");
			$("#sbody #ck").css("border", "white");
		})
		$("#sbody .caozuo2").mouseenter(function() {
			$("#sbody .caozuo2 img").attr("src", "images/zj/dele1.jpg");
			$("#sbody #ck2").css("background-color", "#C2C9CF");
			/*$("#ck2").css("border","1px solid greenyellow");*/

		}).mouseleave(function() {
			$("#sbody .caozuo2 img").attr("src", "images/zj/dele.jpg");
			$("#sbody #ck2").css("background-color", "white");
			$("#sbody #ck2").css("border", "white");
		})
		$("#sbody .caozuo3").mouseenter(function() {
			$("#sbody .caozuo3 img").attr("src", "images/zj/late1.jpg");

			$("#sbody #ck3").css("background-color", "#C2C9CF");
			/*$("#ck3").css("border","1px solid greenyellow");*/

		}).mouseleave(function() {
			$("#sbody .caozuo3 img").attr("src", "images/zj/late.jpg");
			$("#sbody #ck3").css("background-color", "white");
			$("#sbody #ck3").css("border", "white");
		})
		//选材料名zd_1y0  mcad0  
		$("#sbody #zd_1y0").click(function() {  
		 $.ajax({
  			url:"zcaipu/latelypuyuancll.do",
  			dataType:"html",
  			data:{"cmid":cp_2},
  			success:function(result){
  				$("#mcad0").html(result);
  			},error:function(result){
  		     alert("未查到该信息");
  		 }
  		});    
			$("#sbody #mcad0").css("display", "block");
			  
			
		})  
	   //zd_1yc mcad
		$("#sbody #zd_1yer").click(function() {
		$.ajax({
  			url:"zcaipu/latelypuyuancxll.do",
  			dataType:"html",
  			data:{"cmid":cp_2},
  			success:function(result){
  				$("#mcader").html(result);
  			},error:function(result){
  		     alert("未查到该信息");
  		 }
  		});   
  		
  		
  		
  		  
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		 
			$("#sbody #mcader").css("display", "block");
		})
	     //选材料名 
		//ckcad0  
		//clearname  zd_0  zd_1y0  mcad0 ckcad0 nameycliak0
		
		
		//放入数值clearname clearcainame clearcaname yuanleixin danweilx clearcount clearbeizhu
		$("#sbody .ckcad0").click(function() {
			$(this).css("background-color", "#BCD68D");
			$(this).siblings().css("background-color", "white");
			$("#sbody #mcad0").css("display", "none");
			$("#sbody .clearname").val($(this).find(".clncl").text());
			$("#sbody .clearcainame").val(cp_2);
			//alert($(this).find(".clncl").text());
			//菜名编号cp_2 材料编号 cdidd  单位dwnamewcd 类型namecd
			//alert($(this).find(".cdidd").attr("value"));
			$("#sbody .clearcaname").val($(this).find(".cdidd").attr("value"));
			$("#sbody .yuanleixin").val($(this).find(".namecd").attr("value"));
			$("#sbody .danweilx").val($(this).find(".dwnamewcd").attr("value"));
			 
			// alert($("#sbody .clearcaname").val()); 
		}) 
		
		 
		
		
		//选类型
		$("#sbody #chlicf").click(function() {
			$("#sbody #foodstyl").css("display", "block");
		})
		$("#sbody #chlicf1").click(function() {
			$("#sbody #foodstyl1").css("display", "block");
		})
		//获取添加类型
		$("#sbody .ck").click(function() {
			$(this).css("background-color", "#BCD68D");
			$(this).siblings().css("background-color", "white");
			$("#sbody #foodstyl").css("display", "none");
			$("#sbody .yuanleixin").val($(this).find(".cname").text());
			//alert($(this).find(".cname").text());
		})
		//新增类型
		$("#sbody .addt").click(function() {
			$("#sbody #addsty").css("display", "block");
			//alert($(this).find(".cname").text());
		})
		//确认添加类型
		$("#sbody .sure0").click(function() {
			 
			 
			 
			  
			 
			//$(this).parent("tr").prev("tr").find("#csst").val();
			//alert($(this).parent("tr").prev("tr").children("#csst").val());
		    $("#sbody .yuanleixin").val($("#csst").text());
		    /*$("#sbody #").val($(this).find(".cname").text());*/
			$("#sbody #addsty").css("display", "none");
			$("#sbody #foodstyl").css("display", "none");

		})
		//放弃添加
		$("#sbody .give0").click(function() {
			$("#sbody #addsty").css("display", "none");
			$("#sbody #foodstyl").css("display", "none");

		})

		//获取添加单位
		$("#sbody .ck1").click(function() {
			$(this).css("background-color", "#BCD68D");
			$(this).siblings().css("background-color", "white");
			$("#sbody #foodstyl1").css("display", "none");
			$("#sbody .danweilx").val($(this).find(".cname1").text());
			//alert($(this).find(".cname1").text());
		})
	 //添加//修改   类型 cname 单位cname1
	 //添加 类型 foodstyl 单位foodstyl11
	 //修改  类型 foodstyyl 单位cfoodstyl1
		//增加  添加  类型addsty   单位addsty1
		//增加  修改  类型aaddsty   单位aaddsty1
		
		
		
		//新增单位
		$("#sbody .addt1").click(function() {
			$("#sbody #addsty1").css("display", "block");
			//alert($(this).find(".cname1").text());
		})
		//确认添加单位
		$("#sbody .sure1").click(function() {
			//alert($(".dw").val());
			$("#sbody #addsty1").css("display", "none");
			$("#sbody #foodstyl1").css("display", "none");
		})
		//放弃添加
		$("#sbody .give1").click(function() {
			//alert($(".dw").val()); 
			$("#sbody #addsty1").css("display", "none");
			$("#sbody #foodstyl1").css("display", "none");
		})
		
		//保存添加数据
		var skong=1;
		$("#sbody #b1").click(function() {
		   //alert($("#ebody .clearname").val());
		//alert($(".context2").val());
		 if($("#sbody .clearname").val().length==0) {
				//空
				alert( "名称不能为空");
				skong = 0;
			   }
			  
		    else if($("#sbody .yuanleixin").val().trim().length==0) {
				alert("类型不能为空");
				skong = 0;
			} 
		
		  else if($("#sbody .danweilx").val().trim().length==0)
		  {
		    alert("未选择单位");
				skong = 0;
		  }
		  else if($("#sbody .clearcount").val().trim().length==0)
		  {
		    alert("未选择获取数量");
				skong = 0;
		  }
		  else{
		  //clearname clearcainame clearcaname yuanleixin danweilx clearcount clearbeizhu
		 
		   //alert($("#sbody .clearcainame").val());
		   //alert($("#sbody .clearcaname").val());
		   //alert($("#sbody .clearcount").val());
		   //alert($("#sbody .clearbeizhu").val());
		    
		    $.ajax({
  			       url:"zcaipu/nowcaipuyc.do",
  			       dataType:"html",
  			       data:{"cdbiem":cp_1,"caibianhao":$("#sbody .clearcainame").val(),"clbianhao":$("#sbody .clearcaname").val(),"shuliang":$("#sbody .clearcount").val(),"no":1},
  			        success:function(result){
  				     $("#ajaxcpinn").html(result);
  				    alert("添加成功");
  			        },error:function(result){
  				    alert("添加失败");
  			        }
  		        }); 
  		        $.ajax({
  			url:"zcaipu/genxinzhaugntai2.do",
  			dataType:"html",
  			data:{"cmdsa":cp_1,"caixi":caixi_1,"no":1},
  			success:function(result){
  				$("#caudabajax").html(result);
  			},error:function(result){
  		     alert("未查到该信息");
  		 }
  		});    
		    //alert($("#sbody .danweilx").val());
			//$("#sbody #hidden").css("display","none");
			 //alert($(this).find(".cname1").text());
			 //$("#sbody #tijiao").submit(); 
			$("#sbody #hidden").css("display", "none");
			$("#sbody .clearname").val("");
			//alert($(".clearname").text("").length);
			$("#sbody .clearbeizhu").val("");
			$("#sbody .clearcainame").val("");
			$("#sbody .clearcount").val("");
			$("#sbody .clearcaname").val("");
			$("#sbody .clearcaname").val("");
			$("#sbody .yuanleixin").val("");
			$("#sbody .danweilx").val("");
			$("#hidden10").css("display","none");
			}
		})
		//放弃添加数据
		$("#sbody #b2").click(function() {
	   //alert(cp_1);
			$("#sbody #hidden").css("display", "none");
			//alert($(this).find(".cname1").text());
			$("#sbody .clearname").val("");
			//alert($(".clearname").text("").length);
			$("#sbody .clearbeizhu").val("");
			$("#sbody .clearcainame").val("");
			$("#sbody .clearcount").val("");
			$("#sbody .clearcaname").val("");
			$("#sbody .clearcaname").val("");
			$("#sbody .yuanleixin").val("");
			$("#sbody .danweilx").val("");
			$("#hidden10").css("display","none");
		})
	</script>

</html>
    