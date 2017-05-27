<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
      <meta charset="UTF-8">
      <title>네이버 지도 API - 주소로 지도 표시하기</title>
      
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
<%--       <section id="portfolio">
           <div class="container">
              <!--  <div class="row"> -->
                   <div class="portfolio-item responsive gallery">
                    <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                           <div class="caption-content">
                              <span style="text-align: center;">
                              아이디:${requestScope.bicycleList[0].memberId}<br>
                                대여료:${requestScope.bicycleList[0].rentPrice}<br>
                        </span>
                            </div> 
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/upload/${requestScope.bicycleList[0].photo1}" class="img-responsive" alt="Cabin">
                       
                    </a>
                   </div>
                 
               </div>row
                           <!--  <div class="row"> -->
                   <div class="portfolio-item responsive gallery">
                    <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                           <div class="caption-content">
                              <span style="text-align: center;">
                              아이디:${requestScope.bicycleList[0].memberId}<br>
                                대여료:${requestScope.bicycleList[0].rentPrice}<br>
                        </span>
                            </div> 
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/upload/${requestScope.bicycleList[0].photo1}" class="img-responsive" alt="Cabin">
                       
                    </a>
                   </div>
                 
               </div>row
                           <!--  <div class="row"> -->
                   <div class="portfolio-item responsive gallery">
                    <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                           <div class="caption-content">
                              <span style="text-align: center;">
                              아이디:${requestScope.bicycleList[0].memberId}<br>
                                대여료:${requestScope.bicycleList[0].rentPrice}<br>
                        </span>
                            </div> 
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/upload/${requestScope.bicycleList[0].photo1}" class="img-responsive" alt="Cabin">
                       
                    </a>
                   </div>
                 
               </div>row
               
           </div>
       </section>  --%>
 <section id="portfolio"> 
<div class="w3-container w3-teal " >
  <h1>Bicycle List</h1>
</div>

<div class="w3-row-padding w3-margin-top " >
	<c:forEach items="${requestScope.bicycleList}" var="list" >
  <div class="w3-second col-sm-6 w3-margin-top ">
     <div class="w3-card-2 content ">
      <img src="${pageContext.request.contextPath}/resources/upload/${list.photo1}" style="width:100%">
      <div class="overlay" >
     	 <span class="text">
        		아이디:${list.memberId}<br>
                대여료:${list.rentPrice}<br>
             </span>
      </div>
    </div> 
  </div>
</c:forEach>
     <%-- <div class="w3-second col-sm-6  w3-margin-top">
    <div class="w3-card-2 content" >
      <img src="${pageContext.request.contextPath}/resources/upload/${requestScope.bicycleList[0].photo1}" style="width:100%">
      <div class="overlay">
      <span class="text">
        아이디:${requestScope.bicycleList[0].memberId}2<br>
                                대여료:${requestScope.bicycleList[0].rentPrice}<br>
       </span>
      </div>
    </div>
  </div>

       <div class="w3-second col-sm-6  w3-margin-top">
    <div class="w3-card-2 content" >
      <img src="${pageContext.request.contextPath}/resources/upload/${requestScope.bicycleList[0].photo1}" style="width:100%">
      <div class="overlay">
      <span class="text">
        아이디:${requestScope.bicycleList[0].memberId}3<br>
                                대여료:${requestScope.bicycleList[0].rentPrice}<br>
		</span>
      </div>
    </div>
  </div>



      <div class="w3-second col-sm-6  w3-margin-top">
    <div class="w3-card-2 content" >
      <img src="${pageContext.request.contextPath}/resources/upload/${requestScope.bicycleList[0].photo1}" style="width:100%">
      <div class="overlay">
      <span class="text">
        아이디:${requestScope.bicycleList[0].memberId}4<br>
                                대여료:${requestScope.bicycleList[0].rentPrice}<br>
		</span>
      </div>
    </div>
  </div>
   --%>
  
  
</div><%-- 자전거리스트 css --%>
      </section>  
   </div><%--리스트 전체 div --%>
   <%-- 검색 리스트 --%>
   <!-- <div class="col-sm-12" style="height:200px;background-color:#F0FFFF;"></div> -->
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