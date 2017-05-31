<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  			
  	  });
      
      $("#rentForm").submit(function(){
    	     	  
      });
      
      //대여 가능일이랑 사용자가 입력한 값 비교해서 t/f 반환
      function checkDay(){
	    	var size = $("div[id^='possible']").size();
			//alert(size);
			var startDay = $("#startDay").val();
	  	 	var endDay = $("#endDay").val();
			for(var i = 1; i<=size;i++){
				//alert($("div[id^='possible']").find(".possibleStartDay"+i).val());  
				var possibleStartDay = $("div[id^='possible']").find(".possibleStartDay"+i).val();
				if(startDay == possibleStartDay){
		    		  return true;
		    	  }else{
		    		  return false;
		    	}
			}
			
	    	  
	      	
	    	 
    	 
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
<!-- 달력 pickers 스크립트 -->
<!-- <script type="text/javascript">
   $(function() {
      $('#datetimepicker6').datetimepicker();
      $('#datetimepicker7').datetimepicker({
         useCurrent : false
      //Important! See issue #1075
      });
      $("#datetimepicker6").on("dp.change", function(e) {
         $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
      });
      $("#datetimepicker7").on("dp.change", function(e) {
         $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
      });
   });
</script> -->
<!-- fullcalendar -->   
<script>

   $(document).ready(function() {
      
      $('#calendar').fullCalendar({
         header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
         },
         defaultDate: '2017-05-12',
         navLinks: true, // can click day/week names to navigate views
         selectable: true,
         selectHelper: true,
         select: function(start, end) {
            var title = prompt('Event Title:');
            var eventData;
            if (title) {
               eventData = {
                  title: title,
                  start: start,
                  end: end
               };
               $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
            }
            $('#calendar').fullCalendar('unselect');
         },
         editable: true,
         eventLimit: true, // allow "more" link when too many events
         events: [
            {
               title: 'All Day Event',
               start: '2017-05-01'
            },
            {
               title: 'Long Event',
               start: '2017-05-07',
               end: '2017-05-10'
            },
            {
               id: 999,
               title: 'Repeating Event',
               start: '2017-05-09T16:00:00'
            },
            {
               id: 999,
               title: 'Repeating Event',
               start: '2017-05-16T16:00:00'
            },
            {
               title: 'Conference',
               start: '2017-05-11',
               end: '2017-05-13'
            },
            {
               title: 'Meeting',
               start: '2017-05-12T10:30:00',
               end: '2017-05-12T12:30:00'
            },
            {
               title: 'Lunch',
               start: '2017-05-12T12:00:00'
            },
            {
               title: 'Meeting',
               start: '2017-05-12T14:30:00'
            },
            {
               title: 'Happy Hour',
               start: '2017-05-12T17:30:00'
            },
            {
               title: 'Dinner',
               start: '2017-05-12T20:00:00'
            },
            {
               title: 'Birthday Party',
               start: '2017-05-13T07:00:00'
            },
            {
               title: 'Click for Google',
               url: 'http://google.com/',
               start: '2017-05-28'
            }
         ]
      });
      
   });

</script>
<style>
   body {
      margin: 40px 10px;
      padding: 0;
      font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
      font-size: 14px;
   }
   #calendar {
      max-width: 900px;
      margin: 0 auto;
   }
   .plus-img {
	width: 30px;
	height: 30px;
	margin: 0 auto 10px;
	display: block;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}
</style>
   
   <br><br><br>
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
                     src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo1}" style="max-width:100%;">
                  <div class="carousel-caption">${requestScope.findBvo.photoVO.photo1}</div>
               </div>
               <div class="item">
                  <img
                     src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo2}" style="max-width:100%;">
                  <div class="carousel-caption">${requestScope.findBvo.photoVO.photo2}</div>
               </div>
               <div class="item">
                  <img
                     src="${pageContext.request.contextPath}/resources/upload/bicycle/${requestScope.findBvo.photoVO.photo3}" style="max-width:100%;">
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
      <hr>
      <!-- 달력 -->
      <div class="row">
      <div class="col-sm-6" style="height:150%">
      <div id="calendar" ></div>
      </div>
         <div class="col-sm-6">
            
         </div>
         <!-- 예약 부분 -->
         <div class="col-sm-6">
            <h3 class="title text-center" style = "margin-top:0px;">Reservation</h3>
            <div align="center">
            
               <!-- 예약 폼 -->
               <div class="row">
                  <!-- <div class="col-lg-8 col-lg-offset-2"> -->
                  <div class="col-lg-10 col-lg-offset-1">
                     <form name="rentForm" id="rentForm"  action="${pageContext.request.contextPath}/sendRentDay.do">
                     <input type = "hidden" name = "bicycleNo" value = "${requestScope.findBvo.bicycleNo}">
                     <div id = "dayInput">
                        <div class="row control-group">
                           <!-- input 달력 -->
                           <!-- start date -->
                           <div id="div_id_date" class="form-group required">
                              <label for="id_date"
                                 class="control-label col-md-6  requiredField" align="left"><h4>Start Date</h4></label>
                              <div class="controls col-md-5">
                                 <input type="date" name="startDay" id = "startDay"
                                    class="input-md textinput textInput form-control"
                                    id="id_detail">
                             </div>
                             
                             
                           </div>
                           
                           <div align="center">  
                           <abbr title="대여 기간 추가"><img id = "imgView" class="plus-img"
							src="https://www.cambiaelmundo.net/images/covers/subSubjects/9166a4047e8a143a61a644603cedf4bf.jpg" alt="" style = "width:"></abbr>
                        	</div>
                           
                           </div>
                           <div class="row control-group">   
                           <!-- end date -->
                           <div id="div_id_date" class="form-group required">
                              <label for="id_date"
                                 class="control-label col-md-6  requiredField" align="left"><h4 >End Date</h4></label>
                              <div class="controls col-md-5">
                                 <input type="date" name="endDay" id = "endDay"
                                    class="input-md textinput textInput form-control"
                                    id="id_detail">
                              </div>
                           </div>
                        </div>
                        
                      </div>
                      <div id = "plusDay"></div>
                      
                     
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
                              <p class="help-block text-danger">${requestScope.findBvo.rentPrice}</p>
                           </div>
                        </div>
                        <div class="row control-group">
                           <div
                              class="form-group col-xs-12 floating-label-form-group controls">
                              <label for="email">Email Address</label>
                              <h4 align="left">Email Address</h4>
                              <p class="help-block text-danger">${requestScope.findBvo.address}</p>
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
                       <c:forEach items = "${requestScope.findBvo.possibleList}" var = "possibleDay" varStatus="order">
                       
                       	 <div id = "possible${order.count}">
	                       	
	                       	 <input type = "text" class = "possibleStartDay${order.count}" value = "${possibleDay.startDay}">
	                         <input type = "text" class = "possibleEndDay${order.count}" value = "${possibleDay.endDay}">
                        </div>
                       </c:forEach>
                        
                        <br>
                        <div id="success"></div>
                        
                        <div>requestScope.findBvo 결과
                           ${requestScope.findBvo }
                        </div>
                        
                        
                        <div class="row">
                           <div class="form-group col-xs-12" align="center">
                              <button type="submit" class="btn btn-success btn-lg" id="rentBtn">빌리기</button>
                           </div>
                        </div>
                     
                     </form>  
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="calendar"></div>   
      </div>
      <div class="calendar"></div>   
      <br> <br> <br> <br>