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
  	
  		init()
  
  		$('.search-btn').on('click', function(){
  			init()
  		});   
  		
  		
  		function init(){
  			var timetype=$("#timetype option:selected").val()
  			var date1=$("#date1").val()
  			var date2=$("#date2").val()
  			var user_name=$("#user_name").val()
  			var phone=$("#phone").val()
  			
  			var com=$("#com option:selected").val()
  			var dept=$("#dept option:selected").val()
  			var level=$("#levelOp option:selected").val()

  			if(date1>date2)
  			{
  				alert("结束时间不能大于开始时间")
  				return;
  			}
  			
  		    var tableIns = table.render({
  		        elem: '#userList',
  		        url : '/userapi/userlist',
  		        id:'userList',
  		        cellMinWidth : 95,
  		        page : true,
  		        height : 400,
  		        limit : 10,
  		        limits : [10,20,30,40],
  		        where: {timetype:timetype,date1:date1,date2:date2,user_name:user_name,phone:phone,
  		        		province_id:com,city_id:dept,member_level_id:level}, 
  		        cols : [[
  		            {field: 'id', title: '用户ID', width:120, align:"center",align:'center'},
  		            {field: 'is_active', title: '是否启用', width:120,align:'center',
		            	templet :function (res){
		            		var s = ''
		            		if(res.is_active==1){
		            			s='checked=1'
		            		}
		                    return "<input type='checkbox' lay-skin='switch' lay-filter='is_show' "+s+" " +
		                    		"value='"+res.id+"' attr='"+res.is_active+"'>"
		                }
		            },
  		            {field: 'user_name', title: '用户名', width:180,align:'center'},
  		            {field: 'phone', title: '绑定电话', width:180},
  		            {field: 'invitation_user_id', title: '邀请人ID', width:120,align:'center'},
  		          {field: 'upPhone', title: '邀请人手机号码', width:120,align:'center'},
  		            {field: 'invite_code', title: '邀请码',width:120, align:'center'},
  		            {field: 'img_url', title: '头像',  align:'center',width:150,
  		            	templet :function (row){
  		            		if(row.img_url!=null){
  		            			return '<img src="http://erp.wnduoduo.com/phaha/static_file/upload_img/'+row.img_url+'">';
  		            		}
  		            		return ''
  		                    
  		                }
  		            },
  		            {field: 'province_name', title: '省', align:'center',width:120},
  		            {field: 'city_name', title: '市', align:'center',width:120},
  		            {field: 'member_level_id', title: '会员等级', align:'center',width:150,templet :function (row){
		                   if(row.member_level_id==null){
		                	   return '普通用户';
		                   }else if (row.member_level_id==1){
		                	   return 'VIP学员';
		                   }else if (row.member_level_id==2){
		                	   return '钻石VIP';
		                   }else if (row.member_level_id==3){
		                	   return '发起合伙人';
		                   }else if (row.member_level_id==4){
		                	   return '高级合伙人';
		                   }else if (row.member_level_id==5){
		                	   return '创始股东';
		                   }else if (row.member_level_id==6){
		                	   return '市级代理';
		                   }else if (row.member_level_id==7){
		                	   return '省级代理';
		                   }
		                }},
  		            {field: 'member_level_end_time', title: '到期时间', align:'center',width:180,
  		            	templet :function (row){
  		                    return row.member_level_end_time==null?"":createTime(row.member_level_end_time);
  		                }
  		            },
  		            {field: 'create_time', title: '注册时间', align:'center',width:180,
  		            	templet :function (row){
  		                    return createTime(row.create_time);
  		                }
  		            },
  		          {title: '操作', width:170, templet:'#userlistBar',fixed:"right",align:"center"}
  		        ]]
  		    });
  			
  			
  		}
  		
  		
  		//是否启用
	    form.on('switch(is_show)', function(data){
	    	 console.log(data.value+':'+data.elem.checked);
	    	 var user_id=data.value
	    	 var state
	    	 if(data.elem.checked){
	    		 state=1
	    	 }else{
	    		 state=0
	    	 }
	    	 $.ajax({
		            type:"GET",
		            url:"/userapi/updateuser",
		            data:{is_active:state,is_delete:0,user_id:user_id},
		         	datatype: "json",
		      		async:false,
		            success:function(result){
		            	if(result==1){
		            		layer.msg("修改成功！")
		            	}
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		            	layer.msg("修改失败！")
		            }
	         });
	    	 
	    });
	    
	    //列表操作
  	    table.on('tool(userList)', function(obj){
  	        var layEvent = obj.event;
  	        var	data = obj.data;
  	        
  	        var user_id=data.id

  	        //删除
  	        if(layEvent === 'del'){ 
  	        	//询问框
	  	    	layer.confirm('确认删除？', {
	  	    	  btn: ['是','否'] //按钮
	  	    	}, function(){
	  	    		
	  	    		$.ajax({
			            type:"GET",
			            url:"/userapi/updateuser",
			            data:{is_active:1,is_delete:1,user_id:user_id},
			         	datatype: "json",
			      		async:false,
			            success:function(result){
			            	if(result==1){
			            		layer.msg('删除成功！', {icon: 1});
			            		
			            		var timetype=$("#timetype option:selected").val()
			          			var date1=$("#date1").val()
			          			var date2=$("#date2").val()
			          			var user_name=$("#user_name").val()
			          			var phone=$("#phone").val()
			          			
			          			var com=$("#com option:selected").val()
			          			var dept=$("#dept option:selected").val()
			          			var level=$("#levelOp option:selected").val()
			          			
			          			table.reload('userList',{
            		                where: { //设定异步数据接口的额外参数，任意设
            		                	timetype:timetype,date1:date1,date2:date2,user_name:user_name,phone:phone,
            		  		        	province_id:com,city_id:dept,member_level_id:level
            		                }
            		            });
			            	}
			            },
			            error: function (jqXHR, textStatus, errorThrown) {
			            	layer.msg("修改失败！")
			            }
	  	    		});
	  	    		
	  	    	}, function(){
	//		  	    	  layer.msg('操作取消', {
	//		  	    	    time: 20000, //20s后自动关闭
	//		  	    	    btn: ['明白了', '知道了']
	//		  	    	  });
	  	    	});
	        } 
  	        
  	    })
	    
    
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

