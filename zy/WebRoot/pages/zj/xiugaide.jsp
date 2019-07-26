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
									
									<table cellpadding="0" cellspacing="0" border="0.5" id="ewk">
										<tr>
											<td colspan="2" style="padding-left:26px;background-color: #EBE9ED;border: 0.5px solid gainsboro;" align="center">名称</td>
										</tr> 
										   <c:forEach items="${fd}" var="yccse_1">
											<tr class="ckcaer" style="background-color:white;">
												<td><input type="button" value=">" style="width:20px;height: 23px;border: 0.5px solid gainsboro;"></td>
												<td class="nameycliaker" width="140px" align="center" style="border: 0.5px solid gainsboro;">
												 <div class="clncler">${yccse_1.name}</div>
												<input class="cdidderee" type="hidden" value="${yccse_1.id}">
												<input class="dwnamewcder" type="hidden" value="${yccse_1.dwnamew}">
												<input class="namecder" type="hidden" value="${yccse_1.cln}"> 
												<input class="coint" type="hidden" value="${yccse_1.coint}">
												<input class="info" type="hidden" value="${yccse_1.inftion}">
												</td> 
											</tr>
											</c:forEach>  
									</table>
									
									
									
									
								   
        
  </body>
  <script type="text/javascript">
         var cp_2; 
         //zd_er  zd_1yer mcader ckcaer nameycliaker clncler cdidderee dwnamewcder namecder coint info
         //clearname clearcaimin1 clearcailiao1 yuanleixin1 danweilx1 clearcount1 clearbeizhu1
		$("#ewk .ckcaer").click(function() {
		//alert(cp_2);
			$(this).css("background-color", "#BCD68D");
			$(this).siblings().css("background-color", "white");
			$("#sbody #mcader").css("display", "none");
			$("#sbody .clearname").val($(this).find(".clncler").text());
			alert($(this).find(".clncler").text());
			//alert(1);
			 
			$("#sbody .clearcaimin1").val(cp_2);
			//alert($(this).find(".clncl").text());
			//菜名编号cp_2 材料编号 cdidd  单位dwnamewcd 类型namecd
			//alert($(this).find(".cdidd").attr("value"));
			$("#sbody .clearcailiao1").val($(this).find(".cdidderee").attr("value"));
			$("#sbody .yuanleixin1").val($(this).find(".namecder").attr("value"));
			$("#sbody .danweilx1").val($(this).find(".dwnamewcder").attr("value"));
			 //alert("aaaaa"+$(this).find(".dwnamewcd").attr("value")); 	 
		}) 
		
  </script>
</html>
