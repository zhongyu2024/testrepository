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
  
  var i = layer.load();
  setTimeout(function(){
    layer.close(i);
  }, 500);
  	
  	//方法级渲染
    var tableIns = table.render({
        elem: '#chapterlist',
        url : '/jsp/testApi/getChapterByDept',
        id:'chapterlist',
        cellMinWidth : 95,
        page : true,
        height : 550,
        limit : 10,
        limits : [10,20,30,40],
        where: {dept_id:dept_id},
        //autoSort:true,
        //initSort:{field:'chapter_sort_id', type:'asc'},
        cols : [[
            {field: 'chapter_sort_id', title: '序号', width:100, align:"center",align:'center'},
            {field: 'create_time', title: '创建时间', width:180,align:'center',
	            	templet :function (row){
		                    return createTime(row.create_time);
		                }},
            {field: 'chapter_name', title: '三级分类', width:180,align:'center'},
            {field: 'test_base_name', title: '所属题库', width:180,align:'center'},
            {field: 'chapter_isShow', title: '是否显示在前台', width:180,align:'center',
            	templet :function (res){
            		var s = ''
            		if(res.chapter_isShow==1){
            			s='checked=1'
            		}
            		//console.log(res.chapter_isShow)
                    return "<input type='checkbox' lay-skin='switch' lay-filter='is_show' "+s+" " +
                    		"value='"+res.chapter_id+"' attr='"+res.chapter_isShow+"'>"
                }
            },
            {field: 'chapter_test_num', title: '统计题目数量', width:180,align:'center'},
            {title: '操作', width:240, toolbar:'#chapterlistBar',fixed:"right",align:"center"}
        ]]
    });
    	
  		$('.add-class').on('click', function(){
  			//页面层
  			layer.open({
  			  type: 1,
  			  skin: 'layui-layer-rim', //加上边框
  			  area: ['420px', '240px'], //宽高
  			  content: '<span style="margin-left:5%";margin-top:20px;>分类名称：</span><br>'+
  			  '<input type="text" class="cname" style="margin-left:5%;" maxlength="30"><br>'+
  			  '<span style="margin-left:5%;margin-top:20px;">所属题库：</span><br>'+
  			  '<div style="margin-left:5%">'+
  			  '<input type="checkbox" class="base" value="公开题库">公开题库</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
  			  '<input type="checkbox" class="base" value="抽考题库">抽考题库&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
  			  '<input type="checkbox" class="base" value="内部题库">内部题库</div>'+
  			  '<br><div class="add-btn" id="add-btn">确认新增</div>'
  			});
  			
  			$('#add-btn').on('click', function(){
  				var name = $(".cname").val()
  				if(name==""){
  					layer.msg("请输入章节名")
  					return
  				}
  				if($(".base").filter(":checked").length==0){
  					layer.msg("请选择题库")
  					return
  				}	
  				//获取选中的checkbox的值
  				var arr = new Array();
				$(".base").filter(":checked").each(function(i){
					arr[i] = $(this).val();
				});
				var vals = arr.join(",");
  				$.ajax({
 		            type:"GET",
 		            url:"/jsp/testApi/insertChapter",
 		            data:{name:name,dept_id:dept_id,vals:vals},
 		         	datatype: "json",
 		      		async:false,
 		            success:function(result){
 		            	if(result==1){
 		            		tableIns.reload();
 		            		layer.closeAll();
 		            		layer.msg("添加成功！")
 		            	}else if(result==0){
 		            		layer.msg("添加失败！")
 		            	}
 		            },
 		            error: function (jqXHR, textStatus, errorThrown) {
 		            	layer.msg("系统错误")
 		            }
 	         });
  				
  				
  				
  				
  			})
  			
  			
  		});    
  		
  		//是否启用
	    form.on('switch(is_show)', function(data){
	    	 console.log(data.value+':'+data.elem.checked);
	    	 var state
	    	 var chapter_id=data.value
	    	 if(data.elem.checked){
	    		 state=1
	    	 }else{
	    		 state=0
	    	 }

	    	 $.ajax({
		            type:"GET",
		            url:"/jsp/testApi/changeShow",
		            data:{state:state,chapter_id:chapter_id},
		         	datatype: "json",
		      		async:false,
		            success:function(result){
		            	if(result==1){
		            		layer.msg("修改成功！")
		            	}
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		            	alert('error')
		            }
	         });
	    	 
	    });
  		
  		//列表操作
  	    table.on('tool(chapterlist)', function(obj){
  	        var layEvent = obj.event;
  	        var	data = obj.data;
  	        var sort_id = data.chapter_sort_id
  	        var chapter_id=data.chapter_id
  	        var cname=data.chapter_name
  	        var base=data.test_base_name
// 	        var blist= base.split(",")
//  	        console.log(data)
  	        console.log(base)
//  	        console.log(blist)

  	        //编辑
			if(layEvent === 'edit'){
				layer.open({
				  type: 1,
				  title: false,
				  shadeClose: true,
				  area: ['420px', '240px'], //宽高
				  skin: 'layui-layer-rim',
				  content: '<div style="margin-top:30px;"><span style="margin-left:5%";margin-top:20px;>分类名称：</span><br>'+
	  			  '<input type="text" class="cname" id="cname" style="margin-left:5%;" maxlength="30"><br>'+
	  			  '<span style="margin-left:5%;margin-top:20px;">所属题库：</span><br>'+
	  			  '<div style="margin-left:5%">'+
	  			  '<input type="checkbox" class="base" value="公开题库" name="eight"><span style="margin-bottom:10px;">公开题库</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
	  			  '<input type="checkbox" class="base" value="抽考题库" name="eight">抽考题库&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
	  			  '<input type="checkbox" class="base" value="内部题库" name="eight">内部题库</div>'+
	  			  '<br><div class="add-btn" id="edit-btn">确认修改</div></div>'
					});
				//填充数据
				$("#cname").val(cname)
				//遍历
				$(base.split(",")).each(function (i,e){
				    $("input[name='eight'][value='"+e+"']").prop("checked",true);
				    //设置有题的不可改变
				    $.ajax({
			            type:"GET",
			            url:"/jsp/testApi/checkBase",
			            data:{dept_id:dept_id,chapter_id:chapter_id},
			         	datatype: "json",
			      		async:false,
			            success:function(result){
			            	if(result==1){
			            		$("input[name='eight'][value='"+e+"']").prop("disabled",true);
			            	}
			            },
			            error: function (jqXHR, textStatus, errorThrown) {
			            	layer.msg("系统错误")
			            }
					});
				    
				});
				
				//提交前验证
	  			$('#edit-btn').on('click', function(){
	  				var name = $(".cname").val()
	  				if(name==""){
	  					layer.msg("请输入章节名")
	  					return
	  				}
	  				if($(".base").filter(":checked").length==0){
	  					layer.msg("请选择题库")
	  					return
	  				}
	  				//获取选中的checkbox的值
	  				var arr = new Array();
					$(".base").filter(":checked").each(function(i){
						arr[i] = $(this).val();
					});
					var vals = arr.join(",");
					//alert(vals);
					
	  				$.ajax({
	 		            type:"GET",
	 		            url:"/jsp/testApi/updateChapter",
	 		            data:{name:name,chapter_id:chapter_id,vals:vals},
	 		         	datatype: "json",
	 		      		async:false,
	 		            success:function(result){
	 		            	if(result==1){
	 		            		tableIns.reload();
	 		            		layer.closeAll();
	 		            		layer.msg("修改成功！")
	 		            	}else if(result==0){
	 		            		layer.msg("修改失败！")
	 		            	}
	 		            },
	 		            error: function (jqXHR, textStatus, errorThrown) {
	 		            	layer.msg("系统错误")
	 		            }
	 	         });
	  				
	  			})
				
			} 
  	        	
			//删除
	  	      if(layEvent === 'del'){ 
	  	    	  //询问框
		  	    	layer.confirm('确认删除？', {
		  	    	  btn: ['是','否'] //按钮
		  	    	}, function(){
		  	    		
		  	    		$.ajax({
				            type:"GET",
				            url:"/jsp/testApi/delChapter",
				            data:{chapter_id:chapter_id},
				         	datatype: "json",
				      		async:false,
				            success:function(result){
				            	if(result==1){
				            		layer.msg('删除成功！', {icon: 1});
				            		tableIns.reload();
				            	}else if(result==0){
				            		layer.msg('该分类下有题目，不可删除！', {icon: 2});
				            	}
				            },
				            error: function (jqXHR, textStatus, errorThrown) {
				            	alert('error')
				            }
			          });
		  	    		
		  	    	}, function(){
//		  	    	  layer.msg('操作取消', {
//		  	    	    time: 20000, //20s后自动关闭
//		  	    	    btn: ['明白了', '知道了']
//		  	    	  });
		  	    	});
		        } 
	  	      
	  	    //上移
			if(layEvent === 'up'){ +
				$.ajax({
		            type:"GET",
		            url:"/jsp/testApi/getMinSort",
		            data:{dept_id:dept_id},
		         	datatype: "json",
		      		async:false,
		            success:function(result){
		            	if(result==sort_id){
		            		layer.msg("已处于第一行！")
		            		return;
		            	}
		            	up()
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		            	layer.msg("系统错误")
		            }
				});
				
				//向上移动
			function up(){
				$.ajax({
		            type:"GET",
		            url:"/jsp/testApi/newSort",
		            data:{move:1,sort_id:sort_id,chapter_id:chapter_id,dept_id:dept_id},
		         	datatype: "json",
		      		async:false,
		            success:function(result){
		            	if(result==1){
		            		layer.msg("修改成功！")
		            		tableIns.reload();
		            	}else if(result==0){
		            		layer.msg("修改失败！")
		            	}
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		            	layer.msg("系统错误")
		            }
				});
				}
			} 
			
			//下移
			if(layEvent === 'down'){ 
				$.ajax({
		            type:"GET",
		            url:"/jsp/testApi/getMaxSort",
		            data:{dept_id:dept_id},
		         	datatype: "json",
		      		async:false,
		            success:function(result){
		            	if(result==sort_id){
		            		layer.msg("已处于最后一行！")
		            		return;
		            	}
		            	down()
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		            	layer.msg("系统错误")
		            }
				});
				//向下移动
			function down(){
				$.ajax({
		            type:"GET",
		            url:"/jsp/testApi/newSort",
		            data:{move:2,sort_id:sort_id,chapter_id:chapter_id,dept_id:dept_id},
		         	datatype: "json",
		      		async:false,
		            success:function(result){
		            	if(result==1){
		            		layer.msg("修改成功！")
		            		tableIns.reload();
		            	}else if(result==0){
		            		layer.msg("修改失败！")
		            	}
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		            	layer.msg("系统错误")
		            }
				});
				}
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
  		    var str = y+"-"+m+"-"+d+" "+h+":"+M;
  		    return str;
  		}
    
})

