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
    
    <title>My JSP 'reservelist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/ck_css/reservelist.css">
	<script type="text/javascript" src="js/ck_js/jquery-1.8.3.js"></script>
  </head>
  
  <body>
    <div class="nav">  
  		<div id="xinzeng" onclick="javascript:window.location='pages/ck/reserve.jsp'">新增预订</div>
    	<div id="liebiao">预订列表</div>
    </div>
    <div class="yulist">
    	<div class="yumenu">
    		<select id="se_first" name="">
    			<option value="time">预订时间</option>
    			<option value="today">今天</option>
				<option value="tomorrow">明天</option>
				<option value="houtian">后天</option>
    		</select>
    		<select id="se_second">
    			<option value="4">预订状态</option>
    			<option value="0">预订中</option>
    			<option value="1">预订取消</option>
    			<option value="2">已到店</option>
    			<option value="3">已过期</option>
    		</select>
    		<select id="se_third">
    			<option value="1">按创建时间倒序</option>
    			<option value="0">按预订时间顺序</option>
    		</select>
    		<input type="text" id="searchfield" placeholder="输入姓名，手机号...">
<!--      		<input type="hidden" value="" id="type" name="type">
 -->    	</div>
    	<div class="yutab">
    		
    			<div style="background:#F9F9F9;" class="cushead">
    				<span class="cusname" style="width:150px;float:left;">顾客姓名</span>
    				<span class="custel" style="width:170px;float:left;">联系方式</span>
    				<span class="custime" style="width:200px;float:left;">预订时间</span>
    				<span class="cusnum" style="width:160px;float:left;">就餐人数</span>
    				<span class="cusstate" style="width:130px;float:left;">预订状态</span>
    				<span class="cusmoney" style="width:130px;float:left;">押金</span>
    				<span class="custable" style="width:130px;float:left;">预订桌位</span>
    				<span class="cusinfo" style="width:200px;float:left;">备注</span>
    			</div>
    			<div id="showlists">
					  <table id="tab" style="height:475px;width:1358px;border-bottom:1px solid #DADADA；">
			        		<c:forEach items="${ydlist}" var="yuding">
			     				<tr style="width:1358px;float:left;padding-top:5px;cursor:pointer;height:25px;padding-bottom:5px;text-align:center;font-size:15px;" id="${yuding.id}" class="sel">
			    					<td style="width:150px;float:left;">${yuding.name}</td>
			    					<td style="width:170px;float:left;">${yuding.tel }</td>
			    					<td style="width:200px;float:left;">${yuding.yutime}</td>
			    					<td style="width:130px;float:left;">${yuding.mannum }</td>
			    					<td style="width:130px;float:left;">
			    						<input type="hidden" value="${yuding.state}" id="ts">
			    						<c:if test="${yuding.state==0}">
			    							<c:out value="预订中">预定中</c:out>
			    						</c:if>
			    						<c:if test="${yuding.state==1}">
			    							<c:out value="预订取消">预定取消</c:out>
			    						</c:if>
			    						<c:if test="${yuding.state==2}">
			    							<c:out value="已到店">已到店</c:out>
			    						</c:if>
			    						<c:if test="${yuding.state==3}">
			    							<c:out value="已过期">已过期</c:out>
			    						</c:if>
			    					</td>
			    					<td style="width:130px;float:left;">${yuding.money}</td>
			    					<td style="width:130px;float:left;">${yuding.tableid}</td>
			    					<td style="width:200px;float:left;">${yuding.info}</td>
			    				</tr>
			    			</c:forEach>
			  </table>
			  <div style="border-top:1px solid #DADADA;width:1358px;position:absolute;top:620px;">
			  			<input type="button" id="forward"  value="上一页">
			  			<input type="button" id="back" value="下一页">
			  			<input type="hidden" value="${pageNum}" id="pageNum">
			    		<input type="button" value="取消预订" id="button2" disabled="disabled">
			  </div>
    			</div>
    		
    	</div>
    </div>
  </body>
  <script>
  	var yutime="time";
  	var state=4;
  	var createtime=1;
  	var info="";
  	var type="";
  	var pageno=1;
  	function sendAjax()
  	{
  		$.ajax({
  			url:"yuding/list.do",
  			dataType:"html",
  			data:{"yutime":yutime,"state":state,"createtime":createtime,"pageno":pageno},
  			success:function(result){
  				$("#showlists").html(result);			
  			}
  		});
  	}
  	$(function(){
    		sendAjax();
  		$("#se_first").change(function(){
  			yutime=$("#se_first").val();
  			sendAjax();
  		});
  		$("#se_second").change(function(){
  			state=$("#se_second").val();
  			sendAjax();
  		});
  		$("#se_third").change(function(){
  			createtime=$("#se_third").val();
  			sendAjax();
  		});
  		$("#searchfield").blur(function(){
  			info=$(this).val();
  			var rule=/^\d{8,11}$/;
  			if(rule.test(info)){
  				st="tel";
  				pageno=1;
   			$.ajax({
	  				type:"post",
	  				dataType:"html",
	  				url:"<%=basePath%>yuding/inf.do",
	  				data:{"info":info,"st":st,"pageno":pageno},
	  				cache:false,
	  				success:function(result){
	  					$("#showlists").html(result);
	  				}
	  			});
	  		}
	  		else{
/* 	  			alert("查找姓名");
 */	  			st="name";
	  			pageno=1;
	  			$.ajax({
	  				type:"post",
	  				dataType:"html",
	  				url:"<%=basePath%>yuding/inf.do",
	  				data:{"info":info,"st":st,"pageno":pageno},
	  				cache:false,
	  				success:function(result){
	  					$("#showlists").html(result);
	  				}
	  			});	
	  		}
  		});
  	});
  </script>
</html>
