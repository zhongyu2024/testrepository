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
        
        <table border="0px" cellspacing="0px" cellpadding="0px" cellspacing="0px" id="detaileajax">
					<tr id="list">
						<td style="width: 400px;color: #B6BBC3;background-color: #354148;"align="center">操作日期</td>
						<td style="width: 320px;color: #B6BBC3;background-color: #354148;"align="center">仓库</td>
						<td style="width: 300px;color: #B6BBC3;background-color: #354148;"align="center">编号</td>
						<td style="width: 400px;color: #B6BBC3;background-color: #354148;"align="center">名称</td>
						<td style="width: 300px;color: #B6BBC3;background-color: #354148;"align="center">类型</td>
						<td style="width: 80px;color: #B6BBC3;background-color: #354148;"align="center">数量</td>
						<td style="width: 300px;color: #B6BBC3;background-color: #354148;"align="center">单位</td>
						<td style="width: 300px;color: #B6BBC3;background-color: #354148;"align="center">操作类型</td> 
					</tr>
					<c:forEach items="${allInfo}" var="allsing">     
					<tr class="guoshui" style="background-color:white; color: black;border: 0.5px solid gainsboro;">
						<td class="bm" style="width: 80px; border: 0.5px solid gainsboro;" align="center">${allsing.timeall}</td>
						<td class="mz" style="width: 130px; border: 0.5px solid gainsboro;"align="center">${allsing.ckname}</td>
						<td class="glx" style="width: 80px;  border: 0.5px solid gainsboro;"align="center">${allsing.clid}</td>
						<td class="jin" style="width: 100px;  border: 0.5px solid gainsboro;"align="center">${allsing.clname}</td>
						<td class="dae" style="width: 480px;  border: 0.5px solid gainsboro;"align="center">${allsing.lxname}</td>
						<td class="san" style="width: 480px;  border: 0.5px solid gainsboro;"align="center">${allsing.count}</td>
						<td class="jing" style="width: 480px;  border: 0.5px solid gainsboro;"align="center">${allsing.dwname}</td>
						<c:if test="${allsing.state==0}">
						<td class="ink" style="width: 480px;  border: 0.5px solid gainsboro;"align="center">入库</td>
						</c:if>
						<c:if test="${allsing.state==1}">
						 <td class="ink" style="width: 480px;  border: 0.5px solid gainsboro;"align="center">出库</td>
						</c:if>
					</tr>
					 </c:forEach>
				</table>
				<div id="pages" >
					<input type="button" value="首页" id="pagetop" />
					<input type="button" value="上一页" id="pagebefor"/>
					<!--循环出页数-->
					<c:forEach begin="1" end="${zy}" var="i">
					<input type="button" value="${i}" class="pagenum"/>
					</c:forEach>
					<!---->
					<input type="button" value="下一页" id="pageafter"/>
					<input type="button" value="末页" id="pagedown"/>
				</div>
  </body>
  <script type="text/javascript">
      var page=1;
          var value= $("#detaileajax .guoshui :eq(0)").css("background-color","#135A92");
		var value=$("#detaileajax .guoshui :eq(0)").find(".bm").text();
		  $("#detaileajax .guoshui").click(function(){
			 $(this).css("background-color","#135A92");
			 $(this).siblings().css("background-color","white");
			 value=$(this).find(".ink").text();
			// alert(value);
			})
			$("#kbody #pages").css("margin-top","15px");
	$("#kbody #pages input").css({"padding-left":"5px","padding-right":"5px"});
		if("${zy }"!=0){
			$("#kbody #pages input").eq("${page+1}").css({"background":"#135A92","color":"#ffffff"});
			$("#kbody #pages input").eq("${page+1}").attr("disabled","disabled");
			}
		$("#kbody #pages input").mouseenter(function(){
				$(this).css({"background":"#135A92","color":"white"});
			}).mouseleave(function(){
				if($(this).index()!="${page+1}")
				$(this).css({"background":"white","color":"#000000"});
			});
		
		if("${page}"==1){
			$("#kbody #pages input").eq(0).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#kbody #pages input").eq(0).attr("disabled","disabled");
			$("#kbody #pages input").eq(1).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#kbody #pages input").eq(1).attr("disabled","disabled");
		}else{
			$("#kbody #pages input").eq(0).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#kbody #pages input").eq(0).removeAttr("disabled");
			$("#kbody #pages input").eq(1).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#kbody #pages input").eq(1).removeAttr("disabled");
		}
		if("${page}"=="${zy }"){
			$("#kbody #pages input").eq("${zy+2}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#kbody #pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#kbody #pages input").eq("${zy+3}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#kbody #pages input").eq("${zy+3}").attr("disabled","disabled");
		}else{
			$("#kbody #pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#kbody #pages input").eq("${zy+2}").removeAttr("disabled");
			$("#kbody #pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#kbody #pages input").eq("${zy+3}").removeAttr("disabled");
		}
		if("${zy }"==0){
			$("#kbody #pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#kbody #pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#kbody #pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#kbody #pages input").eq("${zy+3}").attr("disabled","disabled");
		}
		
		$("#kbody #pages input").click(function(){
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
  			url:"detail/tiaochaxun.do",
  			dataType:"html",
  			data:{"ach":$("#aji").val(),"zhi":$(".souuodetail").val(),"time1":$("#c_a").val(),"time2":$("#c_b").val(),"page":page},
  			success:function(result){
  				$("#detailjjax").html(result);
  			},error:function(result){
  		     alert("未查到该信息");
  		 }
  		}); 
				 
					
			});
	 
			 
	    
  </script>
</html>
