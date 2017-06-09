<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://momentjs.com/downloads/moment-with-locales.js"></script>
<script src="http://momentjs.com/downloads/moment-timezone-with-data.js"></script>
<script type="text/javascript">
function dateCheck(){
	var startDay=document.searchForm.startDay.value;
	var endDay=document.searchForm.endDay.value;
	
	 if(startDay>endDay){
		 alert("시작날과 종료날을 확인하세요!");
		 document.searchForm.reset();
		 return false;
	 }
	 
}
 
</script>
    
  <style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
.image {
  opacity: 0.9;
  width: 390px;
  transition: .5s ease;
  backface-visibility: hidden;
  position: relative;
}
.middle {
   opacity: 0.3;
  width: 390px;
  height:260px;
  transition: .5s ease;
  background-color: black;
  position: absolute;
  top:0%
}
.cityfont{
transition: .5s ease;
  position: absolute;
  color: white;
  font-size: 60px;
font-family: 'Jeju Gothic', serif;
 top: 60%;
 left: 65%;
}
.middle:hover .image {
  opacity: 1;
}

.middle:hover {
  opacity:0;
}
.middle:hover .cityfont {
}
  
  </style>
    <!-- Header -->
  <%--  <header  style="background-image: url('${pageContext.request.contextPath}/resources/img/seoul3.jpg'); background-repeat: no-repeat; background-size: cover; " > --%>
    <header  style="background-color: #f5fafa" >
        <div class="container " id="maincontent" tabindex="-1" >
            <div class="row" >
                <div class="col-lg-12" style="padding-bottom: 200px">
                    <div class="intro-text"  style="margin-bottom:50px; color:#2c3e50 ">
                        <h2 style="color: ">Search a bike for you</h2>
                        <h5>Save money, meet awesome people, and consume less</h5>
                        	<div  style="margin-top:30px;">
								<div class="row">
        			<form action="${pageContext.request.contextPath}/bicycle_search_list.do" method="post" name="searchForm" onsubmit="return dateCheck()">
            		<div class="form-group registration-date" style="width:800px; margin-left:16%;">
            		<div class="input-group registration-date-time"  >
            		<span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></span>
            		<input class="form-control" name="address" id="" type="text" size="15" required="required">
            		<span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
            		<input class="form-control" name="startDay" id="" type="date" size="" required="required">
            		<span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
            		<input class="form-control" name="endDay" id="" type="date"size="" required="required">
            		<span class="input-group-btn">
                    	<!-- <button class="btn btn-default" type="button" onclick="searchNow()"> Search &nbsp;&nbsp;<span class="glyphicon glyphicon-search" aria-hidden="true"></span></button> -->
                    	<input type="submit" class="btn btn-default" value="Search">%nbsp;<button  class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                    	
                    </span>
            	</div>
            </div>
        </form>
	</div>
</div>
                    </div>
                </div>
                <div  style="margin-bottom: -20px">
                	<div class="col-xs-6 col-md-4 col-lg-4 px-0" style="margin-bottom: -20px">
                		<a href="${pageContext.request.contextPath}/bicycle_search_list.do?address=판교"><img class="image" alt="" src="${pageContext.request.contextPath}/resources/img/pangyo.jpg"></a>
              	 		<div class="middle"></div> <div class="cityfont">판교</div>
              	 	</div>
                	<div class="col-xs-6 col-md-4 col-lg-4 px-0"  style="margin-bottom: -20px">
                	<div class="imgcon">
                		<a href="${pageContext.request.contextPath}/bicycle_search_list.do?address=잠실"><img   class="image" alt="" src="${pageContext.request.contextPath}/resources/img/jamsil.jpg" ></a>
                			<div class="middle"></div> <div class="cityfont">잠실</div>
                			</div>
                	</div>
                	<div class="col-xs-6 col-md-4 col-lg-4 px-0"  style="margin-bottom: -20px">
                	<div class="imgcon">
                		<a href="${pageContext.request.contextPath}/bicycle_search_list.do?address=수원"><img  class="image" alt="" src="${pageContext.request.contextPath}/resources/img/suwonsi.jpg" ></a>
                			<div class="middle"></div> <div class="cityfont">수원</div>
                	</div></div>
                </div>
                <div  style="margin-bottom: -20px">
                	<div class="col-xs-6 col-md-4 col-lg-4 px-0"  style="margin-bottom: -20px">
                	<div class="imgcon">
                		<a href="${pageContext.request.contextPath}/bicycle_search_list.do?address=부산"><img  class="image"  alt="" src="${pageContext.request.contextPath}/resources/img/busan.jpg"></a>
              	 			<div class="middle"></div> <div class="cityfont">부산</div>
              	 	</div></div>
                	<div class="col-xs-6 col-md-4 col-lg-4 px-0"  style="margin-bottom: -20px">
                	<div class="imgcon">
                		<a href="${pageContext.request.contextPath}/bicycle_search_list.do?address=대구"><img  class="image" alt="" src="${pageContext.request.contextPath}/resources/img/daegu.jpg" ></a>
                			<div class="middle"></div> <div class="cityfont">대구</div>
                	</div></div>
                	<div class="col-xs-6 col-md-4 col-lg-4 px-0"  style="margin-bottom: -20px">
                	<div class="imgcon">
                		<a href="${pageContext.request.contextPath}/bicycle_search_list.do?address=서울시"><img  class="image" alt="" src="${pageContext.request.contextPath}/resources/img/seoulsi.jpg" ></a>
                			<div class="middle"></div> <div class="cityfont">서울</div>
                	</div></div>
                </div>
        </div></div>
    </header>
    
    

 