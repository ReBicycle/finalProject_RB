<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
      <meta charset="UTF-8">
      <title>네이버 지도 API - 주소로 지도 표시하기</title>
      <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ysVAG1XWY6Mr05fDy0Dr&submodules=geocoder"></script>
  </head>
  <body>
	<div class="col-sm-6" id="map" style="height:500px;"></div>
	<div class="col-sm-6" style="height:500px;">
	
<section id="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-sm-2 portfolio-item">
                    <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <!-- <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div> -->
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/upload/${requestScope.bicycleList[0].photo1}" class="img-responsive" alt="Cabin">
                        <span style="text-align: center;">아이디:${requestScope.bicycleList[0].memberId}<br>
                        대여료:${requestScope.bicycleList[0].rentPrice}<br>
                        </span>
                    </a>
                </div>
                
                
                
            </div>
        </div>
    </section> 
	
	
	
	
	
	
	</div>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c4a694f8da8eb3b5725921a457f15461"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
</body>
</html>