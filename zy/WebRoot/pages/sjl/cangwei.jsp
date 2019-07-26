<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cangwei.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/sjl/cangwei.css"/>
	<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>

  </head>
  
  <body style="font-family: '微软雅黑';">
		<div id="rbody1">
			<div id="rtop1">
				<div class="change"><img src="images/sjl/添加.jpg" width="35" height="35" align="center"/>&nbsp;添加</div>
				<div class="change"><img src="images/sjl/修改.jpg" width="35" height="35" align="center"/>&nbsp;修改</div>
				<div class="change"><img src="images/sjl/删除.jpg" width="35" height="35" align="center"/>&nbsp;删除</div>
			</div>
			<div id="rtitle">
				<table cellpadding="0" cellspacing="0" >
					<tr height="30">
						<td style="background: #354148;color: #B6BBC3;" width="20"></td>
						<td style="background: #354148;color: #B6BBC3;text-align: center;" width="80" >编码</td>
						<td style="background: #354148;color: #B6BBC3;text-align: center;" width="220">名称</td>
						<td style="background: #354148;color: #B6BBC3;">&nbsp;&nbsp;备注</td>
					</tr>
				</table>
				<input type="hidden" id="ck-page" value="${page }"/>
				<table class="ddd" cellpadding="0" cellspacing="0" >
					<c:forEach items="${cktable }" var="ckt">
					<tr>
						<td style="text-align: center;" width="20" ><a>▶</a></td>
						<td style="text-align: center;" width="80" class="cid">${ckt.id}</td>
						<td style="text-align: center;"  width="220" class="cname">${ckt.name } </td>
						<td class="cinfo">${ckt.info }</td>
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
			<!--覆盖层-->
			<div id="hidden1"></div>
			<!--添加框-->
			<div id="change1" class="tankuang">
				<div class="neirong">
				<form action="Cangku/addNews.do?page=${page }" method="post" >
					<table cellspacing="0" cellpadding="0">
						<tr>
							<td class="stitle">编码：</td>
							<td><input type="text" value="自动编码" disabled="disabled" name="id"/></td>
						</tr>
						<tr>
							<td class="stitle">名称：</td>
							<td><input type="text" placeholder="请输入名称（必填）"  name="name" class="name"/></td>
						</tr>
						<tr>
							<td class="stitle">备注：</td>
							<td>
								<textarea name="info" placeholder="请输入备注" cols="22" rows="5"  class="info"></textarea>
							</td>
						</tr>
					</table>
					<br/>
					<input type="button" value="确定"  class="sub" id="sub1"/>
					<input type="button" value="放弃"  class="res" id="res1"/>
				</form>
				</div>
			</div>
			<!--修改框-->
			<div id="change2" class="tankuang">
				<div class="neirong">
				<form action="" method="post" >
					<table cellspacing="0" cellpadding="0">
						<tr>
							<td class="stitle">编码：</td>
							<td><input type="text" value="编码号显示" disabled="disabled" name="id" id="c2id"/></td>
						</tr>
						<tr>
							<td class="stitle">名称：</td>
							<td><input type="text" value="名称" name="name" class="name" id="c2name"/></td>
						</tr>
						<tr>
							<td class="stitle">备注：</td>
							<td>
								<textarea name="info" cols="22" rows="5"  class="info" id="c2info">备注</textarea>
							</td>
						</tr>
					</table>
					<br/>
					<input type="button" value="确定"  class="sub" id="sub2"/>
					<input type="button" value="放弃"  class="res" id="res2"/>
				</form>
				</div>
			</div>
			<!--删除框-->
			<div id="change3">
				<div class="del">
				<p style="font-size: 16px;">是否确认删除！！</p>
				<br/>
				<input type="button" value="确定"  class="sub" id="sub3"/>
				<input type="button" value="放弃"  class="res" id="res3"/>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/sjl/cangwei.js" ></script>
	<script type="text/javascript">
	$("#rbody1 #pages").css("margin-top","15px");
	$("#rbody1 #pages input").css({"padding-left":"5px","padding-right":"5px"});
		if("${zy }"!=0){
			$("#rbody1 #pages input").eq("${page+1}").css({"background":"#00BC9B","color":"#ffffff"});
			$("#rbody1 #pages input").eq("${page+1}").attr("disabled","disabled");
			}
		$("#rbody1 #pages input").mouseenter(function(){
				$(this).css({"background":"#00BC9B","color":"white"});
			}).mouseleave(function(){
				if($(this).index()!="${page+1}")
				$(this).css({"background":"white","color":"#000000"});
			});
		
		if("${page}"==1){
			$("#rbody1 #pages input").eq(0).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody1 #pages input").eq(0).attr("disabled","disabled");
			$("#rbody1 #pages input").eq(1).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody1 #pages input").eq(1).attr("disabled","disabled");
		}else{
			$("#rbody1 #pages input").eq(0).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody1 #pages input").eq(0).removeAttr("disabled");
			$("#rbody1 #pages input").eq(1).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody1 #pages input").eq(1).removeAttr("disabled");
		}
		if("${page}"=="${zy }"){
			$("#rbody1 #pages input").eq("${zy+2}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody1 #pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#rbody1 #pages input").eq("${zy+3}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody1 #pages input").eq("${zy+3}").attr("disabled","disabled");
		}else{
			$("#rbody1 #pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody1 #pages input").eq("${zy+2}").removeAttr("disabled");
			$("#rbody1 #pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody1 #pages input").eq("${zy+3}").removeAttr("disabled");
		}
		if("${zy }"==0){
			$("#rbody1 #pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody1 #pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#rbody1 #pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody1 #pages input").eq("${zy+3}").attr("disabled","disabled");
		}
		
		$("#rbody1 #pages input").click(function(){
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
					url:"Cangku/pageById.do",
					dataType:"html",
					data:{"page":page},
					success:function(result){
					$("#rbody1 #rtitle").html(result);
				}
				});
					
			});
		
		
	
	</script>
</html>
