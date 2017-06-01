<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html> 
  <head>
      <meta charset="UTF-8">
      <title>자전거 검색</title>
      
      <style>
.content {
  position: relative;
  width: 100%;
}

.image {
  display: block;
  width: 100%;
  height: auto;
}

.overlay {
  position: absolute;
  bottom: 100%;
  left: 0;
  right: 0;
  background-color: #008CBA;
  overflow: hidden;
  width: 100%;
  height:0;
  transition: .5s ease;
  transparent: 50%;
}

.content:hover .overlay {
  bottom: 0;
  height: 100%;
}

.text {
  white-space: nowrap; 
  color: white;
  font-size: 20px;
  position: absolute;
  overflow: hidden;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
}
</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  </head>
   
  <body >
  <%--지도 --%>
   <div class="col-sm-7" id="map" style="height:700px;"></div>
   <%--지도 --%>
   <%-- 검색 리스트 --%>
   <div class="col-sm-5" style="height:700px;background-color:white;overflow:auto;overflow-x:hidden;" >

 <section id="portfolio"> 
<div class="w3-container w3-teal " >
  <h1>Bicycle List</h1>
</div>
<div style="float:right;">
정렬&nbsp;<select id="bikeTypeSelect" >
	<option value="">B-Type</option>
	<option value="1">MTB</option>
	<option value="2">로드</option>
	<option value="3">픽시</option>
	<option value="4">미니벨로</option>
	<option value="5">레코드용</option>
	<option value="6">어린이용</option>
	<option value="7">기타</option>

</select>
<select id="rentalPrice">
<option value="">Price</option>
	<option value="low">낮은가격순</option>
	<option value="high">높은가격순</option>
</select>
</div>
<div class="w3-row-padding w3-margin-top " >
   <c:forEach items="${requestScope.bicycleList}" var="list" >
  <div class="w3-second col-sm-6 w3-margin-top ">
     <div class="w3-card-2 content ">
      <img src="${pageContext.request.contextPath}/resources/upload/bicycle/${list.photoVO.photo1}" width="200px" height="180px">
      <div class="overlay" >
         <span class="text">
              아이디:${list.memberVO.id}<br>
              자전거번호:${list.bicycleNo}<br>
                대여료:${list.rentPrice}<br>
             </span>
      </div>
    </div> 
  </div>
</c:forEach>
    
  
  
</div><%-- 자전거리스트 css --%>
      </section>  
   </div><%--리스트 전체 div --%>
   <%-- 검색 리스트 --%>
   <!-- <div class="col-sm-12" style="height:200px;background-color:#F0FFFF;"></div> -->
   <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c4a694f8da8eb3b5725921a457f15461&libraries=services"></script>
  <script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addr2coord('${requestScope.bicycleList[0].address}', function(status, result) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
        var latitude=JSON.stringify(coords.hb);
        var longitude=JSON.stringify(coords.gb);
        //hb: 위도 , qb:경도
      //alert(${fn:length(bicycleList)});
       /*  alert(latitude);
        alert(longitude); */
      
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
</body>
</html>