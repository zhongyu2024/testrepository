layui.config({
        base: 'module/'
    }).extend({
        treetable: 'treetable-lay/treetable'
    }).use(['layer', 'table', 'treetable','form','jquery','element','laydate'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var form = layui.form;
       // var element = layui.element;
        var layer = layui.layer;
        var treetable = layui.treetable;
 
        // 渲染表格
        var renderTable = function () {
         var tableIns=treetable.render({
                treeColIndex: 1,
                treeSpid: 0,
		        treeIdName: 'id',
		        treePidName: 'parent_id',
                treeDefaultClose: true,
                treeLinkage: false,
                elem: '#chapterlist',
                url: 'courseapi/getAllCate',
                 // url: '{:url('menujson')}',
                page: false,
		            cols: [[
		                {type: 'numbers'},
		                {field: 'name', minWidth: 50, title: '名称'},
		                {field: 'sort', width: 80, align: 'center', title: '默认排序'},
		                {field: 'sort_index', width: 80, align: 'center', title: '展示排序'},
		                {field: 'hide', width: 80, align: 'center', 	templet :function (res){
		            		var s = ''
		                		if(res.is_index==1){
		                			s='checked=1'
		                		}
		                        return "<input type='checkbox' lay-skin='switch' lay-filter='is_index' "+s+" " +
		                        		"value='"+res.id+"' attr='"+res.is_index+"'>"
		                    
		                    }, title: '是否显示到首页'
		                },
		                {field: 'image_url', title: '图片', align:'center',templet :function (row){
		                    return "<img src="+"http://erp.wnduoduo.com/phaha/static_file/upload_img/"+row.img_url+">";
		                	}
		                },
		                {templet: '#auth-state', width: 100, align: 'center', title: '删除'}
		                ,
		                {templet: '#auth-state11', width: 100, align: 'center', title: '新增'}
		                ,
		                {templet: '#auth-state22', width: 100, align: 'center', title: '编辑'}
		            ]],
                done: function () {
                    layer.closeAll('loading');
                }
            });
        };
 
        renderTable();
 

        
  //头工具栏事件
      //列表操作
        table.on('tool(chapterlist)', function(obj){
            var layEvent = obj.event;
            var	data = obj.data;
            var id=data.id
            var name=data.name
            var sort_index=data.sort_index
            var sort=data.sort
            var img_url=data.img_url
            
            //添加
        	if(layEvent === 'add'){
        		$("#name").val('');
        		$("#sort_index").val('');
        		$("#sort").val('');
        		$("#image_url").val('');
        		$("#demo1").attr("src"," ");
        		$("#parentId").val(id);
        		layer.open({
                	  type: 1,
                	  title: '添加分类',
                	  area: ['400px', '500px'],
                	  closeBtn: 1,
                	  shadeClose: true,
                	  skin: 'yourclass',
                	  content: $("#add_course")
        		});
    		}
            //编辑
    		if(layEvent === 'edit'){
    			layer.open({
    			  type: 1,
    			  title: '修改分类',
    			  shadeClose: true,
    			  closeBtn: 1,
    			  area: ['400px', '400px'], //宽高
    			  skin: 'yourclass',
    			  content: $("#up_course")
    			});
    			//填充数据
    			$("#upname").val(name)
    			$("#upid").val(id)
    			$("#sort_indexa").val(sort_index)
    			$("#edit_image_url").val(img_url);
    			$("#up_sort").val(sort);
    			$("#demo2").attr("src","http://erp.wnduoduo.com/phaha/static_file/upload_img/"+img_url);
    		} 
            	
          //删除
          if(layEvent === 'del'){ 
        	  //询问框
      	    	layer.confirm('确认删除？', {
      	    	  btn: ['是','否'] //按钮
      	    	}, function(){
      	    		
      	    		$.ajax({
    		            type:"GET",
    		            url:"/courseapi/delCategory",
    		            data:{id:id},
    		         	datatype: "json",
    		      		async:false,
    		            success:function(result){
    		            	if(result==1){
    		            		layer.msg('删除成功！', {icon: 1});
    		            		renderTable();
    		            	}else if(result==3){
    		            		layer.msg('该分类下有未删除课程，不可删除！', {icon: 5});
    		            	}else if(result==4){
    		            		layer.msg('该分类下有未删除子分类，不可删除！', {icon: 5});
    		            	}
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
      //添加
        $('#add-btn').on('click', function(){
        	$("#name").val('');
        	$("#sort_index").val('');
        	$("#image_url").val('');
        	$("#demo1").attr("src"," ");
        	layer.open({
            	  type: 1,
            	  title: '添加分类',
            	  area: ['400px', '500px'],
            	  closeBtn: 1,
            	  shadeClose: true,
            	  skin: 'yourclass',
            	  content: $("#add_course")
        	});
        }); 
        
        	//提交前验证
    		$('.up-confirm').on('click', function(){
    			var name = $("#upname").val()
    			var id = $("#upid").val()
    			var sort_index = $("#sort_indexa").val()
    			var img_url = $("#edit_image_url").val()
    			var sort = $("#up_sort").val()
    			if(name==null||name==''){
    				layer.msg("名称不能为空");
    				return
    			}
    			if(!isRealNum(sort_index)){
    				layer.msg("请输入数字")
    				return
    			}
    	 
    			$.ajax({
    	            type:"GET",
    	            url:"/courseapi/updateCategory",
    	            data:{id:id,name:name,sort_index:sort_index,img_url:img_url,sort:sort},
    	         	datatype: "json",
    	      		async:false,
    	            success:function(data){
    	            	if(data==1){
    	            		renderTable();
    	            		layer.closeAll();
    	            		layer.msg("修改成功！")
    	            	}
    	            },
    	            error: function (jqXHR, textStatus, errorThrown) {
    	            	layer.msg("系统错误")
    	            }
    			});
    			
    		})
    		
    		//确定添加
    		$(".add-confirm").click(function(){
  	    	//验证数据
    			
    		var parentId = $("#parentId").val()
  	    	var name = $("#name").val()
  	    	$("#sort").val('');
			var sort_index = $("#sort_index").val()
			var sort = $("#sort").val()
			var img_url = $("#image_url").val();
			if(!isRealNum(sort_index)){
				layer.msg("请输入数字")
				return
			}
			
			//添加数据
			$.ajax({
		            type:"GET",
		            url:"/courseapi/addCategory",
					data:{parentId:parentId,name:name,sort_index:sort_index,img_url:img_url,sort:sort},		         	
		         	datatype: "json",
		      		async:false,
		            success:function(data){
		            	console.log(data)
		            	layer.msg("添加成功！")
		            	renderTable();
		            	layer.closeAll()
		            }
	        });
  	    })
    		
    		
    		//是否显示到首页
    	    form.on('switch(is_index)', function(data){
    	    	 console.log(data.value+':'+data.elem.checked);
    	    	 var state
    	    	 var id=data.value
    	    	 if(data.elem.checked){
    	    		 state=true
    	    	 }else{
    	    		 state=false
    	    	 }
    	    	 $.ajax({
    		            type:"GET",
    		            url:"/courseapi/updateCategory",
    		            data:{is_index:state,id:id,sort_index:0},
    		         	datatype: "json",
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