layui.use(['table','form','element','laydate'], function(){
  var table = layui.table
 ,form = layui.form
 ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
  
  var laydate = layui.laydate;
  
  laydate.render({
	    elem: '#date1' 
	  });
  
  laydate.render({
	    elem: '#date2' 
	  });
  
/*  var ii = layer.load();
  setTimeout(function(){
    layer.close(ii);
  }, 500);*/
  	
  		init();
  
  		$('.search-btn').on('click', function(){
  			init()
  		});   
  		
  		
  		function init(){
  			//var is_check=$("#is_check option:selected").val()
  			var is_pay=$("#is_pay option:selected").val()
  			var get_way=$("#get_way option:selected").val()
  			var date1=$("#date1").val()
  			var date2=$("#date2").val()
  			var user_name=$("#user_name").val()
  			var order_sn=$("#order_sn").val()
  			
  			if(date1>date2)
  			{
  				alert("结束时间不能大于开始时间")
  				return;
  			}
  			
  		    var tableIns = table.render({
  		        elem: '#userList',
  		        url : '/userapi/allgetmoneyinfo',
  		        id:'userList',
  		        cellMinWidth : 95,
  		        page : true,
  		        height : 400,
  		        limit : 10,
  		        limits : [10,20,30,40],
  		        where: {is_pay:is_pay,get_way:get_way,date1:date1,date2:date2,user_name:user_name,order_sn:order_sn}, 
  		        cols : [[
  		            {field: 'id', title: '序号', width:120, align:"center",align:'center'},
  		            {field: 'user_name', title: '用户名', width:180,align:'center'},
  		            {field: 'real_name', title: '真实姓名', width:180,align:'center'},
  		            {field: 'get_way', title: '提现方式', width:120,align:'center',
  		            	templet :function (row){
  		            		if(row.get_way==1){
  		            			return '支付宝'
  		            		}
  		                    return '银行卡'
  		                }
  		            },
  		            {field: 'account', title: '提现账号', width:120,align:'center'},
  		            {field: 'amount', title: '提现金额', width:120,align:'center'},
  		            {field: 'create_time', title: '创建时间',width:180, align:'center',
  		            	templet :function (row){
  		                    return createTime(row.create_time);
  		                }
  		            },
  		            {field: 'order_sn', title: '订单号', width:180},
  		            /*{field: 'is_check', title: '是否审核',  align:'center',width:150,
  		            	templet :function (res){
  		            		var s = ''
  		            		if(res.is_check==1){
  		            			s='checked=1'
  		            		}
  		                    return "<input type='checkbox' lay-skin='switch' lay-filter='is_check' "+s+" " +
  		                    		"value='"+res.id+"' attr='"+res.is_check+"'>"
  		                }
  		            },*/
  		            {field: 'is_pay', title: '是否支付',  align:'center',width:150,
  		            	templet :function (res){
  		            		if(res.is_pay==2){
  		            			return '已拒绝'
  		            		}else if(res.is_pay==1){
  		            			return '已支付'
  		            		}else{
  		            			return '未支付'
  		            		}
  		                }
  		            },
  		           {title: '操作', width:180, 
  		            	templet :function (res){
  		            		if(res.is_pay==2){
  		            			return '<a class="layui-btn layui-btn-xs">已拒绝</a>'
  		            		}else if(res.is_pay==1){
  		            			return '<a class="layui-btn layui-btn-xs" lay-event="edit">修改订单</a>'
  		            		}else{
  		            			return '<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">同意</a><a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="refuse">拒绝</a><a class="layui-btn layui-btn-xs" lay-event="edit">修改订单</a>'
  		            		}
  		                }
  		            ,fixed:"right",align:"center"}
  		        ]]
  		    });
  			
  			
	    //列表操作
  	    table.on('tool(userList)', function(obj){
  	        var layEvent = obj.event;
  	        var	data = obj.data;
  	        var id=data.id
  	        var user_id=data.user_id
  	        var amount=data.amount

  	        
  	        if(layEvent === 'del'){ 
  	        	
  	        	  layer.prompt({title: '输入订单号', formType: 3}, function(text, index){
  	        	    layer.close(index);
	  	        	  $.ajax({
				            type:"GET",
				            url:"/userapi/updategetmoney",
				            data:{is_pay:1,id:id,user_id:user_id,amount:amount,order_sn:text},
				         	datatype: "json",
				      		async:false,
				            success:function(result){
				            	if(result==1){
				            		layer.msg('操作成功！', {icon: 1});
				            		tableIns.reload();
				            	}
				            },
				            error: function (jqXHR, textStatus, errorThrown) {
				            	layer.msg("操作失败！")
				            }
		  	    		});
  	        	  });
  	        	
	        } 
  	        
	  	      if(layEvent === 'edit'){ 
		        	
		        	  layer.prompt({title: '输入订单号', formType: 3}, function(text, index){
		        	    layer.close(index);
	  	        	  $.ajax({
				            type:"GET",
				            url:"/userapi/updateOrderSn",
				            data:{id:id,order_sn:text},
				         	datatype: "json",
				      		async:false,
				            success:function(result){
				            	if(result==1){
				            		layer.msg('操作成功！', {icon: 1});
				            		tableIns.reload();
				            	}
				            },
				            error: function (jqXHR, textStatus, errorThrown) {
				            	layer.msg("操作失败！")
				            }
		  	    		});
		        	  });
	  	      } 
	  	      
	  	    if(layEvent === 'refuse'){ 
	        	
	        	  $.ajax({
			            type:"GET",
			            url:"/userapi/refusegetmoney",
			            data:{id:id,is_pay:2},
			         	datatype: "json",
			      		async:false,
			            success:function(result){
			            	if(result==1){
			            		layer.msg('操作成功！', {icon: 1});
			            		tableIns.reload();
			            	}
			            },
			            error: function (jqXHR, textStatus, errorThrown) {
			            	layer.msg("操作失败！")
			            }
	  	    		});
	      } 
  	        
  	    })
	    
  	}/*init*/
})

/* layui end */

	function createTime(v){
		var date = new Date(v);
	    var y = date.getFullYear();
	    var m = date.getMonth()+1;
	    m = m<10?'0'+m:m;
	    var d = date.getDate();
	    d = d<10?("0"+d):d;
	    var h = date.getHours();
	    h = h<10?("0"+h):h;
	    var M = date.getMinutes();
	    M = M<10?("0"+M):M;
	    var str = y+"-"+m+"-"+d+" "+h+":"+M;
	    return str;
	}

