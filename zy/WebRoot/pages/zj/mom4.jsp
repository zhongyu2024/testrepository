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
   <table cellpadding="0" cellspacing="0" border="0.5" id="asds">
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
  </body>
  <script type="text/javascript">
   $("#asds .ck1").click(function(){
			 $(this).css("background-color","#BCD68D");
			 $(this).siblings().css("background-color","white");
			 $("#ebody #cfoodstyl1").css("display","none");
			 $("#ebody .danweilx1").val($(this).find(".cname1").text());
			 //alert($(this).find(".cname1").text());
		})
		//新增修改单位
		$("#asds .addtoo").click(function(){
			$("#ebody #aaddsty1").css("display","block");
			 //alert($(this).find(".cname1").text());
		}) 
  </script>
</html>
