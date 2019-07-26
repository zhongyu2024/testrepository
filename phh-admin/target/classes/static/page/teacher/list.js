layui.use(['table','form','element','laydate','upload'], function(){
  var table = layui.table
 ,form = layui.form
 ,upload = layui.upload
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
        elem: '#list',
        url : '/courseapi/getTeacherAll',
        id:'chapterlist',
        cellMinWidth : 95,
        page : true,
        height : 550,
        limit : 10,
        limits : [10,20,30,40],
        where :{parent_id:0},
        cols : [[
            {field: 'id', title: '编号', width:100, align:"center",align:'center'},
            {field: 'teacher_name', title: '老师名字', width:180,align:'center'},
            {field: 'img_url', title: '头像', width:180, align:'center',templet :function (row){
            	 return "<img src="+"http://erp.wnduoduo.com/phaha/static_file/upload_img/"+row.img_url+">";
            }
            },
            {field: 'introduction', title: '描述', width:180,align:'center'},
            {field: 'create_time', title: '最后更新时间', width:180,align:'center',templet :function (row){
                return createTime(row.create_time);
            }},
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
    
	$('#add-btn').on('click', function(){
		$("#teacher_name").val('');
		$("#introduction").val('');
		$("#image_url").val('');
		$("#demo1").attr("src"," ");
		layer.open({
        	  type: 1,
        	  title: '添加老师',
        	  area: ['400px', '600px'],
        	  closeBtn: 1,
        	  shadeClose: true,
        	  skin: 'yourclass',
        	  content: $("#add_model")
    });
	    
	}); 

	//点击确定添加
    $(".add-confirm").click(function(){
    		var teacher_name = $("#teacher_name").val();
			var introduction = $("#introduction").val();
			var img_url = $("#image_url").val();
			var data = {
					teacher_name:teacher_name,
					introduction:introduction,
					img_url:img_url
			};
			//添加数据
			$.ajax({
		            type:"post",
		            url:"/courseapi/addteacher",
		            // headers必须添加，否则会报415错误
		            headers: {
		                'Accept': 'application/json',
		                'Content-Type': 'application/json'
		            },
					data:JSON.stringify(data),		         	
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
    table.on('tool(list)', function(obj){
        var layEvent = obj.event;
        var	data = obj.data;
        console.log(data)
        //编辑
		if(layEvent === 'edit'){
			layer.open({
			  type: 1,
			  title: '修改老师',
			  shadeClose: true,
			  area: ['400px', '600px'], //宽高
			  skin: '',
			  content: $("#up_model")
			});
			//填充数据
			$("#up_teacher_name").val(data.teacher_name)
			$("#up_id").val(data.id)
			$("#up_introduction").val(data.introduction)
			$("#up_image_url").val(data.img_url)
			$("#up_create_time").val(createTime(data.create_time))
			$('#demo2').attr('src', "http://erp.wnduoduo.com/phaha/static_file/upload_img/"+data.img_url)
		} 
        	
      //删除
      if(layEvent === 'del'){ 
    	  //询问框
  	    	layer.confirm('确认删除？', {
  	    	  btn: ['是','否'] //按钮
  	    	}, function(){
  	    		
  	    		$.ajax({
		            type:"GET",
		            url:"/courseapi/delteacher",
		            data:{id:data.id},
		         	datatype: "json",
		      		async:false,
		            success:function(result){
		            	if(result==1){
		            		layer.msg('删除成功！', {icon: 1});
		            		tableIns.reload();
		            	}else if(result==0){
		            		layer.msg('删除失败！', {icon: 5});
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
			var id = $("#up_id").val();
			var teacher_name = $("#up_teacher_name").val();
			var introduction = $("#up_introduction").val();
			var img_url = $("#up_image_url").val();
			
			var data = {
					id:id,
					teacher_name:teacher_name,
					introduction:introduction,
					img_url:img_url
			};
			
			//添加数据
			$.ajax({
		            type:"post",
		            url:"/courseapi/upteacher",
		            // headers必须添加，否则会报415错误
		            headers: {
		                'Accept': 'application/json',
		                'Content-Type': 'application/json'
		            },
					data:JSON.stringify(data),		         	
		         	datatype: "json",
		      		async:false,
		            success:function(data){
		            	console.log(data)
		            	layer.msg("修改成功！")
		            	tableIns.reload()
		            	layer.closeAll()
		            }
	        });
			
		})
		
		
		//普通图片上传
	  	var uploadInst = upload.render({
	    elem: '#uploadImg'
	    ,url: '/courseapi/uploadImg'
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('#demo1').attr('src', result); //图片链接（base64）
	      });
	    }
	    ,done: function(res){
	    	console.log(res)
	      //如果上传失败
	      if(res.code > 1){
	        return layer.msg('上传失败');
	      }
	      //上传成功
	     
	      $("#image_url").val(res.img_url)
	     }
	    ,error: function(){
	      //演示失败状态，并实现重传
	      var demoText = $('#demoText');
	      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
	      demoText.find('.demo-reload').on('click', function(){
	      		uploadInst.upload();
	      });
	    }
	  });
		
		//普通图片上传
	  	var uploadup = upload.render({
	    elem: '#uploadImg2'
	    ,url: '/courseapi/uploadImg'
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('#demo2').attr('src', result); //图片链接（base64）
	      });
	    }
	    ,done: function(res){
	    	console.log(res)
	      //如果上传失败
	      if(res.code > 1){
	        return layer.msg('上传失败');
	      }
	      //上传成功
	     
	      $("#up_image_url").val(res.img_url)
	     }
	    ,error: function(){
	      //演示失败状态，并实现重传
	      var demoText = $('#demoText');
	      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
	      demoText.find('.demo-reload').on('click', function(){
	    	  uploadup.upload();
	      });
	    }
	  });
	  	
	  //timestamp-》date
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
  		    var S = date.getSeconds();
		    S = S<10?("0"+S):S;
  		    var str = y+"-"+m+"-"+d+" "+h+":"+M+":"+S;
  		    return str;
  		}
  	    
    
})/*layend*/

	function addCategory(parent_id,name){
		$("#parent").html("")
		$.ajax({
	            type:"GET",
	            url:"/courseapi/getCategoryByParam",
				data:{parent_id:parent_id,name:name},		         	
	         	datatype: "json",
	      		async:false,
	            success:function(data){
	            	console.log(data)
	            	for(var i = 0;i<data.length;i++){
	            		$("#parent").append('<option value="'+data[i].id+'">'+
	            				data[i].name+'</option>')
	            	}
	            }
        });
		
	}
