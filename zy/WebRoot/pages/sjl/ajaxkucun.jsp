<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ajaxkucun.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table cellpadding="0" cellspacing="0" style="text-align: center;">
		<tr height="30">
			<td style="background: #354148;color: #B6BBC3;" width="90" >仓库号</td>
			<td style="background: #354148;color: #B6BBC3;" width="110" >仓库名</td>
			<td style="background: #354148;color: #B6BBC3;" width="100" >材料编码</td>
			<td style="background: #354148;color: #B6BBC3;" width="150" >材料名称</td>
			<td style="background: #354148;color: #B6BBC3;" width="140" >类型</td>
			<td style="background: #354148;color: #B6BBC3;" width="90" >数量</td>
			<td style="background: #354148;color: #B6BBC3;" width="90" >单位</td>
		</tr>
	</table>
	<table class="kc-ddd" cellpadding="0" cellspacing="0" style="text-align: center;">
		<c:forEach items="${ckctable }" var="ckct">
		<tr height="30" >
			<td width="90" >${ckct.cangkuid }</td>
			<td width="110" >${ckct.ckname }</td>
			<td width="100" >${ckct.materialsid }</td>
			<td width="150" >${ckct.mname }</td>
			<td width="140" >${ckct.mtype }</td>
			<td width="90" >${ckct.num }</td>
			<td width="90" >${ckct.dw }</td>
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
  </body>
  <script type="text/javascript">
  	$(".kc-ddd tr").mouseenter(function(){
		$(this).css("background","#DBE4ED");
	}).mouseleave(function(){
		$(this).css("background","#FFFFFF");
	});
	
	
	$("#rbody4 #pages").css("margin-top","15px");
	$("#rbody4 #pages input").css({"padding-left":"5px","padding-right":"5px"});
		if("${zy }"!=0){
			$("#rbody4 #pages input").eq("${page+1}").css({"background":"#00BC9B","color":"#ffffff"});
			$("#rbody4 #pages input").eq("${page+1}").attr("disabled","disabled");
			}
		$("#rbody4 #pages input").mouseenter(function(){
				$(this).css({"background":"#00BC9B","color":"white"});
			}).mouseleave(function(){
				if($(this).index()!="${page+1}")
				$(this).css({"background":"white","color":"#000000"});
			});
		
		if("${page}"==1){
			$("#rbody4 #pages input").eq(0).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody4 #pages input").eq(0).attr("disabled","disabled");
			$("#rbody4 #pages input").eq(1).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody4 #pages input").eq(1).attr("disabled","disabled");
		}else{
			$("#rbody4 #pages input").eq(0).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody4 #pages input").eq(0).removeAttr("disabled");
			$("#rbody4 #pages input").eq(1).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody4 #pages input").eq(1).removeAttr("disabled");
		}
		if("${page}"=="${zy }"){
			$("#rbody4 #pages input").eq("${zy+2}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody4 #pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#rbody4 #pages input").eq("${zy+3}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody4 #pages input").eq("${zy+3}").attr("disabled","disabled");
		}else{
			$("#rbody4 #pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody4 #pages input").eq("${zy+2}").removeAttr("disabled");
			$("#rbody4 #pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody4 #pages input").eq("${zy+3}").removeAttr("disabled");
		}
		if("${zy }"==0){
			$("#rbody4 #pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody4 #pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#rbody4 #pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody4 #pages input").eq("${zy+3}").attr("disabled","disabled");
		}
	
			$("#rbody4 #pages input").click(function(){
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
			url:"Cangkucun/findByText.do",
	  		dataType:"html",
	  		data:{"text":text,"type":type,"page":page},
	  		success:function(result){
	  			$("#rbody4 #rtitle").html(result);
			}
		});
	});
	
	
  
  </script>
</html>
