<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
  <script>

  $(document).ready(function() {
    var opts = {
      theme: true,
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      defaultDate: '2016-01-12',
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [{
        title: 'Long Event',
        start: '2016-01-01',
        end: '2016-01-04'
      }, {
        title: 'All Day Event',
        start: '2016-01-07'
      }, {
        id: 999,
        title: 'Repeating Event',
        start: '2016-01-09T16:00:00'
      }, {
        id: 999,
        title: 'Repeating Event',
        start: '2016-01-16T16:00:00'
      }, {
        title: 'Conference',
        start: '2016-01-11',
        end: '2016-01-13'
      }, {
        title: 'Meeting',
        start: '2016-01-12T10:30:00',
        end: '2016-01-12T12:30:00'
      }, {
        title: 'Lunch',
        start: '2016-01-12T12:00:00'
      }, {
        title: 'Meeting',
        start: '2016-01-12T14:30:00'
      }, {
        title: 'Happy Hour',
        start: '2016-01-12T17:30:00'
      }, {
        title: 'Dinner',
        start: '2016-01-12T20:00:00'
      }, {
        title: 'Birthday Party',
        start: '2016-01-13T07:00:00'
      }, {
        title: 'Click for Google',
        url: 'https://google.com/',
        start: '2016-01-28',
        end: '2016-01-29'
      }]
    };
    
    var first_event = _.min(opts.events, function(event){
      var start = event.start;
      return moment(start).unix();
    });  
    var last_event = _.max(opts.events, function(event){
      // account for all-day events
      var end = event.end ? event.end : event.start;
      return moment(end).unix();
    });
    var min_date = moment(first_event.start);
    var max_date = moment(last_event.end || last_event.start); 
    
    opts.dayRender = function(min_date, max_date, date, cell){
      var before_min = date.diff(min_date, "days") < 0;
      var after_max = date.diff(max_date, "days") >= 0;
      if (before_min || after_max){
        cell.addClass("out-of-range");
        if(before_min){
          cell.addClass("out-of-range-before");
        }
        else if(after_max){
          cell.addClass("out-of-range-after");
        }
      }
    }.bind(this, min_date, max_date);
    
    $('#calendar').fullCalendar(opts);

  });
  </script>
<!-- calendar -->

	  <div id='calendar'>123</div>





