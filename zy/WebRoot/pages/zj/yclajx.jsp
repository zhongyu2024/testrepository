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
    
    <title>My JSP 'gysajax.jsp' starting page</title>
    
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
  
    <table border="0px" cellspacing="0px" cellpadding="0px" cellspacing="0px" style="magin-left:-10px;" id="bodyycl">
					<tr id="list">
						<td style="width: 80px;color: #B6BBC3;background-color: #354148;">&nbsp;&nbsp;&nbsp; 编码</td>
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
  </body>
  <script type="text/javascript">
  var page=1;
         var value=$("#bodyycl .guoshui :eq(0)").find(".bm").text();
		var value1=$("#bodyycl .guoshui :eq(0)").find(".mz").text();
		var value2=$("#bodyycl .guoshui :eq(0)").find(".glx").text();
		var value3=$("#bodyycl .guoshui :eq(0)").find(".jin").text();
		var value4=$("#bodyycl .guoshui :eq(0)").find(".dae").text();
            $("#bodyycl .guoshui :eq(0)").css("background-color","#135A92");
		    $("#bodyycl .guoshui").click(function() {
			$(this).css("background-color", "#135A92");
			$(this).siblings().css("background-color", "white");
			value = $(this).find(".bm").text();
			value1 = $(this).find(".mz").text();
			value2 = $(this).find(".glx").text();
			value3 = $(this).find(".jin").text();
			value4 = $(this).find(".dae").text(); 
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
