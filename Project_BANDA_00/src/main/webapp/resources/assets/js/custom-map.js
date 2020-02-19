
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
	

	
	/*city select box default set*/
	city_selbox_set();
	dist_selbox_set();
	
	function city_selbox_set(){
		$("#city_selbox").append("<option value='' disabled selected>&nbsp;&nbsp;::시/도 선택::</option>");
		$.getJSON("resources/assets/json/administrativeArea.json",function(data){
			$.each(data, function(key, val){
				if(key=="city"){
					var list = val;
					for(var i=0; i<list.length; i++){
						console.log(i + " = " +list[i]);
						$("#city_selbox").append("<option value='"+list[i]+"'>"+list[i]+"</option>");
					}
					
					customSelect("custom-select");
				}
			});
		});
	}
	
	function dist_selbox_set(){
		$("#dist_selbox").append("<option value='' disabled selected>&nbsp;&nbsp;::구/군 선택::</option>");
		customSelect("custom-select2");
	}

});//function

/***********************************
  select box
***********************************/
function customSelect(customTarget){
	var x, i, j, selElmnt, a, b, c;

	/* custom-select/custom-select2 클래스 엘리먼트 get */
	x = document.getElementsByClassName(customTarget);

	for (i = 0; i < x.length; i++) {
		/* city_selbox/ dist_selbox 리스트 get */
		selElmnt = x[i].getElementsByTagName("select")[0];
			// 체크 코드 : alert("selElmnt:2 " + selElmnt.innerHTML);
		
		/* div(Add Class) 생성 */
		a = document.createElement("DIV");
		a.setAttribute("class", "select-selected");
		a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
		x[i].appendChild(a);
		
		
		/* option list div(Add Class/Id) 생성 */
		b = document.createElement("DIV");
		b.setAttribute("class", "select-items select-hide");
		b.setAttribute("id", "style-1");
		
		for (j = 1; j < selElmnt.length; j++) {
			/* 원본 요소의 각 옵션에 대한  div 생성*/
			c = document.createElement("DIV");
			c.innerHTML = selElmnt.options[j].innerHTML;
			c.addEventListener("click",function(e) {
				
				/* 기존 selected option 해제*/
				if (customTarget == "custom-select") {
					$("#city_selbox option:selected").attr('selected', false);
				} else {
					$("#dist_selbox option:selected").attr('selected', false);
				}
	
				/* 항목 클릭 시 원본 리스트 업데이트 */
				var y, i, k, s, h;
				s = this.parentNode.parentNode.getElementsByTagName("select")[0];
				h = this.parentNode.previousSibling;
				for (i = 0; i < s.length; i++) {
					if (s.options[i].innerHTML == this.innerHTML) {
						s.selectedIndex = i;
						h.innerHTML = this.innerHTML;
						y = this.parentNode.getElementsByClassName("same-as-selected");
						for (k = 0; k < y.length; k++) {
							y[k].removeAttribute("class");
						}
						this.setAttribute("class","same-as-selected");
						
						/* 선택 옵션 원본 리스트에 적용 */
						if (customTarget == "custom-select") {
							$('#city_selbox option[value='+ h.innerHTML + ']').attr('selected','selected');
							testcity(h.innerHTML);
						} else {
							$('#dist_selbox option[value='+ h.innerHTML + ']').attr('selected','selected');
						}
						break;
					}
				}
				h.click();
			});
			
			b.appendChild(c);
		}
		
		x[i].appendChild(b);
		a.addEventListener("click", function(e) {
			/* select box 클릭 시 다른 select box 닫기  */
			e.stopPropagation();
			closeAllSelect(this);
			this.nextSibling.classList.toggle("select-hide");
			/* 현재 선택한 select box 열기*/
			this.classList.toggle("select-arrow-active");
		});
	}
	
	
	/*select box 닫기*/
	function closeAllSelect(elmnt) {

		var x, y, i, arrNo = [];
		x = document.getElementsByClassName("select-items");
		y = document.getElementsByClassName("select-selected");
		for (i = 0; i < y.length; i++) {
			if (elmnt == y[i]) {
				arrNo.push(i)

			} else {
				y[i].classList.remove("select-arrow-active");
			}
		}
		for (i = 0; i < x.length; i++) {
			if (arrNo.indexOf(i)) {
				x[i].classList.add("select-hide");
			}
		}
	}
	
	/* select box 외 영역 클릭 시 select box 닫기*/
	document.addEventListener("click", closeAllSelect);
	
}

/* city 선택 시 district 리스트 set*/
function testcity(cityname){
	/* 기존 리스트 제거 */
	$("#dist_selbox option").remove();
	
	/* 기본 option 추가 */
	$("#dist_selbox").append("<option value='' disabled selected>&nbsp;&nbsp;::구/군 선택::</option>");
	$.getJSON("resources/assets/json/administrativeArea.json",function(data){
		$.each(data, function(key, val){
			if(key=="district"){
				var list = val;
				for(var i=0; i<list.length; i++){
					console.log(i + " = " +list[i].name);
					if(list[i].name==cityname){
						console.log("list[i].value : " + list[i].value);
						var testlist = list[i].value;
						for(var j=0; j<testlist.length; j++){
							$("#dist_selbox").append("<option value='"+testlist[j]+"'>"+testlist[j]+"</option>");
						}
						$("#cateTwo > div").remove();
						customSelect("custom-select2");
						return;
					}
				}
			}
		});
	});
	
}

/***********************************
searchForm
***********************************/
function searchFormSubmit(){
	
	var city = $("#city_selbox option:selected").val();
	var district = $("#dist_selbox option:selected").val();
	var keyword = $("#searchInput").val();
	
	/* 유효성 검사 */
	if(city==null || city=="" || district==null || district==""){
		alert("지역을  모두 선택해주세요.");
	}else if(keyword==null || keyword==""){
		alert("검색어를 입력해주세요.");
	}else{
		alert("모두 입력 완료!");
	}
		
	//alert("city : " + city + "/ dist : " + district + "/ keyword: " + keyword);
	
}

/* keyword input 특수문자 제한*/
$("#searchInput").bind("keyup", function(){
	re = /[~!@\#$%^&*\()\-=+_']/gi; 
	var temp = $("#searchInput").val();
	if(re.test(temp)){
		$("#searchInput").val(temp.replace(re,""));
	}
})

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




