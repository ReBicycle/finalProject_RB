<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
  bottom: 0%;
  left: 0;
  right: 0;
  background-color: #006666;
  overflow: hidden;
  width: 100%;
  height:0%;
  transition: .05s ease;
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
  top: 65%;
  left: 30%;
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

 .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}


</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
   <div class="col-sm-6" style="height:700px;background-color:white;overflow:auto;overflow-x:hidden;" >

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
<%-- 자전거리스트 css --%>
 <div class="w3-row" id="listSpace" style="margin-top: 40px;">
	<c:forEach items="${requestScope.bicycleList}" var="list" >
    	<div class="content w3-half" >
    	<a href="${pageContext.request.contextPath }/bicycle/bicycle_findBicycleByNo.do?bicycleNo=${list.bicycleNo}" onclick="return loginCheck()">
     		 <img src="${pageContext.request.contextPath }/resources/upload/bicycle/${list.photoVO.photo1}" style="width:100%;height:250px;" onclick="onClick(this)" >
      		<div class="overlay">
      					<img class="w3-circle" src="${pageContext.request.contextPath}/resources/upload/member/${list.memberVO.picture}" width="25%" height="100%" align="right">
      					<span class="text" align="left"  width="70%"  >	
      										${list.title }<br>
      										&#8361;${list.rentPrice}&nbsp;-&nbsp;No${list.bicycleNo}&nbsp;-&nbsp;Type${list.categoryVO.categoryNo }
      					</span>
      		</div>
      		</a>
     	</div>
     
     </c:forEach>
   </div>
 </div><%--리스트 출력 전체 div --%>
   <%-- 검색 리스트 --%>
   <!-- <div class="col-sm-12" style="height:200px;background-color:#F0FFFF;"></div> -->
   <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c4a694f8da8eb3b5725921a457f15461&libraries=services"></script>
 <script>
 var markers=[];
 var map;
  mapSetting();
function mapSetting(){
	
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng("${requestScope.bicycleList[0].map.latitude}", "${requestScope.bicycleList[0].map.longitude}"), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
map=new daum.maps.Map(mapContainer, mapOption); 
// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new daum.maps.ZoomControl();
	//범위재설정
	var bounds = new daum.maps.LatLngBounds();   
	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, daum.maps.ControlPosition.BOTTOMLEFT);
        var positions = [
            <c:forEach items="${requestScope.bicycleList}" var="bicycleList" varStatus="status">
           				{	title: "${bicycleList.title}",
           					latlng: new daum.maps.LatLng("${bicycleList.map.latitude}", "${bicycleList.map.longitude}"),
           					bicycleNo:"${bicycleList.bicycleNo}"
           				}
           				<c:if test="${not status.last}">,</c:if>
            </c:forEach>
    ];
        var index=0;
     var contents = new Array();
     <c:forEach items="${requestScope.bicycleList}" var="bicycleList" varStatus="status">
     <c:set var="addr" value="${bicycleList.address}"/>    	
    contents[index]= '<div class="wrap">' + 
     '    <div class="info">' + 
     '        <div class="title">' + 
     '           ${bicycleList.title}' + 
     '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
     '        </div>' + 
     '        <div class="body">' + 
     '            <div class="img">' +
     '                <img src="${pageContext.request.contextPath}/resources/upload/bicycle/${bicycleList.photoVO.photo1}" width="73" height="70">' +
     '           </div>' + 
     '            <div class="desc">' + 
     '                <div class="ellipsis"> ${fn:substringBefore(addr, "%")}</div>' + 
     '                <div class="jibun ellipsis"> ${fn:substringAfter(addr, "%")}</div>' + 
     '                <div class="ellipsis"> ${bicycleList.rentPrice}원/시간</div>' + 
     '            </div>' + 
     '        </div>' + 
     '    </div>' +    
     '</div>';
     index++;
     </c:forEach>
     
     
        // 마커 이미지의 이미지 주소입니다
        var imageSrc = "${pageContext.request.contextPath}/resources/img/marker4.png"; 
 		//var imageSrc = "${pageContext.request.contextPath}/resources/img/images.jpg";
 		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
 		 
 		
         for (var i = 0; i < positions.length; i ++) {
            
            // 마커 이미지의 이미지 크기 입니다
            var imageSize = new daum.maps.Size(30,40); 
            
            // 마커 이미지를 생성합니다    
            var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
            
             // 마커를 생성합니다
              var marker = new daum.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng , // 마커를 표시할 위치
                title :positions[i].title , // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지 
            }); 
             
              bounds.extend(positions[i].latlng);
              
              
 			 // 마커 위에 커스텀오버레이를 표시합니다
 			 // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			  var overlay = new daum.maps.CustomOverlay({
  			     content: contents[i],
  			     map: map,
 			     position: marker.getPosition()       
			  });
 			 
             overlay.setMap(null);
             
     		var p = positions[i].bicycleNo;
         
              daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, overlay));
              daum.maps.event.addListener(marker, 'mouseout', makeOutListener(overlay)); 
           // 마커를 클릭했을 때 디테일로 페이지이동
              daum.maps.event.addListener(marker, 'click', function() {
            	  if(loginCheck())
                  location.href="${pageContext.request.contextPath }/bicycle/bicycle_findBicycleByNo.do?bicycleNo="+p;
              });
              
        }//for문 끝
        
        setBounds();
        
       //오버레이를 표시하는 클로저를 만드는 함수입니다 
         function makeOverListener(map, marker, overlay) {
             return function() {
            	 overlay.setMap(map);
                 
             };
         }

         // 오버레이를 닫는 클로저를 만드는 함수입니다 
         function makeOutListener(overlay) {
             return function() {
            	  overlay.setMap(null); 
                
             };
         }  
         
         function setBounds() {
        	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
        	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
        	    map.setBounds(bounds);
        	}

}//mapSetting

</script>
<script type="text/javascript">
function loginCheck(){
	var mvo="${sessionScope.mvo}";
		if(mvo==""){
			alert("로그인이 필요한 서비스 입니다.");
			return false;
		}
		else
			return true;
}
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
 				url:"${pageContext.request.contextPath}/sortByBikeType.do",
 				data:"address=${param.address}&startDay=${param.startDay}&endDay=${param.endDay}&bikeType="+bikeType,
 				dataType:"json",
 				success:function refreshList(data){
 					$("#listSpace").html("");
 					var sortedList=JSON.stringify(data);
 					var contents=""; 
 					//alert(JSON.stringify(data)); 			
 			 		 for(var i=0;i<data.length;i++){
 					
 					contents+='<div class="content w3-half">';
 					contents+='<a href="${pageContext.request.contextPath }/bicycle/bicycle_findBicycleByNo.do?bicycleNo='+data[i].bicycleNo+'"onclick="return loginCheck()">';
 					contents+='<img src="${pageContext.request.contextPath}/resources/upload/bicycle/'+data[i].photoVO.photo1+'" style="width:100%;height:250px;">';
 					contents+='<div class="overlay" >';
 					contents+='<img class="w3-circle" src="${pageContext.request.contextPath}/resources/upload/member/'+data[i].memberVO.picture+'" width="25%" height="100%" align="right">';
 					contents+=' <span class="text" align="left" width="70%" >';
 					contents+=data[i].title;
 					contents+='<br>&#8361;'+data[i].rentPrice+'&nbsp;-&nbsp;'+'No'+data[i].bicycleNo+'&nbsp;-&nbsp;Type'+data[i].categoryVO.categoryNo;
 					contents+='</span></div></a></div>';
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
 				url:"${pageContext.request.contextPath}/sortByPriceType.do",
 				data:"address=${param.address}&startDay=${param.startDay}&endDay=${param.endDay}&priceType="+priceType,
 				dataType:"json",
 				success:function refreshList(data){
 					$("#listSpace").html("");
 					var sortedList=JSON.stringify(data);
 					var contents=""; 
 					//alert(sortedList);
 					//alert(JSON.stringify(data)); 			
 					
 					  for(var i=0;i<data.length;i++){
 					contents+='<a href="${pageContext.request.contextPath }/bicycle/bicycle_findBicycleByNo.do?bicycleNo='+data[i].bicycleNo+'"onclick="return loginCheck()">';
 					contents+='<div class="content w3-half ">';
 					contents+='<img src="${pageContext.request.contextPath}/resources/upload/bicycle/'+data[i].photoVO.photo1+'" style="width:100%;height:250px;">';
 					contents+='<div class="overlay" >';
 					contents+='<img class="w3-circle" src="${pageContext.request.contextPath}/resources/upload/member/'+data[i].memberVO.picture+'" width="25%" height="100%" align="right">';
 					contents+=' <span class="text" align="left" width="70%" >';
 					contents+=data[i].title;
 					contents+='<br>&#8361;'+data[i].rentPrice+'&nbsp;-&nbsp;'+'No'+data[i].bicycleNo+'&nbsp;-&nbsp;Type'+data[i].categoryVO.categoryNo;
 					contents+='</span></div></a></div>';
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
 
