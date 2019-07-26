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
       <table border="0px" cellspacing="0px" cellpadding="0px" cellspacing="0px" id="ajaxcpinn">
					<tr id="list">
						<td style="width: 80px;color: #B6BBC3;background-color: #354148;">&nbsp;&nbsp;&nbsp;&nbsp;编号</td>
						<td style="width: 130px;color: #B6BBC3;background-color: #354148;">&nbsp;&nbsp;&nbsp;&nbsp;材料类型</td>
						<td style="width: 80px;color: #B6BBC3;background-color: #354148;">材料名称</td>
						<td style="width: 100px;color: #B6BBC3;background-color: #354148;">数量</td>
					</tr>
					<c:forEach items="${yclfood}" var="cpdu">
					<tr class="guoshui" style="background-color:white; color: black;border: 0.5px solid gainsboro;">
						<td class="bm" style="width: 80px; border: 0.5px solid gainsboro;" align="center">${cpdu.id}</td>
						<td class="mz" style="width: 130px; border: 0.5px solid gainsboro;">${cpdu.j}</td>
						<td class="glx" style="width: 80px;  border: 0.5px solid gainsboro;">${cpdu.n}</td>
						<td class="jin" style="width: 100px;  border: 0.5px solid gainsboro;">${cpdu.num}</td> 
						<input class="cdidderas" type="hidden" value="${cpdu.materialsid}">
						  <input class="cdi" type="hidden" value="${cpdu.es}">
						 <input class="cdiw" type="hidden" value="${cpdu.w}">
					</tr>
					</c:forEach> 
				</table> 
  </body>
  <script type="text/javascript">
        var value=$("#ajaxcpinn .guoshui :eq(0)").find(".bm").text();
		var value1=$("#ajaxcpinn .guoshui :eq(0)").find(".mz").text();
		var value2=$("#ajaxcpinn .guoshui :eq(0)").find(".glx").text();
		var value3=$("#ajaxcpinn .guoshui :eq(0)").find(".jin").text();
		var value4;
		var value5;
		var value6;
		$("#ajaxcpinn .guoshui :eq(0)").find(".bm").css("background-color", "#135A92");
        $("#ajaxcpinn .guoshui").click(function() {
			$(this).css("background-color", "#135A92");
			$(this).siblings().css("background-color", "white");
			 value = $(this).find(".bm").text();
			 value1 = $(this).find(".mz").text();
		     value2= $(this).find(".glx").text();
			 value3 = $(this).find(".jin").text();
             value4=$(this).find(".cdidderas").attr("value");
             value5=$(this).find(".cdi").attr("value");
             value6=$(this).find(".cdiw").attr("value");
		})
  </script>
</html>
