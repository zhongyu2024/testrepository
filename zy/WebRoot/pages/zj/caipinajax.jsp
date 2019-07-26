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
       <table border="0px" cellspacing="0px" cellpadding="0px" cellspacing="0px" style="font-size: 13px;" id="caixiajax">
				<tr>
					<td style="background-color: #354148;"></td>
					<td style="width: 180px;color: #B6BBC3;background-color: #354148;"align="center">菜名</td>
					<td style="width: 130px;color: #B6BBC3;background-color: #354148;"align="center">编号</td>
					<td style="width: 130px;color: #B6BBC3;background-color: #354148;"align="center">单价</td>
					<td style="width: 130px;color: #B6BBC3;background-color: #354148;"align="center">状态</td>
				</tr>
				<c:forEach items="${cdfood}" var="caidangall">
				<tr class="caipin" style="color: black;border: 0.5px solid gainsboro;background-color: white;cursor:pointer;">
					<td class="fuhao" style="border: 0.5px solid gainsboro;" align="center">
						<input class="fh" type="button" value=">" style="width:20px;height: 20px; display:none;" > 
					</td>
					<td class="bmdu" style="width: 600px;height:25px; border: 0.5px solid gainsboro;" align="center">${caidangall.name}</td>
					<td class="mzdu" style="width: 100px;height:25px; border: 0.5px solid gainsboro;"align="center">${caidangall.id}</td>
					<td class="glxdu" style="width: 80px;height:25px; border: 0.5px solid gainsboro;"align="center">${caidangall.price}</td>
					<td class="jindu" style="width: 0px;height:25px; border: 0.5px solid gainsboro;"align="center">${caidangall.state}</td>
				</tr>
				 </c:forEach> 
			</table>
  </body>
  <script type="text/javascript">
        var cp_1=$("#caixiajax .caipin:eq(0)").find(".bmdu").text();
		var cp_2=$("#caixiajax .caipin:eq(0)").find(".mzdu").text();
		var cp_3=$("#caixiajax .caipin:eq(0)").find(".glxdu").text();
		var cp_4=$("#caixiajax .caipin:eq(0)").find(".jindu").text();
		 $("#caixiajax .caipin :eq(0)").find(".fh").css("display","block");
		 $("#caixiajax .caipin:eq(0)").css("background-color", "#135A92");
	 
	 
	 
	 
	 
		 
		$("#caixiajax .caipin").click(function() {
			$(this).css("background-color", "#135A92");
			$(this).siblings().css("background-color", "white");
//			alert($(this).find(".bm").text()); 
            $(this).find(".fh").css("display", "block");
			$(this).siblings().find(".fh").css("display","none");
			cp_1=$(this).find(".bmdu").text();
			cp_2=$(this).find(".mzdu").text();
			cp_3=$(this).find(".glxdu").text();
			cp_4=$(this).find(".jindu").text();
			//alert(cp_1);
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
  		$(this).css("disabled","disabled");
  		 alert("尚未配菜"); 
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
        
  </script>
</html>
