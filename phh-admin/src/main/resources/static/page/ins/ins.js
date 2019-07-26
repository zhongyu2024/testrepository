layui.use(['layer', 'table','form','jquery','element','laydate'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var form = layui.form;
        var layer = layui.layer;
        
        
        var i = layer.load();
       
 
        // 渲染表格
        var renderTable = function () {
        	 var tableIns = table.render({
   		        elem: '#insList',
   		        url : '/ins/insList',
   		        id:'insList',
   		        cellMinWidth : 95,
   		        page : true,
   		        height : 500,
   		        limit : 10,
   		        limits : [10,20,30,40],
		            cols: [[
		                {type:  'numbers',title: '序号'},
		                {field: 'ins_name', width: 300, title: '商户名'},
		                {field: 'account_name', width: 300, title: '账户名'},
		                {field: 'sort', width: 160, align: 'center', title: '排序'},
		                {field: 'mobile', width: 160, align: 'center', title: '手机号'},
		                {field: 'img_url', align: 'center', title: '头像',
		                	templet :function (res){
		                		if((res.img_url).indexOf('http')!=-1){
		    	            		return "<img src="+res.img_url+">";
		    	            	}
		    	                return "<img src="+"http://erp.wnduoduo.com/phaha/static_file/upload_img/"+res.img_url+">";
		    	            }
		                },
		                {field: 'id_card', width: 160, align: 'center', title: '身份证号'},
		                {field: 'get_percent', width: 160, align: 'center', title: '课程提取百分比'},
		                {field: 'status', width: 160, align: 'center',title: '是否通过审核',templet :function (res){
		            			var s = ''
		                		if(res.status==1){
		                			s='checked=1'
		                		}
		                        return  "<input type='checkbox' lay-skin='switch' " +
		                        		"lay-filter='status' "+s+" " +
		                        		"value='"+res.id+"' attr='"+res.status+"'>"
		                    }
		                },
		                /*{field: 'image_url', title: '头像', align:'center',templet :function (row){
		                    return "<img src="+""+row.img_url+">";
		                	}//"http://erp.wnduoduo.com/phaha/static_file/upload_img/"
		                },*/
		                {templet: '#auth-state22', width: 100, align: 'center', title: '编辑',fixed:'right'},
		                {templet: '#auth-state11', width: 100, align: 'center', title: '锁定',fixed:'right'},
		                {templet: '#auth-state', width: 100, align: 'center', title: '删除',fixed:'right'}
		            ]],
                done: function () {
                    layer.closeAll('loading');
                }
            });
        };
 
        renderTable();

        //列表操作
        table.on('tool(insList)', function(obj){
            var layEvent = obj.event;
            var	data = obj.data;
            var id=data.id
//            var name=data.name
//            var sort_index=data.sort_index
//            var sort=data.sort
//            var img_url=data.img_url
            
            //编辑
    		if(layEvent === 'edit'){
    			layer.open({
    			  type: 1,
    			  title: '修改分类',
    			  shadeClose: true,
    			  closeBtn: 1,
    			  area: ['500px', '600px'], //宽高
    			  skin: 'yourclass',
    			  content: $("#update_ins")
    			});
    			
    			$("#id").val(id)
    			
    			$.ajax({
		            type:"post",
		            url:"/ins/updateview",
		            data:{id:id},
		         	datatype: "json",
		      		async:false,
		            success:function(data){
		            	//console.log(data.entity)
		            	var obj = data.entity
		            	updateview(obj)
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		            	layer.msg('删除失败！', {icon: 2});
		            }
		            
    			});
    		} 

            //锁定
            if(layEvent === 'lock'){ 
          	  //询问框
        	    	layer.confirm('确认锁定？', {
        	    	  btn: ['是','否'] //按钮
        	    	}, function(){
        	    		$.ajax({
      		            type:"post",
      		            url:"/ins/lock",
      		            data:{id:id},
      		         	datatype: "json",
      		      		async:false,
      		            success:function(data){
      		            		layer.msg('锁定成功！', {icon: 1});
      		            		renderTable();
      		            },
      		            error: function (jqXHR, textStatus, errorThrown) {
      		            	layer.msg('锁定失败！', {icon: 2});
      		            }
      	          });
        	    		
        	    	}, function(){
//      		  	    	  layer.msg('操作取消', {
//      		  	    	    time: 20000, //20s后自动关闭
//      		  	    	    btn: ['明白了', '知道了']
//      		  	    	  });
        	    	});
              } 
            	
          //删除
          if(layEvent === 'del'){ 
        	  //询问框
      	    	layer.confirm('确认删除？', {
      	    	  btn: ['是','否'] //按钮
      	    	}, function(){
      	    		
      	    		$.ajax({
    		            type:"post",
    		            url:"/ins/delete",
    		            data:{id:id},
    		         	datatype: "json",
    		      		async:false,
    		            success:function(data){
    		            		layer.msg('删除成功！', {icon: 1});
    		            		renderTable();
    		            },
    		            error: function (jqXHR, textStatus, errorThrown) {
    		            	layer.msg('删除失败！', {icon: 2});
    		            }
    	          });
      	    		
      	    	}, function(){
//    		  	    	  layer.msg('操作取消', {
//    		  	    	    time: 20000, //20s后自动关闭
//    		  	    	    btn: ['明白了', '知道了']
//    		  	    	  });
      	    	});
            } 
      	      
        });
        
        //添加商家
        $('#add-btn').on('click', function(){
        	$("#name").val('');
        	$("#sort_index").val('');
        	$("#image_url").val('');
        	$("#demo1").attr("src"," ");
        	layer.open({
            	  type: 1,
            	  title: '添加商家',
            	  area: ['500px', '600px'],
            	  closeBtn: 1,
            	  shadeClose: true,
            	  skin: '',
            	  content: $("#add_course")
        	});
        });
        
		//确定添加
		$("#add-confirm").click(function(){
				//验证数据
//	    		var parentId = $("#parentId").val()
//	  	    	var name = $("#name").val()
//	  	    	$("#sort").val('');
//				var sort_index = $("#sort_index").val()
//				var sort = $("#sort").val()
//				var img_url = $("#image_url").val();
//				if(!isRealNum(sort_index)){
//					layer.msg("请输入数字")
//					return
//				}
			
			console.log($("#addForm").serialize())
			//添加数据
			$.ajax({
		            type:"post",
		            url:"/ins/insert",
					data:$("#addForm").serialize(),		         	
		         	datatype: "json",
		      		async:false,
		            success:function(data){
		            	//console.log(data)
		            	renderTable();
		            	layer.closeAll()
		            	layer.msg(data.message)
		            }
	        });
  	    })
    		
    		//修改
    		$('#update-confirm').on('click', function(){
//    			var name = $("#upname").val()
//    			var id = $("#upid").val()
//    			var sort_index = $("#sort_indexa").val()
//    			var img_url = $("#edit_image_url").val()
//    			var sort = $("#sort").val()
//    			if(name==null||name==''){
//    				layer.msg("名称不能为空");
//    				return
//    			}
//    			if(!isRealNum(sort)){
//    				layer.msg("请输入数字")
//    				return
//    			}
    			
    			//更新数据
    			$.ajax({
    		            type:"post",
    		            url:"/ins/update",
    					data:$("#updateForm").serialize(),		         	
    		         	datatype: "json",
    		      		async:false,
    		            success:function(data){
    		            	//console.log(data)
    		            	renderTable()
    		            	layer.closeAll()
    		            	layer.msg(data.message)
    		            }
    	        });
    			
    		})
    		
    		//是否审核通过
    	    form.on('switch(status)', function(data){
    	    	 //console.log(data.value+':'+data.elem.checked);
    	    	 var state
    	    	 var id=data.value
    	    	 if(data.elem.checked){
    	    		 state=1
    	    	 }else{
    	    		 state=0
    	    	 }
    	    	 //var params = {"id":id,"status":state}
    	    	 $.ajax({
    		            type:"post",
    		            url:"/ins/updateStatus",
    		            data:{"id":id,"status":state},
    		        	//contentType : 'application/json',
    		        	dataType : 'json',
    		      		async:false,
    		            success:function(result){
    		            	if(result==1){
    		            		layer.msg("操作成功！")
    		            	}
    		            },
    		            error: function (jqXHR, textStatus, errorThrown) {
    		            	layer.msg("系统异常！")
    		            }
    	         });
    	    	 
    	    });
    });


	function isRealNum(val){
		    // isNaN()函数 把空串 空格 以及NUll 按照0来处理 所以先去除
		    if(val === "" || val ==null){
		        return false;
		    }
		    if(!isNaN(val)){
		        return true;
		    }else{
		        return false;
		    }
	}     
	
	//填充数据
	function updateview(o){
		$(".account_name").val(o.account_name)
		$(".ins_name").val(o.ins_name)
		$(".mobile").val(o.mobile)
		$(".get_percent").val(o.get_percent)
		$(".real_name").val(o.real_name);
		$(".id_card").val(o.id_card);
		$(".id_card_up").val(o.id_card_up);
		$(".id_card_down").val(o.id_card_down);
		$(".img_url").val(o.img_url);
		$(".bus_lisence").val(o.bus_lisence);
		$(".sort").val(o.sort);
		$(".address").val(o.address);
	    $(".status").find("option[value="+o.status+"]").attr("selected",true);
	    
	    $(".upview0").attr("src",o.img_url)
	    $(".upview1").attr("src",o.id_card_up)
	    $(".upview2").attr("src",o.id_card_down)
	    $(".upview3").attr("src",o.bus_lisence)
	    
		//$("#demo2").attr("src","http://erp.wnduoduo.com/phaha/static_file/upload_img/"+img_url);
	}
	

