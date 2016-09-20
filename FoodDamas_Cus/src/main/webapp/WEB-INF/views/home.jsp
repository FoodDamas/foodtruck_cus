<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<base href="resources/assets/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나만의 맛집 검색</title>
<script src="http://s.codepen.io/assets/libs/modernizr.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=d76d3b667738eb709c0fdad4f29b259e"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=d76d3b667738eb709c0fdad4f29b259e&libraries=LIBRARY"></script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=d76d3b667738eb709c0fdad4f29b259e&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=d76d3b667738eb709c0fdad4f29b259e&libraries=services,clusterer,drawing"></script>




<link rel="stylesheet" media="screen" href="css/fooddamas.css">
<link rel="stylesheet" href="css/dropbox.css">

</head>
<body class="home_page ng-scope" onunload="" ng-app="mp20App">


	<!-- 상단 영역 -->
	<header class="header ng-scope"
		ng-controller="mp20_search_input_controller">
		<!-- mode-scroll, searching -->
		<a href="/" class="/"
			style="line-height: 50px; margin-left: 10px; font-weight: bold;">푸드로고</a>

		<nav class="nav-menus">
			<div class="menus">
				<!-- 로그인 후 -->
				<button class="btn-user">
					<figure class="user">
						<span class="badge"><em class="count">1</em><span
							class="hidden">개의 알림이 있습니다.</span></span>

						<div class="is_login_status_btn ng-hide" ng-show="is_login">
							<div class="thumb"></div>
						</div>

						<div class="thumb no-profile" ng-show="!is_login"></div>
					</figure>
				</button>
			</div>
			<button class="btn-menu-open"
				onclick="common_ga(get_now_page_code(), &#39;CLICK_MENU&#39;);toggle_menu_layer();">메뉴
				열기</button>
		</nav>
	</header>


	<!-- 본문 영역 -->
	<main class="pg-main">
	<article class="contents main-padding">
		<!-- Carousel
    ================================================== -->
		<div>
			<div id="map" style="width: 100%; height: 250px;"></div>

		</div>


		<style>
.nav-dropdown li {
	width: 100%;
}

.nav-dropdown li a {
	width: 100%;
}
</style>


		<!--이가영-->
		<div style="width: 100%">

			<div class="sitenavigation" style="width: 50%; float: left">
				<ul>

					<li class="nav-dropdown" style="width: 100%;"><a href="#"
						class="type">분류 별</a>
						<ul class="typeSelect" style="width: 100%; z-index: 200;">
							<li><a href="#">거리순</a></li>
							<li><a href="#">평점순</a></li>
							<li><a href="#">리뷰순</a></li>

						</ul></li>
				</ul>
			</div>
			<div class="sitenavigation" style="width: 50%; float: right">
				<ul>

					<li class="nav-dropdown" style="width: 100%;"><a
						class="typeFood" href="#">음식 종류별</a>
						<ul class="typeFoodSelect" style="width: 100%; z-index: 200;">
							<li><a href="#">한식</a></li>
							<li><a href="#">중식</a></li>
							<li><a href="#">일식</a></li>
							<li><a href="#">양식</a></li>
							<li><a href="#">분식</a></li>
							<li><a href="#">기타</a></li>

						</ul></li>
				</ul>
			</div>
		</div>
		<script
			src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>


		<!--이가영-->

		<!-- 인기 식당 -->

		<div class="slider-container" style="margin-left: 10px;">
			<p class="tags">
				<button href="#" class="tag-item selected">거리순</button>
				<button href="#" class="tag-item ng-binding ng-scope">평점순</button>
				<button href="#" class="tag-item ng-binding ng-scope">리뷰순</button>
				<button href="#" class="tag-item tag-item selected">종료순</button>

			</p>
		</div>

		<div class="slider-container popular_restaurant_container">
			<ul class="list-restaurants type-main" id="list">				

			</ul>
			<button class="more_btn" id="more">더보기</button>
		</div>
	</article>
	</main>

	<!-- 하단 영역 -->
	<footer class="footer">
		<div class="inner" style="font-size: 16px;">

			<div style="color: #ffffff; margin-bottom: 15px;">푸드다마스</div>
			<nav class="links-external">
				<ul class="list-links">
					<li><a href="/">회사소개</a></li>
					<li><a href="/">직원내용</a></li>
					<li><a href="/">이용약관</a></li>
					<li><a class="only-desktop" href="/">브랜드</a></li>
				</ul>
			</nav>
			<div class="language-copyrights">
				<p class="select-language">
					<a href="/" class="selected">한국어</a> <a href="/">English</a>
				</p>
				<small>
					<p>
						푸드다마스 대표이사: 이성현 | 사업자 등록번호: 000-00-0000 <br class="only-mobile">
						서울특별시 강남구 역삼동 12, 8층<br> <span class="copyrights">©
							2016 zzennam. All rights reserved.</span>
					</p>
				</small>
			</div>
		</div>
	</footer>

	<!--이가영-->



	<script>
    // on document ready
    $(document).ready(function () {
        /*성현*/
                
        /////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////*다음맵*////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////
        
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
        
        /////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////*푸드트럭*/////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////
        
        // List        
        homeManager.list();
        
        // 더보기
        var page=0;
		$("#more").on("click", function(){
			console.log("more clicked...");
			page = page+8;
			homeManager.moreList(page);
		});
        /*성현*/


        var typeSelect = 0;
        $('.nav-dropdown > .type').on("click", function () {//종류별
            if (typeSelect == 0) {
                typeSelect++;
                $(".typeSelect").show(100);
            } else {
                typeSelect--;
                $(".typeSelect").hide(100);
            }
        });
        var typeFoodSelect = 0;
        $('.nav-dropdown > .typeFood').on("click", function () {//종류별
            if (typeFoodSelect == 0) {
                typeFoodSelect++;
                $(".typeFoodSelect").show(100);
            } else {
                typeFoodSelect--;
                $(".typeFoodSelect").hide(100);
            }
        });

    });
</script>
	<!--이가영-->
	<script src="js/home.js"></script>
</body>
</html>