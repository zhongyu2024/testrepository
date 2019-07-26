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
    
    <title>厂商设置</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" href="css/zj/gys.css" />
		<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

  </head>
     <body style="font-family: '微软雅黑';">
		<div id="rbody">
			<div id="kuang" >
				<div id="zsg">
					<div id="ck">
						<div class="caozuo1"><img src="images/zj/add.jpg" width="35px" height="35px" align="center" />&nbsp;添加</div>
					</div>
					<div id="ck3">
						<div class="caozuo3"><img src="images/zj/late.jpg" width="35px" height="35px" align="center" />&nbsp;修改</div>
					</div>
					<div id="ck2">
						<div class="caozuo2"><img src="images/zj/dele.jpg" width="35px" height="35px" align="center" />&nbsp;删除</div>
					</div>
				</div>
				<div id="rsg">
					<form id="info" action="#" method="post">
						<div id="rsearch">
							<select style="width: 65px;" id="aja">
								<option value="编号">编号</option>
								<option value="名称">名称</option>
							</select>
							<input class="sousuogys" style="border-radius: 8px; background-color:#EBE9ED;" type="text" name="sousuogys" placeholder="搜索" />
							<input class="chaxungys" type="button" value="查询" />
							
						</div>
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
						 <input class="allscreen" type="button" value="All"style="width:30px;"/>
					</form>
				</div>
			</div>
			<div id="search" style="margin-top: 20px;">
			<form action="giver.do" method="post" id="gysajaxs" >
				<table border="0px" cellspacing="0px" cellpadding="0px" cellspacing="0px"  > 
					<tr id="list">
						<td style="width: 80px;color: #B6BBC3;background-color: #354148;">&nbsp;&nbsp;&nbsp;&nbsp;编码</td>
						<td style="width: 130px;color: #B6BBC3;background-color: #354148;">&nbsp;&nbsp;&nbsp;&nbsp;名称</td>
						<td style="width: 80px;color: #B6BBC3;background-color: #354148;">联系人</td>
						<td style="width: 80px;color: #B6BBC3;background-color: #354148;">电话</td>
						<td style="width: 500px;color: #B6BBC3;background-color: #354148;">地址</td>
					</tr>
					
					 
					<c:forEach items="${gysAll}" var="gysall">
					<tr class="guoshui" style="background-color:white; color: black;">
						<td class="bm" style="width: 80px; border: 0.5px solid gainsboro;" align="center">${gysall.id}</td>
						<td class="mz" style="width: 130px; border: 0.5px solid gainsboro;">${gysall.name}</td>
						<td class="glx" style="width: 80px;  border: 0.5px solid gainsboro;">${gysall.manname}</td>
						<td class="jin" style="width: 100px;  border: 0.5px solid gainsboro;">${gysall.mantel}</td>
						<td class="dae" style="width: 480px;  border: 0.5px solid gainsboro;">${gysall.address}</td>
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
			 
			<div id="hidden" style="position: absolute;top:250px; border: 1px solid cornflowerblue; width: 498px; height:137px; border-radius: 5px;margin-left: 180px;display: none;z-index:3;">
				<form id="info1" action="#" method="post">
				<table style="border:1px solid #B5B4B8; background-color: #EBE9ED;">
					<tr>
						<td colspan="4" align="center" style="background-color: #D3D3D3;">供应商信息</td>
					</tr>
					
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">编号</td>
							<td><input type="text" name="" placeholder="自动编号" disabled="disabled" id="bhao"></td>
							<td style="background-color: #D3D3D3; width: 40px;" align="center">名称</td>
							<td><input type="text" name="" class="gyname"></td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">联系人</td>
							<td>
								<div id="chose"><input type="text " name=" " style="width:142px;" class="context"></div>
							</td>
							<td style="background-color: #D3D3D3;width: 100px; " align="center">电话</td>
							<td>
								<div id="chose1 " style="float:left;width:50px; "><input type="text " name=" " style="width:143px;" class="phone"></div>
							</td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3;width: 50px;" align="center">地址</td>
							<td colspan="3"><input type="text" name="" style="width: 390px;"class="address"></td>
						</tr>

				</table>
				<div class="colo" style="background-color: #EBE9ED;">
					<div id="b1" style="float: left;background-color:#EBE9ED; "><input type="button" value="保存" style="width:100px;height:40px;margin-left: 296px;"></div>
					<div id="b2" style="float: left;background-color:#EBE9ED; "><input type="reset" value="放弃" style="width:100px;height:40px;margin-left: 0px;"></div>
					
				</div>
				</form>
			</div>

			 
			<div id="hiddenn" style="position: absolute;top:250px; border: 1px solid cornflowerblue; width: 500px; height:137px; border-radius: 5px;margin-left: 180px;display: none;z-index:3;">
				<form id="info2" action="#" method="post">
				<table style="border:1px solid #B5B4B8; background-color: #EBE9ED;">
					<tr>
						<td colspan="4" align="center" style="background-color: #D3D3D3;">供应商信息</td>
					</tr>
					
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">编号</td>
							<td><input type="text" name="" placeholder="自动编号" disabled="disabled" style="width:147px;" id="bhao1"></td>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">名称</td>
							<td><input type="text" name="gyname" class="gyname2" placeholder="" style="width:152px;"></td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3; width: 100px;" align="center">联系人</td>
							<td>
								<div id="chose"><input type="text " name="contextp" style="width:147px;" class="context2" placeholder=" "></div>
							</td>
							<td style="background-color: #D3D3D3;width: 110px; " align="center">电话</td>
							<td>
								<div id="chose1 " style="float:left;width:100px; "><input class="phone2" type="text" name="phone" style="width:152px;"  placeholder=" "></div>
							</td>
						</tr>
						<tr>
							<td style="background-color: #D3D3D3;width: 50px;" align="center">地址</td>
							<td colspan="3"><input type="text" name="" style="width: 414px;" class="address2"></td>
						</tr>

				</table>
				<div class="colo" style="background-color: #EBE9ED;">
					<div id="bb1" style="float: left;background-color:#EBE9ED; "><input type="button" value="保存" style="width:100px;height:40px;margin-left: 300px;"></div>
					<div id="bb2" style="float: left;background-color:#EBE9ED; "><input type="button" value="放弃" style="width:100px;height:40px;margin-left: 0px;"></div>
					
				</div>
				</form>
			</div>

			 
			<div id="shanchu" style="position:absolute;top:300px;border: 1px solid #B5B4B8; left:400px; width:220px;height:100px;display:none;background-color: #135A92;z-index:3;">
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
		<div id="hidden3" style="display:none;"></div>
	</body>
	<script>
	    var page=1;
		var value=$("#rbody .guoshui :eq(0)").find(".bm").text();
		var value1=$("#rbody .guoshui :eq(0)").find(".mz").text();
		var value2=$("#rbody .guoshui :eq(0)").find(".glx").text();
		var value3=$("#rbody .guoshui :eq(0)").find(".jin").text();
		var value4=$("#rbody .guoshui :eq(0)").find(".dae").text();
		
		$("#rbody .guoshui :eq(0)").css("background-color","#135A92");
		$("#rbody .guoshui").click(function() {
			$(this).css("background-color", "#135A92");
			$(this).siblings().css("background-color", "white");
			value = $(this).find(".bm").text();
			value1 = $(this).find(".mz").text();
			value2 = $(this).find(".glx").text();
			value3 = $(this).find(".jin").text();
			value4 = $(this).find(".dae").text();
			 
		}) 
		//显示全部
		$(".allscreen").click(function() {
		$(".sousuogys").val("");
		   $.ajax({
  			url:"giver/findAt.do",
  			dataType:"html",
  			data:{"page":page},
  			success:function(result){
  				$("#gysajaxs").html(result);
  			}
  		}); 
		})
		
		
		
		 
		
		//按要求查询
		$(".chaxungys ").click(function() {
		  //alert($("#aja").val());
		  if($(".sousuogys").val().trim().length==0)
		  {
		   alert("未输入查询值")
		  }
		  else{
       //alert(t);
        
       $.ajax({
  			url:"giver/ajaxQ.do",
  			dataType:"html",
  			data:{"typed":$("#aja").val(),"zhi":$(".sousuogys").val(),"page":page},
  			success:function(result){
  				$("#gysajaxs").html(result);
  			}
  		}); 
		  }
		})
		
		//按要求查询数据
		//添加
		$("#rbody .caozuo1").click(function() {
			$("#rbody #hidden").css("display", "block");
			 $("#hidden3").css("display", "block"); 
			  //$("#bhao").val(value);  
		})

		//修改
		$("#rbody .caozuo3").click(function() { 
		$("#rbody #bhao1").val(value);
		$("#rbody .gyname2").val(value1);
		$("#rbody .context2").val(value2);
	    $("#rbody .phone2").val(value3);
	    $("#rbody .address2").val(value4);  
		$("#rbody #hiddenn").css("display", "block");
		$("#hidden3").css("display","block");   
		})

		//删除数据
		$("#rbody .caozuo2").click(function() { 
			$("#rbody #shanchu").css("display", "block");
			 $("#hidden3").css("display","block"); 

		})
		//删除数据成功
		$("#rbody .Y").click(function() {
			//alert(value);
           $.ajax({
  			url:"giver/ajaxQdele.do",
  			dataType:"html",
  			data:{"id":value},
  			success:function(result){
  				$("#gysajaxs").html(result);
  			},error:function(result){
  			 
  				       alert("该供货商有供货记录，不可删除");
  			        }
  		});  
			$("#rbody #shanchu").css("display", "none");
			$("#hidden3").css("display","none"); 
		})
		//取消删除
		$("#rbody .N").click(function() {
		//alert(value);
			$("#rbody #shanchu").css("display", "none");
             $("#hidden3").css("display","none"); 

		})

		$("#rbody .caozuo1").mouseenter(function() {
			$("#rbody .caozuo1 img").attr("src", "images/zj/add1.jpg");
			$("#rbody #ck").css("background-color", "#C2C9CF");
			 
			/*$("#ck").css("border","1px solid greenyellow");*/

		}).mouseleave(function() {
			$("#rbody .caozuo1 img").attr("src", "images/zj/add.jpg");
			$("#rbody #ck").css("background-color", "white");
			$("#rbody #ck").css("border", "white");
		})
		$("#rbody .caozuo2").mouseenter(function() {
			$("#rbody .caozuo2 img").attr("src", "images/zj/dele1.jpg");
			$("#rbody #ck2").css("background-color", "#C2C9CF");
			/*$("#ck2").css("border","1px solid greenyellow");*/

		}).mouseleave(function() {
			$("#rbody .caozuo2 img").attr("src", "images/zj/dele.jpg");
			$("#rbody #ck2").css("background-color", "white");
			$("#rbody #ck2").css("border", "white");
		})
		$("#rbody .caozuo3").mouseenter(function() {
			$("#rbody .caozuo3 img").attr("src", "images/zj/late1.jpg");

			$("#rbody #ck3").css("background-color", "#C2C9CF");
			/*$("#ck3").css("border","1px solid greenyellow");*/

		}).mouseleave(function() {
			$("#rbody .caozuo3 img").attr("src", "images/zj/late.jpg");
			$("#rbody #ck3").css("background-color", "white");
			$("#rbody #ck3").css("border", "white");
		})
		//添加   
		//保存添加数据
		/*$("#b1").click(function() {
			/*$("#hidden").css("display", "none");
			//alert($(this).find(".cname1").text());
			 $(".gyname").val("");
			 $(".context").val("");
			 $(". phone").val("");
			 $(".address").val("");
		})*/
		
		
		//放弃添加数据
		$("#rbody #b2").click(function() {
			$("#rbody #hidden").css("display", "none");
			//alert($(this).find(".cname1").text());
			$("#rbody .gyname").val("");
			 $("#rbody .context").val("");
			 $("#rbody .phone").val("");
			 $("#rbody .address").val("");
			 $("#hidden3").css("display", "none"); 
		})
		//修改
		//保存添加数据
		var success = 1;
		var phon = /^1[3|4|5|8][0-9]\d{4,8}$/;
			  
		$("#rbody #b1").click(function() { 
		//alert($("#rbody #hidden .context").val());
		    $.ajax({
  			       url:"giver/gongyingsagin.do",
  			       dataType:"JSON",
  			       data:{"name":$("#rbody #hidden .context").val()},
  			        success:function(result){
  			        if(result==0)
  			        {
  			         if($("#rbody #hidden .gyname").val().trim().length==0) {
				//空
				          alert( "名称不能为空");
				               success = 0;
			                    }
			  
		             else	if(!phon.test($("#rbody #hidden .phone").val().trim())) {
				          alert("不是完整的11位手机号或者正确的手机号前七位");
				               success = 0;
			               } 
			            else  if(!$("#rbody #hidden .context").val()) {
				//空
			                   alert("联系人不能为空");
				              success = 0;
			                 }
			        else {
			 
			     //alert($("#hidden .address").val());
				//$("#rbody #hiddenn").css("display", "none");
				//alert($(this).find(".cname1").text());
				//alert($("#rbody .gyname").val());
				    $.ajax({
  			          url:"giver/ajaxQadd.do",
  			          dataType:"html",
  			          data:{"name":$("#rbody .gyname").val(),"content":$("#rbody .context").val(),"cell":$("#rbody .phone").val(),"address":$("#rbody .address").val(),"page":page},
  			           success:function(result){
  				      $("#gysajaxs").html(result);
  				     //alert("1");
  			          },error:function(result){
  			 
  				       alert("该供货商有供货记录，不可删除");
  			        }
  		        }); 
				
				//$("#rbody #info1").submit();
				$("#rbody #hidden").css("display", "none");
			   //alert($(this).find(".cname1").text());
			    $("#rbody .gyname").val("");
			    $("#rbody .context").val("");
			    $("#rbody .phone").val("");
			    $("#rbody .address").val(""); 
			    $("#hidden3").css("display", "none"); 	
			}
			 
  			        }
  			        else{
  			        alert("名称不合格");
  			        } 
  			        }
  			        })
		 
			})
			
		var mothin = 1;
		var phon1 = /^1[3|4|5|8][0-9]\d{4,8}$/;
		$("#rbody #bb1").click(function() {
		//alert($(".gyname2").val());
		//alert($(".context2").val());
		 if($("#rbody .gyname2").val().length==0) {
				//空
				alert( "名称不能为空");
				mothin = 0;
			   }
			  
		    else	if(!phon1.test($("#rbody .phone2").val().trim())) {
				alert("不是完整的11位手机号或者正确的手机号前七位");
				mothin = 0;
			} 
			else  if(!$("#rbody .context2").val()) {
				//空
				alert("联系人不能为空");
				mothin = 0;
			   }
			 
		else {
		//alert(value);	
				 $.ajax({
  			       url:"giver/ajaxQXiugai.do",
  			       dataType:"html",
  			       data:{"id":$("#rbody #bhao1").val(),"name":$("#rbody .gyname2").val(),"content":$("#rbody .context2").val(),"cell":$("#rbody .phone2").val(),"address":$("#rbody .address2").val(),"page":page},
  			        success:function(result){
  				     $("#gysajaxs").html(result);
  			        }
  		        });   
			$("#rbody #hiddenn").css("display", "none");
			//alert($(this).find(".cname1").text());
			//$("#rbody #info2").submit();
			 $("#rbody .gyname2").val("");
			 $("#rbody .context2").val("");
			 $("#rbody .phone2").val("");
			 $("#rbody .address2").val("");
			 $("#hidden3").css("display", "none"); 
			 } 
		})

		//放弃修改数据
		$("#rbody #bb2").click(function() {
			$("#rbody #hiddenn").css("display", "none");
			//alert($(this).find(".cname1").text());
			$("#rbody .gyname2").val("");
			 $("#rbody .context2").val("");
			 $("#rbody .phone2").val("");
			 $("#rbody .address2").val("");
			 $("#hidden3").css("display", "none"); 
		})
		
		$("#rbody #pages").css("margin-top","15px");
	$("#rbody #pages input").css({"padding-left":"5px","padding-right":"5px"});
		if("${zy }"!=0){
			$("#rbody #pages input").eq("${page+1}").css({"background":"#135A92","color":"#ffffff"});
			$("#rbody #pages input").eq("${page+1}").attr("disabled","disabled");
			}
		$("#rbody #pages input").mouseenter(function(){
				$(this).css({"background":"#135A92","color":"white"});
			}).mouseleave(function(){
				if($(this).index()!="${page+1}")
				$(this).css({"background":"white","color":"#000000"});
			});
		
		if("${page}"==1){
			$("#rbody #pages input").eq(0).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody #pages input").eq(0).attr("disabled","disabled");
			$("#rbody #pages input").eq(1).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody #pages input").eq(1).attr("disabled","disabled");
		}else{
			$("#rbody #pages input").eq(0).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody #pages input").eq(0).removeAttr("disabled");
			$("#rbody #pages input").eq(1).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody #pages input").eq(1).removeAttr("disabled");
		}
		if("${page}"=="${zy }"){
			$("#rbody #pages input").eq("${zy+2}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody #pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#rbody #pages input").eq("${zy+3}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody #pages input").eq("${zy+3}").attr("disabled","disabled");
		}else{
			$("#rbody #pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody #pages input").eq("${zy+2}").removeAttr("disabled");
			$("#rbody #pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody #pages input").eq("${zy+3}").removeAttr("disabled");
		}
		if("${zy }"==0){
			$("#rbody #pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody #pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#rbody #pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody #pages input").eq("${zy+3}").attr("disabled","disabled");
		}
		
		$("#rbody #pages input").click(function(){
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
  			url:"giver/ajaxQ.do",
  			dataType:"html",
  			data:{"typed":$("#aja").val(),"zhi":$(".sousuogys").val(),"page":page},
  			success:function(result){
  				$("#gysajaxs").html(result);
  			}
  		}); 
				
				 
					
			});
	 
		
	</script>

</html>