
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
	});
	
});//function

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