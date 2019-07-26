layui.use(['table','form','element','laydate'], function(){
  var table = layui.table
 ,form = layui.form
 ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
/**
 * 定义一个vue 
 */
var vm = new Vue({
	el : '#daili-vue',
	data : {
		req_data:{member_name:'省级代理'}
	}
});

form.render('select');
  //表格
  var tableIns = table.render({
        elem: '#userList',
        url : '/userapi/getVipUser',
        id:'userList',
        cellMinWidth : 95,
        page : true,
        height : 800,
        limit : 10,
        limits : [10,20,50,100],
       // where: {date1:date1,date2:date2,user_name:user_name,phone:phone,
       // 		province_id:com,city_id:dept,member_level_id:level}, 
        cols : [[
            {field: 'id', title: '用户ID', width:120, align:"center",align:'center'},
            {field: 'is_active', title: '是否启用', width:120,align:'center',
          	templet :function (res){
          		console.log(res.is_active)
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
            {field: 'invite_code', title: '邀请码',width:120, align:'center'},
            {field: 'img_url', title: '头像',  align:'center',width:150,
            	templet :function (row){
            		if(row.user_img!=null){
            			return '<img src="'+row.user_img+'">';
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
                    return createTime(row.member_level_end_time);
                }
            },
            {field: 'create_time', title: '注册时间', align:'center',width:180,
            	templet :function (row){
                    return createTime(row.create_time);
                }
            }
        ]]
    });
	

/**
 * 引入 layui
 */
layui.use(['form','element','layer','jquery'],function(){
	var form = layui.form;
	var $ = layui.jquery;
	var layer = layui.layer;
	var element = layui.element;
	
	
	function SHOW_LOAD() {
	    return layer.msg('努力加载中...', { icon: 16, shade: [0.5, '#f5f5f5'], scrollbar: false, offset: '50%', time: 100000 });
	}
	function CLOSE_LOAD(index) {
	    layer.close(index);
	}
	function SHOW_TIP() {
	    layer.msg('加载完成！', { time: 1000, offset: '50%' });
	}
	
	
	
	form.on('submit(uplev)', function(data){
		  console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
		  console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
		  console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
		  var url = "/MemberApi/add_lev1";
		  $.ajax({type:'post',url:url,data:data.field,dataType:'json',async:true,
		  		beforeSend: function () {
		              i = SHOW_LOAD();
		           },success:function(res){
		        	   CLOSE_LOAD(i);
		        	   layer.alert(res.message);
		           },error:function(error){		//响应失败的回调函数
		  			CLOSE_LOAD(i);
		  			layer.alert("请求失败:" + error.status );
		  		} 
		  });
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		 });
	
});



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
