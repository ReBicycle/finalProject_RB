<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 달력 스크립트 -->
<script type="text/javascript">
   $(function() {
      $('[data-toggle="calendar"] > .row > .calendar-day > .events > .event')
            .popover(
                  {
                     container : 'body',
                     content : 'Hello World',
                     html : true,
                     placement : 'bottom',
                     template : '<div class="popover calendar-event-popover" role="tooltip"><div class="arrow"></div><h4 class="popover-title"></h4><div class="popover-content"></div></div>'
                  });

      $('[data-toggle="calendar"] > .row > .calendar-day > .events > .event')
            .on(
                  'show.bs.popover',
                  function() {
                     var attending = parseInt($(this).find(
                           'div.progress>.progress-bar').attr(
                           'aria-valuenow')), total = parseInt($(this)
                           .find('div.progress>.progress-bar').attr(
                                 'aria-valuemax')), remaining = total
                           - attending, displayAttending = attending
                           - $(this).find('div.attending').children().length, html = [
                           '<button type="button" class="close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>',
                           '<h4>' + $(this).find('h4').text()
                                 + '</h4>',
                           '<div class="desc">'
                                 + $(this).find('div.desc').html()
                                 + '</div>',
                           '<div class="location">'
                                 + $(this).find('div.location')
                                       .html() + '</div>',
                           '<div class="datetime">'
                                 + $(this).find('div.datetime')
                                       .html() + '</div>',
                           '<div class="space">Attending <span class="pull-right">Available spots</span></div>',
                           '<div class="attending">',
                           $(this).find('div.attending').html(),
                           '<span class="attending-overflow">+'
                                 + displayAttending + '</span>',
                           '<span class="pull-right">' + remaining
                                 + '</span>', '</div>',
                           '<a href="#signup" class="btn btn-success" role="button">Sign up</a>' ]
                           .join('\n');

                     $(this).attr('title', $(this).find('h4').text());
                     $(this).attr('data-content', html);
                  });

      $('[data-toggle="calendar"] > .row > .calendar-day > .events > .event')
            .on(
                  'shown.bs.popover',
                  function() {
                     var $popup = $(this);
                     $('.popover:last-child').find('.close').on('click',
                           function(event) {
                              $popup.popover('hide');
                           });
                  });
      
      $(".plus-img").click(function(){
           var size = $("div[id^='possible']").size();                    
           for(var i = 1; i<=size;i++){}
            //alert($("div[id^='possible']").find(".possibleStartDay"+i).val());
       });
      
      $("#rentForm").submit(function(){      
         var startDay = $("#startDay").val();
         var endDay = $("#endDay").val();
         //alert($("div[id^='possible']").text());
         
      });
   });
</script>
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
</style>
<!-- 이미지 슬라이드 스크립트 -->
<script type="text/javascript">
   $('section.awSlider .carousel').carousel({
      pause : "hover",
      interval : 2000
   });

   var startImage = $('section.awSlider .item.active > img').attr('src');
   $('section.awSlider').append('<img src="' + startImage + '">');

   $('section.awSlider .carousel').on('slid.bs.carousel', function() {
      var bscn = $(this).find('.item.active > img').attr('src');
      $('section.awSlider > img').attr('src', bscn);
   });
</script>

<!-- fullcalendar 스크립트-->
<!-- http://blog.naver.com/seon5524/220733425041 달력 디자인-->
<!-- http://blog.naver.com/yoocm1229/220442972831 해보기 -->
<script>
   $(document).ready(function() {   
      
      $('#calendar').fullCalendar({
         header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
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
            
           for(var i=0; i<=startLength; i++){
                 //day N:N - 각 startDay와 endDay를 map에 넣어준다.
                 var dayMap=newMap();
                 dayMap.put("startDay",$("#startDay"+i).val());
                 dayMap.put("endDay",$("#endDay"+i).val());
                 startendDay[i]=dayMap;
                 checkFlag[i] = true;
                 
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
		                     //가능한 날짜일 경우 flag에 +1 한다.
		                     
		                     if(((data[j].startDay<=startendDay[i-1].get("startDay")) && (startendDay[i-1].get("endDay")<=data[j].endDay))	){
		                    	 flag=1;
		                         content = ("<font color='blue'>가능</font><br>");
		                         
		                         //?번 입력날짜가 possible_day 테이블의 데이터 범위안에 들어오면 "가능"
		                         //exit_for 을 사용하지 않으면 
		                         //다음 possible_day 와 비교결과 아래의 "else" 영역으로 넘어가 
		                         //결국 불가능이 된다.
		                         break exit_for;
		                        
		                     }else{ 
		                    	 result = (i-1);
		                    	 content = ("<font color='red'>"+result+"번 날짜 불가능</font><br>");
		                    	 //$("#startDay"+[i-1]).focus();
		                    	 //$("#startDay"+[i-1]).val("");
		                    	 //$("#endDay"+[i-1]).val("");
		                    	 
		                    	 checkFlag[i-1] = false;
		                    	 //alert("test" + checkFlag[i-1]);
		                     }
		                  }
		                  $("#checkResult").html(content);      
			      	 } //success    		     
			     });//ajax		        
	     	}//for-startendDay.length           
        });
        
        
        $("#plusImg").click(function(){
        	checkFlag[clickCount+1] = false;
        	//alert(clickCount);
        	if(checkFlag[clickCount]==false){
	 			alert("가능일 확인 절차가 필요합니다!");
	 			return false;
	 		}
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
                        var rentPrice = parseInt($("#rentPrice").text());
                        var calResult=result*rentPrice;
                        $("#calResult"+dayFlag).html("총대여료 : " + calResult);
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
</style> 
<!-- main css -->
<style>
   body {
      margin: 10px 10px;
      padding: 0;
      font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
      font-size: 10px;
   }
   #calendar {
      max-width: 900px;
      margin: 0 auto;
   }
   .plus-img,.check-img,.cal-img {
   width: 30px;
   height: 30px;
   margin: 0 auto 10px;
   display: block;
   -moz-border-radius: 50%;
   -webkit-border-radius: 50%;
   border-radius: 50%;
   }
</style>

<br>
<br>
<br>
<div class="container">
   <section class="awSlider">
      <div class="carousel slide" data-ride="carousel">
         <!-- Indicators -->
         <ol class="carousel-indicators">
            <li data-target=".carousel" data-slide-to="0" class="active"></li>
            <li data-target=".carousel" data-slide-to="1"></li>
            <li data-target=".carousel" data-slide-to="2"></li>
         </ol>

         <!-- Wrapper for slides -->
         <div class="carousel-inner" role="listbox">
            <div class="item active">
               <img
                  src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo1}"
                  style="max-width: 100%;">
               <div class="carousel-caption">${requestScope.findBvo.photoVO.photo1}</div>
            </div>
            <div class="item">
               <img
                  src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo2}"
                  style="max-width: 100%;">
               <div class="carousel-caption">${requestScope.findBvo.photoVO.photo2}</div>
            </div>
            <div class="item">
               <img
                  src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo3}"
                  style="max-width: 100%;">
               <div class="carousel-caption">${requestScope.findBvo.photoVO.photo3}</div>
            </div>
         </div>
        
         
         <!-- Controls -->
         <a class="left carousel-control" href=".carousel" role="button"
            data-slide="prev"> <span
            class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Geri</span>
         </a> <a class="right carousel-control" href=".carousel" role="button"
            data-slide="next"> <span
            class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">İleri</span>
         </a>
      </div>
   </section>
   
   <div class="row control-group">
             <div class="form-group col-xs-12 floating-label-form-group controls">
                 <label for="name">TITLE</label>
                 <h3 align="center">- TITLE -</h3>
                 <p class="help-block text-danger">${requestScope.findBvo.title}</p>
             </div>
  </div>
   
   <!-- 달력 -->
   <div class="row">
      <div class="col-sm-6" style="height: 150%">
         <div id="calendar"></div>
      </div>
      <div class="col-sm-6"></div>
      <!-- 예약 부분 -->
      <div class="col-sm-6">
         <h3 class="title text-center" style="margin-top: 0px;">Reservation</h3>
         <div align="center">

            <!-- 예약 폼 -->
            <div class="row">
               <!-- <div class="col-lg-8 col-lg-offset-2"> -->
               <div class="col-lg-10 col-lg-offset-1">
                  <form name="rentForm" id="rentForm"
                     action="${pageContext.request.contextPath}/bicycle/rentRegister.do" method="post">
                     
                  <table id = "addTable">                   
                    
                        <div class="row control-group">
                           <!-- input 달력 -->
                           <!-- start date -->
                           <div id="div_id_date" class="form-group required" >
                              <label for="id_date"
                                 class="control-label col-md-6  requiredField" align="left"><h4>Start Date</h4></label>
                              <div class="controls col-md-5">
                                 <input type="date" name="startDay" 
                                    class="startInput"
                                    id="startDay0">
                             </div>
                             
                          </div>    
                      </div>
                           
                            <!-- class="input-md textinput textInput form-control" -->
                      <div class="row control-group">   
                           <!-- end date -->
                           <div id="div_id_date" class="form-group required">
                              <label for="id_date"
                                 class="control-label col-md-6  requiredField" align="left"><h4>End Date</h4></label>
                              <div class="controls col-md-5">
                                 <input type="date" name="endDay" 
                                    class="endInput"
                                    id="endDay0"> <div id="calResult0"></div>
                              </div>
                           </div>
                      </div>
                        
                        </table>
                     
               
                      
                      
                
                
                   <div class = "row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                <div class="col-sm-4">
                           <abbr title="대여가능체크"><img id = "checkImg" class="check-img"
                     src=" https://www.2buy2.com/images/icons/other/green-outline/tick.png" alt="" style = "width:"></abbr>
                        <div id = "checkResult"></div>
                     </div>
                     
                     <div class="col-sm-4"> 
                           <abbr title="대여 기간 추가"><img id = "plusImg" class="plus-img"
                     src="https://www.cambiaelmundo.net/images/covers/subSubjects/9166a4047e8a143a61a644603cedf4bf.jpg" alt="" style = "width:"></abbr>
                     </div>
                    
                     <div class="col-sm-4">  
                          <abbr title="대여료 계산하기"><img id = "calImg" class="cal-img"
                     src="http://icon-icons.com/icons2/300/PNG/256/calculation-icon_31858.png" alt="" style = "width:"></abbr>
                        <!-- <div id = "calResult"></div> -->
                     </div>
                    </div>
                  </div>
                       
               
                 


                     <div class="row control-group">
                        <div
                           class="form-group col-xs-12 floating-label-form-group controls">
                           <label for="name">ID</label>
                           <h4 align="left">ID</h4>
                           <p class="help-block text-danger">${requestScope.findBvo.memberVO.id}</p>
                        </div>
                     </div>
                     
                     
                     <div class="row control-group">
                        <div
                           class="form-group col-xs-12 floating-label-form-group controls">
                           <label for="name">Price</label>
                           <h4 align="left">Price</h4>
                           <p class="help-block text-danger" id = "rentPrice">${requestScope.findBvo.rentPrice}</p>
                        </div>
                     </div>
                     
                     
                     <div class="row control-group">
                        <div
                           class="form-group col-xs-12 floating-label-form-group controls">
                           <label for="email">Email Address</label>
                           <h4 align="left">Email Address</h4>
                           <p class="help-block text-danger">${requestScope.findBvo.memberVO.email}</p>
                        </div>
                     </div>
                     
                     
                     <div class="row control-group">
                        <div
                           class="form-group col-xs-12 floating-label-form-group controls">
                           <label for="phone">Phone Number</label>
                           <h4 align="left">Phone Number</h4>
                           <p class="help-block text-danger">${requestScope.findBvo.memberVO.phone}</p>
                        </div>
                     </div>
                     
                     
                     <div class="row control-group">
                        <div
                           class="form-group col-xs-12 floating-label-form-group controls">
                           <label for="phone">Share Address</label>
                           <h4 align="left">Share Address</h4>
                           <p class="help-block text-danger">${requestScope.findBvo.address}</p>
                        </div>
                     </div>
                     
                     
                     <div class="row control-group">
                        <div
                           class="form-group col-xs-12 floating-label-form-group controls">
                           <label for="message">Detail</label>
                           <h4 align="left">Detail</h4>
                           <p class="help-block text-danger">${requestScope.findBvo.detail}</p>
                        </div>
                     </div>
                     
                     
                     <c:forEach items="${requestScope.findBvo.possibleList}"
                        var="possibleDay" varStatus="order">

                        <div id="possible${order.count}">

                           <input type="hidden" class="possibleStartDay${order.count}"
                              value="${possibleDay.startDay}" id="pStartDay${order.count}">
                           <input type="hidden" class="possibleEndDay${order.count}"
                              value="${possibleDay.endDay}" id="pEndDay${order.count}">
                        </div>
                     </c:forEach>

                     <br>
                     
                     
                     <br>
                  
                     <div id="success"></div>
                   
                     <c:if test="${sessionScope.mvo.id != requestScope.findBvo.memberVO.id}">
	                     <div class="row">
	                        <div class="form-group col-xs-12" align="center">
	                        <input type = "hidden" name = "bicycleNo" value = "${requestScope.findBvo.bicycleNo}">
	                        
	                           
	                           <button type="submit" class="btn btn-success btn-lg"
	                              id="rentBtn">빌리기</button>
	                        
	                        </div>
	                     </div>
					</c:if>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<br>
<br>
<br>
<br>
<!-- 리뷰 -->
      <div id="banner-wrapper">
      <div align="left" style="padding-left: 15%; font-size: 15px">
         총 ${fn:length(requestScope.reviewList)} 개의 리뷰 &nbsp;&nbsp;
         <img style='width:10px' src='${pageContext.request.contextPath}/resources/img/staron.png'>
         <fmt:formatNumber value="${requestScope.findBvo.avgRate}" pattern=".00"/>
      </div>
      <!-- 리뷰작성칸 -->
      <c:if test="${requestScope.reviewCheck }">
         <div class="box container">
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
         </div>
         <br>
         </c:if>
         <br>
         <br>         
         <!-- 리뷰리스트 -->
         <div class="box container">
            <c:forEach items="${requestScope.reviewList}" var="rList">
               <div class="col-sm-12 col-xs-12 p-0">
                  <div class="review-item__img ember-view" style="float: left; width: 30%; padding:10px; font-size:11px; font-weight: 400;">
                      <img style="width: 80px" alt="${rList.rentVO.memberVO.id}" src="${pageContext.request.contextPath}/resources/upload/member/${rList.rentVO.memberVO.id}.JPG">
                     <br>${rList.rentVO.memberVO.id}
                  </div>
                  <div style="float: left; width: 30%; padding-top:4%;font-size: 15px;text-align: left; ">
                     ${rList.content}
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
      <br>