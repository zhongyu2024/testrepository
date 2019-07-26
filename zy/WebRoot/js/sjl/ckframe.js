var index=1;


$("#cksd .title").mouseenter(function(){
	if(index!=$(this).index()){
	$(this).css("background","#3E5764");
	}
}).mouseleave(function(){
	if(index!=$(this).index()){
	$(this).css("background","none");
	}
});

var index2=1;
$("#cksd .title").click(function(){
	index=$(this).index();
	$(this).css("background","#252C32");
	$(this).siblings().css("background","none");
//	alert($(this).index());
	$("#ckright .pages11").eq(index2-1).css("display","none");
	$("#ckright .pages11").eq(index-1).css("display","block");
	index2=index;
});
