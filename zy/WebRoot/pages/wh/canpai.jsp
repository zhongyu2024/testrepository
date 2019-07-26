<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'canpai.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>
  </head>
  
	<style>
		#box{
			font-family: "微软雅黑";
			font-size: 16px;
		}table tr td{
			border-bottom: 1px #F5F5F5 solid;
		}tr{
			height: 40px;
		}
	</style>
 <body>
		<div id="box">
			<form method="post">
				<div id="top" style="background-color:#EAEEF1;height: 40px;font-size: 26px;">
					<div style="float: left;">
						<a href="pages/wh/w-1.jsp"><img src="images/wh/w-cantai1.png"></a>
					</div>|快餐牌号
					<div style="float: right;">
						<input id="Button1" type="button" value="导出EXCEL"  onclick="javascript:method1('ta')" />
					</div>
				</div>
				
				<div id="addpaihao" style="display:none;width: 300px;height: 200px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
							<div style="background-color: #F5F5F5;width: 300px;height:36px ;">
						<div style="float: left;margin-left: 40px;">提醒</div>
						<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>	
					</div>
					<div style="margin-top: 50px;margin-left: 50px;">确定添加？</div>
					<div>
					<div style="margin-top: 30px;"> 
							<div id="s" class="trust" style="float: left;margin-left:40px;cursor: pointer;"><img src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 50px;cursor: pointer;"><img src="images/wh/w-quxiao.png"></div>
					</div>
					</div>
				</div>
				
				
				
				<div id="deletepaihao" style="display:none;width: 300px;height: 200px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
					<div style="background-color: #F5F5F5;width: 300px;height:36px ;">
						<div style="float: left;margin-left: 40px;">提醒</div>
						<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>	
					</div>
					<div style="margin-top: 50px;margin-left: 50px;">确定删除？</div>
					<div>
					<div style="margin-top: 30px;"> 
							<div id="ses" class="trust" style="float: left;margin-left:40px;cursor: pointer;"><img src="images/wh/w-queding.png"></div>
							<div class="quxiao" style="float: left;margin-left: 50px;cursor: pointer;"><img src="images/wh/w-quxiao.png"></div>
					</div>
					</div>
				</div>
				
				<div id="middle" style="clear: both;">
					<div id="right" style="float: left;background-color: white;width:1000px">
						<div style="height: 30px;float: left;">快餐牌号</div>
						<div style="float: right;"></div>
						<div style="clear: both;background-color: #F5F5F5;">
							<div style="float: left;cursor: pointer;" class="add"><img src="images/wh/w-paihao-1.png"></div>
							<div style="float: left;cursor: pointer;" class="delete"><img src="images/wh/w-paihao-3.png"></div>
							<div style="float: right;"></div>
						</div>
						<div id="showInfo"  style="clear: both;width: 1000px;">
							<table cellpadding="0" cellspacing="0" width="1000px" id="ta">
								<tr style="background-color: lightgray;height: 40px;cursor: default;">
									<td width="50">编号</td>
									<td width="100">餐牌</td>
								</tr>
								<c:forEach var="t" items="${canpai }">
								<tr class="ccc">
									<td width="50">${t.id }</td>
									<td width="100">${t.id }号</td>
								</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>
	<script>
		$(".ccc").live('click',function(){
			$(this).css({"background":"gold"}).attr("id","select");
			$(".ccc").not(this).css({"background":"white"}).attr("id","");
		});
		$("#s").click(function(){
			$.ajax({
					method:"get",
					url:"whCanPai/addCanpai.do",
					dataType:"html",
					success:function(result){
						if(result){
							window.location.href="whCanPai/showCanPai.do";
						}
					}	
			});
		});
		$("#ses").click(function(){
			var s=true;
			var id=0;
			$(".ccc").each(function(){
				if($(this).attr("id")=="select"){
					id=$(this).find("td:eq(0)").html();					
					s=false;
					return;
				}
			});
			if(s){
				alert("请选中要删除的内容！");
			}else{
				//window.location="whCanPai/deleteCanpai.do?id="+id;
				$.ajax({
					method:"get",
					url:"whCanPai/deleteCanpai.do",
					data:{"id":id},
					dataType:"html",
					success:function(result){
					if(result){
						window.location.href="whCanPai/showCanPai.do";
						}
					}
				});
			}
			$("#deletepaihao").css("display","none");
		});
		$(".cha").click(function(){
			$(this).parent().parent().css("display","none");
		});
		$(".quxiao").click(function(){
			$(this).parent().parent().parent().css("display","none");
		});
		$(".all").click(function(){
			$(this).css("background-color","darkgrey");
			$(this).siblings().css("background-color","#F5F5F5");
		});
		/*$(".dating").click(function(){
			$(this).css("background-color","darkgrey");
		});
		$(".baoxiang").click(function(){
			$(this).css("background-color","darkgrey");
		});*/
		$(".add").click(function(){
			$("#addpaihao").find("input").val("");
			$("#addpaihao").css("display","block");	
			$("#editpaihao").css("display","none");
			$("#deletepaihao").css("display","none");
		});
		$(".edit").click(function(){
			//alert(1);
			$("#editpaihao").find("input").val("");
			$("#addpaihao").css("display","none");	
			$("#deletepaihao").css("display","none");
			$("#editpaihao").css("display","block");
		});
		$(".delete").click(function(){
			//alert(1);
			$("#deletepaihao").find("input").val("");
			$("#addpaihao").css("display","none");	
			$("#editpaihao").css("display","none");
			$("#deletepaihao").css("display","block");
		});
	</script>
	<script type="text/javascript" language="javascript">
        var idTmr;
        function  getExplorer() {
            var explorer = window.navigator.userAgent ;
            //ie 
            if (explorer.indexOf("MSIE") >= 0) {
                return 'ie';
            }
            //firefox 
            else if (explorer.indexOf("Firefox") >= 0) {
                return 'Firefox';
            }
            //Chrome
            else if(explorer.indexOf("Chrome") >= 0){
                return 'Chrome';
            }
            //Opera
            else if(explorer.indexOf("Opera") >= 0){
                return 'Opera';
            }
            //Safari
            else if(explorer.indexOf("Safari") >= 0){
                return 'Safari';
            }
        }
        function method1(tableid) {//整个表格拷贝到EXCEL中
            if(getExplorer()=='ie')
            {
                var curTbl = document.getElementById(tableid);
                var oXL = new ActiveXObject("Excel.Application");

                //创建AX对象excel 
                var oWB = oXL.Workbooks.Add();
                //获取workbook对象 
                var xlsheet = oWB.Worksheets(1);
                //激活当前sheet 
                var sel = document.body.createTextRange();
                sel.moveToElementText(curTbl);
                //把表格中的内容移到TextRange中 
                sel.select;
                //全选TextRange中内容 
                sel.execCommand("Copy");
                //复制TextRange中内容  
                xlsheet.Paste();
                //粘贴到活动的EXCEL中       
                oXL.Visible = true;
                //设置excel可见属性

                try {
                    var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
                } catch (e) {
                    print("Nested catch caught " + e);
                } finally {
                    oWB.SaveAs(fname);

                    oWB.Close(savechanges = false);
                    //xls.visible = false;
                    oXL.Quit();
                    oXL = null;
                    //结束excel进程，退出完成
                    //window.setInterval("Cleanup();",1);
                    idTmr = window.setInterval("Cleanup();", 1);

                }

            }
            else
            {
                tableToExcel('ta')
            }
        }
        function Cleanup() {
            window.clearInterval(idTmr);
            CollectGarbage();
        }
        var tableToExcel = (function() {
              var uri = 'data:application/vnd.ms-excel;base64,',
              template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',
                base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
                format = function(s, c) {
                    return s.replace(/{(\w+)}/g,
                    function(m, p) { return c[p]; }) }
                return function(table, name) {
                if (!table.nodeType) table = document.getElementById(table)
                var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
                window.location.href = uri + base64(format(template, ctx))
              }
            })()
    </script>
</html>
