<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'htqueryCanTai.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
<script type="text/javascript">
  		/* $("#showcanhetai div").click(function(){
		 		if($(this).attr("id")!="slc"){
		 			alert("a");
		 			$(this).css({"background":"#FF7900"}).attr("id","slc");
		 		}else{
		 			alert("b");
		 			$(this).css({"background":"#F9D6B6"}).attr("id","");
		 		}
		 }); */
		/* $("#htqueren").live('click',function(){

			$("#showcanhetai div").each(function(){
  			if($(this).attr("id")=="slc"){
  				htarray.push($(this).find(".canhetaitableid").val());
  				alert("大小"+htarray.length);	
  			}
  		});	
	
		});	 */	  
</script>
  <body>
	 		<c:forEach items="${canhetaitable}" var="t">
	 			<c:if test="${t.id!=htfutableid}">
			 	<div id="" class="d1"  style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: #F9D6B6;border-radius:5px 5px 5px 5px;cursor: pointer;">
			 	<input class="canhetaitableid" type="hidden" value="${t.id}"/>
			 	<input class="fuhetaitableid" type="hidden" value="${htfutableid}"/>
				<input class="ddcantai" type="hidden" value="${ddcantai}"/>
				<input class="ddstate" type="hidden" value="${ddstate}"/>
				<input class="ddarea" type="hidden" value="${ddarea}"/>	 		 			
		 			<div style="height: 86px;width: 100%;float: left;text-align: center;line-height: 86px;">
		 				${t.name }
		 			</div>
		 		</div> 
		 		</c:if>
	 		</c:forEach>
  </body>
<script type="text/javascript">

</script>
</html>
