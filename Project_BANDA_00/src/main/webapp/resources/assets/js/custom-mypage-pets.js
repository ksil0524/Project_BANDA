$(function() {
	
	$("#updateBtn").hide();
    //이미지 클릭시 업로드창 실행
    $("#image_section").click(function() {
        $("#imgInp").click();
    })   
    
    function readURL(input) {
    	 if (input.files && input.files[0]) {
    	  var reader = new FileReader();
    	  
    	  reader.onload = function (e) {
    	   $('#image_section').attr('src', e.target.result);  
    	  }
    	  
    	  reader.readAsDataURL(input.files[0]);
    	  }
    	}
    	  
    $("#imgInp").change(function(){
    	readURL(this);
    });
    
    	
    $(".mypetInsert").click(function(){
    	$("#updateBtn").hide();
    	$("#mypetsUpdate").hide();
    	$("#mypetsDetail").hide();
    	$("#mypetsInsert").show();
    	$("#submitBtn").show();
    })
    
    $(".mypetListSeq").click(function(){
    	$("#submitBtn").hide();
    	$("#mypetsUpdate").hide();
    	$("#mypetsInsert").hide();
    	$("#mypetsDetail").show();
    	$("#updateBtn").show();
    })
    
    $("#updateBtn").click(function(){
    	$("#updateBtn").hide();
    	$("#mypetsInsert").hide();
    	$("#mypetsDetail").hide();
    	$("#mypetsUpdate").show();
    	$("#submitBtn").show();
    })
})
