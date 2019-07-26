layui.use(['table','form','element','laydate','tree'], function(){
  var table = layui.table
 ,form = layui.form
 ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
  
  var laydate = layui.laydate;
  laydate.render({
	    elem: '#create_time' 
  });
  
  laydate.render({
	    elem: '#end_time' 
  });

	
  	//方法级渲染
    var tableIns = table.render({
        elem: '#chapterlist',
        url : '/indexPicApi/getAllIndexPic',
        id:'chapterlist',
        cellMinWidth : 95,
        page : true,
        height : 550,
        limit : 10,
        limits : [10,20,30,40],
        where :{parent_id:0},
        cols : [[
            {field: 'id', title: '序号', width:100, align:"center",align:'center'},
            {field: 'introduce', title: '简介', width:180,align:'center'},
            {field: 'sort', title: '默认排序', width:120,align:'center'},
            {field: 'jump_url', title: '跳转', width:180,align:'center'},
            {field: 'image_url', title: '图片', align:'center',templet :function (row){
                return "<img src="+"http://erp.wnduoduo.com/phaha/static_file/upload_img/"+row.img_url+">";
            	}
            },
            {title: '操作', width:240, toolbar:'#chapterlistBar',fixed:"right",align:"center"}
        ]],
        done: function(res, curr, count){
	        //如果是异步请求数据方式，res即为你接口返回的信息。
	        //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
	        console.log(res);
	        //得到当前页码
	        console.log(curr); 
	        //得到数据总量
	        console.log(count);
	      }
    });
    
    //添加
	$('#add-btn').on('click', function(){
		$("#name").val('');
		$("#sort").val('');
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

	//确定添加
    $(".add-confirm").click(function(){
  	    	//验证数据
  	    	var intro = $("#intro").val()
			var sort = $("#sort").val()
			var img_url = $("#image_url").val();
  	    	var jump_url = $("#jump_url").val();
			if(!isRealNum(sort)){
				layer.msg("请输入排序")
				return
			}
			
			//添加数据
			$.ajax({
		            type:"GET",
		            url:"/indexPicApi/addIndexPic",
					data:{intro:intro,sort:sort,img_url:img_url,jump_url:jump_url},		         	
		         	datatype: "json",
		      		async:false,
		            success:function(data){
		            	console.log(data)
		            	layer.msg("添加成功！")
		            	tableIns.reload()
		            	layer.closeAll()
		            }
	        });
  	    })
  	    
    
  		
	//列表操作
    table.on('tool(chapterlist)', function(obj){
        var layEvent = obj.event;
        var	data = obj.data;
        var id=data.id
        var introduce=data.introduce
        var jump_url=data.jump_url
        var sort=data.sort
        var img_url=data.img_url
        //编辑
		if(layEvent === 'edit'){
			layer.open({
			  type: 1,
			  title: '修改轮播图',
			  shadeClose: true,
			  closeBtn: 1,
			  area: ['400px', '400px'], //宽高
			  skin: 'yourclass',
			  content: $("#up_course")
			});
			//填充数据
			$("#upname").val(introduce)
			$("#upid").val(id)
			$("#up_jump_url").val(jump_url)
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
		            url:"/indexPicApi/delIndePic",
		            data:{id:id},
		         	datatype: "json",
		      		async:false,
		            success:function(result){
		            	if(result==1){
		            		layer.msg('删除成功！', {icon: 1});
		            		tableIns.reload();
		            	}else if(result==0){
		            		layer.msg('该分类下有课程，不可删除！', {icon: 5});
		            	}
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		            	layer.msg('删除失败！', {icon: 2});
		            }
	          });
  	    		
  	    	}, function(){
//		  	    	  layer.msg('操作取消', {
//		  	    	    time: 20000, //20s后自动关闭
//		  	    	    btn: ['明白了', '知道了']
//		  	    	  });
  	    	});
        } 
  	      
    });
    
    
    	//提交前验证
		$('.up-confirm').on('click', function(){
			var name = $("#upname").val()
			var id = $("#upid").val()
			var sort = $("#up_sort").val()
			var img_url = $("#edit_image_url").val()
			var jump_url = $("#up_jump_url").val()
			if(!isRealNum(sort)){
				layer.msg("请输入数字")
				return
			}
	 
			$.ajax({
	            type:"GET",
	            url:"/indexPicApi/updateCategory",
	            data:{id:id,name:name,sort:sort,img_url:img_url,jump_url:jump_url},
	         	datatype: "json",
	      		async:false,
	            success:function(data){
	            	if(data==1){
	            		tableIns.reload();
	            		layer.closeAll();
	            		layer.msg("修改成功！")
	            	}
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	            	layer.msg("系统错误")
	            }
			});
			
		})
		

  	    
})/*layend*/

	

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
