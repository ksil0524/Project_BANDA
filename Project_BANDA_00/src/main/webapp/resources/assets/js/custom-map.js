
$(function(){
	
	/* Search Input */
	$("#searchInput").autocomplete({
		source: function(request, response){
			$.ajax({
				type:"post",
				url:"autocompleteAjax.do",
				data:{value: request.term},
				dataType:"json",
				success: function(result){
					
					/* Test Code*/
					if(result.success==true){
						list = result.list;
						
						$.each(list, function(key, value){
							console.log("key: " + key+ "   value: " + value);
						})
					}
					
				},
				error: function(){
					alert("ajax 서버와 통신 실패");
				}
				
				
			})//ajax end
		},//source end
		minLength:1,
		select:function(event, ui){
		
		}
		
		
	});
	/* Map */
	
});//function

