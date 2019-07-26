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
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/ck_css/reserve.css" />
	<script type="text/javascript" src="js/ck_js/jquery-1.8.3.js"></script>
  </head>
  
  <body>
  <div>
  	<div class="nav">  
  		<div id="xinzeng">新增预订</div>
    	<div id="liebiao" onclick="javascript:window.location='pages/ck/reservelist.jsp'">预订列表</div>
    </div>
    <div>
	<div class="left">
		<div class="left-date" id="left-date">
			<span id="${today}">今天${today}</span>
			<input type="hidden" value="${h}" id="h">
			<span id="${tomorrow}">明天${tomorrow}</span>
			<span id="${houtian}">后天${houtian}</span>
			<span id="${d1}">${d1}</span>
			<span id="${d2}">${d2}</span>
			<span id="${d3}">${d3}</span>
			<span id="${d4}">${d4}</span>
		</div>
		<div class="left-menu">
			<div class="left-time" id="left-time">
				<p id="1">早市</p>
				<p id="2">午市</p>
				<p id="3">晚市</p>
			</div>
			<div class="left-list">
				<div class="left-seatnum" id="left-seatnum">
					<div id="all">全部</div>
					<div id="two">二人桌</div>
					<div id="four">四人桌</div>
					<div id="six">六人桌</div>
					<div id="eight" style="width:75px;float:left;cursor:pointer;height:15px;margin-left:20px;padding-top:10px;padding-bottom:10px;">八人及以上</div>
				</div>
				<!-- 桌位显示 -->
				<div style="width:954px;height:548px;float:left;" id="showSeat">
				<div style="height:493px;width:956px;" id="tlist">
 				<!-- 查询全部桌位 -->
  				<c:forEach items="${ylist}" var="yudingfoodtable">
				<div style="width:115px;height:80px;border:1px solid #DADADA;background:#EFF3F6;float:left;margin-left:30px;margin-top:20px;<c:if test="${foodtable.state==0}">border:1px solid green</c:if>" <%-- id="${yudingfoodtable.id }" --%> id="${yudingfoodtable.id}">
					<span style="position:relative;top:20px;left:30px;font-size:16px;">${yudingfoodtable.name}</span>
					<span style="position:relative;top:50px;left:-50px;font-size:10px;">${yudingfoodtable.seatsize}人桌</span>	
 					<input type="hidden" value="${yudingfoodtable.seatsize}"  id="hum">
				</div> 
				</c:forEach>
				</div>
				</div>
			</div>
		</div>
	</div>
	<div class="right">
		<form action="yuding/insertYuding.do" method="post" onsubmit="return validate()">
			<div style="width:294px;float:left;padding-left:20px;margin-top:30px;">
				<span style="float:left;width:104px;">预订编号:</span>
				<span id="ydid">YD2017${tr_today}${ydid}</span>
			</div>
			<div style="width:294px;float:left;padding-left:20px;margin-top:15px;">
				<div style="float:left;width:104px;"><span>顾客姓名:</span></div>
				<div style="float:left;"><input type="text" name="name" style="width:160px;height:30px;" id="name"></div>
			</div>
			<span style="width:195px;float:left;padding-left:119px;margin-top:15px;" id="sexdiv">			
				<input type="radio" value="0" id="boy" name="sex" checked="true">先生
				<input type="radio" value="1" name="sex" id="girl">女士
				<input type="hidden" value="" name="ssex" id="sex">
			</span>
			<div></div>
			<div style="width:294px;float:left;padding-left:20px;margin-top:15px;" id="teldiv">
				<span style="float:left;width:104px;">联系电话:</span>
				<input type="text" name="tel" style="width:160px;height:30px;" id="tel">
			</div>
			<div></div>
			<div style="width:294px;float:left;padding-left:20px;margin-top:15px;">
				<span style="float:left;width:104px;">预订人数:</span>
				<input type="text"  style="width:160px;height:30px;" name="mannum" id="mannum"> 
			</div>
			<div></div>
			<div style="width:294px;float:left;padding-left:20px;margin-top:15px;">
				<span style="float:left;width:104px;">预订时间:</span>
				<input type="text" style="width:160px;height:30px;" id="yuinput" value=""
					placeholder="请输入预订时间:" name="yutime">
				<!-- 营业时段编号 -->
				<input type="hidden" name="opentimeid" value="" id="opentimeid">
				<!-- 桌台号 -->
				<input type="hidden" name="tableid" value="" id="tableid">
				<div style="display:none;position:absolute;top:311px;left:971px;border:1px solid #DADADA;background:white;" id="hid">
					<div id="hid1" style="background:white;width:380px;display:none;">
						<div class="hidstyle">6:00</div>
						<div class="hidstyle">6:30</div>
						<div class="hidstyle">7:00</div>
						<div class="hidstyle">7:30</div>
						<div class="hidstyle">8:00</div>
						<div class="hidstyle">8:30</div>
						<div class="hidstyle">9:00</div>
						<div class="hidstyle">9:30</div>
						<div class="hidstyle">10:00</div>
						<div class="hidstyle">10:30</div>
					</div>
					<div id="hid2" style="background:white;width:380px;display:none;">
						<div class="hidstyle">11:00</div>
						<div class="hidstyle">11:30</div>
						<div class="hidstyle">12:00</div>
						<div class="hidstyle">12:30</div>
						<div class="hidstyle">13:00</div>
						<div class="hidstyle">13:30</div>
						<div class="hidstyle">14:00</div>
						<div class="hidstyle">14:30</div>
						<div class="hidstyle">15:00</div>
						<div class="hidstyle">15:30</div>
					</div>
					<div id="hid3" style="background:white;width:380px;display:none;">
						<div class="hidstyle">16:00</div>
						<div class="hidstyle">16:30</div>
						<div class="hidstyle">17:00</div>
						<div class="hidstyle">17:30</div>
						<div class="hidstyle">18:00</div>
						<div class="hidstyle">18:30</div>
						<div class="hidstyle">19:00</div>
						<div class="hidstyle">19:30</div>
						<div class="hidstyle">20:00</div>
						<div class="hidstyle">20:30</div>
						<div class="hidstyle">21:00</div>
						<div class="hidstyle">21:30</div>
						<div class="hidstyle">22:00</div>
					</div>
				</div>
			</div>
			<div></div>
			<div style="width:294px;float:left;padding-left:20px;margin-top:15px;">
				<span style="float:left;width:104px;">预订保留时间:</span>
				<select style="width:160px;height:30px;" name="baotime" id="baotime">
					<option value="0.5">半小时</option>
					<option value="1">1个小时</option>
					<option value="1.5">1个半小时</option>
					<option value="2">2个小时</option>
					<option value="2.5">2个半小时</option>
					<option value="3">3个小时</option>
					<option value="3.5">3个半小时</option>
					<option value="4">4个小时</option>
				</select>
			</div>
			<div></div>
			<div style="width:294px;float:left;padding-left:20px;margin-top:15px;">
				<span style="float:left;width:104px;">预订备注:</span>
				<input type="text" style="width:160px;height:30px;" name="info">
			</div>
			<div></div>
			<div style="width:294px;float:left;padding-left:20px;margin-top:15px;">
				<span style="float:left;width:104px;">押金:</span>
				<input type="text" style="width:160px;height:30px;" name="money" id="money">
			</div>
			<div></div>
			<input type="submit" style="color: #FFFFFF;border:0;margin-top:20px;margin-left:20px;background:#00B96D;width:270px;height:50px;" value="确认预订">
		</form>
	</div>
	</div>
  </div>
  </body>
  <script>
  	var nameCheck=false;
	var telCheck=false;
	var mannumCheck=false;
	var yutimeCheck=false;
	var moneyCheck=false;
	var tableCheck=false;
	function validate(){
	    	return nameCheck&&telCheck&&mannumCheck&&yutimeCheck&&moneyCheck&&tableCheck;
    } 
  	$(function(){
  		$("#${today}").css('background','#88849A');
  		$("#${today}").css('color','white');
  		$("#1").css('background','#88849A');
  		$("#1").css('color','white');
  		$("#all").css('background','#88849A');
  		$("#all").css('color','white');	
  	});		
  	$(function(){
			var yutime="${today}";
			var seatsize="all";
			var opentimeid=1;
			var humnum=0;
			sendAjax();
   		$("#left-time p").click(function(){
 			opentimeid=$(this).attr("id");
  			$(this).css('background','#88849A');
   			$(this).siblings().css('background','white');
   			$("#hid").css('display','none');
  			$(this).css('color','white');
  			$(this).siblings().css('color','black');
  			sendAjax();
  		});
  		$("#left-seatnum div").click(function(){
  			seatsize=$(this).attr("id");
  			$(this).css('background','#88849A');
  			$(this).siblings().css('background','white');
  			$(this).css('color','white');
  			$(this).siblings().css('color','black');
  			sendAjax();
  		});
  		$("#left-date span").click(function(){
  			yutime=$(this).attr("id");
  			$(this).css('background','#88849A');
  			$(this).siblings().css('background','white');
  			$(this).css('color','white');
  			$(this).siblings().css('color','black');
  			sendAjax();
  		});
  		
  		/* 表单验证 */
  		$("#name").blur(function(){
  			var name = $("#name").val().trim();
  			if(name.length==0)
  			{
  				alert("姓名不能为空");
  				nameCheck=false;
  				return;
  			}
  			else{
  				nameCheck=true;
  			}
  		});
  		$("#tel").blur(function(){
  			var tel=$(this).val().trim();
  			if(tel.length==0)
  			{
  				alert("请输入电话:");
  				telCheck=false;
  				return;
  			}
  			var rule=/^\d{8,11}$/;
  			if(!rule.test(tel))
  			{
  				alert("号码格式错误!");
  				telCheck=false;
  				return;
  			}
  			if(rule.test(tel)&&tel.length!=0){
  				telCheck=true;
  			}
  		});
  		$("#mannum").blur(function(){
  			var mannum=$(this).val().trim();
  			var rule=/^\d{1,3}$/;
  			if(mannum.length==0)
  			{
  				alert("未填写用餐人数!");
  				mannumCheck=false;
  				return;
  			}
  			if(mannum>humnum){
  				alert("自行换桌!");
  				mannumCheck=false;
  				return;
  			}
  			if(!rule.test(mannum))
  			{
  				alert("请输入数字!");
  				mannumCheck=false;
  				return;
  			}
  			if(mannum.length!=0&&mannum<=humnum&&rule.test(mannum)){
  				mannumCheck=true;
  			}
  		});
  		$("#money").blur(function(){
  			var money=$(this).val().trim();
  			if(money.length==0)
  			{
  				alert("未填写押金!");
  				moneyCheck=false;
  				return;
  			}
  			var rule=/^\d{1,6}$/;
  			if(!rule.test(money))
  			{
  				alert("请输入数字!");
  				moneyCheck=false;
  				return;
  			}
  			if(money.length!=0&&rule.test(money)){
  				moneyCheck=true;
  			}
  		});  			
  		/* 获取选中的tableid */
  		$("#tlist div").live('click',function(){
   			$("#tableid").attr("value",$(this).attr("id"));
  			tableCheck=true;
  			humnum=$(this).find("#hum").attr("value");
  			$(this).css('background','#A9EB6A');
  			$(this).siblings().css('background','#EFF3F6');
  		});
  		/* 获取表单提交的性别sex */
  		$("#tel").focus(function(){
   			$("#sex").attr("value",$("input:radio[name='sex']:checked").val());
  		});
  		$("#yuinput").click(function(){
  				if(opentimeid==1){
	  			$("#hid").css('display','block');
	  			$("#hid1").css('display','block');
	  			$("#hid2").css('display','none');
	  			$("#hid3").css('display','none');
	  			$("#opentimeid").attr("value",1);
	  			$("#hid div div").click(function(){
	  				$(this).css('border','1px solid green');
	  				$(this).siblings().css('border','1px solid #DADADA');
	  				$("#hid2 div").css('border','1px solid #DADADA');
	  				$("#hid3 div").css('border','1px solid #DADADA');
	  				$("#hid").css('display','none');
	  				var h=$("#h").val().replace(":","");
	  				var a=$(this).html().replace(":","");
	  				if(parseInt(a)>parseInt(h)){
/* 	  					alert(1);
 */	  					yutimeCheck=true;
	  					$("#yuinput").attr("value",yutime+" "+$(this).html());}
	  				else{
	  					yutimeCheck=false;
	  					return;
	  				}
	  			});}
	  			else if(opentimeid==2){
	  			$("#hid").css('display','block');
	  			$("#hid2").css('display','block');
	  			$("#hid1").css('display','none');
	  			$("#hid3").css('display','none');
	  			$("#opentimeid").attr("value",2);
	  			$("#hid div div").click(function(){
	  				$(this).css('border','1px solid green');
	  				$(this).siblings().css('border','1px solid #DADADA');
	  				$("#hid3 div").css('border','1px solid #DADADA');
	  				$("#hid1 div").css('border','1px solid #DADADA');
	  				$("#hid").css('display','none');
	  				var h=$("#h").val().replace(":","");
	  				var a=$(this).html().replace(":","");
	  				if(parseInt(a)>parseInt(h)){  				
	  					yutimeCheck=true;
	  					$("#yuinput").attr("value",yutime+" "+$(this).html());} 
	  				else{
	  				yutimeCheck=false;
	  				return;
	  				} 			
	  			});}
	  			else if(opentimeid==3){
	  			$("#hid").css('display','block');
	  			$("#hid3").css('display','block');
	  			$("#hid2").css('display','none');
	  			$("#hid1").css('display','none');
	  			$("#opentimeid").attr("value",3);
	  			$("#hid div div").click(function(){
	  				$(this).css('border','1px solid green');
	  				$(this).siblings().css('border','1px solid #DADADA');
	  				$("#hid2 div").css('border','1px solid #DADADA');
	  				$("#hid1 div").css('border','1px solid #DADADA');
	  				$("#hid").css('display','none');
	  				var h=$("#h").val().replace(":","");
	  				var a=$(this).html().replace(":","");
	  				if(parseInt(a)>parseInt(h)){	  				
	  					yutimeCheck=true;
	  					$("#yuinput").attr("value",yutime+" "+$(this).html());
	  				}
	  				else{
	  				yutimeCheck=false;
	  				return;
	  				}	  			
	  			});}
  			
  		});
  		function sendAjax()
  		{
	  		$.ajax({
	  			url:"yuding/time.do",
	  			dataType:"html",
	  			data:{"yutime":yutime,"seatsize":seatsize,"opentimeid":opentimeid},
	  			success:function(result){
	/*   				location.reload(); */
	  				$("#showSeat").html(result);			
	  			}
  		});
  	}
});
  </script>
</html>
