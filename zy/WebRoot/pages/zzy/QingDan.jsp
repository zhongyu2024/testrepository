<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'QingDan.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="layui/css/layui.css" rel="stylesheet"  type="text/css" />
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="layui/layui.js"></script>
<style type="text/css">
	.pagelist input{
		width: 50px;
		height: 30px;
	}
</style>
  </head>
<script type="text/javascript">
var qdtype=3;
var qdstate=5;
var d=new Date();
var qddate1=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
var qddate2=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+(d.getDate()+1);

var qdyysd=0;
	$(function(){
		$("#qdtype").change(function(){
			qdtype=$(this).val();
			sendAjax();
		});
		$("#qdstate").change(function(){
			qdstate=$(this).val();
			sendAjax();
		});
		/* $("#qddate1").blur(function(){
			qddate1=$(this).val();
			qddate2=$("#qddate2").val();
			sendAjax();
		});
		$("#qddate2").blur(function(){
			qddate1=$("#qddate1").val();
			qddate2=$(this).val();
			sendAjax();
		}); */
		$("#qdyysd").change(function(){
			qdyysd=$(this).val();
			sendAjax();
		});
	});
	function sendAjax()
	{
  		$.ajax({
  			url:"qingdan/queryQingDan.do",
  			dataType:"html",
  			data:{"pageNum":1,t:2,"qdtype":qdtype,"qdstate":qdstate,"qddate1":qddate1,"qddate2":qddate2,"qdyysd":qdyysd},
  			success:function(result){

  				$("#qdshow").html(result);
  				
  			}
  		});		
	}
</script>
  <body>
    <div  style="height: 740px;background-color: #dddddd;">
    	<div style="height: 90px;background-color: white;">
    		<div style="height: 45px;background-color: #e2e2e2;">
    		<div style="width: 150px;float: left;margin-left: 10px;">
    			<select id="qdtype"   style="width: 150px;height: 31px;">
				  <option value="3">全部消费类型</option>
				  <option value="0">堂食</option>
				  <option value="1">快餐</option>
				  <option value="2">外卖</option>
				</select> 
			</div>
    		<div  style="width: 150px;float: left;margin-left: 10px;">
    			<select id="qdstate" style="width: 150px;height: 31px;">
				  <option value="5">全部订单状态</option>
				  <option value="0">新单</option>
				  <option value="1">已结账</option>
				  <option value="2">取消</option>
				  <option value="3">免单</option>
				  <option value="4">未下单</option>
				</select> 
			</div>
    		</div>
    		<div style="height: 45px;background-color: white;">
    		<div style="width: 150px;float: left;margin-left: 10px;margin-top: 3px;">
<!--     			<select name="qddata" style="width: 150px;height: 31px;">
				  <option value="7">全部时间</option>
				  <option value="0">今天</option>
				  <option value="1">昨天</option>
				  <option value="2">本周</option>
				  <option value="3">本月</option>
				  <option value="4">本季度</option>
				  <option value="5">本年</option>
				</select>  -->
				<input type="text" class="layui-input" id="qddate1">

			</div>  
    		<div style="width: 150px;float: left;margin-left: 10px;margin-top: 3px;">


				<input type="text" class="layui-input" id="qddate2">
			</div>  
    		<div style="width: 150px;float: left;margin-left: 10px;margin-top: 3px;">
    			<select id="qdyysd" style="width: 150px;height: 31px;">
				  <option value="0">全部营业时段</option>
				  <c:forEach items="${allopentime}" var="time">
				  	<option value="${time.id}">${time.name }</option>
				  </c:forEach>
				</select> 
			</div>  			
    		</div>
    	</div>
    	<div id="qdshow" style="height: 650px; width:2100px;background-color: #f2f2f2;">
    	<input type="hidden" id="url" value="${url }">
    		<table id="showtable" class="layui-table" lay-even lay-size="sm">
				<colgroup>
				    <col width="180">
				    <col width="150">
				    <col width="70">
				    <col width="80">
				    <col width="130">
				    <col width="90">
				    <col width="90">
				    <col width="100">
				    <col width="90">
				    <col width="80">
				    <col width="80">
				    <col width="150">
				    <col width="200">
				    <col width="100">
				    <col width="150">
				    <col width="270">
				  </colgroup>
				  <thead>
				    <tr>
				      <th>单号</th>
				      <th>消费时间</th>
				      <th>类型</th>
				      <th>状态</th>
				      <th>餐位名字</th>
				      <th>消费金额</th>
				      <th>就餐人数</th>
				      <th>折扣金额</th>
				      <th>实际付款</th>
				      <th>服务员</th>
				      <th>收银员</th>
				      <th>结账时间</th>
				      <th>会员</th>
				      <th>送餐员</th>
				      <th>送餐时间</th>
				      <th>外卖信息</th>
				    </tr> 
				  </thead>
				  <tbody>
				  <c:forEach items="${zls.list}" var="zl">
				    <tr>
		
				      <td>${zl.id}<br/><span style="color: red;">${zl.aid} </span></td>		
				      	  
				      <td>${zl.ordertime }</td>
				      <td>${zl.typename}</td>
				      <td>${zl.statename}</td>
				      <td>${zl.tablename }</td>
				      <td>${zl.paymoney }</td>
				      <td>${zl.eatnum}</td>
				      <td>${zl.dazhemoney}</td>
				      <td>${zl.realpay }</td>
				      <td>${zl.waitername }</td>
				      <td>${zl.cashiername }</td>
				      <td>${zl.paytime}</td>
				      <td>${zl.vipname}</td>
				      <td>${zl.sendname }</td>
				      <td>${zl.sendtime }</td>
				      <td>${zl.sendmsg }</td>
				    </tr>				  
				  </c:forEach>

				   <tr>
				   		<td colspan="16">
				   			<div class="pagelist">
				        		<input type="button" id="1" value="首页"> 
				             	<%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
				             	<c:if test="${zls.pageNum !=1}">
				             		<input type="button" id="${zls.pageNum-1}" value="上一页">
				              	</c:if>
				                  <c:forEach begin="${zls.start}" end="${zls.end}" step="1" var="i">
				                      <c:if test="${zls.pageNum == i}">
				                         <input type="button" value="${i }" style="background: #EDEDED" disabled="disabled">
				                     </c:if>                
				                     <c:if test="${zls.pageNum != i}">   
				                         <input type="button" value="${i }" id="${i }">                                   
				                     </c:if> 	                                             
				                 </c:forEach> 
								 <c:if test="${zls.totalPage !=zls.pageNum}">
				                	<input type="button" value="下一页" id="${zls.pageNum+1}">
				                 </c:if>
				             <%--尾页 --%>
				             <input type="button" value="尾页" id="${zls.totalPage}">
					        </div>					       
				   		</td>
				   </tr>	
				  </tbody>    			
    		</table>
    	</div>
    </div>
    
  </body>
  <script type="text/javascript">
 document.getElementById('qddate1').value=qddate1;
  document.getElementById('qddate2').value=qddate2;
layui.use('form', function(){
  var form = layui.form;
  
}); 
$(function(){
			layui.use('laydate', function(){
	 		 var laydate = layui.laydate;
	  
	 		 //执行一个laydate实例
			  laydate.render({
	 		   elem: '#qddate1', //指定元素
	 		   done:function(value)
	 		   {
	 		   	//alert(value);
	 		   	qddate1=$("#qddate1").val();
				qddate2=$("#qddate2").val();
				sendAjax();
	 		   }
	 		 });
	 		  laydate.render({
	 		   elem: '#qddate2', //指定元素
	 		   done:function(value)
	 		   {
	 		   	//alert(value);
	 		   	qddate1=$("#qddate1").val();
				qddate2=$("#qddate2").val();
				sendAjax();
	 		   }
	 		 });
	 		 
			});

});
 $(".pagelist input").live('click',function(){
	var src=$(this).attr("id");	  		
 		$.ajax({
 				method:"get",
 				dataType:"html",
 				url:$("#url").val(),
 				data:{"pageNum":src,"t":2,"qdtype":qdtype,"qdstate":qdstate,"qddate1":qddate1,"qddate2":qddate2,"qdyysd":qdyysd},
 				success:function(result){
 					$("#qdshow").html(result);
 				}  			
 		});
}); 
$("#showtable tr").live('dblclick',function(){
	
	window.location.href="qingdan/qdxiangqing.do?id="+$(this).find("td:first").text();
});
  </script>
</html>
