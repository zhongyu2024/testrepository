<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'quhui.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/xfr/quhui.css">
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	

  </head>
  
  <body> 
    <div id="qbox">
    	<div id="qtop">
    		<input type="button" style="border:none;font-family:微软雅黑;color:white;border-radius:10px;width:150px;height:40px;background: #00B944;cursor: pointer;" value="返回点餐">
    	</div>
    	<div style="margin-top: 20px;">
    		<div id="qleft">
    			<div style="margin-left:20px;">
    				<img src="images/xfr/24.jpg"><br>
    				<input type="button" class="statebtn btn1" style="background: #00B944" value="全部" id="0">
    				<input type="button" class="statebtn btn1" value="未派送" id="1">
    				<input type="button" class="statebtn btn1" value="派送中" id="2">
    			</div>
    			<div style="margin-left:20px;margin-top: 20px;">
    				<img src="images/xfr/17.jpg"><br>
    				<input type="button" class="timebtn btn1" style="background: #00B944" value="全部" id="0">
    				<input type="button" class="timebtn btn1" value="10分钟" id="10">
    				<input type="button" class="timebtn btn1" value="20分钟" id="20">
    				<input type="button" class="timebtn btn1" value="40分钟" id="40">
    				<input type="button" class="timebtn btn1" value="1小时" id="60">
    				<input type="button" class="timebtn btn1" value="2小时" id="120">
    			</div>
    		</div>
    		<div id="qright">
    			<input type="hidden" id="url" value="${url }">
    			<table class="layui-table" lay-skin="line">
				  <colgroup>
				    <col width="100">
				    <col width="50">
				    <col width="50">
				    <col width="150">
				    <col width="70">
				    <col width="150">
				    <col>
				  </colgroup>
				  <thead>
				    <tr>
				      <th>单号</th>
				      <th>基本信息</th>
				      <th>金额</th>
				      <th>下单时间</th>
				      <th>派送人员</th>
				      <th>派送时间</th>
				      <th>操作</th>
				    </tr> 
				  </thead>
				  <tbody >
				  <c:forEach items="${zls.list }" var="zl">
				    <tr>
				      <td>${zl.id }</td>
				      <td>${zl.sendmsg}</td>
				      <td>${zl.paymoney }</td>
				      <td>${zl.ordertime }</td>
				      <td class="sendname">${zl.sendname }</td>
				       <td>${zl.sendtime }</td>
				      <td id="${zl.id }">
				      	<input type="button" style="background: #1E9FFF;" class="btn info" value="详情">
				      	<input type="button" style="background: #00B944;" class="btn jie" value="结账">				      	
		   				<input type="button" style="background: #FFB800;" class="btn paisong" value="派送">
				      	<input type="button" style="background: #FF5722;" class="btn laji" value="作废">
				      </td>
				    </tr>
				   </c:forEach>	
				   <tr>
				   		<td colspan="7">
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
    </div>
    <div id="cailist">
    	
    </div>
     <div id="cover"></div>
    <div id="sendinfo">
	  	&nbsp;&nbsp;请选择派送人员：
	  	<select name="select" style="width:150px;height:40px;" id="pai">
	  		
	  	</select>
	  	<input type="button" id="subbtn" value="确定" style="height:40px;width:100px;background: #00B944;margin-left: 20px;border: none;color:white;cursor: pointer;">
  </div>
  </body>
  <script type="text/javascript">
  var time;//按时间段搜索
   var state;//按状态搜索
  var listid;//标记当前选中的清单
  function checkpai(){
  	$(".sendname").each(function(){	  		
	  		if($(this).text().trim().length>0){
	  			$(this).next().next().find("input:eq(2)").css("background","#D1D1D1").attr("disabled",true);
	  		}
	  	}); 
  }
  	$(function(){
  		//判断是否显示派送按钮
  		checkpai();	  	
  		//按时间段显示
  		$(".timebtn").click(function(){
  			$(this).css({"background":"#00B944"});
  			$(".btn1").not(this).css("background","#EDEDED");
  			time=$(this).attr("id");
  			$.ajax({
  				method:"post",
  				dataType:"html",
  				url:"Waimai/getBytime.do",
  				data:{"time":time,"pageNum":1},
  				success:function(result){
  					$("#qright").html(result);
  					checkpai();
  				}
  			});
  		});
  		//按状态搜索
  		$(".statebtn").click(function(){
  			$(this).css({"background":"#00B944"});
  			$(".btn1").not(this).css("background","#EDEDED");
  			state=$(this).attr("id");
  			$.ajax({
  				method:"post",
  				dataType:"html",
  				url:"Waimai/getBystate.do",
  				data:{"state":state,"pageNum":1},
  				success:function(result){
  					$("#qright").html(result);
  					checkpai();
  				}
  			});
  		});
  		
  		//分页请求
		$(".pagelist input").live('click',function(){
			var src=$(this).attr("id");	  		
	  		$.ajax({
	  				method:"get",
	  				dataType:"html",
	  				url:$("#url").val(),
	  				data:{"pageNum":src,"t":2,"time":time,"state":state},
	  				success:function(result){
	  					$("#qright").html(result);
	  					checkpai();
	  				}  			
	  		});
		});
	  	//返回点餐
	  	$("#qtop input").click(function(){
	  		window.location="Waimai/showWaimai.do";
	  	});
	  	//详细操作
	  	$(".info").live('click',function(){
	  		var danhao=$(this).parent().attr("id");
	  		$.ajax({
	  			method:"post",
	  			dataType:"html",
	  			url:"Waimai/getcailist.do",
	  			data:{"id":danhao},
	  			success:function(result){
	  				$("#cailist").css("display","block");
	  				$("#cailist").html(result);
	  				var allnum=0;
	  				var allpay=0;
	  				$(".num").each(function(){
	  					allnum+=parseInt($(this).text());
	  				});
	  				$(".pay").each(function(){
	  					allpay+=parseInt($(this).text());
	  				});
	  				$("#allnum").html(allnum+"*份");
	  				$("#allpay").html(allpay+".00");
	  			}
	  		});
	  	});
	  	//关闭详细页面
	  	$("#close").live('click',function(){
	  		$("#cailist").css("display","none");
	  		$("#cailist").html("");
	  	});
	  	//结账操作
	  	$(".jie").live('click',function(){
	  		var danhao=$(this).parent().attr("id");
	  		window.location="Waimai/quhuijiezhang.do?listid="+danhao;
	  	});
	  	//作废操作
	  	$(".laji").live('click',function(){
	  		var danhao=$(this).parent().attr("id");
	  		window.location="Waimai/quhuizuofei.do?listid="+danhao;
	  	});
	  	//展示派送人员页面
	  	$(".paisong").live('click',function(){
	  		$("#cover").css("display","block");	
	  		$("#sendinfo").css("display","block");
	  		listid=$(this).parent().attr("id");
	  		$.ajax({
  				method:"post",
  				dataType:"json",
  				url:"Waimai/getpaisongman.do",
  				data:{},
  				success:function(result){
  					for(var i=0;;i++){
  						var dd=$("<option value='"+result[i].id+"'>"+result[i].name+"</option>");
  						dd.appendTo($("#pai"));
  					}
  				}
  			});
	  	});
	  	//确定派送
	  	$("#subbtn").click(function(){
	  		$("#cover").css("display","none");	
	  		$("#sendinfo").css("display","none");
	  		var pai=$("#pai").val();
	  		$.ajax({
	  			method:"post",
	  			dataType:"html",
	  			url:"Waimai/waimaiquhuipaisong.do",
	  			data:{"listid":listid,"sendman":pai},
	  			success:function(result){
	  				$("#qright").html(result);
	  				checkpai();
	  			}
	  		});
	  	});
	  	//搜索
	  	$("#sea").click(function(){
	  		var waitnum=$("#waitshu").val().trim();
	  		if(waitnum.length==0){
	  			//未输入值
	  			alert("请输入牌号！");
	  			return;
	  		}else if(isNaN(parseInt(waitnum))){
	  			alert("格式错误！");
	  			return;
	  		}else if(waitnum.indexOf(".")!=-1){	  			
				//输入的是小数，就只取整数部分
				waitnum=waitnum.substring(0,waitnum.indexOf("."));				
	  		}
	  		$.ajax({
	  			method:"post",
	  			dataType:"html",
	  			url:"Kuaican/search.do",
	  			data:{"waitnum":waitnum},
	  			success:function(result){
	  				$("#qright").html(result);
	  			}
	  		});
	  	});
	  	
	  	
  	});
  </script>
</html>
