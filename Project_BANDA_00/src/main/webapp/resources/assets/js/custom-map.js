
/***********************************
 검색어
 ***********************************/
$(function(){
	
	/* 검색어 자동완성 */
	$("#searchInput").autocomplete({
		source: function(request, response){
			$.ajax({
				type:"post",
				url:"map_autocompleteAjax.do",
				data:{keyword: request.term},
				dataType:"json",
				success: function(result){
					/* Test Code*/
					if(result.success==true){
						response(
							$.map(result.list, function(item){
								return{
									label:item,
									value:item
								}
							})
						)
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
	}); //autocomplete
	
	/*city select*/
	$("#city_selbox").change(function(){
		var cityname = $(this).val();
		alert(cityname);
		$.getJSON("resources/assets/json/administrativeArea.json",function(data){
			$.each(data, function(key, val){
				if(key=="district"){
					
					var list = val;
					var result = Object.keys(list).map(function(key) {
						  return [list[key]];
						});

						console.log(result);
						//한단계씩 안으로 [] + 
						console.log("test! " + result[0].__proto__.length);
						
						//object 까기 
						var sJson = JSON.stringify(list);
						console.log("st :"+sJson);
						
					
					for(var i=0; i<list.length; i++){
						console.log(i + " = " +list[i].name);
						if(list[i].name==cityname){
							console.log("list[i].value : " + list[i].value);
							var testlist = list[i].value;
							for(var j=0; j<testlist.length; j++){
								$("#dist_selbox").append("<option value='"+testlist[j]+"'>"+testlist[j]+"</option>");
							}
							return;
						}
						//$("#dist_selbox").append("<option value='"+list[i]+"'>"+list[i]+"</option>");
					}
				}
				/*if(key=="district")*/
			});
		});
		
	});
	
	/*city select box default set*/
	city_selbox_set();
	
	function city_selbox_set(){
		$.getJSON("resources/assets/json/administrativeArea.json",function(data){
			$.each(data, function(key, val){
				if(key=="city"){
					var list = val;
					for(var i=0; i<list.length; i++){
						console.log(i + " = " +list[i]);
						$("#city_selbox").append("<option value='"+(i+1)+"'>"+list[i]+"</option>");
					}
					
					aff();
				}
				/*if(key=="district")*/
			});
		});
	}

});//function

/***********************************
  select box
***********************************/
function aff(){
	var x, i, j, selElmnt, a, b, c;
	x=$(".custom-select");
	  selElmnt = x[0].getElementsByTagName("select")[0];
	 console.log("selElmnt: "+ selElmnt.innerHTML);
	
}

/***********************************
 Map
***********************************/
$(function(){
	/* Map */
	// 지도를 표시할 div 
	var mapContainer = document.getElementById('map'), 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	//----------------1. 마커만 찍기 
		//마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
	
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	//----------------1. 마커만 찍기  end
});


//TestCode
/*
function sub(){
	var ka1 = $("#city").val();
	var ka3 = $("#").val();
	var keyword = $("#searchInput").val();
}
*/