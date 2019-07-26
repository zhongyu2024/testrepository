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
    
    <title>My JSP 'TangShi.jsp' starting page</title>
    
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
	<script type="text/javascript" src="js/custominput.js"></script>
	<script type="text/javascript" src="layui/layui.js"></script>
	<link href="css/zzy/TangShistyle.css" rel="stylesheet"  type="text/css" /> 
<!-- 	<link href="css/zzy/base.css" rel="stylesheet"  type="text/css" />  -->
  </head>
  <script type="text/javascript">
  	var cantai=0;
  	var state=3;
  	var area=2;
	var id=0;
	var ddcantai=0;
	var ddstate=3;
	var ddarea=2;
		var dingdanid="xx";
		var tableid=0;
		var dingdaneatnum=0;
		var fuwuid=0;
		var dingdancashierid=0;
		var xdcantai=0;
		var xdstate=3;
		var xdarea=2;
	var qtdingdanid="";
	var qttableid=0;
	var qtcantai=0;
	var qtstate=3;
	var qtarea=2;
	var htcantaiqueren=0;
	var htstatequeren=3;
	var htareaqueren=2;
	var htcantai=0;
	var htarea=2;
	var htseltableid=0;	
	var htids="";
	var res;
	var nhcantai=0;
	var nhstate=3;
	var nharea=2;
	var ctcantai=0;
	var ctstate=3;
	var ctarea=2;
	var cttableid=0;
$(function(){

  		$("#left-seatnum div").click(function(){
  			$(this).css('background','#88849A');
  			$(this).siblings().css('background','white');
  			$(this).css('color','white');
  			$(this).siblings().css('color','black');
  		});
  		$("#all").click(function(){
  			cantai=0;
  			sendAjax();
  		});
  		$("#two").click(function(){
  			cantai=2;
  			sendAjax();
  		});
  		$("#four").click(function(){
  			cantai=4;
  			sendAjax();
  		});
  		$("#six").click(function(){
  			cantai=6;
  			sendAjax();
  		});
  		$("#eight").click(function(){
  			cantai=8;
  			sendAjax();
  		});
  		$("#quan").click(function(){
  			area=2;
  			sendAjax();
  		});
  		$("#ting").click(function(){
  			area=0;
  			sendAjax();
  		});
  		$("#bao").click(function(){
  			area=1;
  			sendAjax();
  		});

  		$('input:radio[name="state"]').change(function(){
  			state=$(this).val();
  			sendAjax();
  		});	
		$(".d").live('click',function(){
			ddcantai=$(".ddcantai").val();
			ddstate=$(".ddstate").val();
			ddarea=$(".ddarea").val();
			id=$(this).attr("id");
			htseltableid=id;
			sendTAjax();
		});

  	});	
  	function sendAjax()
  	{

  		$.ajax({
  			url:"tangshi/findByQuery.do",
  			dataType:"html",
  			data:{"cantai":cantai,"state":state,"area":area},
  			success:function(result){
  				$("#showtables").html(result);
  				
  			}
  		});
  		
  	}
	function sendTAjax()
	{
		$.ajax({
  			url:"tangshi/DingDanfindByQuery.do",
  			dataType:"html",
  			data:{"id":id,"ddcantai":ddcantai,"ddstate":ddstate,"ddarea":ddstate},
  			success:function(result){
  				$("#showDingDan").html(result);	
  				}		
		});
	}
	function sendKAjax()
		{
  		$.ajax({
  			url:"tangshi/addKaiTai.do",
  			dataType:"html",
  			data:{"dingdanid":dingdanid,"tableid":tableid,"dingdaneatnum":dingdaneatnum,"fuwuid":fuwuid,"dingdancashierid":dingdancashierid,"xdcantai":xdcantai,"xdstate":xdstate,"xdarea":xdarea},
  			success:function(result){
  				$("#showtables").html(result);
  				$("#kaitai").css("display","none");
  			}
  		});			
		}
  	function sendDAjax()
  	{
  		$.ajax({
  			url:"tangshi/qingtai.do",
  			dataType:"html",
  			data:{"qtdingdanid":qtdingdanid,"qttableid":qttableid,"qtcantai":qtcantai,"qtstate":qtstate,"qtarea":qtarea},
  			success:function(result){
  				$("#showtables").html(result);
  				$("#qingtai").css("display","none");

				$.ajax({
		  			url:"tangshi/DingDanfindByQuery.do",
		  			dataType:"html",
		  			data:{"id":qttableid,"ddcantai":qtcantai,"ddstate":qtstate,"ddarea":qtstate},
		  			success:function(result){
		  				$("#showDingDan").html(result);	
		  				}		
				});

  			}
  		});
  		
  	}
  	  function sendHAjax()
  	{
  		
  		$.ajax({
  			url:"tangshi/hetaifind.do",
  			dataType:"html",
  			data:{"htcantai":htcantai,"htarea":htarea,"htseltableid":htseltableid},
  			success:function(result){
  				$("#showcanhetai").html(result);
  				$("#hetai").css("display","block");
  			}
  		});
  	}	
 	function sendNHAjax()
 	{
  		$.ajax({
  			url:"tangshi/newhetai.do",
  			dataType:"html",
  			data:{"res":res,"nhcantai":nhcantai,"nhstate":nhstate,"nharea":nharea},
  			success:function(result){
  				$("#showtables").html(result);
  				$("#hetai").css("display","none");
  			}
  		});
 	}
  	function sendCTAjax()
 	{
  		$.ajax({
  			url:"tangshi/chaitai.do",
  			dataType:"html",
  			data:{"cttableid":cttableid,"ctcantai":ctcantai,"ctstate":ctstate,"ctarea":ctarea},
  			success:function(result){
  				$("#showtables").html(result);
  				$("#chaitai").css("display","none");
  			}
  		});
 	}
  </script>
  <body style="margin:0;"> 
    <div style="height: 750px;width: 100%;background-color: #dddddd;">
    <div  style="height: 750px;width: 80%;float: left;background-color: white;">
    	<div  style="height: 40px;width: 100%;float: left;border-bottom: 1px solid #eeeeee;">
			  <div  style="width: 390px;float: left;">
			    <!-- <label class="layui-form-label" style="color: #01AAED;">座位数</label>
			    <div class="layui-input-block">
			      <select id="cantai" lay-filter="cantai">
			        <option value="0">全部</option>
			        <option value="2">2人桌</option>
			        <option value="4">4人桌</option>
			        <option value="6">6人桌</option>
			        <option value="8">8人桌</option>
			        <option value="1">8人以上</option>
			      </select>
			    </div> -->
			   	<div class="left-seatnum" id="left-seatnum">
					<div id="all" style="background-color: #88849A;color: white;">全部</div>
					<div id="two">二人桌</div>
					<div id="four">四人桌</div>
					<div id="six">六人桌</div>
					<div id="eight" style="width:75px;float:left;cursor:pointer;height:40px;margin-left:20px;text-align: center;line-height: 40px;border-radius:5px 5px 5px 5px;">八人及以上</div>
				</div>
			  </div> 
			  <div style="height: 50px;width: 400px;float: right;">
				  <div style="height: 20px;width: 400px;margin-top: 10px;float: left;">
				    <div id="statediv" class="layui-input-block">
				      <input type="radio" name="state" value="3"  checked>全部&nbsp;
				      <input type="radio" name="state" value="0"  >空闲&nbsp;
				      <input type="radio" name="state" value="1" >就餐&nbsp;
				      <input type="radio" name="state" value="2" >预定&nbsp;
				    </div>
				  </div>
			  </div>   			
    	</div>
<!--     	<div class="layui-form" style="height: 50px;width: 100%;float: left; ">
			  <div class="layui-form-item" style="width: 200px;float: left;"> -->
			<div  style="height: 50px;width: 100%;float: left; ">
			  <div  style="width: 200px;float: left;"> 
			    <!-- <label class="layui-form-label" style="color: #01AAED;">位置</label> -->
<!-- 			    <div class="layui-input-block">
			      <select name="area" lay-verify="required">
			        <option value="2">全部</option>
			        <option value="0">大厅</option>
			        <option value="1">包厢</option>
			      </select>
			    </div> -->
			   	<div class="left-seatnum" id="left-seatnum">
					<div id="quan" style="background-color: #88849A;color: white;">全部</div>
					<div id="ting">大厅</div>
					<div id="bao">包厢</div>
				</div>			    
			  </div>     		
    	</div>
    	<div id="showtables" style="height: 658px;width: 100%;background-color: #f2f2f2;float: left;">
    	<c:forEach items="${tables}" var="t">
    		<c:if test="${t.state==0}">
			<div id="${t.id }" class="d" style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: A9EB6A;border-radius:5px 5px 5px 5px;cursor:pointer;">
				<input class="ddcantai" type="hidden" value="${initcantai}"/>
				<input class="ddstate" type="hidden" value="${initstate}"/>
				<input class="ddarea" type="hidden" value="${initarea}"/>
	 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
	 				${t.name }
	 			</div>
	 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
	 				可供${t.seatsize}人
	 			</div>
	 		</div>
	 		</c:if>
	 		<c:if test="${t.state==1 }">
	 		<c:if test="${t.hetai==0}">
			 	<div id="${t.id }" class="d" style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: #F9D6B6;border-radius:5px 5px 5px 5px;cursor:pointer;">
				<input class="ddcantai" type="hidden" value="${initcantai}"/>
				<input class="ddstate" type="hidden" value="${initstate}"/>
				<input class="ddarea" type="hidden" value="${initarea}"/>			 		
		 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
		 				${t.name }
		 			</div>
		 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
		 				消费：${t.zlist.paymoney } 
		 			</div>
		 		</div> 
		 	</c:if>
		 	<c:if test="${t.hetai==1}">
		 		<div id="${t.id }" class="d" style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: FF6666;border-radius:5px 5px 5px 5px;cursor: pointer;">
		 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
		 				<div style="position: absolute;;margin-left: 0px;margin-top: 0px;"><span class="layui-badge">并</span></div>
		 				${t.name }
		 			</div>
		 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
		 				总消费：${t.htmoney}
		 			</div>
		 		</div>
		 	</c:if>
		 	<c:if test="${t.hetai==2}">
				 <div id="${t.id }" class="d" style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: #F9D6B6;border-radius:5px 5px 5px 5px;cursor: pointer;">
		 			<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
		 				<div style="position: absolute;;margin-left: 0px;margin-top: 0px;"><span class="layui-badge">子</span></div>
		 				${t.name }
		 			</div>
		 			<div style="height: 26px;width: 100%;float: left;color: AAAAAA;padding-left: 5px;">
		 				消费：${t.zlist.paymoney }
		 			</div>
		 		</div> 
		 	</c:if>	
	 		</c:if>
	 		<c:if test="${t.state==2 }">
 		
		 		<div id="${t.id }" class="d" style="height: 86px;width: 121px;float: left;margin: 15px;border: 1px solid #c2c2c2;background-color: A9EB6A;border-radius:5px 5px 5px 5px;cursor:pointer;">
			 		<input class="ddcantai" type="hidden" value="${initcantai}"/>
					<input class="ddstate" type="hidden" value="${initstate}"/>
					<input class="ddarea" type="hidden" value="${initarea}"/>	
			 		<div style="height: 60px;width: 100%;float: left;text-align: center;line-height: 60px;">
		 				${t.name}
		 			</div>
		 			<div style="height: 26px;width: 100%;float: left;color:white;background-color: FF7900;font-size: 12px;">
		 				 ${t.yutime}
		 			</div>
		 		</div> 	 			
	 		</c:if>
	 	</c:forEach>	  
    	</div>
	</div>

	<div id="showDingDan" style="height: 750px;width: 19.9%;float: right;background-color: #d2d2d2;">
<%-- 		<div style="height: 100px;width: 100%;border-bottom: 1px solid #eeeeee;float: left; background-color: white;">
			<div style="height: 15px;width: 100%;margin-top: 5px;font-weight: bold;">&nbsp;桌号：</div>
			<div style="height: 15px;width: 100%;margin-top: 5px;">&nbsp;单号：</div>
			<div style="height: 15px;width: 100%;margin-top: 5px;">&nbsp;开台时间：</div>
		</div>
		<div  style="height: 480px;width: 100%;border-bottom: 1px solid #eeeeee;float: left;background-color: white;">
			<table class="layui-table" lay-even lay-skin="row" >
				  <colgroup>
				    <col width="50%">
				    <col width="25%">
				    <col width="25%">
				  </colgroup>
		  		  <thead>
				    <tr>
				      <th>品名</th>
				      <th>数量</th>
				      <th>价格</th>
				    </tr> 
				  </thead>
				  <tbody>



				  </tbody>
			</table>
				
			</div>
			<div style="height: 35px;width: 100%;border-bottom: 1px solid #eeeeee;float: left;text-align: right;line-height: 35px;background-color: white;">
				菜品金额：
			</div>
			<div class="add" style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_kaitai.jpg');margin-top: 5px;margin-left: 10px;margin-right: 10px;"></div>
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_diandan.jpg');margin-top: 5px;"></div>
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_jiezhang.jpg');margin-top: 5px;margin-left: 10px;margin-right: 10px;"></div>
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_qingtai.jpg');margin-top: 5px;"></div>
			<div style="width: 125px;height: 48px;float: left;margin-top: 5px;margin-left: 10px;margin-right: 10px;text-align: center;line-height: 48px;background-color: white;"><i class="layui-icon" style="color: 5A7B9E;">&#xe64c;</i> 合台</div>
			<div style="width: 125px;height: 48px;float: left;background-color: white;;margin-top: 5px;text-align: center;line-height: 48px;"><i class="layui-icon" style="color: 58729C;font-size: 20px;">&#xe64d;</i>&nbsp;拆台</div>
 --%>
 		<div style="height: 100px;width: 100%;border-bottom: 1px solid #eeeeee;float: left; background-color: white;">
			<div style="height: 15px;width: 100%;margin-top: 5px;font-weight: bold;">&nbsp;桌号：</div>
			<div style="height: 15px;width: 100%;margin-top: 5px;">&nbsp;单号：			<c:choose>
				<c:when test="${dds.state==1}">
					<label id="newdd">${dds.zlist.id }</label>
				</c:when>
				<c:otherwise>
					<label id="danhao"></label>
				</c:otherwise>
			</c:choose></div>
			<div style="height: 15px;width: 100%;margin-top: 5px;">&nbsp;开台时间：</div>
		</div>
		<div style="height: 420px;width: 100%;border-bottom: 1px solid #eeeeee;float: left;background-color: white;">
			<table class="layui-table" lay-even lay-skin="row" >
				  <colgroup>
				    <col width="50%">
				    <col width="25%">
				    <col width="25%">
				  </colgroup>
		  		  <thead>
				    <tr>
				      <th>品名</th>
				      <th>数量</th>
				      <th>价格</th>
				    </tr> 
				  </thead>
				  <tbody>
 				  <c:forEach items="${DDXQ}" var="d">
				    <tr>
				      <td>${d.cainame}</td>
				      <td>${d.num}份</td>
				      <td>${d.money}</td>
				    </tr>
				   </c:forEach>  
				  </tbody>
			</table>
				
			</div>
			<div style="height: 35px;width: 100%;border-bottom: 1px solid #eeeeee;float: left;text-align: right;line-height: 35px;background-color: white;">
				菜品金额：
			</div>
			<div class="add" style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_kaitai.jpg');margin-top: 5px;margin-left: 10px;margin-right: 5px;"></div>
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_diandan.jpg');margin-top: 5px;"></div>
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_jiezhang.jpg');margin-top: 5px;margin-left: 10px;margin-right: 5px;"></div>
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_qingtai.jpg');margin-top: 5px;"></div>
			<div style="width: 125px;height: 48px;float: left;margin-top: 5px;margin-left: 10px;margin-right: 5px;text-align: center;line-height: 48px;background-color: white;"><i class="layui-icon" style="color: 5A7B9E;">&#xe64c;</i> 合台</div>
			<div style="width: 125px;height: 48px;float: left;background-color: white;;margin-top: 5px;text-align: center;line-height: 48px;"><i class="layui-icon" style="color: 58729C;font-size: 20px;">&#xe64d;</i>&nbsp;拆台</div>
 
		</div>
		
	</div>


  </body>
 <script type="text/javascript">
		$("#kaitaiqueren").live('click',function(){
			dingdanid=$("#danhao").html();
			tableid=$("#tableid").val();
			dingdaneatnum=$("#eatnum").val();
			fuwuid=$("#fuwuid").val();
			dingdancashierid=$("#cashierid").val();
			xdcantai=$(".ddcantai").val();
			xdstate=$(".ddstate").val();
			xdarea=$(".ddarea").val();
			sendKAjax();
		});
		$("#qtquren").live('click',function(){

			qtdingdanid=$("#newdd").html();
			qttableid=$("#tableid").val();
			qtcantai=$(".ddcantai").val();
			qtstate=$(".ddstate").val();
			qtarea=$(".ddarea").val();
			sendDAjax();
		});


	$("#showcanhetai>div").live('click',function(){
				//alert("dd");
		 		if($(this).attr("id")!="slc"){
		 			$(this).css({"background":"#FF7900"}).attr("id","slc");
		 		}else{
		 			$(this).css({"background":"#F9D6B6"}).attr("id","");
		 		}
		 });


	$("#htqueren").live('click',function(){
			
			res=$("#showcanhetai>div").find(".fuhetaitableid").val()+"/";
			$("#showcanhetai>div").each(function(){
  			if($(this).attr("id")=="slc"){
  				res+=$(this).find(".canhetaitableid").val()+"/";
  			}
  		});
			nhcantai=$(".ddcantai").val();
			nhstate=$(".ddstate").val();
			nharea=$(".ddarea").val();	
  		sendNHAjax();
		});	
	$("#ctqueren").live('click',function(){
			ctcantai=$(".ddcantai").val();
			ctstate=$(".ddstate").val();
			ctarea=$(".ddarea").val();
			cttableid=$("#tableid").val();
			sendCTAjax();			
	});
  		$("#showtables>div").live('click',function(){
/*    			$("#tableid").attr("value",$(this).attr("id"));
  			tableCheck=true;
  			humnum=$(this).find("#hum").attr("value"); */
  			$(this).css('border','1px solid #FF5722');
  			$(this).siblings().css('border','1px solid #c2c2c2');
  		});
 </script>
</html>
