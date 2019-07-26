<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'situation.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background: #E6EAED;font-family: 微软雅黑;">
    <div id="showView">
		<table style="width:100%">
			<tr style="width:100%;height:50px;border-bottom:1px solid #DADADA;">
				<!-- 报表头部 -->
				<td colspan="2" style="border-bottom:1px solid #DADADA;background:#354148;color:white;border-radius:5px;padding-left: 20px; ">
					<span style="float:left;font-weight:bold;">营业收入:￥${total}</span>
					<span style="float:left;margin-left:20px;">总订单数:${sum }</span>
					<span style="float:left;margin-left:10px;">总消费人数:${hum }</span>
					<span style="float:left;margin-left:10px;">人均消费:￥${renjun }</span>
					<span style="float:left;margin-left:10px;">客单价:￥${kedan}</span>
				</td>
			</tr>
			<tr style="height:180px;">
				<td width="50%">
					<table cellspacing="50%" style="border-collapse:collapse;width:50%;border-top:1px solid #DADADA;border-right:1px solid #DADADA;border-bottom:1px solid #DADADA;background: #BFBFBE;color:white;border-radius:5px;margin-left:10px; ">
						<tr style="float:left;border-bottom:1px solid #DADADA;">
							<td colspan="4" style="height:30px;">销售汇总</td>
						</tr>
						<tr style="height:30px;border-bottom:1px dashed #DADADA;">
							<td colspan="4" style="float:left;width:515px;">菜类</td>  
						</tr>
<%-- 						<c:forEach items="${clist}" var="cooktype">
 --%>					<tr style="height:30px;">
							<td style="width:515px;float:left;">精致冷碟</td>
							<td colspan="3"></td>
							<td>${total }</td>
						</tr>
<%-- 						</c:forEach>
 --%>					
 						<tr style="height:30px;">
							<td style="width:515px;float:left;">精致热菜</td>
							<td colspan="3"></td>
							<td>${a2}</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:515px;float:left;">特色小炒</td>
							<td colspan="3"></td>
							<td>${a3}</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:515px;float:left;">川府菜肴</td>
							<td colspan="3"></td>
							<td>${a4}</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:515px;float:left;">精品点心</td>
							<td colspan="3"></td>
							<td>${a5}</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:515px;float:left;">酒水饮料</td>
							<td colspan="3"></td>
							<td>${a6}</td>
						</tr>
 						<tr style="height:30px;border-bottom:1px dashed #DADADA;">
								<td style="width:150px;float:left;">小计:</td>
								<td colspan="3"></td>
								<td>￥${total}</td>						
						</tr>
						<tr style="height:30px;">
							<td style="width:150px;float:left;">免单金额:</td>
							<td colspan="3"></td>
							<td>-0.00</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:150px;float:left;">服务费:</td>
							<td colspan="3"></td>
							<td>-0.00</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:150px;float:left;">抹零:</td>
							<td colspan="3"></td>
							<td>-0.00</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:150px;float:left;">手动优惠:</td>
							<td colspan="3"></td>
							<td>-0.00</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:150px;float:left;">总额:</td>
							<td colspan="3"></td>
							<td>￥${total}</td>
						</tr>
					</table>
				</td>
				<td>
					<table style="margin-left:-280px;height:340px;margin-bottom:90px;text-align:center;border-collapse:collapse;background: #BFBFBE;border-radius:6px;color:white;width:1000px;">
						<tr style="height:30px;float:left;border-bottom:1px solid #DADADA;">
							<td>支付汇总</td>
						</tr>
						<tr style="height:60px;border-bottom:1px dashed #DADADA;">
							<td style="width:200px;float:left;">支付方式</td> 
							<td style="width:130px;">单数</td> 
							<td style="width:130px;">实付</td> 
							<td style="width:130px;">实收</td>
						</tr>
						<tr style="height:60px;">
							<td>现金支付</td>
							<td>${sum }</td>
							<td>${total}</td>
							<td>${total}</td>
						</tr>
						<tr style="height:60px;border-top:1px solid #DADADA;border-bottom:1px dashed #DADADA;">
							<td>合计:</td>
							<td></td>
							<td>￥${total }</td>
							<td>￥${total }</td>
						</tr>
						<tr style="height:50px;float:left;">
							<td style="">会员充值</td>
						</tr>
						<tr style="height:100px;border-top:1px solid #DADADA;border-bottom:1px dashed #DADADA;">
							<td>合计:</td>
							<td colspan="2"></td>
							<td>￥${chongzhi }</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
    </div>
  </body>
  <script>
  	function sendAjax()
  		{
	  		$.ajax({
	  			url:"baobiao/tot.do",
	  			dataType:"html",
	  			data:{"beginTime":beginTime},
	  			success:function(result){
	  				$("#showView").html(result);				
	  			}
  		});
  	}
  </script>
</html>
