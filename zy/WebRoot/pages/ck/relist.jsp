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
    
    <title>My JSP 'relist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/ck_js/jquery-1.8.3.js"></script>
  </head>
  <body>
  <div id="showlist">
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
  			<input type="button" id="forward" value="上一页"  style="width:75px;height:30px;margin-top:10px;">
  			<input type="button" id="back" value="下一页"  style="width:75px;height:30px;margin-left:10px;">
  			<input type="hidden" value="${pageNum}" id="pageNum">
  			<input type="hidden" value="${a }" id="a">
    		<input type="button" value="取消预订" id="button2" disabled="false" style="margin-right:30px;">
  </div>
  </div>
  </body>
  <script>
  	$(function(){
 			if(pageno==1){
   				$("#forward").attr("disabled",true);
   				$("#back").click(function(){
   					pageno=pageno+1;
   					sendAjax();
   				});
   				if($("#a").val()<=14){
   					$("#back").attr("disabled",true);   				}
   			}
   			else if(pageno>1&&pageno<$("#pageNum").val()){
   				$("#forward").attr("disabled",false);
   				$("#forward").click(function(){
   					pageno=pageno-1;
   					sendAjax();
   				});
   				$("#back").click(function(){
   					pageno=pageno+1;
   					sendAjax();
   				});
   			}
   			else{
   				$("#back").attr("disabled",true);
   				$("#forward").attr("disabled",false);
   				$("#forward").click(function(){
   					pageno=pageno-1;
   					sendAjax();
   				});
   			} 
   			
   			
  	  		$("#tab tr").click(function(){
  			if($(this).find("#ts").val()!=0){
  				$("#button2").attr("disabled",true);
  			}
  			if($(this).find("#ts").val()==0){
  				$("#button2").attr("disabled",false);
  			}
  			
			
   			
   			
  			$(this).css('background','#D5EAFF','border','1px solid #D5EAFF');
  			$(this).siblings().css('background','white');
  			var id=$(this).attr("id");
  			$("#button2").click(function(){
  				var state=1;
  				sendAjax();
	  			$.ajax({
	  			url:"yuding/update.do",
	  			dataType:"html",
	  			data:{"id":id,"state":state},
	  			success:function(result){
	  				$.ajax({
			  			url:"yuding/list.do",
			  			dataType:"html",
			  			data:{"yutime":"time","state":4,"createtime":1,"pageno":1},
			  			success:function(result){
			  				$("#showlists").html(result);			
			  			}
			  		});			
	  			}
  				});	 
	  		});
  		});
  	});
  </script>
</html>
