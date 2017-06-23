<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 이미지 슬라이드 -->
<style type="text/css">
section.awSlider .carousel {
   display: table;
   z-index: 2;
   -moz-box-shadow: 0 0 4px #444;
   -webkit-box-shadow: 0 0 4px #444;
   box-shadow: 0 0 15px rgba(1, 1, 1, .5);
}

section.awSlider {
   margin: 30px auto;
   padding: 30px;
   position: relative;
   display: table;
   -webkit-touch-callout: none;
   -webkit-user-select: none;
   -khtml-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
   user-select: none;
}

section.awSlider:hover>img {
   -ms-transform: scale(1.2);
   -webkit-transform: scale(1.2);
   transform: scale(1.2);
   opacity: 1;
}

section.awSlider img {
   pointer-events: none;
}

section.awSlider>img {
   position: absolute;
   top: 30px;
   z-index: 1;
   transition: all .3s;
   filter: blur(1.8vw);
   -webkit-filter: blur(2vw);
   -moz-filter: blur(2vw);
   -o-filter: blur(2vw);
   -ms-filter: blur(2vw);
   -ms-transform: scale(1.1);
   -webkit-transform: scale(1.1);
   transform: scale(1.1);
   opacity: .5;
}

<%-- 리뷰 모달css--%>
 
/* The Modal background */
.modal { 
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 5; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 50%; /* Could be more or less, depending on screen size */
    height: 75%;
}
.close {
    position: absolute;
    right: 20%;  
    top: 10%;
    color: #000;
    font-size: 40px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

<%-- detail information 모달css--%>
.modal2 { 
    display: none;
    position: fixed;
    z-index: 5;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
    padding-top: 60px;
}
.modal2-content {
    background-color: #ffffff;
    margin:5% auto 15% auto;
    border: 1px solid #888;
    width: 30%; 
    height: 50%;
}
.close2 {
    position: absolute;
    right: 37%;  
    top: 21%;
    color: #000;
    font-size: 40px;
    font-weight: bold;
}

.close2:hover,
.close2:focus {
    color: red;
    cursor: pointer;
}


</style>

<!-- fullcalendar 스크립트-->
<!-- http://blog.naver.com/seon5524/220733425041 달력 디자인-->
<!-- http://blog.naver.com/yoocm1229/220442972831 해보기 -->
<script>
   $(document).ready(function() {   
	  
      
      $('#calendar').fullCalendar({
         header: {
            right: 'prev,next today',
            left: 'title',
            center:'possibleDay'
            /* right: 'month,agendaWeek,agendaDay' */
         },
         //defaultDate: '2017-05-12',
         navLinks: true, // can click day/week names to navigate views
         //selectable: true,
         //selectHelper: true,     
         //editable: true,
         eventLimit: true, // allow "more" link when too many events   
         events: '${pageContext.request.contextPath}/appearDate.do?bicycleNo=${requestScope.findBvo.bicycleNo}'
 
      });
   });//ready
</script>

<!-- 기간 추가, 가능 날짜 검사, 대여료 기능  -->
<script>

   //day N:N 서로 다른 id를 생성하기 위한 변수
   var clickCount=0;
   
   //day N:N - 각각의 startDay , endDay를 담기 위한 배열 선언
   var startendDay=new Array();
  
   var oTbl;
   
   //day N:N 로 비교하기 위해 
   //input - class 가 같은 수
   var startLength=0;
   var endLength=0;
     
   //Row 추가
   function insRow() {
        oTbl = document.getElementById("addTable");
        var oRow = oTbl.insertRow();
        oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
        var oCell = oRow.insertCell();
   
        //day N:N 검사를 위한
        //class수 검사
        startLength=$(".startInput").length;
        endLength=$(".endInput").length;
        
        //삽입될 Form Tag'
        var frmTag = "<input type=date name=startDay class=startInput textinput textInput form-control id=startDay"+clickCount+"><input type=date name=endDay class=endInput textinput textInput form-control id=endDay"+clickCount+">";
        frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'><div id = calResult"+clickCount+"></div>";
        oCell.innerHTML = frmTag;        
   }
   
   //Row 삭제
   function removeRow() {
      oTbl.deleteRow(oTbl.clickedRowIndex);
   }
   
   function frmCheck() {
        var frm = document.form;
        for( var i = 0; i <= frm.elements.length - 1; i++ ){
          if( frm.elements[i].name == "addText[]" ) {
               if( !frm.elements[i].value ){
                   alert("텍스트박스에 값을 입력하세요!!!");
                   frm.elements[i].focus();
                   return;
                }
            }
         }
   }     
          
   $(document).ready(function(){
	   $.ajax({
			type:"get",
			url:"${pageContext.request.contextPath }/heartCheck.do",
			data:"id=${sessionScope.mvo.id}&bicycleNo=${requestScope.findBvo.bicycleNo}",
			success:function(data){
				//alert(data);
				$("#heart").html("<img alt='찜하기' src='${pageContext.request.contextPath}/resources/img/heart"+data+".png' style='width:35px'>");
			}
		});
	   $("#heart").click(function(){
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath }/heartOnOff.do",
				data:"id=${sessionScope.mvo.id}&bicycleNo=${requestScope.findBvo.bicycleNo}",
				success:function(data){
					if(data=="on")
						alert("내 자전거로 찜하기!");
					else
						alert("내 자전거에서 삭제!");
					$("#heart").html("<br><img alt='찜하기' src='${pageContext.request.contextPath}/resources/img/heart"+data+".png' style='width:35px'>");
				}
			});
		});
	   
	   $( ".star_rating a" ).click(function() {
           event.preventDefault();
           $(this).parent().children("a").removeClass("on");
           $(this).addClass("on").prevAll("a").addClass("on");
           $(this).parent().children("a").html("<img style='width:30px' src='${pageContext.request.contextPath}/resources/img/staroff.png'>");
           $(".on").html("<img style='width:30px' src='${pageContext.request.contextPath}/resources/img/staron.png'>");
           return false;
        });
        $(".on").html("<img style='width:30px' src='${pageContext.request.contextPath}/resources/img/staron.png'>");
        
        
        $( ".star_rating_modal a" ).click(function() {
            event.preventDefault();
            $(this).parent().children("a").removeClass("on");
            $(this).addClass("onn").prevAll("a").addClass("onn");
            $(this).parent().children("a").html("<img style='width:30px' src='${pageContext.request.contextPath}/resources/img/staroff.png'>");
            $(".onn").html("<img style='width:30px' src='${pageContext.request.contextPath}/resources/img/staron.png'>");
            return false;
         });       
        
        $("#reviewSubmit").click(function(){
           if($("#reviewContent").val() == ""){
              alert("리뷰를 입력하세요");
              return false;
           }
           location.href="${pageContext.request.contextPath}/writeReview.do?bicycleNo=${requestScope.findBvo.bicycleNo}&content="+$("#reviewContent").val()+"&star="+$(".star_rating  .on").length;
        }); 
        $(".deleteReview").click(function(){
        	if(confirm('리뷰를 삭제하시겠습니까?')){
        		var no = $("#rentNo").val();
        		location.href="${pageContext.request.contextPath}/deleteReview.do?rentNo="+no;
        	}       		
        });
        $("#updateReviewSubmit").click(function(){        	
        		var no = $("#modal_rentNo").val();
        		var content = $("#review_update_content").val();
        		var star=$(".star_rating_modal .onn").length;
        		if(star==0)
        			star=$("#modal_before_star").val();
        	    location.href="${pageContext.request.contextPath}/updateReview.do?rentNo="+no+"&star="+star+"&content="+content;  		
        });
        $(".updateReview").click(function(){
        	document.getElementById('id01').style.display='block';
        })
        
         //day N:N - 사용가능 결과 변수
        var checkDayResultl=null;
        var checkFailList=new Array();
         
        //사용자가 입력한 날짜별 계산된 대여료들
       	//calculateResult 변수에 넣는다.
	     var calculateResult=new Array();
	     var content = "";  
	     var checkFlag = new Array();
	     
	     checkFlag[0] = false;
	 		
	 	
        $("#checkImg").click(function(){
           //day N:N - 배열 형태인 startDay 와 endDay 를 
           //startendDay[] 에 넣어준다.
           //여기서 날짜 전후 비교
           for(var i=0; i<=startLength; i++){
                 
        	   if($("#startDay"+i).val()>$("#endDay"+i).val()){
					alert("입력한 날짜 전후를 확인하세요.")
					 $("#startDay"+[i]).focus();
		             $("#startDay"+[i]).val("");
		             $("#endDay"+[i]).val("");
					return false;
				}
        	   //day N:N - 각 startDay와 endDay를 map에 넣어준다.
                 var dayMap=newMap();
                 dayMap.put("startDay",$("#startDay"+i).val());
                 dayMap.put("endDay",$("#endDay"+i).val());
                 startendDay[i]=dayMap;
                 //checkFlag[i] = true;
                 
                 //alert("checkFlag i번째 - checkImg click" + checkFlag[i]);
		         $.ajax({
		            type:"get",
		            data:"bicycleNo=${requestScope.findBvo.bicycleNo}",
		            dataType:"json",
		            url:"${pageContext.request.contextPath}/dayCheck.do",
		            success:function(data){
		            	 var flag=0;//불가능
		            	 var result="";
		            	
		            	  exit_for:
		                  for(var j=0; j< data.length; j++){
		                     //가능한 날짜일 경우 flag에 =1 한다.
		                     if(((data[j].startDay<=startendDay[i-1].get("startDay")) && (startendDay[i-1].get("endDay")<=data[j].endDay))){
		                    	 flag=1;
		                         content = ("<font color='blue'>가능</font><br>");		                    
		                         //?번 입력날짜가 possible_day 테이블의 데이터 범위안에 들어오면 "가능"
		                         //exit_for 을 사용하지 않으면 
		                         //다음 possible_day 와 비교결과 아래의 "else" 영역으로 넘어가 
		                         //결국 불가능이 된다.
		                         checkFlag[i] = true;
		                         break exit_for;
		                        
		                     }else{ 
		                    	 result = (i-1);
		                    	 content = ("<font color='red'>"+result+"번 날짜 불가능</font><br>");
		                    	 checkFlag[i-1] = false;
		                    	 //alert("test" + checkFlag[i-1]);
		                     }                  
		                  }
		            	 
		            	 if(flag==0){
	                    	 $("#startDay"+[i-1]).focus();
	                    	 $("#startDay"+[i-1]).val("");
	                    	 $("#endDay"+[i-1]).val("");
	                     }
		            	 
		                  $("#checkResult").html(content);      
			      	 } //success    		     
			     });//ajax		        
	     	}//for-startendDay.length           
        });
        
        
        $("#plusImg").click(function(){
        	
        	if(checkFlag[clickCount+1]==false){
	 			alert("가능일 확인 절차가 필요합니다!");
	 			return false;
	 		}
        	checkFlag[clickCount+1] = false;
           //day N:N 검사에서 id에 0,1,2,,, 를 붙이기 위해 
           //clickCount 변수에 +1 을 한다
           
           //+를 누를때 이전 startDay값과 endDay값이 있는지 없는지 check
           
           clickCount=clickCount+1;
           insRow();
        });
         
         
		$("#calImg").click(function(){
          	for(var i=0; i<=startLength; i++){
 				if($("#startDay"+i).val()>$("#endDay"+i).val()){
					alert("입력한 날짜를 확인하세요.")
					return false;
				}
				var dayMap=newMap();
				dayMap.put("startDay",$("#startDay"+i).val());
				dayMap.put("endDay",$("#endDay"+i).val());
				startendDay[i]=dayMap;  
			}                            
              
			for(var i=0; i<=startLength; i++){
				// 대여료 계산 - calResult 영역에 
				// 각각의 대여료를 나타내기 위한 변수
				var dayFlag=0;
				var start = startendDay[i].get("startDay");//사용자가 클릭한 시작일 2017-05-31
				var end = startendDay[i].get("endDay");//사용자가 클릭한 종료일 2017-05-31
				var startYear = parseInt(start.substring(0,4));
				var endYear = parseInt(end.substring(0,4));
				var startMonth = parseInt(start.substring(5,7));//5
				var endMonth = parseInt(end.substring(5,7));//7
				var startDay = parseInt(start.substring(8,10));//6
				var endDay = parseInt(end.substring(8,10));//8
                  
                  $.ajax({
                     type:"get",
                     data:"currYear="+ startYear + "&startMonth="+startMonth + "&endMonth="+endMonth+ "&startDay=" + startDay + "&endDay="+endDay,
                     url:"${pageContext.request.contextPath}/getCalendarBean.do",
                     success:function(data){
                        //alert("총기간" + data);
                        var result = (parseInt(data));
                        var rentPrice = parseInt("${requestScope.findBvo.rentPrice}");
                        var calResult=result*rentPrice;
                        $("#calResult"+dayFlag).html("총대여료 : " + calResult);
                        //alert("대욜   "+calResult);
                        dayFlag=dayFlag+1; 
                     } //success       
                  });//ajax 
                  
                 }            
         });
         
         //달력 변경 시 div-checkResult 영역 초기화 - keyup 대신 
         $("#startDay").click(function(){
            $("#checkResult").html("시작 날짜를 검사해야 합니다.");
         });
       	$("#endDay").click(function(){
          $("#checkResult").html("끝 날짜를 검사해야 합니다.");
         });
         
         $("#rentBtn").click(function(){
            $("#rentForm").submit(function(){  
               if($("#checkResult").text()=='가능'){
                  if (confirm("빌리시겠습니까?") == true){
                  return true;
                  }else{
                     return false;
                  }
               }else{
                  alert("날짜를 검사해야 합니다.");
                  return false;
               }                       
            });           
         });
         //id 위에 detail information 
         $('[data-toggle="tooltip"]').tooltip(); 
         
         //javascript 에서 map 기능을 사용하기 위함
         function newMap() {
           var map = {};
           map.value = {};
           map.getKey = function(id) {
             return "k_"+id;
           };
           map.put = function(id, value) {
             var key = map.getKey(id);
             map.value[key] = value;
           };
           map.contains = function(id) {
             var key = map.getKey(id);
             if(map.value[key]) {
               return true;
             } else {
               return false;
             }
           };
           map.get = function(id) {
             var key = map.getKey(id);
             if(map.value[key]) {
               return map.value[key];
             }
             return null;
           };
           map.remove = function(id) {
             var key = map.getKey(id);
             if(map.contains(id)){
               map.value[key] = undefined;
             }
           };
          
           return map;
         }
        
   });
</script>
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
  }
  x[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " w3-opacity-off";
}
</script> 
<!-- main css -->
<style>
   body {
      margin: 10px 10px;
      padding: 0;
      font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
      
   }
   #calendar {
      max-width: 900px;
      margin: 0 auto;
   }
   .plus-img,.check-img,.cal-img {
   width: 30px;
   height: 30px;
   margin: 10px auto 10px;
   
   display: block;
   -moz-border-radius: 50%;
   -webkit-border-radius: 50%;
   border-radius: 50%;
  
   }
</style>

<br><br><br>
<div class="container">

   	<!-- <section class="awSlider"> -->
      	<!-- <div class="carousel slide" data-ride="carousel">
         	Indicators
         	<ol class="carousel-indicators">  
	            <li data-target=".carousel" data-slide-to="0" class="active"></li>
	            <li data-target=".carousel" data-slide-to="1"></li>
	            <li data-target=".carousel" data-slide-to="2"></li>
         	</ol> -->
         	<div class="col-sm-2" ></div>   
	 
	       <div class="w3-row col-sm-8" align="center" style="max-width:800px;">
	       <button class="w3-button  w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
			<div class="w3-content w3-display-container" >
  				<img class="mySlides" src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo1}" style="width:50%">
  				<img class="mySlides" src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo2}" style="width:50%;display: none;">
 				<img class="mySlides" src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo3}" style="width:50%;display: none;">

  			
  			
    		
    			<div class="w3-row-padding w3-section">
      				<img class="demo w3-opacity w3-hover-opacity-off" src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo1}" style="width:10%" onclick="currentDiv(1)">
      				&nbsp;&nbsp;&nbsp;
      				<img class="demo w3-opacity w3-hover-opacity-off" src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo2}" style="width:10%" onclick="currentDiv(2)">
      				&nbsp;&nbsp;&nbsp;
      				<img class="demo w3-opacity w3-hover-opacity-off" src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo3}" style="width:10%" onclick="currentDiv(3)">
  				</div><br>
  		 
			</div>    
			<button class="w3-button  w3-display-right" onclick="plusDivs(1)">&#10095;</button> 
			</div>   

      	<div class="col-sm-2" style="height:400px;"></div>  
 <span id="heart"></span>


         <%-- 	<!-- Wrapper for slides -->
         	<div class="carousel-inner" role="listbox">
            	<div class="item active">
               	<img src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo1}" style="max-width: 100%;" width="500px">
               		<div class="carousel-caption">${requestScope.findBvo.photoVO.photo1}</div>
            	</div>
            	<div class="item">
               		<img src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo2}" style="max-width: 100%;" width="500px">
               		<div class="carousel-caption">${requestScope.findBvo.photoVO.photo2}</div>
            	</div>
            	<div class="item">
               		<img src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo3}" style="max-width: 100%;" width="500px">
               		<div class="carousel-caption">${requestScope.findBvo.photoVO.photo3}</div>
            	</div>
         	</div>
        
         	<!-- Controls -->
         	<a class="left carousel-control" href=".carousel" role="button" data-slide="prev"> 
	         	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	            <span class="sr-only">Geri</span>
         	</a>
         	<a class="right carousel-control" href=".carousel" role="button" data-slide="next"> 
	         	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	            <span class="sr-only">İleri</span>
         	</a> --%>
      	<!-- </div> -->
   	<!-- </section> -->  
 	
   	<div class="row control-group">
		<div class="form-group col-xs-12 floating-label-form-group controls">
		    <label for="name">TITLE</label>
		    <h3 align="center">TITLE</h3>
		    <p class="help-block text-danger">${requestScope.findBvo.title}</p>
		</div>
		
		
  	</div>
   
   <br><br><br>
   
   <!-- 달력 -->
   	<div class="row">
   		
      	<div class="col-sm-6" style="height: 150%">
      	<h3 class="title text-center" style="margin-top: 0px;"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;Possible Day</h3>
         	<br><br>
         	<div id="calendar"></div>
      	</div>

      	 
      	<!-- 예약 부분 -->
      	<div class="col-sm-6">
         	<h3 class="title text-center" style="margin-top: 0px;"><span class="glyphicon glyphicon-time" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;Reservation</h3>
         	<br><br>
         	<div align="center">

            	<!-- 예약 폼 -->
            	<div class="row">
               		<!-- <div class="col-lg-8 col-lg-offset-2"> -->
               		<div class="col-lg-10 col-lg-offset-1">
                  		<form name="rentForm" id="rentForm" action="${pageContext.request.contextPath}/bicycle/rentRegister.do" method="post">
	                    	
	                    	<table id = "addTable">                   
                   				<div class="row control-group">
		                           	<!-- input 달력 -->
		                           	<!-- start date -->
		                           	<div id="div_id_date" class="form-group required" >
		                              	<h4><label for="id_date" class="control-label col-md-6  requiredField" align="left">Start Date</label></h4>
		                              	<div class="controls col-md-5">
		                              		<input type="date" name="startDay" class="startInput" id="startDay0">
		                             	</div>
                         			</div>    
                     			</div>
                          
                           		<!-- class="input-md textinput textInput form-control" -->
                     			<div class="row control-group">   
                          			<!-- end date -->
                          			<div id="div_id_date" class="form-group required">
                             			<h4><label for="id_date" class="control-label col-md-6  requiredField" align="left">End Date</label></h4>
                             			<div class="controls col-md-5">
                                			<input type="date" name="endDay" class="endInput" id="endDay0"> 
                                			<div id="calResult0"></div>
                             			</div>
			                   		</div>
			        			</div>
                       		</table>

                   			<div class = "row control-group">
                    			<div class="form-group col-xs-12 floating-label-form-group controls">
                					<div class="col-sm-4">
                           				<abbr title="대여가능체크">
                           					<img id = "checkImg" class="check-img" src=" https://www.2buy2.com/images/icons/other/green-outline/tick.png" alt="" style = "width:">
                           				</abbr>
                        				<div id = "checkResult"></div>
                     				</div>
                     
                     				<div class="col-sm-4"> 
                           				<abbr title="대여 기간 추가">
                           					<img id = "plusImg" class="plus-img" src="https://www.cambiaelmundo.net/images/covers/subSubjects/9166a4047e8a143a61a644603cedf4bf.jpg" alt="" style = "width:">
                           				</abbr>
                     				</div>
                    
                     				<div class="col-sm-4">  
                          				<abbr title="대여료 계산하기">
                          					<img id = "calImg" class="cal-img" src="http://icon-icons.com/icons2/300/PNG/256/calculation-icon_31858.png" alt="" style = "width:">
                          				</abbr>
                        				<!-- <div id = "calResult"></div> -->
                     				</div>
                    			</div>
                  			</div>
	                      	                       		
	                       	<hr>                		
                     		
                     		<div class="row control-group">
                        		<div class="form-group col-xs-12 floating-label-form-group controls">
									<h4 align="left">ID</h4>
                           			<h5><a onclick="document.getElementById('id02').style.display='block';" style="float:center;" data-toggle="tooltip" title="Detail Information">${requestScope.findBvo.memberVO.id}</a>
                           			</h5>
                        		</div>
                     		</div>

							<div class="row control-group">
								<div class="form-group col-xs-12 floating-label-form-group controls">
									<label for="phone">Address</label>
									<h4 align="left">Address</h4>
									<c:set var="addr" value="${requestScope.findBvo.address}" />
									<c:set var="addd" value="${fn:split(addr, '%') }" />
									<c:forEach items="${addd }" var="addd">
										<p style="font-size: 15px">${addd }</p>
									</c:forEach>
								</div>
							</div>

							<!-- Modal detail information -->
                     		<div id="id02" class="modal2" align="center">
								<div class="modal2-content animate mainbox">
									<div class=" panel panel-default">
										<%--내용물영역 --%>
										<div class="panel-heading">
												<h4>
													<strong>Detail Information
													<span onclick="document.getElementById('id02').style.display='none'" class="close2" title="Close Modal" >×</span>
													</strong>
												</h4>
												
										</div>
										
										<div class="panel-body">


											<table class="table table-hover">
												
													<tr>
														<th scope="row"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></th>
														<td>${requestScope.findBvo.memberVO.id}</td>
													</tr>
													<tr>
														<th scope="row"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></th>
														<td>${requestScope.findBvo.memberVO.email}</td>
													</tr>
													<tr>
														<th scope="row"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span></th>
														<td>${requestScope.findBvo.memberVO.phone}</td>
													</tr>
													<tr>
														<th scope="row"><span class="glyphicon glyphicon-usd" aria-hidden="true"></span></th>
														<td>${requestScope.findBvo.rentPrice}</td>									
													</tr>
													<tr>

														<th scope="row"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></th>
														<td>${requestScope.findBvo.detail}</td>
													</tr>
												
											</table>
												
										</div>
									</div>
								</div>
							</div>
							
							<c:forEach items="${requestScope.findBvo.possibleList}" var="possibleDay" varStatus="order">
								<div id="possible${order.count}">
									<input type="hidden" class="possibleStartDay${order.count}" value="${possibleDay.startDay}" id="pStartDay${order.count}">
                           			<input type="hidden" class="possibleEndDay${order.count}" value="${possibleDay.endDay}" id="pEndDay${order.count}">
                        		</div>
                     		</c:forEach>

	                     	
                     		<c:if test="${sessionScope.mvo.id != requestScope.findBvo.memberVO.id}">
	                     		<div class="row">
	                        		<div class="form-group col-xs-12" align="center">
	                        			<input type = "hidden" name = "bicycleNo" value = "${requestScope.findBvo.bicycleNo}">
			                        	<button type="submit" class="btn btn-success btn-md" id="rentBtn"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true" style="width: 30px;"></span></button>
	                        		 
	                        		</div>
	                     		</div>
							</c:if>
							
							<hr>
							
                  		</form>
               		</div>
            	</div>
         	</div>
      	</div>
   	</div>
<!-- </div> -->
<br><br><br><br>

<!-- 리뷰 -->
      <div id="banner-wrapper">
      <div align="left" style="padding-left: 15%; font-size: 15px">
      	<div class="col-sm-12 style="height: 150%">
      	<h3 class="title text-left" style="margin-top: 0px;">
      	<span class="glyphicon glyphicon-comment"></span>
      	&nbsp;&nbsp;&nbsp;Review&nbsp;
      	<span class="label label-danger">${fn:length(requestScope.reviewList)}
      	</span>
      	</h3>
         	<br><br>
     	</div>
   	
   		<hr>
   	
         <c:if test="${fn:length(requestScope.reviewList)!=0}">
         <img style='width:10px' src='${pageContext.request.contextPath}/resources/img/staron.png'>
         <fmt:formatNumber value="${requestScope.findBvo.avgRate}" pattern=".00"/>
         </c:if>
      </div>
      <!-- 리뷰작성칸 -->
       <div class="box container" id="writeReviewForm">
      <c:if test="${requestScope.reviewCheck}">
        
            <div class="row" align="left">
               <div class="col-sm-3">
                  <p class="star_rating" style="padding-top:20px; padding-left: 30%">
                      <a href="#" class="on"></a>
                      <a href="#" class="on"></a>
                      <a href="#" class="on"></a>
                      <a href="#" class="on"></a>
                      <a href="#" class="on"></a>
                  </p>
               </div>
               <div class="9u">
                  <form id="reviewForm">
                     <div class="w3-row w3-section">
                        <div id="reviewSubmit" class="w3-col" style="float:right; padding-right: 16%"> 
                           <i class="w3-xxlarge fa fa-pencil w3-text-blue"  style="font-size: 35px"></i>
                        </div>
                         <div class="w3-rest" >
                           <textarea  id="reviewContent" STYLE="font-size:16px; padding-right: " class="w3-input w3-border" name="content" cols="65" rows="4" ></textarea>
                         </div>
                     </div>
                     <input id="reviewHidden" type="text" style="display: none; width:auto;" />
                  </form>
               </div>
            </div>
            </c:if>
         </div>
         <br>
         
         <br>
         <br>         
         <!-- 리뷰리스트 -->
         <div class="box container">
            <c:forEach items="${requestScope.reviewList}" var="rList">
               <div class="col-sm-12 col-xs-12 p-0">
                  <div class="review-item__img ember-view" style="float: left; width: 30%; padding:10px; font-size:11px; font-weight: 400;">
                      <img style="width: 80px" alt="${rList.rentVO.memberVO.id}" src="${pageContext.request.contextPath}/resources/upload/member/${rList.rentVO.memberVO.picture}">
                     <br>${rList.rentVO.memberVO.id}
                  </div>
                  <div style="float: left; width: 30%; padding-top:4%;font-size: 15px;text-align: left; ">
                     ${rList.content}&nbsp;&nbsp;&nbsp;
               <c:if test="${rList.rentVO.memberVO.id ==sessionScope.mvo.id}">               
            	 <input type="hidden" id="rentNo" value="${rList.rentVO.rentNo}" />
            	 <input type="hidden" id="content" value="${rList.content}" />
            	 <input type="hidden" id="star" value="${rList.star}" />
            	 <font size="1px" color="#999999"  class="updateReview" > 수정&nbsp;|</font>
            	 <font size="1px" color="#999999"  class="deleteReview"> 삭제</font>
            	 
        <%--리뷰 수정 modal --%>
        <div id="id01" class="modal" align="center" >
  			<form method="post" class="modal-content animate mainbox"  >
  				<input type="hidden" id="modal_rentNo" value="${rList.rentVO.rentNo}">
  				<input type="hidden" id="modal_before_star" value="${rList.star}">
  				<div class=" panel panel-default" style="height: 100%;">
   				<%--내용물영역 --%>
   					 <div class="panel-heading">
   					 	<div><h4><strong>리뷰 수정하기</strong></h4></div>
            		</div>
           			<div class="panel-body">
            	   		<!-- star -->
				    	<div id="div_id_title" class="form-group required"> 
				        <label for="id_title" class="control-label col-md-3  requiredField">별점</label> 
				        <div class="controls col-md-8 "> 
				            <p class="star_rating_modal" style="padding-top:20px; padding-left: 30%">
				            	<c:forEach begin="1" end="${rList.star}">
				            		<a href="#" class="on"></a>
				            	</c:forEach>
                     			<c:forEach begin="${rList.star+1}" end="5">
                      				<a href="#" class=""><img style='width:30px' src='${pageContext.request.contextPath}/resources/img/staroff.png'></a>
                      			</c:forEach>
                  			</p>
                  		</div>
				    </div>
				    
				    <!-- 아이디 -->
				    <div id="div_id_memberId" class="form-group required"> 
				        <label for="id_memberId" class="control-label col-md-3  requiredField">아이디</label> 
				        <div class="controls col-md-8 "> 
				            <input class="input-md textinput textInput form-control" id="review_update_id" style="margin-bottom: 30px" type="text" value="${sessionScope.mvo.id }" readonly="readonly">
				        </div>
				    </div>
         	
				    <!-- Detail -->
				    <div id="div_id_detail" class="form-group required">
				         <label for="id_detail" class="control-label col-md-3  requiredField">리뷰내용</label>
				         <div class="controls col-md-8 ">
				        	<input class="input-md textinput textInput form-control" id="review_update_content" value="${rList.content}" required="required"  style="margin-bottom: 20px;height:120px;"></input>
				        </div>
				    </div>
             </div>
           
   <%--버튼영역 --%>
            <div class="form-group" style="margin-bottom: 30px;"> 
				        <div class="aab controls col-md-12"></div>
				        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="btn btn-primary btn btn-info" style="font-size: 15px;">취소</button>
				        <input value="수정"  type="button" class="btn btn-primary btn btn-info" id="updateReviewSubmit" style="font-size: 15px;"/>
			</div> 
       
    </div>
  </form>
</div>
        <%--modal end --%>
            	</c:if>
                  </div>
                  <div  style=" float: right; width: 30%; padding:10px; padding-right: 10%" align="right">                     
                     <c:forEach begin="1" end="${rList.star}">
                        <img style='width:20px' src='${pageContext.request.contextPath}/resources/img/staron.png'>
                     </c:forEach><br><br>
                     <c:set var="TextValue" value="${rList.reviewDate}"/>
                         ${fn:substring(TextValue,0,10)}<br>                        
                  </div>
               </div>
            </c:forEach>            
         </div>
      </div>
     <!--  </div> -->
<br>
