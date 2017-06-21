<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://momentjs.com/downloads/moment-with-locales.js"></script>
<script src="http://momentjs.com/downloads/moment-timezone-with-data.js"></script>
<script type="text/javascript">
function dateCheck(){
	var now= new Date();  //날짜 객체 생성
	var year=now.getFullYear(); //년도 정보를 받음
	var month=now.getMonth()+1; //달 정보를 받음 현재달은 +1
	if((month+"").length<2){ //한자리 달을 0을 붙여 두자리로 
		month="0"+month;
	}

	var day=now.getDate();
	if((day+"").length<2) //한자리 일을 0을 붙여 두자리로
		day="0"+day;
	var today=year+"-"+month+"-"+day;  //Date 형식으로 저장
	var startDay=document.searchForm.startDay.value; 
	var endDay=document.searchForm.endDay.value;
	if(today !=""&&startDay!=""&&today>startDay){ //날짜 값이 널이 아닐 때 오늘날짜와 시작날짜 비교
		alert("오늘 날짜 이후를 선택하여 주세요.");
		return false;
	}
	 if(startDay>endDay){ //시작일과 종료일 비교
		 alert("시작일과 종료일을 확인하세요!");
		 return false;
	 }
	 
}
 
</script>
    
  <style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);

#city1{
 style="width: 100%; 
 height:50%; 
 background-color: black;
 padding: 0px;
}
#city2{
padding: 0px;
}

.image {
  opacity: 0.9;
  transition: .5s ease;
  backface-visibility: hidden;
  position: relative;
  margin-bottom: 0px;
}
.middle {
   opacity: 0.3;
   width:100%;
   height:100%;
  transition: .5s ease;
  background-color: white;
  position: absolute;
  top:0%
}
.cityfont{
transition: .5s ease;
  position: absolute;
  color: white;
  font-size: 40px;
font-family: 'Jeju Gothic', serif;
 top: 70%;
 left: 75%;
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
  <%--  <header  style="background-image: url('${pageContext.request.contextPath}/resources/img/portfolio/seoul.jpg'); background-repeat: no-repeat; background-size: cover; " > --%>
    <header  style="background-color: white; width: 100%;" >
        <div class="container " id="maincontent" tabindex="-1" style="width: 100%; padding-bottom: 50px;">
            <div class="row" >
                <div class="col-lg-12" style="padding-bottom: 200px">
                    <div class="intro-text"  style="margin-bottom:50px; color:#4d4d4d ">
                    <%-- <img alt="" src="${pageContext.request.contextPath}/resources/img/rebicycle_login.png" style="width: 300px;"> --%>
                        <h2>Search <font  style="color:#E8402E">rebicycle</font> for you !</h2>
                        	<div  style="margin-top:30px;"align="center">
								<div class="row" align="center">

					        			<form action="${pageContext.request.contextPath}/bicycle_search_list.do"  name="searchForm" onsubmit="return dateCheck()">
					            		<div class="form-group registration-date" style="width:800px;" align="center">
					            		<div class="input-group registration-date-time"  >
					            		<span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></span>
					            		<input class="form-control" name="address" id="" type="text" size="15" required="required">
					            		<span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
					            		<input class="form-control" name="startDay" id="" type="date" size="" >
					            		<span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
					            		<input class="form-control" name="endDay" id="" type="date"size="" >
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
                <div class="col-lg-12" id="city1" >
                	<div class="col-lg-4" id="city2">
                		<a href="${pageContext.request.contextPath}/bicycle_search_list.do?address=판교">
                			<img class="image" alt="" src="${pageContext.request.contextPath}/resources/img/pangyo.jpg"  style="width: 100%;">
              	 			<div class="middle"></div> <div class="cityfont">판교</div>
              	 		</a>
              	 	</div>
                	<div class="col-lg-4 "  id="city2">
                		<a href="${pageContext.request.contextPath}/bicycle_search_list.do?address=잠실">
                			<img   class="image" alt="" src="${pageContext.request.contextPath}/resources/img/jamsil.jpg"  style="width: 100%;">
                			<div class="middle"></div> <div class="cityfont">잠실</div>
                		</a>
                	</div>
                	<div class="col-lg-4"   id="city2">
                		<a href="${pageContext.request.contextPath}/bicycle_search_list.do?address=수원">
                			<img  class="image" alt="" src="${pageContext.request.contextPath}/resources/img/suwonsi.jpg"  style="width: 100%;">
                			<div class="middle"></div> <div class="cityfont">수원</div>
                		</a>
                	</div>
                </div>
                <div class="col-lg-12"  id="city1"">
                	<div class="col-lg-4"   id="city2">
                		<a href="${pageContext.request.contextPath}/bicycle_search_list.do?address=부산">
                			<img  class="image"  alt="" src="${pageContext.request.contextPath}/resources/img/busan.jpg" style="width: 100%;">
              	 			<div class="middle"></div> <div class="cityfont">부산</div>
              	 		</a>
              	 	</div>
                	<div class="col-lg-4"   id="city2">
                		<a href="${pageContext.request.contextPath}/bicycle_search_list.do?address=대구">
                			<img  class="image" alt="" src="${pageContext.request.contextPath}/resources/img/daegu.jpg"  style="width: 100%;">
                			<div class="middle"></div> <div class="cityfont">대구</div>
                		</a>
                	</div>
                	<div class="col-lg-4"   id="city2">
                		<a href="${pageContext.request.contextPath}/bicycle_search_list.do?address=서울시">
                			<img  class="image" alt="" src="${pageContext.request.contextPath}/resources/img/seoulsi.jpg"  style="width: 100%;">
                			<div class="middle"></div> <div class="cityfont">서울</div>
                		</a>
                	</div>
                </div>
        </div></div>
    </header>
    
    

 