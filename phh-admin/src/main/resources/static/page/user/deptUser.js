layui.use(['table','form','element','laydate','layer'], function(){
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
  
  var ii = layer.load();
  setTimeout(function(){
    layer.close(ii);
  }, 500);
  		
  var tableIns = table.render({
        elem: '#userList',
        url : '/duser/api/duserList',
        id:'userList',
        cellMinWidth : 95,
        page : true,
        height : 400,
        limit : 10,
        limits : [10,20,30,40],
        where: {select: 0}, //如果无需传递额外参数，可不加该参数
        cols : [[
            {field: 'id', title: '序号', width:60, align:"center",align:'center'},
            {field: 'user_create_time', title: '创建时间', width:180,align:'center',
            	templet :function (row){
                    return createTime(row.user_create_time);
                }   
            },
            {field: 'user_uname', title: '账号名称', width:180,align:'center'},
            {field: 'user_name', title: '登录账号', width:180,align:'center'},
            {field: 'user_pass', title: '登录密码', width:180,align:'center',
            	templet :function (row){
                    return '******';
                } 
            },
            {field: 'company_name', title: '顶级分类', width:120,align:'center'},
            {field: 'dept_name', title: '所属部门', width:120,align:'center'},
            {field: 'user_is_lock', title: '是否启用', width:120,align:'center',
            	templet :function (row){
            		if(row.user_is_lock==0){
            			return "<input type='checkbox' selected='selected'>"
            		}
                    return "<input type='checkbox'>";
                } 
            },
            {title: '操作', width:120, templet:'#userlistBar',fixed:"right",align:"center"}
        ]],
        
    });
	
    	//根据条件查找
  		$('.search-btn').on('click', function(){
  			var com=$("#com option:selected").val()
  			var dept=$("#dept option:selected").val()
  			var account_name=$("#account_name").val()
  			var user_name=$("#user_name").val()
  			
  			if(com!=0&&dept==0){
  				alert("请选择部门")
  				return;
  			}
  			
  			//方法级渲染
  			var tableIns = table.render({
  		        elem: '#userList',
  		        url : '/duser/api/duserList',
  		        id:'userList',
  		        cellMinWidth : 95,
  		        page : true,
  		        height : 400,
  		        limit : 10,
  		        limits : [10,20,30,40],
  		        where: {com:com,dept:dept,account_name:account_name,user_name:user_name}, 
  		        cols : [[
  		            {field: 'user_id', title: '序号', width:60, align:"center",align:'center'},
  		            {field: 'create_time', title: '创建时间', width:180,align:'center',
  		            	templet :function (row){
  		                    return createTime(row.create_time);
  		                }
  		            },
  		            {field: 'account_name', title: '账号名称', width:180,align:'center'},
  		            {field: 'user_name', title: '登录账号', width:180,align:'center'},
  		            {field: 'user_pass', title: '登录密码', width:180,align:'center',
  		            	templet :function (row){
  		                    return '******';
  		                }
  		            },
  		            {field: 'company_name', title: '顶级分类', width:120,align:'center'},
  		            {field: 'dept_name', title: '所属部门', width:120,align:'center'},
  		            {field: 'is_active', title: '是否启用', width:120,align:'center',
  		            	templet :function (row){
  		            		if(row==1){
  		            			return "<input type='checkbox' selected='selected'>"
  		            		}
  		                    return "<input type='checkbox'>";
  		                } 
  		            },
  		            {title: '操作', width:120, templet:'#userlistBar',fixed:"right",align:"center"}
  		        ]],
  		        
  		    });
  			
  		});   
  		
  		
  		//列表操作
  	    table.on('tool(userList)', function(obj){
  	        var layEvent = obj.event,
  	            data = obj.data;
  	        if(layEvent === 'edit'){ //编辑
  	        	layer.open({
  	        	  type: 1,
  	        	  title: false,
  	        	  closeBtn: 0,
  	        	  shadeClose: true,
  	        	  skin: 'yourclass',
  	        	  content: '<div> asd</div>'
  	        	});
  	        	
  	        } 
  	    });
  	    
  	    $("#addBtn").click(function(){
  	    	layer.open({
	        	  type: 1,
	        	  title: '新增账户',
	        	  area: ['350px', '450px'],
	        	  closeBtn: 1,
	        	  shadeClose: true,
	        	  skin: 'yourclass',
	        	  content: $("#t")
	        	  
	        	});
  	    })
  	    
    
})

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

