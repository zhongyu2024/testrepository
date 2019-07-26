var url;
$("#rbody2 .change").mouseenter(function(){
	url=$(this).find("img").attr("src").substr(0,$(this).find("img").attr("src").indexOf('.'));
	$(this).find("img").attr("src",url+'1'+".jpg");
	$(this).css({"background":"#cccccc","color":"#354148"});
}).mouseleave(function(){
	$(this).find("img").attr("src",url+".jpg");
	$(this).css({"background":"white","color":"black"});
});

$("#rbody2 .inc-ddd tr").css("background","#ffffff");
$("#rbody2 .inc-ddd tr").eq(0).css("background","#DBE4ED");
var cid=$("#rbody2 .inc-ddd tr").eq(0).find(".cid").text();
$("#rbody2 .inc-ddd tr").click(function(){
	$(this).css("background","#DBE4ED");
	$(this).siblings().css("background","none");
	cid=$(this).find(".cid").text();
});

$(function(){
    $("#rbody2 .time").calendar();
});

var name;
$("#rbody2 .change").click(function(){
	var id="#rbody2 #change"+($(this).index()+1);
	$(id).css("display","block");
	$("#rbody2 #hidden1").css("display","block");
	name=$(id).find(".name").val();
	
	$.ajax({
		url:"Incangku/tianjia.do",
  		dataType:"html",
  		success:function(result){
  			$("#rbody2 #inckt").html(result);
		}
	});
	/*alert($("#rbody2 #in-id").val())*/
	if($("#rbody2 #in-id").val().length==2){
		/*alert("cc");*/
		$.ajax({
			url:"Incangku/tianjia.do",
	  		dataType:"html",
	  		success:function(result){
	  			$("#rbody2 #inckt").html(result);
			}
		});
		
	}
	
	
	
});

$("#rbody2 #sub1").click(function(){
	/*var count=$("#matertable").find("tr").length;*/
	/*alert($("#rbody2 #in-id").val());*/
	if($("#rbody2 #change1").find("#in-ckname").val()==0)
	{
		alert("请选择仓库");
	}else if($("#rbody2 #change1").find("#givername").val()==0)
	{
		alert("请选择供应商");
	}else if($("#rbody2 #change1").find("#buyman").val()==0)
	{
		alert("请选择采购员");
	}else if($("#rbody2 #change1").find("#inman").val()==0)
	{
		alert("请选择收货员");
	}else if($("#rbody2 #matertable").find("tr").length<=1)
	{
		alert("请填写采购入库单");
	}else{
		$("#rbody2 #change1").css("display","none"); 
		$("#rbody2 #hidden1").css("display","none");
		$("#rbody2 #in-mx").html("");
		/*alert($("#rbody2 #in-clinfo").val());*/
		$.ajax({
			url:"Incangku/ajaxinck2.do",
	  		dataType:"html",
	  		data:{
	  			"id":$("#rbody2 #in-id").val(),
	  			"intime":$("#rbody2 #in-intime").val(),
	  			"cangkuid":$("#rbody2 #in-ckname").val(),
	  			"giverid":$("#rbody2 #givername").val(),
	  			"byid":$("#rbody2 #buyman").val(),
	  			"inid":$("#rbody2 #inman").val(),
	  			"info":$("#rbody2 #in-clinfo").val(),
	  		},
	  		success:function(result){
	  			$("#rbody2 #in-zhuti").html(result);
			}
		});
		/*$("#change1 form").submit();*/
		
	}
});
$("#rbody2 #res1").click(function(){
	$("#rbody2 #ckname").val("");
	$("#rbody2 #givername").val("");
	$("#rbody2 #buyman").val("");
	$("#rbody2 #inman").val("");
	$("#rbody2 #change1").css("display","none"); 
	$("#rbody2 #hidden1").css("display","none");
  	$("#rbody2 #in-mx").html("");
  	$.ajax({
		url:"Incangku/ajaxinck1.do",
  		dataType:"html",
  		data:{
  			"type":1,
  			"id":$("#rbody2 #in-id").val(),
  			/*"cangkuid":$("#rbody2 #ckname").val(),
  			"giverid":$("#rbody2 #givername").val(),
  			"byid":$("#rbody2 #buyman").val(),
  			"inid":$("#rbody2 #inman").val(),
  			"info":$("#rbody2 #clinfo").val(),*/
  		},
  		success:function(result){
  			$("#rbody2 #in-zhuti").html(result);
		}
	});
	
});

/*$("#sub2").click(function(){
	/*ajax更新取值*/
	
	/*if($("#change2").find(".name").val().trim().length==0)
	{
	alert("请输入名称,不可为空格");
	$("#change2").find(".name").val(name);
}else {
	$("#change2 form").submit();
}
});
$("#res2").click(function(){
	$("#change2").css("display","none");
	$("#hidden").css("display","none");
});*/

$("#rbody2 #res3").click(function(){
	$("#rbody2 #change3").css("display","none");
	$("#rbody2 #hidden1").css("display","none");
});

$("#rbody2 #sub4").click(function(){
	$("#rbody2 #newmater").css("display","block");
	$("#rbody2 #hidden1").css("z-index","4");
});

var hwname=$("#rbody2 .ccl").eq(0).find(".hwname").text();
var hwid=$("#rbody2 .ccl").eq(0).find(".hwid").text();
var hwdw=$("#rbody2 .ccl").eq(0).find(".dw").text();
$("#rbody2 .cailiao").click(function(){
	$("#rbody2 #choose").css("display","block");
	
});


$("#rbody2 .ccl").css("background","#DBE4ED");
$("#rbody2 .ccl").eq(0).css("background","#E8E8E8");
$("#rbody2 .ccl").click(function(){
	$(this).css("background","#E8E8E8");
	$(this).siblings().css("background","none");
	hwname=$(this).find(".hwname").text();
	hwid=$(this).find(".hwid").text();
	hwdw=$(this).find(".dw").text();
	/*alert(hwid+"---"+hwname);*/
});

$("#rbody2 .queren").click(function(){
	$("#rbody2 #choose").css("display","none");
	$("#rbody2 .cailiao").val(hwname);
	$("#rbody2 .cailiaoid").val(hwid);
	$("#rbody2 .cailiaodw").val(hwdw);
});

var rule=/^0\.{1}\d{1,2}$/;
var rule1=/^[1-9]\d*$/;
var rule2=/^[1-9]\d*(.\d{1,2})?$/;
$("#rbody2 #sub5").click(function(){
	var dd=rule.test($("#rbody2 #clmoney").val())||rule2.test($("#rbody2 #clmoney").val());
	if($("#rbody2 #change1").find("#in-ckname").val()==0)
	{
		alert("请先选择仓库");
	}else if($("#rbody2 .cailiao").val()==0)
	{
		alert("请选择材料");
	}else if(!rule1.test($("#rbody2 #clnum").val()))
	{
		alert("请正确输入数量");
	}else if(!dd)
	{
		alert("请正确输入单价");
	}else{
		$("#rbody2 #newmater").css("display","none"); 
		$("#rbody2 #hidden1").css("z-index","2");
		/*$("#change1 form").submit();*/
		$.ajax({
			url:"Incangku/cailiaoAdd.do",
	  		dataType:"html",
	  		data:{"id":$("#rbody2 .cailiaoid").val(),
	  			"number":$("#rbody2 #clnum").val(),
	  			"money":$("#rbody2 #clmoney").val(),
	  			"cid":$("#rbody2 #in-id").val(),
	  			"ckid":$("#rbody2 #change1").find("#in-ckname").val()
	  			},
	  		success:function(result){
	  			$("#rbody2 #in-mx").html(result);
			}
		});
		$("#rbody2 .cailiao").val("");
		$("#rbody2 .cailiaoid").val("");
		$("#rbody2 .cailiaodw").val("");
		$("#rbody2 #clnum").val("");
		$("#rbody2 #clmoney").val("");
	}
});

$("#rbody2 #res5").click(function(){
	$("#rbody2 #newmater").css("display","none");
	$("#rbody2 #hidden1").css("z-index","2");
	$("#rbody2 .cailiao").val("");
	$("#rbody2 .cailiaoid").val("");
	$("#rbody2 .cailiaodw").val("");
	$("#rbody2 #clnum").val("");
	$("#rbody2 #clmoney").val("");
});

var type1=$("#rbody2 .type").val();
var text1=$("#rbody2 .text").val().trim();
$("#rbody2 #sscl").click(function(){
	if($("#rbody2 .type").val()!=0&&$("#rbody2 .text").val().trim().length==0)
	{
		alert("请输入搜索的关键字");
	}else if($("#rbody2 .type").val()==0&&$("#rbody2 .text").val().trim().length!=0)
	{
		alert("请选择搜索字段类型");
	}else{
		/*$("#rbody2 #chtop form").submit();*/
		/*alert("ajax");*/
		type1=$("#rbody2 .type").val();
		text1=$("#rbody2 .text").val().trim();
		$.ajax({
			url:"Incangku/cailiaoSearch.do",
	  		dataType:"html",
	  		data:{"type":$("#rbody2 .type").val(),"text":$("#rbody2 .text").val().trim()},
	  		success:function(result){
	  			$("#rbody2 #chtable1").html(result);
			}
		});
		
		$("#rbody2 .type").val("");
		$("#rbody2 .text").val("");
	}
});

var time1=$("#rbody2 #time1").val();
var time2=$("#rbody2 #time2").val();
var tt=$("#rbody2 #typez").val();
var text=$("#rbody2 #textz").val();

$("#rbody2 #topsub").click(function(){
	if($("#rbody2 #typez").val()!=0&&$("#rbody2 #textz").val().trim().length==0)
	{
		alert("请输入搜索的关键字");
	}else if($("#rbody2 #typez").val()==0&&$("#rbody2 #textz").val().trim().length!=0)
	{
		alert("请选择搜索字段类型");
	}else if(($("#rbody2 #time1").val()!=0&&$("#rbody2 #time2").val().trim().length==0)||($("#rbody2 #time1").val()==0&&$("#rbody2 #time2").val().trim().length!=0))
	{
		alert("请明确时间区间");
	}else{
		/*$("#rbody2 #chtop form").submit();*/
		time1=$("#rbody2 #time1").val(),
		time2=$("#rbody2 #time2").val(),
		tt=$("#rbody2 #typez").val(),
		text=$("#rbody2 #textz").val(),
		$.ajax({
			url:"Incangku/ajaxsearch.do",
	  		dataType:"html",
	  		data:{
	  			"time1":$("#rbody2 #time1").val(),
	  			"time2":$("#rbody2 #time2").val(),
	  			"tt":$("#rbody2 #typez").val(),
	  			"text":$("#rbody2 #textz").val(),
	  		},
	  		success:function(result){
	  			$("#rbody2 #in-zhuti").html(result);
			}
		});
	}
});


/*$("#rbody2 .in-tr").css("background","#D3D3D3");
$("#rbody2 .in-tr").eq(0).css("background","#9FB9D6");
var mid=$("#rbody2 .in-tr").eq(0).find(".in-ajaxid").val();
$(".in-tr").click(function(){
$(this).css("background","#9FB9D6");
$(this).siblings().css("background","none");
mid=$(this).find(".in-ajaxid").val();
});*/

$("#rbody2 #res4").click(function(){
	$.ajax({
		url:"Incangku/cailiaoAdd.do",
  		dataType:"html",
  		data:{"id":mid,
  			"cid":$("#rbody2 #in-id").val(),
  			"type":2,
  			"number":1,
  			"money":1,
  			"ckid":1
  		},
  		success:function(result){
  			$("#rbody2 #in-mx").html(result);
		},error:function(result){
			alert("删除失败");
  		}
	});
});










