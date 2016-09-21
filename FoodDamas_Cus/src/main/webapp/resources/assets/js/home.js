var homeManager = (function() {	
	var truckList="";
	function list(page, callback) {
		if(page==null){
			page = 0;
		}		
		$.getJSON('http://localhost/home/list/'+page, function (data){
			map(data);
			for(var i=0; i<data.distance.length; i++){
				var distance= data.distance[i].distance*10000;
				distance = distance.toFixed(1);
				truckList += "<li class='restaurant-item'><div class='popular_restaurant_inner_wrap'><figure class='restaurant-item'><div class='thumb' style='background-image: url(img/1.jpg)'></div>" +
						"<div class='info'><span class='title'>"+data.distance[i].co_name+
						"</span> <strong class='point search_point'>"+data.distance[i].grade+
						"</strong><p class='etc'>"+data.distance[i].location+
						"</p><p class='etc'>"+distance+"m</p></div></figure></div></li>"					
			}
			$("#list").html(truckList);
		});
	}	
	
	function moreList(page, callback){		
		$.getJSON('http://localhost/home/list/'+page, function (data){
			map(data);
			for(var i=0; i<data.distance.length; i++){
				var distance= data.distance[i].distance*10000;
				distance = distance.toFixed(1);
				truckList += "<li class='restaurant-item'><div class='popular_restaurant_inner_wrap'><figure class='restaurant-item'><div class='thumb' style='background-image: url(img/1.jpg)'></div>" +
						"<div class='info'><span class='title'>"+data.distance[i].co_name+
						"</span> <strong class='point search_point'>"+data.distance[i].grade+
						"</strong><p class='etc'>"+data.distance[i].location+
						"</p><p class='etc'>"+distance+"m</p></div></figure></div></li>"					
			}
			$("#list").append(truckList);
		});
	}
	
	function map(data, callback){
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };

        var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

        // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
        if (navigator.geolocation) {

            // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {

                var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도

                var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                        message = '<div style="padding:5px;">My Position</div>'; // 인포윈도우에 표시될 내용입니다

                // 마커와 인포윈도우를 표시합니다
                displayMarker(locPosition, message);                       

            });

        } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

            var locPosition = new daum.maps.LatLng(33.450701, 126.570667),
                    message = 'geolocation을 사용할수 없어요..'

            displayMarker(locPosition, message);
        }

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
        function displayMarker(locPosition, message) {

            // 마커를 생성합니다
            var marker = new daum.maps.Marker({
                map: map,
                position: locPosition
            });

            var iwContent = message, // 인포윈도우에 표시할 내용
                    iwRemoveable = true;

            // 인포윈도우를 생성합니다
            var infowindow = new daum.maps.InfoWindow({
                content : iwContent,
                removable : iwRemoveable
            });

            // 인포윈도우를 마커위에 표시합니다
            infowindow.open(map, marker);

            // 지도 중심좌표를 접속위치로 변경합니다
            map.setCenter(locPosition);
        }
        
        console.log("-----------");
		console.log(data);
		console.log("-----------");
		
        // 마커를 표시할 위치와 title 객체 배열입니다
        var positions = new Array;
        
        // 마커에 위치 값을 push 합니다
		for(var i=0; i<data.distance.length;i++){
			var lat = 
			positions.push({
				title: data.distance[i].co_name, 
				latlng: new daum.maps.LatLng(data.distance[i].lat, data.distance[i].lng)
			});
		}		
        
        // 마커 이미지의 이미지 주소입니다
        var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
            
        for (var i = 0; i < positions.length; i ++) {
            
            // 마커 이미지의 이미지 크기 입니다
            var imageSize = new daum.maps.Size(24, 35); 
            
            // 마커 이미지를 생성합니다    
            var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
            
            // 마커를 생성합니다
            var marker = new daum.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng, // 마커를 표시할 위치
                title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지 
            });
        }
	}
	
	return {
		map: map,
		list : list,
		moreList : moreList
	}

})();