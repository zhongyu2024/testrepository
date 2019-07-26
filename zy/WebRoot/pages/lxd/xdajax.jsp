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
    
    <title>My JSP 'yybb.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="/ZhongyuSystem/css/lxd/yewubaobiao.css" type="text/css" />
	<script type="text/javascript" src="/ZhongyuSystem/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="/ZhongyuSystem/laydate/laydate.js"></script>	
  </head>
  
  <body style="background-color: #F5F5F5">
			  <table> style="border:1px solid  black; "  
			    <tr>
			       <td colspan="2" align="center">营业综合统计报表</td>
			    </tr>
			    <tr>
			     <td  align="left">
			     <div> 开始时间</div>
			     <div>结束时间  </div>
			     </td>
			     <td  align="right">
			      <div>${time1}</div>
			       <div>${time2}</div>
			     </td>
			     </tr> 
			    <tr>
			     <td align="left" width="60">折扣</td>
			     <td align="left" width="60">营业总额（实付）</td>
			     <td align="left" width="60">总单数</td>
			     <td align="left" width="60">消费人数</td>			    
			    </tr>
			    <tr>			    
			     <td align="right" width="60">${lisAl.discount}</td>
			    <td align="right" width="60">${lisAl.realcount}</td>
			    <td align="right" width="60">${lisAl.danshu}</td>
			    <td align="right" width="60">${lisAl.personcount}</td>
			    </tr> 
			  </table>
	</body>
	 <%-- <table> style="border:1px solid  black; "  
			    <tr>
			       <td colspan="2" align="center">营业综合统计报表</td>
			    </tr>
			    <tr>
			     <td  align="left">
			     <div> 开始时间</div>
			     <div>结束时间  </div>
			     </td>
			     <td  align="right">
			      <div>${time1}</div>
			       <div>${time2}</div>
			     </td>
			     </tr> 
			    <tr>
			     <td align="left">折扣</td>
			     <td align="right">${lisAl.discount}</td>
			    </tr>
			    <tr>
			    <td align="left">营业总额（实付）</td>
			    <td align="right">${lisAl.realcount}</td>
			    </tr>
			    <tr>
			    <td align="left">总单数</td>
			    <td align="right">${lisAl.danshu}</td>
			    </tr>
			    <tr>
			    <td align="left">消费人数</td>
			    <td align="right">${lisAl.personcount}</td>
			    </tr> 
			  </table> --%>


</html>
<script>
	 
	 
	
</script>