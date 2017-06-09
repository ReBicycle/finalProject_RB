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
    
    
    <!-- Header -->
   <header  style="background-image: url('${pageContext.request.contextPath}/resources/img/seoul3.jpg'); background-repeat: no-repeat; background-size: cover; " >
    <!-- <header  style="background-color:#7FFFD4; background-size: cover; " > -->
        <div class="container " id="maincontent" tabindex="-1" >
            <div class="row" >
                <div class="col-lg-12">
                    <div class="intro-text"  style="margin-bottom:300px;">
                        <h2 style="color: ">Search a bike for you</h2><br>
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
                        
                        <!-- <hr class="star-light"> -->
                        <!-- <span class="skills">Web Developer - Graphic Artist - User Experience Designer</span> -->
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    

 