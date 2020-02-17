
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
	/*$("#city_selbox").change(function(){*/

	
	/*city select box default set*/
	city_selbox_set();
	
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
				/*if(key=="district")*/
			});
		});
	}

});//function

/***********************************
  select box
***********************************/
function customSelect(customTarget){
	var x, i, j, selElmnt, a, b, c;
	/*look for any elements with the class "custom-select":*/
	x = document.getElementsByClassName(customTarget);
	alert("x::: " + x.innerHTML);
	for (i = 0; i < x.length; i++) {
	  selElmnt = x[i].getElementsByTagName("select")[0];
	 //alert("selElmnt: "+ selElmnt.innerHTML);
	  /*for each element, create a new DIV that will act as the selected item:*/
	  a = document.createElement("DIV");
	  a.setAttribute("class", "select-selected");
	  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
	  x[i].appendChild(a);
	  /*for each element, create a new DIV that will contain the option list:*/
	  b = document.createElement("DIV");
	  b.setAttribute("class", "select-items select-hide");
	  b.setAttribute("id","style-1");
	  for (j = 1; j < selElmnt.length; j++) {
	    /*for each option in the original select element,
	    create a new DIV that will act as an option item:*/
	    c = document.createElement("DIV");
	    c.innerHTML = selElmnt.options[j].innerHTML;
	    c.addEventListener("click", function(e) {
	        /*when an item is clicked, update the original select box,
	        and the selected item:*/
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
	            this.setAttribute("class", "same-as-selected");
	            alert("셀...: "+$("#city_selbox option:selected").attr('selected','selected').val());
	            /*
	             $("#city_selbox option:eq("+k+")").removeAttribute("selected");
	             * */
	            //$('#city_selbox option[value='+h.innerHTML+']').attr('selected','selected');
	            testcity(h.innerHTML);
	            break;
	          }
	        }
	        h.click();
	    });
	    b.appendChild(c);
	  }
	  x[i].appendChild(b);
	  a.addEventListener("click", function(e) {
	      /*when the select box is clicked, close any other select boxes,
	      and open/close the current select box:*/
	      e.stopPropagation();
	      closeAllSelect(this);
	      this.nextSibling.classList.toggle("select-hide");
	      this.classList.toggle("select-arrow-active");
	    });
	}
	function closeAllSelect(elmnt) {
	  /*a function that will close all select boxes in the document,
	  except the current select box:*/
		
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
	/*if the user clicks anywhere outside the select box,
	then close all select boxes:*/
	document.addEventListener("click", closeAllSelect);
	
}

function testcity(cityname){
	alert("cityname: "+cityname);
	$("#dist_selbox").append("<option value='' disabled selected>&nbsp;&nbsp;::구/군 선택::</option>");
	$.getJSON("resources/assets/json/administrativeArea.json",function(data){
		$.each(data, function(key, val){
			if(key=="district"){
				
				var list = val;
				/*var result = Object.keys(list).map(function(key) {
					  return [list[key]];
					});

					console.log(result);
					//한단계씩 안으로 [] + 
					console.log("test! " + result[0].__proto__.length);
					
					//object 까기 
					var sJson = JSON.stringify(list);
					console.log("st :"+sJson);*/
					
				
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
					//$("#dist_selbox").append("<option value='"+list[i]+"'>"+list[i]+"</option>");
				}
				
				
			}
			/*if(key=="district")*/
		});
	});
	
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




