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
	src="//apis.daum.net/maps/maps3.js?apikey=911ffa91ef92e4018ca8e381432dccea"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=911ffa91ef92e4018ca8e381432dccea&libraries=LIBRARY"></script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=911ffa91ef92e4018ca8e381432dccea&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=911ffa91ef92e4018ca8e381432dccea&libraries=services,clusterer,drawing"></script>



<base href="resources/">


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
					<li class="nav-dropdown" style="width: 100%;"><a href="#"class="type">분류 별</a>
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
				<button href="#" class="tag-item tag-item selected">종료순</button>
			</p>					
		</div> 
		

		<div class="slider-container popular_restaurant_container" >
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
        
        /////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////*성현*//////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////
        
        //map
        
        // List        
        homeManager.list();
        
        
        // 더보기
        var page=0;
		$("#more").on("click", function(){
			console.log("more clicked...");
			page = page+8;
			homeManager.moreList(page);
		});
		
        /////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////*성현*//////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////
  	        	
        var typeSelect = 0;
        $('.nav-dropdown > .type').on("click", function (e) {//분류별
        	e.preventDefault();
            if (typeSelect == 0) {
                typeSelect++;
                $(".typeSelect").show(100);
                $(".typeFoodSelect").hide(100);
            } else {
                typeSelect--;
                $(".typeSelect").hide(100);
            }
        });
        var typeFoodSelect = 0;
        $('.nav-dropdown > .typeFood').on("click", function (e) {//종류별
        	e.preventDefault();
            if (typeFoodSelect == 0) {
                typeFoodSelect++;
                $(".typeFoodSelect").show(100);
                $(".typeSelect").hide(100);
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