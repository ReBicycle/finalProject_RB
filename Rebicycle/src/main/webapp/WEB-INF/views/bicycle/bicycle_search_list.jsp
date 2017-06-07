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
  background-color: #006666;
  overflow: hidden;
  width: 100%;
  height:0;
  transition: .10s ease;
  opacity: 0.9;
}

.content:hover .overlay{
  bottom: 0;
  height: 30%;
}

.text {
  white-space: nowrap; 
  color: white;
  font-size: 15px;
  position: absolute;
  overflow: hidden;
  top: 60%;
  left: 35%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
}
select { 
width: 120px; /* 원하는 너비설정 */ 
padding: .3em .3em; /* 여백으로 높이 설정 */ 
font-family: inherit; /* 폰트 상속 */
background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
border: 1px solid #999; 
border-radius: 0px; /* iOS 둥근모서리 제거 */ 
-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
-moz-appearance: none; 
appearance: none; 
}

</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  </head>
 
 
  <body>
  <script type="text/javascript">
  		<c:if test="${empty requestScope.bicycleList}">
  		alert("검색결과가 없습니다. 메인화면으로 이동합니다.");
  		location.href="${pageContext.request.contextPath}/home.do";
  		</c:if>
  
  </script>
  <%--지도 --%>
   <div class="col-sm-6" id="map" style="height:700px;"></div>
   <%--지도 --%>
   <%-- 검색 리스트 --%>
   <div class="col-sm-6" style="width:50%;;height:700px;background-color:white;overflow:auto;overflow-x:hidden;" >

 <!-- <section id="portfolio">  -->
<div class="w3-container w3-teal" style="margin-top: 50px; " >
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
<div class="w3-row-padding w3-margin-top" id="listSpace" >
   <c:forEach items="${requestScope.bicycleList}" var="list" >
 <a href="${pageContext.request.contextPath }/findBicycleByNo.do?bicycleNo=${list.bicycleNo}" onmouseover=""> <div class="w3-second col-sm-6 w3-margin-top " >
     <div class="w3-card-2 content " width="240px" height="180px">
      <img class="img" src="${pageContext.request.contextPath}/resources/upload/bicycle/${list.photoVO.photo1}" width="240px" height="180px">
      <div class="overlay" >
     	<img class="w3-circle" src="${pageContext.request.contextPath}/resources/upload/member/${list.memberVO.picture}" width="20%" height="100%" align="right">
         <span class="text" align="left" width="70%"  >
         	${list.title }<br>
               &#8361;${list.rentPrice}&nbsp;-&nbsp;No${list.bicycleNo}&nbsp;-&nbsp;Type${list.categoryVO.categoryNo }
             </span>
      </div>
    </div> 
  </div></a>
</c:forEach>
    
  
  
</div><%-- 자전거리스트 css --%>
<!--       </section>   -->
   </div><%--리스트 전체 div --%>
   <%-- 검색 리스트 --%>
   <!-- <div class="col-sm-12" style="height:200px;background-color:#F0FFFF;"></div> -->
   <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=f4cd67b2fb4a9926d16fe85ee8ec2a67&libraries=services"></script>
 <script>
  mapSetting();
function mapSetting(){
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng("${requestScope.bicycleList[0].map.latitude}", "${requestScope.bicycleList[0].map.longitude}"), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
        
        var positions = [
            <c:forEach items="${requestScope.bicycleList}" var="bicycleList" varStatus="status">
           				{	title: "${bicycleList.title}",
           					latlng: new daum.maps.LatLng("${bicycleList.map.latitude}", "${bicycleList.map.longitude}")
           				}
           				<c:if test="${not status.last}">,</c:if>
            </c:forEach>
    ];
 
        // 마커 이미지의 이미지 주소입니다
        var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
 		//var imageSrc = "${pageContext.request.contextPath}/resources/img/images.jpg";
         for (var i = 0; i < positions.length; i ++) {
            
            // 마커 이미지의 이미지 크기 입니다
            var imageSize = new daum.maps.Size(24, 35); 
            
            // 마커 이미지를 생성합니다    
            var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
            
             // 마커를 생성합니다
              var marker = new daum.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng , // 마커를 표시할 위치
                title :positions[i].title , // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지 
            });   
           // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
              var iwContent = '<div style="padding:5px;">'+positions[i].title+'</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

              // 인포윈도우를 생성합니다
              var infowindow = new daum.maps.InfoWindow({
                  content : iwContent
              });

              // 마커에 마우스오버 이벤트를 등록합니다
              daum.maps.event.addListener(marker, 'mouseover', function() {
                // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                  infowindow.open(map, marker);
              });

              // 마커에 마우스아웃 이벤트를 등록합니다
              daum.maps.event.addListener(marker, 'mouseout', function() {
                  // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                  infowindow.close();
              });
              daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
              daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        }  
       //인포윈도우를 표시하는 클로저를 만드는 함수입니다 
         function makeOverListener(map, marker, infowindow) {
             return function() {
                 infowindow.open(map, marker);
             };
         }

         // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
         function makeOutListener(infowindow) {
             return function() {
                 infowindow.close();
             };
         }
      

}//mapSetting

</script>
<script type="text/javascript">
 
 	$(document).ready(function(){
 		$("#bikeTypeSelect").change(function(){
 			var bikeType=$("#bikeTypeSelect option:selected").val();
 			//alert(bikeType);
 			//alert("address=${param.address}&startDay=${param.startDay}&endDay=${param.endDay}");
 				
 	 			$.ajax({
 				//${pageContext.request.contextPath}/bicycle/bicycle_search_list.do
 				type:"get",	
 				url:"${pageContext.request.contextPath}/bicycle/sortByBikeType.do",
 				data:"address=${param.address}&startDay=${param.startDay}&endDay=${param.endDay}&bikeType="+bikeType,
 				dataType:"json",
 				success:function refreshList(data){
 					$("#listSpace").html("");
 					var sortedList=JSON.stringify(data);
 					var contents=""; 
 					//alert(JSON.stringify(data)); 			
 			 		 for(var i=0;i<data.length;i++){
 					contents+='<a href="${pageContext.request.contextPath }/findBicycleByNo.do?bicycleNo='+data[i].bicycleNo+'">';
 					contents+='<div class="w3-second col-sm-6 w3-margin-top ">';
 					contents+='<div class="w3-card-2 content ">';
 					contents+='<img src="${pageContext.request.contextPath}/resources/upload/bicycle/'+data[i].photoVO.photo1+'" width="250px" height="180px">';
 					contents+='<div class="overlay" >';
 					contents+='<img class="w3-circle" src="${pageContext.request.contextPath}/resources/upload/member/'+data[i].memberVO.picture+'" width="20%" height="100%" align="right">';
 					contents+=' <span class="text" align="left" width="70%" >';
 					contents+=data[i].title;
 					contents+='<br>&#8361;'+data[i].rentPrice+'&nbsp;-&nbsp;'+'No'+data[i].bicycleNo+'&nbsp;-&nbsp;Type'+data[i].categoryVO.categoryNo;
 					contents+='</span></div></div></a></div>';
 					}  
 				 	
 					$("#listSpace").html(contents);
 				
 					$("#rentalPrice").val(""); 
 					}
 			})//ajax   
 		   
 		});//bikeType change
 		
 		$("#rentalPrice").change(function(){
 			var priceType=$("#rentalPrice option:selected").val();
 			//alert(bikeType);
 			//alert("address=${param.address}&startDay=${param.startDay}&endDay=${param.endDay}");
 			
 	 			$.ajax({
 				//${pageContext.request.contextPath}/bicycle/bicycle_search_list.do
 				type:"get",	
 				url:"${pageContext.request.contextPath}/bicycle/sortByPriceType.do",
 				data:"address=${param.address}&startDay=${param.startDay}&endDay=${param.endDay}&priceType="+priceType,
 				dataType:"json",
 				success:function refreshList(data){
 					$("#listSpace").html("");
 					var sortedList=JSON.stringify(data);
 					var contents=""; 
 					//alert(sortedList);
 					//alert(JSON.stringify(data)); 			
 					
 					  for(var i=0;i<data.length;i++){
 					contents+='<a href="${pageContext.request.contextPath }/findBicycleByNo.do?bicycleNo='+data[i].bicycleNo+'">';
 					contents+='<div class="w3-second col-sm-6 w3-margin-top ">';
 					contents+='<div class="w3-card-2 content ">';
 					contents+='<img src="${pageContext.request.contextPath}/resources/upload/bicycle/'+data[i].photoVO.photo1+'" width="250px" height="180px">';
 					contents+='<div class="overlay" >';
 					contents+='<img class="w3-circle" src="${pageContext.request.contextPath}/resources/upload/member/'+data[i].memberVO.picture+'" width="20%" height="100%" align="right">';
 					contents+=' <span class="text" align="left" width="70%" >';
 					contents+=data[i].title;
 					contents+='<br>&#8361;'+data[i].rentPrice+'&nbsp;-&nbsp;'+'No'+data[i].bicycleNo+'&nbsp;-&nbsp;Type'+data[i].categoryVO.categoryNo;
 					contents+='</span></div></div></a></div>';
 					}  
 					//alert('${requestScope.bicycleList}');
 					$("#listSpace").html(contents);
 					$("#bikeTypeSelect").val(""); 
 					}
 			})//ajax   
 		   
 		});//price change
 	});//ready
 		
 	
 </script>
<script src="//code.jquery.com/jquery.min.js"></script>
 
</body>
</html>