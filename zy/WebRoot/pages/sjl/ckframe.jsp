<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>仓库管理主界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/sjl/ckframe.css" />
	<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>
  </head>
  
  	<body style="font-family: '微软雅黑';background:#ffffff">
  	<div id="cksd">
		<div id="ckleft">
			<div class="csd">
				<div style="height:50px;"></div>
				<div class="title" style="background: #252C32;"><label>仓位设置</label></div>
				<div class="title"><label>供应商设置</label></div>
				<div class="title"><label>原材料设置</label></div>
				<div class="title"><label>菜品配方设置</label></div>
				<div class="title"><label>采购入库</label></div>
				<div class="title"><label>领用出库</label></div>
				<div class="title"><label>库存报表</label></div>
				<div class="title"><label>进出明细表</label></div>
			</div>
		</div>
		<div id="ckright" style="float:left">
			<div style="display:block" class="pages11"><jsp:include page="/Cangku/showByPage.do"/></div>
			<div style="display:none" class="pages11"><jsp:include page="/giver/findAllGiverInfo.do"/></div>
			<div style="display:none" class="pages11"><jsp:include page="/zycl/findAllYclInfo.do"/></div>
			<div style="display:none" class="pages11"><jsp:include page="/zcaipu/ininfo.do"/></div>
			<div style="display:none" class="pages11"><jsp:include page="/Incangku/showAll.do"/></div>
			<div style="display:none" class="pages11"><jsp:include page="/outCangku/showByPage.do"/></div>
			<div style="display:none" class="pages11"><jsp:include page="/Cangkucun/showByPage.do"/></div>
			<div style="display:none" class="pages11"><jsp:include page="/detail/inouttableAll.do"/></div>
		</div>
		</div>
	</body>
	<script type="text/javascript" src="js/sjl/ckframe.js" ></script>
<!-- 	<script type="text/javascript" >
	var index=1;

	alert("111");
	$("#cksd .title").mouseenter(function(){
	/* alert("111"); */
	if(index!=$(this).index()){
	$(this).css("background","#3E5764");
	}
	}).mouseleave(function(){
	if(index!=$(this).index()){
	$(this).css("background","none");
	}
	});

	var index2=1;
	$("#cksd .title").click(function(){
	alert("111");
	index=$(this).index();
	$(this).css("background","#252C32");
	$(this).siblings().css("background","none");
		alert($(this).index());
	$("#ckright .pages11").eq(index2-1).css("display","none");
	$("#ckright .pages11").eq(index-1).css("display","block");
	index2=index;
	});
	
	</script> -->
	
</html>
