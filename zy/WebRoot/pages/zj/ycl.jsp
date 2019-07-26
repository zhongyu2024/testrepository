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
    
    <title>原材料设置</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" href="css/zj/ycl.css" />
		<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

  </head>
  
  <body style="font-family: '微软雅黑';">
		<div id="ebody">

			<div id="kuang">
				<div id="zsg">
                      <div id="hidden2"></div>
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
					<form>
						<div id="rsearch">
							<select style="width: 65px;" id="aj">
								<option value="编号">编号</option>
								<option value="名称">名称</option>
							</select>
							<input class="sousuoycl" style="border-radius: 8px; background-color:#EBE9ED;" type="text" name="" placeholder="搜索"/>
							<input class="chaxunycl" type="button" value="查询"/>
						</div>
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
						 <input class="allscreenr" type="button" value="All"style="width:30px;"/>
					</form>
				</div>
			</div>
			<div id="search" style="margin-top:20px;magin-left:-10px;">
			<form action="giver.do" method="post" id="yclajax" >
				<table border="0px" cellspacing="0px" cellpadding="0px" cellspacing="0px" style="magin-left:-10px;" id="tab1">
					<tr id="list">
						<td style="width: 80px;color: #B6BBC3;background-color: #354148;">&nbsp;&nbsp;&nbsp;&nbsp;编码</td>
						<td style="width: 130px;color: #B6BBC3;background-color: #354148;">&nbsp;&nbsp;&nbsp;&nbsp;名称</td>
						<td style="width: 80px;color: #B6BBC3;background-color: #354148;">类型</td>
						<td style="width: 100px;color: #B6BBC3;background-color: #354148;">单位</td>
						<td style="width: 480px;color: #B6BBC3;background-color: #354148;">备注</td>
					</tr>
					<c:forEach items="${yclAll}" var="yclall">
					<tr class="guoshui" style="background-color:white; color: black;border: 0.5px solid gainsboro;">
                        <td class="bm" style="width: 80px; border: 0.5px solid gainsboro;"align="center">${yclall.clid}</td>
						<td class="mz" style="width: 130px; border: 0.5px solid gainsboro;">${yclall.lxname}</td>
						<td class="glx" style="width: 80px;  border: 0.5px solid gainsboro;">${yclall.cpname}</td>
						<td class="jin" style="width: 100px;  border: 0.5px solid gainsboro;">${yclall.danweiname}</td>
						<td class="dae" style="width: 480px;  border: 0.5px solid gainsboro;">${yclall.cailinfo}</td>
					</tr>
					 </c:forEach>
				</table>
				<div id="pages" >
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
				</form>
			</div>
		 <!-- //添加 -->
			<div id="hidden" style="position: absolute;top:250px; border: 1px solid cornflowerblue; width: 497px;height:174px; border-radius: 5px;margin-left: 180px;display: none;z-index:3">
				<form  id="tijiao" action="#" method="post">
				<table style="border:1px solid #B5B4B8; background-color: #EBE9ED;">
				
					<tr>
						<td colspan="4" align="center" style="background-color: #D3D3D3;">物料信息</td>
					</tr>
					
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">编号</td>
							<td><input type="text" name="" placeholder="自动编号" disabled="disabled"></td>
							<td style="background-color: #D3D3D3; width: 40px;" align="center">名称</td>
							<td><input type="text" name="" class="clearname"></td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">类型</td>
							<td>
								<div id="chose" style="float:left;width:50px;"><input class="yuanleixin" type="text" name="" style="width:143px;"></div>
								<div id="chlicf" style="float:left;margin-left:74px;"><input id="lxtian" type="button" value="^" style="width:20px; heigth:20px;"/></div>
								<div id="foodstyl" style="border: 1px solid #B5B4B8; width: 260px;position:absolute;top:80px;background: white; display:none;"> 									  
									<table cellpadding="0" cellspacing="0" border="0.5">
										<tr>
											<td colspan="2" style="padding-left:26px;background-color: #EBE9ED;border: 0.5px solid gainsboro;" align="center">名称</td>
											<td width="100px" align="center" style="background-color: #EBE9ED;border: 0.5px solid gainsboro;">编号</td>
										</tr>
										 <c:forEach items="${stylec}" var="ycsslall">
										<tr class="ck" style="background-color:white;">
										     <td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
											<td class="cname" width="140px" align="center" style="border: 0.5px solid gainsboro;">${ycsslall.name}</td>
											<td class="cnumber" width="100px" align="center" style="border: 0.5px solid gainsboro;">${ycsslall.id}</td> 
										</tr>
										</c:forEach>
										<tr class="addt">
											<td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
											<td width="140px" align="center" style="border: 0.5px solid gainsboro;">
												<新增>
											</td>
											<td width="100px" align="center" style="border: 0.5px solid gainsboro;"></td>
										</tr>
                                       
									</table> 
								</div>
							</td>

							<td style="background-color: #D3D3D3;width: 100px;" align="center">单位</td>
							<td> 
								<div id="chose1" style="float:left;width:50px;"><input class="danweilx"  type="text" name="" style="width:143px;"></div>
								<div id="chlicf1" style="float:left;margin-left:74px;"><input type="button" value="^" style="width:20px; heigth:20px;"/></div>
								<div id="foodstyl1" style="border: 1px solid #B5B4B8; width: 260px;position:absolute;top:80px;left:350px; background: white; display:none;">
									<table cellpadding="0" cellspacing="0" border="0.5">
										<tr>
											<td colspan="2" style="padding-left:26px;background-color: #EBE9ED;border: 0.5px solid gainsboro;" align="center">单位</td>
											<td width="100px" align="center" style="background-color: #EBE9ED;border: 0.5px solid gainsboro;">编号</td>
										</tr>
										 <c:forEach items="${danweic}" var="danweii">
										<tr class="ck1">
											<td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
											<td class="cname1" width="140px" align="center" style="border: 0.5px solid gainsboro;">${danweii.name}</td>
											<td class="cnumber1" width="100px" align="center" style="border: 0.5px solid gainsboro;">${danweii.id}</td>
										</tr>
										 </c:forEach> 
										<tr class="addt1">
											<td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
											<td width="140px" align="center" style="border: 0.5px solid gainsboro;">
												<新增>
											</td>

											<td width="100px" align="center" style="border: 0.5px solid gainsboro;"></td>
										</tr>
									</table>
								</div>
						 
							</td>

						</tr>
						<tr>
							<td style="background-color: #D3D3D3;width: 100px;" align="center">备注</td>
							<td colspan="3"><input type="text" style="width: 350px;height: 60px;" class="beichu"></td>
						</tr>
				</table>
				<div class="colo" style="background-color: #EBE9ED;">
					<div id="b1" style="float: left;background-color:#EBE9ED; "><input type="button" value="保存" style="width:100px;height:40px;margin-left: 296px;"></div>
					<div id="b2" style="float: left;background-color:#EBE9ED; "><input type="reset" value="放弃" style="width:100px;height:40px;margin-left: 0px;"></div>
				</div>
				</form>

			</div>
			<div id="addsty" style="position: absolute;top:500px;border: 1px solid #B5B4B8; left:300px; width: 260px;display: none; z-index:5">
				<form id="suretijiao" action="#" method="post">
				<table style="background-color: #EBE9ED;">
					<tr>
						<td colspan="2" width="300px" align="center" style="background-color:#2D74AC;">添加信息</td>
					</tr>
					
						<tr>
							<td style="background-color: #D3D3D3;">编号</td>
							<td width="100px"><input type="text" name="" placeholder="自动编号" disabled="disabled"></td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3;">名称</td>
							<td width="100px"><input type="text" name="" class="lx"></td>
						</tr>
						<tr height="70px">
							<td class="sure0"><input type="button" value="确定" style="width: 100px; height: 30px;"></td>
							<td class="give0"><input type="reset" value="放弃" style="width: 100px; height: 30px;margin-left: 30px;"></td>
						</tr>
					
				</table>
				</form>
			</div>
			
			<div id="addsty1" style="position: absolute;top:500px;border: 1px solid #B5B4B8; left:560px; width: 260px;display:none;z-index:5">
				<form id="suretijiao1" action="#" method="post">
				<table style="background-color: #EBE9ED;">
					<tr>
						<td colspan="2" width="300px" align="center" style="background-color:#2D74AC;">添加信息</td>
					</tr>
					
						<tr>
							<td  style="background-color: #D3D3D3;">编号</td>
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
					
				</table>
				</form>
			</div>

 

          <!-- //修改 -->
          <div id="hiddenn" style="position: absolute;top:250px; border: 1px solid cornflowerblue; width: 497px; height:174px; border-radius: 5px;margin-left: 180px;display: none;z-index:3">
				<form id="tijiao1" action="#" method="post">
				<table style="border:1px solid #B5B4B8; background-color: #EBE9ED;">
					<tr>
						<td colspan="4" align="center" style="background-color: #D3D3D3;">物料信息</td>
					</tr>
					
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">编号</td>
							<td><input type="text" name="" placeholder="自动编号" disabled="disabled" class="bbbbb"></td>
							<td style="background-color: #D3D3D3; width: 40px;" align="center">名称</td>
							<td><input type="text" name="" class="clearname1"></td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">类型</td>
							<td>
								<div id="chosee" style="float:left;width:50px;"><input  class="yuanleixin1" type="text" name="" style="width:143px;"></div>
								<div id="chlicff" style="float:left;margin-left:74px;"><input type="button" value="^" style="width:20px; heigth:20px;"/></div>
								<div id="foodstyyl" style="border: 1px solid #B5B4B8; width: 260px;position:absolute;top:80px;background: white; display:none;">
									<form>
									<table cellpadding="0" cellspacing="0" border="0.5">
										<tr>
											<td colspan="2" style="padding-left:26px;background-color: #EBE9ED;border: 0.5px solid gainsboro;" align="center">名称</td>
											<td width="100px" align="center" style="background-color: #EBE9ED;border: 0.5px solid gainsboro;">编号</td>
										</tr>
										<c:forEach items="${stylec}" var="ycsslall">
										<tr class="ck" style="background-color:white;">
											<td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
											<td class="cname" width="140px" align="center" style="border: 0.5px solid gainsboro;">${ycsslall.name}</td>
											<td class="cnumber" width="100px" align="center" style="border: 0.5px solid gainsboro;">${ycsslall.id}</td>
										</tr>
										</c:forEach> 
										<tr class="addto">
											<td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
											<td width="140px" align="center" style="border: 0.5px solid gainsboro;">
												<新增>
											</td>

											<td width="100px" align="center" style="border: 0.5px solid gainsboro;"></td>
										</tr>

									</table>
									</form>
								</div>
							</td>

							<td style="background-color: #D3D3D3;width: 100px;" align="center">单位</td>
							<td> 
								<div id="cchose1" style="float:left;width:50px;"><input class="danweilx1" type="text" name="" style="width:143px;"></div>
								<div id="cchlicf1" style="float:left;margin-left:74px;"><input type="button" value="^" style="width:20px; heigth:20px;"/></div>
								<div id="cfoodstyl1" style="border: 1px solid #B5B4B8; width: 260px;position:absolute;top:80px;left:350px; background: white; display:none;">
									<form>
									<table cellpadding="0" cellspacing="0" border="0.5">
										<tr>
											<td colspan="2" style="padding-left:26px;background-color: #EBE9ED;border: 0.5px solid gainsboro;" align="center">单位</td>
											<td width="100px" align="center" style="background-color: #EBE9ED;border: 0.5px solid gainsboro;">编号</td>
										</tr>
										<c:forEach items="${danweic}" var="danweii">
										<tr class="ck1">
											<td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
											<td class="cname1" width="140px" align="center" style="border: 0.5px solid gainsboro;">${danweii.name}</td>
											<td class="cnumber1" width="100px" align="center" style="border: 0.5px solid gainsboro;">${danweii.name}</td>
										</tr>
										 </c:forEach> 
										<tr class="addtoo">
											<td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
											<td width="140px" align="center" style="border: 0.5px solid gainsboro;">
												<新增>
											</td>

											<td width="100px" align="center" style="border: 0.5px solid gainsboro;"></td>
										</tr>
									</table>
									</form>
								</div>
						 
							</td>

						</tr>
						<tr>
							<td style="background-color: #D3D3D3;width: 100px;" align="center">备注</td>
							<td colspan="3"><input type="text" style="width: 350px;height: 60px;" class="beichu1"></td>
						</tr>
				</table>
				<div class="colo" style="background-color: #EBE9ED;">
					<div id="bb1" style="float: left;background-color:#EBE9ED; "><input type="button" value="保存" style="width:100px;height:40px;margin-left: 296px;"></div>
					<div id="bb2" style="float: left;background-color:#EBE9ED; "><input type="button" value="放弃" style="width:100px;height:40px;margin-left: 0px;"></div>
					
				</div>
                </form>
			</div>
			<div id="aaddsty" style="position: absolute;top:500px;border: 1px solid #B5B4B8; left:300px; width: 260px;display: none;z-index:5">
				<form id="suretijiao2" action="#" method="post">
				<table style="background-color: #EBE9ED;">
					<tr>
						<td colspan="2" width="300px" align="center" style="background-color:#2D74AC;">添加信息</td>
					</tr>
					
						<tr>
							<td style="background-color: #D3D3D3;">编号</td>
							<td width="100px"><input type="text" name="" placeholder="自动编号" disabled="disabled"></td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3;">名称</td>
							<td width="100px"><input type="text" name="" class="lx1"></td>
						</tr>
						<tr height="70px">
							<td class="sure10"><input type="button" value="确定" style="width: 100px; height: 30px;"></td>
							<td class="give10"><input type="reset" value="放弃" style="width: 100px; height: 30px;margin-left: 30px;"></td>
						</tr>
					
				</table>
				</form>
			</div>
			
			<div id="aaddsty1" style="position: absolute;top:500px;border: 1px solid #B5B4B8; left:560px; width: 260px;display:none;z-index:5">
				<form id="suretijiao3" action="#" method="post">
				<table style="background-color: #EBE9ED;">
					<tr>
						<td colspan="2" width="300px" align="center" style="background-color:#2D74AC;">添加信息</td>
					</tr>
					
						<tr>
							<td  style="background-color: #D3D3D3;">编号</td>
							<td class="nun" width="100px"><input type="text" name="" placeholder="自动编号" disabled="disabled"></td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3;">单位</td>
							<td class="danwei" width="100px"><input type="text" name="name" class="dw2"></td>
						</tr>
						<tr height="70px">
							<td><input class="sure11" type="button" value="确定" style="width: 100px; height: 30px;"></td>
							<td><input class="give11" type="reset" value="放弃" style="width: 100px; height: 30px;margin-left: 30px;"></td>
						</tr>
					
				</table>
				</form>
			</div>

               <!-- 删除-->
         <div id="shanchu" style="position:absolute;top:300px;border: 1px solid #B5B4B8; left:280px; width:220px;height:100px;display:none;background-color: #135A92;z-index:3">
			<div style="color: white;background-color:#135A92;font-size: 13px;"><strong>提示</strong></div>
			<table style="background-color:#EBE9ED;margin-left: 4px;">
				<tr>
					<td colspan="2" style="font-size: 15px;"align="center">确定选中的行？</td>
				</tr>
				<tr>
					<td style="width: 100px;"><input type="button" value="是（Y）"style="width: 90px;height: 18px;border: 1px;margin-top: 20px;" class="Y"></td>
					<td style="width: 100px;"><input type="button" value="否（N）"style="width: 90px;height: 18px;border: 1px;margin-top: 20px;"class="N"></td>
				</tr>
			</table>
         </div>
       
             
		</div>
		<div id="hidden2"></div>
 
	</body>
	<script> 
	var page=1;
		var value=$("#ebody .guoshui :eq(0)").find(".bm").text();
		var value1=$("#ebody .guoshui :eq(0)").find(".mz").text();
		var value2=$("#ebody .guoshui :eq(0)").find(".glx").text();
		var value3=$("#ebody .guoshui :eq(0)").find(".jin").text();
		var value4=$("#ebody .guoshui :eq(0)").find(".dae").text();
		//按要求查询数据 
	    $("#ebody .guoshui :eq(0)").css("background-color","#135A92");
		$("#ebody .caozuo1").click(function(){
			 $("#ebody #hidden").css("display","block");
			  $("#ebody #hidden2").css("display","block");  
		})
		//选择原材料
		 $("#ebody .guoshui").click(function(){
			 $(this).css("background-color","#135A92");
			 $(this).siblings().css("background-color","white");
			 value=$(this).find(".bm").text();
			 value1 = $(this).find(".mz").text();
		     value2 = $(this).find(".glx").text();
			 value3 = $(this).find(".jin").text();
			 value4 = $(this).find(".dae").text();  
		})
		
		
		
		//显示全部
		$(".allscreenr").click(function() {
		$(".sousuoycl").val("");
		alert(1);
		   $.ajax({
  			url:"zycl/findAtt.do",
  			dataType:"html",
  			data:{"page":page},
  			success:function(result){
  				$("#yclajax").html(result);
  			}
  		}); 
		})
		
		
		
		
		
		
		
		//按要求查询
		$(".chaxunycl").click(function() {
		  //alert($("#aj").val());
		  if($(".sousuoycl").val().trim().length==0)
		  {
		   alert("未输入查询值")
		  }
		  else{
       //alert(t);
       $.ajax({
  			url:"zycl/chaxun.do",
  			dataType:"html",
  			data:{"typeycl":$("#aj").val(),"zhi":$(".sousuoycl").val(),"page":page},
  			success:function(result){
  				$("#yclajax").html(result);
  			},error:function(result){
  		     alert("未查到该信息");
  		 }
  		}); 
		  }
		}) 
		
		 //修改原材料
		 //bbbbb clearname1 yuanleixin1 danweilx1 beichu1
		 $("#ebody .caozuo3").click(function(){
		   $("#ebody .bbbbb").val(value);
		   $("#ebody .clearname1").val(value1);
		   $("#ebody .yuanleixin1").val(value2);
	       $("#ebody .danweilx1").val(value3);
	      $("#ebody .beichu1").val(value4);
	       
	        
		 	 $("#ebody #hiddenn"). css("display","block");
		 	  $("#ebody #hidden2").css("display","block"); 
		})
		
		
		 $("#ebody #chlicff").click(function(){
			 $("#ebody #foodstyyl").css("display","block");
		})
		
			$("#ebody #cchlicf1").click(function(){
			 $("#ebody #cfoodstyl1").css("display","block");
		}) 
		
		//获取修改类型
		$("#ebody .ck").click(function(){
			 $(this).css("background-color","#BCD68D");
			 $(this).siblings().css("background-color","white");
			 $("#ebody #foodstyyl").css("display","none");
			 $("#ebody .yuanleixin1").val($(this).find(".cname").text());
			 //alert($(this).find(".cname").text());
		})
		//新增修改类型
		$("#ebody .addto").click(function(){
			$("#ebody #aaddsty").css("display","block");
			 //alert($(this).find(".cname").text());
		}) 
		//确认添加类型
		var led=1;
		$("#ebody .sure10").click(function(){
			//alert($(".lx").val()); 
			$.ajax({
  			       url:"zycl/chongmaddleixing.do",
  			       dataType:"JSON",
  			       data:{"name":$("#ebody .lx1").val()},
  			        success:function(result){
  			        if(result==0)
  			        {
  			          if($("#ebody .lx1").val().length==0) {
				//空
				alert( "名称不能为空");
				led = 0;
			  }
			 else{ 
			 $("#ebody .yuanleixin1").val($("#ebody .lx1").val());
			 $.ajax({
  			       url:"zycl/addleixing.do",
  			       dataType:"html",
  			       data:{"lxiname":$("#ebody .lx1").val()},
  			        success:function(result){
  				    alert("添加成功");
  			        },
  		        });   
			 
			  $("#ebody .yuanleixin1").val($("#ebody .lx1").val());
			  //$("#ebody #suretijiao2").submit(); 
			  $("#ebody .lx1").val("");
			$("#ebody #aaddsty").css("display","none");
			$("#ebody #foodstyyl").css("display","none");
			
			
			
			$.ajax({
  			       url:"zycl/updateleix1.do",
  			       dataType:"html", 
  			        success:function(result){
  				     $("#foodstyyl").html(result); 
  			        },error:function(result){
  				     
  			        }
  		        }); 
			}
  			        }
  			        else{
  			          alert("名称不合格");   
  			           }
  			        }
  			        })
			 
		})
		//放弃添加
		$("#ebody .give10").click(function(){
			$("#ebody #aaddsty").css("display","none");
			$("#ebody #foodstyyl").css("display","none");
			  
		})
		
		//获取单位
		$("#ebody .ck1").click(function(){
			 $(this).css("background-color","#BCD68D");
			 $(this).siblings().css("background-color","white");
			 $("#ebody #cfoodstyl1").css("display","none");
			 $("#ebody .danweilx1").val($(this).find(".cname1").text());
			 //alert($(this).find(".cname1").text());
		})
		//新增修改单位
		$("#ebody .addtoo").click(function(){
			$("#ebody #aaddsty1").css("display","block");
			 //alert($(this).find(".cname1").text());
		}) 
		//确认添加单位
		var dane=1;
		$("#ebody .sure11").click(function(){
			//alert($(".dw").val());
			$.ajax({
  			       url:"zycl/chongdanwei.do",
  			       dataType:"JSON",
  			       data:{"name":$("#ebody .dw2").val()},
  			        success:function(result){
  			        if(result==0)
  			        {
  			         if($("#ebody .dw2").val().length==0) {
				//空
				alert( "单位不能为空0");
				dane = 0;
			  }
			 else{
			//alert($("#ebody .dw2").val());
			 $.ajax({
  			       url:"zycl/addddanwei.do",
  			       dataType:"html",
  			       data:{"danweiname":$("#ebody .dw2").val()},
  			        success:function(result){
  				    alert("添加成功");
  			        }, 
  		        });   
			 
			  $("#ebody .danweilx1").val($("#ebody .dw2").val());
			  //$("#ebody #suretijiao3").submit();
			$("#ebody .dw2").val("");
			$("#ebody #aaddsty1").css("display","none");
			$("#ebody #cfoodstyl1").css("display","none");
			
			
			
			$.ajax({
  			       url:"zycl/updateleixx2.do",
  			       dataType:"html", 
  			        success:function(result){
  				     $("#cfoodstyl1").html(result); 
  			        },error:function(result){
  				     
  			        }
  		        }); 
			
			}
  			        }
  			        else{
  			        alert("单位不合格");
  			        } 
  			        }
  			        })
			 
			
		})
		//放弃添加
			$("#ebody .give11").click(function(){
			//alert($(".dw").val()); 
			$("#ebody #aaddsty1").css("display","none");
			$("#ebody #cfoodstyl1").css("display","none");
		})
			//保存添加数据
			var tjia=1;
		$("#ebody #bb1").click(function(){
		      // alert($("#ebody .clearname1").val());
		      //alert($(".context2").val());
		 if($("#ebody .clearname1").val().length==0) {
				//空
				alert( "名称不能为空");
				tjia = 0;
			   }
			  
		    else if($("#ebody .yuanleixin1").val().trim().length==0) {
				alert("未选择类名");
				tjia = 0;
			} 
		
		  else if($("#ebody .danweilx1").val().trim().length==0)
		  {
		    alert("未选择单位");
				tjia = 0;
		  }
		 
		else{
		   $("#ebody .bm").val(value);
		   $("#ebody .mz").val(value1);
		   $("#ebody .glx").val(value2);
	       $("#ebody .jin").val(value3);
	       $("#ebody .dae").val(value4); 
	        
		$.ajax({
  			       url:"zycl/xiugaiclInfo.do",
  			       dataType:"html",
  			       data:{"clid":$("#ebody .bm").val(),"lxname":$("#ebody .clearname1").val(),"cpname":$("#ebody .yuanleixin1").val(),"danweiname": $("#ebody .danweilx1").val(),"cailinfo":$("#ebody .beichu1").val(),"page":page},
  			        success:function(result){
  				     $("#yclajax").html(result);
  				    alert("修改成功");
  			        },error:function(result){
  				    alert("修改失败");
  			        }
  		        }); 
		 
			$("#ebody #hiddenn").css("display","none");
			 //alert($(this).find(".cname1").text());
			 //$("#ebody #tijiao").submit();
			  $("#ebody .clearname1").val("");
			 $("#ebody .yuanleixin1").val("");
			 $("#ebody .danweilx1").val("");
			 $("#ebody .beichu1").val("");
			 $("#ebody #hidden2").css("display","none"); 
			 }
		}) 	
		//放弃添加数据
		$("#ebody #bb2").click(function(){
			$("#ebody #hiddenn").css("display","none");
			 $("#ebody #hidden2").css("display","none"); 
			 //alert($(this).find(".cname1").text());
			  $("#ebody .clearname1").val("");
			 $("#ebody .yuanleixin1").val("");
			 $("#ebody .danweilx1").val("");
			 $("#ebody .beichu1").val("");
		}) 
	    //删除数据
	    $("#ebody .caozuo2").click(function(){
			$("#ebody #shanchu").css("display","block");
			 
			 $("#ebody #hidden2").css("display","block");
		}) 
	   //删除数据成功
	    $("#ebody .Y").click(function(){
	   // alert(value);
	    $.ajax({
  			url:"zycl/deleyclInfo.do",
  			dataType:"html",
  			data:{"id":value},
  			success:function(result){
  			$("#yclajax").html(result);
  			alert("删除成功");
  			},error:function(result){
  		     alert("该原料正在使用");
  		 }
  		});  
	         //alert(value);
			$("#ebody #shanchu").css("display","none"); 
			$("#ebody #hidden2").css("display","none");  
		})  
	   //取消删除
		 $("#ebody .N").click(function(){
			$("#ebody #shanchu").css("display","none"); 
			$("#ebody #hidden2").css("display","none");
			
		}) 
		  
		 
		 	  
		
		$("#ebody .caozuo1").mouseenter(function() {
			$("#ebody .caozuo1 img").attr("src", "images/zj/add1.jpg");
			$("#ebody #ck").css("background-color","#C2C9CF");
			
			/*$("#ck").css("border","1px solid greenyellow");*/

		}).mouseleave(function() {
			$("#ebody .caozuo1 img").attr("src", "images/zj/add.jpg");
			$("#ebody #ck").css("background-color", "white");
			$("#ebody #ck").css("border", "white");
		})
		$("#ebody .caozuo2").mouseenter(function() {
			$("#ebody .caozuo2 img").attr("src", "images/zj/dele1.jpg");
			$("#ebody #ck2").css("background-color", "#C2C9CF");
			/*$("#ck2").css("border","1px solid greenyellow");*/

		}).mouseleave(function() {
			$("#ebody .caozuo2 img").attr("src", "images/zj/dele.jpg");
			$("#ebody #ck2").css("background-color", "white");
			$("#ebody #ck2").css("border", "white");
		})
		$("#ebody .caozuo3").mouseenter(function() {
			$("#ebody .caozuo3 img").attr("src", "images/zj/late1.jpg");

			$("#ebody #ck3").css("background-color", "#C2C9CF");
			/*$("#ck3").css("border","1px solid greenyellow");*/

		}).mouseleave(function() {
			$("#ebody .caozuo3 img").attr("src", "images/zj/late.jpg");
			$("#ebody #ck3").css("background-color", "white");
			$("#ebody #ck3").css("border", "white");
		})
		//选类型
		$("#ebody #chlicf").click(function(){
		 $("#ebody #foodstyl").css("display","block");
	  
		})
		//材料类型查询
		/* $("#ebody #lxtian").click(function(){
			 $.ajax({
  			url:"zycl/findAllYclstyle.do",
  			dataType:"html",
  			success:function(result){
  		    $("#foodstyl").html(result);
  			},error:function(result){
  		     alert("未查到该信息");
  		 }
  		}); 
	  
		}) */
	 
			$("#ebody #chlicf1").click(function(){
			 $("#ebody #foodstyl1").css("display","block");
			
			  
		}) 
		//获取类型
		$("#ebody .ck").click(function(){
			 $(this).css("background-color","#BCD68D");
			 $(this).siblings().css("background-color","white");
			 $("#ebody #foodstyl").css("display","none");
			 $("#ebody .yuanleixin").val($(this).find(".cname").text());
			 //alert($(this).find(".cname").text());
		})
		//新增类型
		$("#ebody .addt").click(function(){
			$("#ebody #addsty").css("display","block");
			 //alert($(this).find(".cname").text());
		}) 
		//确认添加类型
		var sp=1;
		$("#ebody .sure0").click(function(){
			//alert($("#ebody .lx").val());
			$.ajax({
  			       url:"zycl/chongmaddleixing.do",
  			       dataType:"JSON",
  			       data:{"name":$("#ebody .lx").val()},
  			        success:function(result){
  			        if(result==0)
  			        {
  			         
  			        if($("#ebody .lx").val().length==0) {
				//空
				alert( "名称不能为空");
				sp = 0;
			  }
			 else{
			 //alert($("#ebody .lx").val());
			  $("#ebody .yuanleixin").val($("#ebody .lx").val());
			  $.ajax({
  			       url:"zycl/addleixing.do",
  			       dataType:"html",
  			       data:{"lxiname":$("#ebody .lx").val()},
  			        success:function(result){
  				    alert("添加成功");
  			        },
  		        });  
  		        $("#ebody .lx").val("");
			  //$("#ebody #suretijiao").submit();
			$("#ebody #addsty").css("display","none");
			$("#ebody #foodstyl").css("display","none");
		 
			 $.ajax({
  			       url:"zycl/updateleix.do",
  			       dataType:"html", 
  			        success:function(result){
  				     $("#foodstyl").html(result); 
  			        },error:function(result){
  				     
  			        }
  		        }); 
				 
			
			} 
  			        } 
  			        else
  			        {
  			         alert("名称不合格");
  			        }
                   } 
                   
                   }) 
			
			
		})
		//放弃添加
		$("#ebody .give0").click(function(){
			$("#ebody #addsty").css("display","none");
			$("#ebody #foodstyl").css("display","none");
			  
		})
		//获取单位
		$("#ebody .ck1").click(function(){
			 $(this).css("background-color","#BCD68D");
			 $(this).siblings().css("background-color","white");
			 $("#ebody #foodstyl1").css("display","none");
			 $("#ebody .danweilx").val($(this).find(".cname1").text());
			 //alert($(this).find(".cname1").text());
		})
		//新增添加单位
		$("#ebody .addt1").click(function(){
			$("#ebody #addsty1").css("display","block");
			 //alert($(this).find(".cname1").text());
		}) 
		//确认添加单位
		var sdew=1;
		$("#ebody .sure1").click(function(){
		
		$.ajax({
  			       url:"zycl/chongdanwei.do",
  			       dataType:"JSON",
  			       data:{"name":$("#ebody .dw").val()},
  			        success:function(result){
		             if(result==0)
		             {
		             if($("#ebody .dw").val().length==0) {
				//空
				alert( "单位不能为空");
				sdew = 0;
			  }
			else{
			  //alert($("#ebody .dw").val());
			  $("#ebody .danweilx").val($("#ebody .dw").val());
			  
			  $.ajax({
  			       url:"zycl/addddanwei.do",
  			       dataType:"html",
  			       data:{"danweiname":$("#ebody .dw").val()},
  			        success:function(result){
  				    alert("添加成功");
  			        }, 
  		        });  
			   
			  $("#ebody .dw").val("");
			  //$("#ebody #suretijiao1").submit();
			$("#ebody #addsty1").css("display","none");
			$("#ebody #foodstyl1").css("display","none");
			
			
			$.ajax({
  			       url:"zycl/updateleixx.do",
  			       dataType:"html", 
  			        success:function(result){
  				     $("#foodstyl1").html(result); 
  			        },error:function(result){
  				     
  			        }
  		        }); 
			
			
			
			
			
			}
		             }
		             else{
		             alert("名称不合格");
		             }
		
		            }
		            })
		 
			
		})
		//放弃添加
			$("#ebody .give1").click(function(){
			//alert($(".dw").val()); 
			$("#ebody #addsty1").css("display","none");
			$("#ebody #foodstyl1").css("display","none");
		})
			//保存添加数据
		var jus = 1;	 
		$("#ebody #b1").click(function(){
		  //alert($("#ebody .clearname").val());
		//alert($(".context2").val());
		
		 $.ajax({
  			       url:"zycl/addcailiaomming.do",
  			       dataType:"JSON",
  			       data:{"name":$("#ebody .clearname").val()},
  			        success:function(result){
                    if(result==0)
  				     {
  				     if($("#ebody .clearname").val().length==0) {
				//空
				alert( "名称不能为空");
				jus = 0;
			   }
		 
		    else if($("#ebody .yuanleixin").val().trim().length==0) {
				alert("类型不能为空");
				jus = 0;
			} 
		
		  else if($("#ebody .danweilx").val().trim().length==0)
		  {
		    alert("未选择单位");
				jus = 0;
		  }
		  /* else if()
		  {
		    
		  
		  } */
		  else{
		       
		  //clearname  yuanleixin  danweilx beichu
			    //alert($("#ebody .clearname").val());
			     //alert($("#ebody .yuanleixin").val());
			     // alert($("#ebody .danweilx").val());
			     // alert($("#ebody .beichu").val());
				//$("#rbody #hiddenn").css("display", "none");
				//alert($(this).find(".cname1").text())
				 
				 				
				 $.ajax({
  			       url:"zycl/addGiverInfo.do",
  			       dataType:"html",
  			       data:{"lxname":$("#ebody .clearname").val(),"cpname":$("#ebody .yuanleixin").val(),"danweiname":$("#ebody .danweilx").val(),"cailinfo":$("#ebody .beichu").val(),"page":page},
  			        success:function(result){
  				     $("#yclajax").html(result);
  				    alert("添加成功");
  			        },error:function(result){
  				    alert("添加失败");
  			        }
  		        }); 
				 
			$("#ebody #hidden").css("display","none");
			 //alert($(this).find(".cname1").text());
			 //$("#ebody #tijiao").submit();
			 $("#ebody #hidden2").css("display","none");
			 $("#ebody .clearname").val("");
			 $("#ebody .yuanleixin").val("");
			 $("#ebody .danweilx").val("");
			 $("#ebody .beichu").val("");
			}  
  				     }
  				    else
  				    {
  				      alert("材料名不合格");  
  				    
  				    }
  				   
  			        },error:function(result){
  				    alert("材料名不合格");
  			        }
  		        });  
		
		
		}) 	
		//放弃添加数据
		$("#ebody #b2").click(function(){
			$("#ebody #hidden").css("display","none");
			 //alert($(this).find(".cname1").text());
			 $("#ebody .clearname").val("");
			 $("#ebody .yuanleixin").val("");
			 $("#ebody .danweilx").val("");
			 $("#ebody .beichu").val("");
			 $("#ebody #hidden2").css("display","none");
		}) 
		
		
		
		$("#ebody #pages").css("margin-top","15px");
	$("#ebody #pages input").css({"padding-left":"5px","padding-right":"5px"});
		if("${zy }"!=0){
			$("#ebody #pages input").eq("${page+1}").css({"background":"#135A92","color":"#ffffff"});
			$("#ebody #pages input").eq("${page+1}").attr("disabled","disabled");
			}
		$("#ebody #pages input").mouseenter(function(){
				$(this).css({"background":"#135A92","color":"white"});
			}).mouseleave(function(){
				if($(this).index()!="${page+1}")
				$(this).css({"background":"white","color":"#000000"});
			});
		
		if("${page}"==1){
			$("#ebody #pages input").eq(0).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#ebody #pages input").eq(0).attr("disabled","disabled");
			$("#ebody #pages input").eq(1).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#ebody #pages input").eq(1).attr("disabled","disabled");
		}else{
			$("#ebody #pages input").eq(0).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#ebody #pages input").eq(0).removeAttr("disabled");
			$("#ebody #pages input").eq(1).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#ebody #pages input").eq(1).removeAttr("disabled");
		}
		if("${page}"=="${zy }"){
			$("#ebody #pages input").eq("${zy+2}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#ebody #pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#ebody #pages input").eq("${zy+3}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#ebody #pages input").eq("${zy+3}").attr("disabled","disabled");
		}else{
			$("#ebody #pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#ebody #pages input").eq("${zy+2}").removeAttr("disabled");
			$("#ebody #pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#ebody #pages input").eq("${zy+3}").removeAttr("disabled");
		}
		if("${zy }"==0){
			$("#ebody #pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#ebody #pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#ebody #pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#ebody #pages input").eq("${zy+3}").attr("disabled","disabled");
		}
		
		$("#ebody #pages input").click(function(){
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
				/* alert(page); */
			 $.ajax({
  			url:"zycl/chaxun.do",
  			dataType:"html",
  			data:{"typeycl":$("#aj").val(),"zhi":$(".sousuoycl").val(),"page":page},
  			success:function(result){
  				$("#yclajax").html(result);
  			},error:function(result){
  		     alert("未查到该信息");
  		 }
  		});  		
			});
		
		 
		 
	</script>

</html>