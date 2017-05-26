<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>달력</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  -->
<style type="text/css">
    body {
		padding: 20px 0px 200px;
	}
	h1.title {
		font-family: 'Roboto', sans-serif;
		font-weight: 900;
	}
	.calendar {
		margin: 0px 40px;
	}
	.popover.calendar-event-popover {
		font-family: 'Roboto', sans-serif;
		font-size: 12px;
		color: rgb(120, 120, 120);
		border-radius: 2px;
		max-width: 300px;
	}
	.popover.calendar-event-popover h4 {
		font-size: 14px;
		font-weight: 900;
	}
	.popover.calendar-event-popover .location,
	.popover.calendar-event-popover .datetime {
		font-size: 14px;
		font-weight: 700;
		margin-bottom: 5px;
	}
	.popover.calendar-event-popover .location > span,
	.popover.calendar-event-popover .datetime > span {
		margin-right: 10px;
	}
	.popover.calendar-event-popover .space,
	.popover.calendar-event-popover .attending {
		margin-top: 10px;
		padding-bottom: 5px;
		border-bottom: 1px solid rgb(160, 160, 160);
		font-weight: 700;
	}
	.popover.calendar-event-popover .space > .pull-right,
	.popover.calendar-event-popover .attending > .pull-right {
		font-weight: 400;
	}
	.popover.calendar-event-popover .attending {
		margin-top: 5px;
		font-size: 18px;
		padding: 0px 10px 5px;
	}
	.popover.calendar-event-popover .attending img {
		border-radius: 50%;
		width: 40px;
	}
	.popover.calendar-event-popover .attending span.attending-overflow {
		display: inline-block;
		width: 40px;
		background-color: rgb(200, 200, 200);
		border-radius: 50%;
		padding: 8px 0px 7px;
		text-align: center;
	}
	.popover.calendar-event-popover .attending > .pull-right {
		font-size: 28px;
	}
	.popover.calendar-event-popover a.btn {
		margin-top: 10px;
		width: 100%;
		border-radius: 3px;
	}
	[data-toggle="calendar"] > .row > .calendar-day {
		font-family: 'Roboto', sans-serif;
		width: 14.28571428571429%;
		border: 1px solid rgb(235, 235, 235);
		border-right-width: 0px;
		border-bottom-width: 0px;
		min-height: 120px;
	}
	[data-toggle="calendar"] > .row > .calendar-day.calendar-no-current-month {
		color: rgb(200, 200, 200);
	}
	[data-toggle="calendar"] > .row > .calendar-day:last-child {
		border-right-width: 1px;
	}

	[data-toggle="calendar"] > .row:last-child > .calendar-day {
		border-bottom-width: 1px;
	}

	.calendar-day > time {
		position: absolute;
		display: block;
		bottom: 0px;
		left: 0px;
		font-size: 12px;
		font-weight: 300;
		width: 100%;
		padding: 10px 10px 3px 0px;
		text-align: right;
	}
	.calendar-day > .events {
		cursor: pointer;
	}
	.calendar-day > .events > .event h4 {
		font-size: 12px;
		font-weight: 700;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		margin-bottom: 3px;
	}
	.calendar-day > .events > .event > .desc,
	.calendar-day > .events > .event > .location,
	.calendar-day > .events > .event > .datetime,
	.calendar-day > .events > .event > .attending {
		display: none;
	}
	.calendar-day > .events > .event > .progress {
		height: 10px;
	}
</style>

<script type="text/javascript">
$(function () {
	$('[data-toggle="calendar"] > .row > .calendar-day > .events > .event').popover({
		container: 'body',
		content: 'Hello World',
		html: true,
		placement: 'bottom',
		template: '<div class="popover calendar-event-popover" role="tooltip"><div class="arrow"></div><h4 class="popover-title"></h4><div class="popover-content"></div></div>'
	});

	$('[data-toggle="calendar"] > .row > .calendar-day > .events > .event').on('show.bs.popover', function () {
		var attending = parseInt($(this).find('div.progress>.progress-bar').attr('aria-valuenow')),
			total = parseInt($(this).find('div.progress>.progress-bar').attr('aria-valuemax')),
			remaining = total - attending,
			displayAttending = attending - $(this).find('div.attending').children().length,
			html = [
				'<button type="button" class="close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>',
				'<h4>'+$(this).find('h4').text()+'</h4>',
				'<div class="desc">'+$(this).find('div.desc').html()+'</div>',
				'<div class="location">'+$(this).find('div.location').html()+'</div>',
				'<div class="datetime">'+$(this).find('div.datetime').html()+'</div>',
				'<div class="space">Attending <span class="pull-right">Available spots</span></div>',
				'<div class="attending">',
					$(this).find('div.attending').html(),
					'<span class="attending-overflow">+'+displayAttending+'</span>', 
					'<span class="pull-right">'+remaining+'</span>',
				'</div>',
				'<a href="#signup" class="btn btn-success" role="button">Sign up</a>'
			].join('\n');

		$(this).attr('title', $(this).find('h4').text());
		$(this).attr('data-content', html);
	});

	$('[data-toggle="calendar"] > .row > .calendar-day > .events > .event').on('shown.bs.popover', function () {
		var $popup = $(this);
		$('.popover:last-child').find('.close').on('click', function(event) {
			$popup.popover('hide');
		});
	});
});
</script>
<!-- 이미지 슬라이드 -->
<style type="text/css">

section.awSlider .carousel{
  display:table;
  z-index:2;
  -moz-box-shadow: 0 0 4px #444;
	-webkit-box-shadow: 0 0 4px #444;
	box-shadow: 0 0 15px rgba(1,1,1,.5);
}

section.awSlider{
  margin:30px auto;
  padding:30px;
  position:relative;
  display:table;
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

section.awSlider:hover > img{
  -ms-transform: scale(1.2);
  -webkit-transform: scale(1.2);
  transform: scale(1.2);
  opacity:1;
}

section.awSlider img{
   pointer-events: none;
}

section.awSlider > img{
  position:absolute;
  top:30px;
  z-index:1;
  transition:all .3s;
  filter: blur(1.8vw);
  -webkit-filter: blur(2vw);
  -moz-filter: blur(2vw); 
  -o-filter: blur(2vw); 
  -ms-filter: blur(2vw);
  -ms-transform: scale(1.1);
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
  opacity:.5;
}
</style>
<!-- 이미지 슬라이드 스크립트 -->
<script type="text/javascript">
$('section.awSlider .carousel').carousel({
	pause: "hover",
  interval: 2000
});

var startImage = $('section.awSlider .item.active > img').attr('src');
$('section.awSlider').append('<img src="' + startImage + '">');

$('section.awSlider .carousel').on('slid.bs.carousel', function () {
 var bscn = $(this).find('.item.active > img').attr('src');
	$('section.awSlider > img').attr('src',bscn);
});
</script>
<!-- 달력 pickers 스크립트 -->
<script type="text/javascript">
$(function () {
    $('#datetimepicker6').datetimepicker();
    $('#datetimepicker7').datetimepicker({
        useCurrent: false //Important! See issue #1075
    });
    $("#datetimepicker6").on("dp.change", function (e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker7").on("dp.change", function (e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });
});
</script>
</head>
<body>
<div class="container">
<section class="awSlider">
  <div  class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target=".carousel" data-slide-to="0" class="active"></li>
      <li data-target=".carousel" data-slide-to="1"></li>
      <li data-target=".carousel" data-slide-to="2"></li>
      <li data-target=".carousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-941.jpg">
        <div class="carousel-caption">Görsel #1</div>
      </div>
      <div class="item">
        <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-101.jpg">
        <div class="carousel-caption">Görsel #2</div>
      </div>
      <div class="item">
        <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-1051.jpg">
        <div class="carousel-caption">Görsel #3</div>
      </div>
      <div class="item">
        <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
        <div class="carousel-caption">Görsel #4</div>
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
    </a>
  </div>
</section>
	<hr>
<div class="row">
	<div class="col-sm-6">
    <h3 class="title text-center"> July 2014 </h3>
	<div class="calendar" data-toggle="calendar" class="col-sm-6">
		<div class="row">
			<div class="col-xs-12 calendar-day calendar-no-current-month">
				<time datetime="2014-06-29">29</time>
			</div>
			<div class="col-xs-12 calendar-day calendar-no-current-month">
				<time datetime="2014-06-30">30</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-01">01</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-02">02</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-03">03</time>
				<div class="events">
					<div class="event">
						<h4>Mid Day Dance Break - SELF CARE</h4>
						<div class="desc">
							<p>Take a Break and enjoy Live dance and Art from Eries own local Talent</p>
							<p>Support for this program is provided in part from an Erie Arts & Culture Project Grant, made possible by community contributions to the Combined Arts & Cultural Campaign and the Erie Arts Endowment.</p>
						</div>
						<div class="location"> <span class="glyphicon glyphicon-map-marker"></span> State St and Rt 5, Erie, Pa.</div>
						<div class="datetime"> <span class="glyphicon glyphicon-time"></span> 12:00am - 1:00pm</div>
						<div class="attending">
							<img src="http://api.randomuser.me/portraits/women/54.jpg" />
							<img src="http://api.randomuser.me/portraits/men/27.jpg" />
							<img src="http://api.randomuser.me/portraits/men/61.jpg" />
						</div>
						<div class="progress">
							<div class="progress-bar" role="progressbar" aria-valuenow="6" aria-valuemin="0" aria-valuemax="134" style="width: 4.477%;">
								<span class="sr-only">4.477% Filled</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-04">04</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-05">05</time>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-06">06</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-07">07</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-08">08</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-09">09</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-10">10</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-11">11</time>
				<div class="events">
					<div class="event">
						<h4>Local artist showing, meet and greet and feature film</h4>
						<div class="desc">
							<p>We will be showing local artists films on our new 16 foot movie screen with feature film last "Carnival Of Souls", come see the new BT, hang out and socialize while enjoying some local talent. FREE event, suggested $2 or $3 donation. Concessions, popcorn, soda etc available so come hungry!!</p>
							<p>*This event is all ages welcomed and also handicapped accessible (side entrance ramp)</p>
							<p>Featuring :</p>
							<ul>
								<li><a href="https://www.youtube.com/user/walrys11/videos">Jack Rys</a></li>
								<li><a href="http://society6.com/wombglow">Alex Wilson</a></li>
								<li><a href="http://www.erieartcompany.com/">Brad Ford</a></li>
								<li><a href="http://www.youtube.com/watch?v=dkTz0EvfEiY">Carnival of Souls</a> (Trailer)</li>
							</ul>
						</div>
						<div class="location"> <span class="glyphicon glyphicon-map-marker"></span> 145 West 11th Street, Erie, Pa.</div>
						<div class="datetime"> <span class="glyphicon glyphicon-time"></span> 7:00pm - ?</div>
						<div class="attending">
							<img src="http://api.randomuser.me/portraits/women/31.jpg" />
							<img src="http://api.randomuser.me/portraits/women/47.jpg" />
							<img src="http://api.randomuser.me/portraits/women/93.jpg" />
						</div>
						<div class="progress">
							<div class="progress-bar" role="progressbar" aria-valuenow="43" aria-valuemin="0" aria-valuemax="368" style="width: 11.68%;">
								<span class="sr-only">11.68% Filled</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-12">12</time>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-13">13</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-14">14</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-15">15</time>
				<div class="events">
					<div class="event">
						<h4>Erie Art Museum 91st Annual Spring Show</h4>
						<div class="desc">
							<p>This juried, regional multi-media exhibition, open to all artists living within a 250-mile radius of Erie represents all media and showcases the most current and finest artwork created in the area.</p>
						</div>
						<div class="location"> <span class="glyphicon glyphicon-map-marker"></span> Presque Isle State Park </div>
						<div class="datetime"> <span class="glyphicon glyphicon-time"></span> ALL DAY</div>
						<div class="attending">
							<img src="http://api.randomuser.me/portraits/men/10.jpg" />
							<img src="http://api.randomuser.me/portraits/men/23.jpg" />
							<img src="http://api.randomuser.me/portraits/men/66.jpg" />
						</div>
						<div class="progress">
							<div class="progress-bar" role="progressbar" aria-valuenow="69" aria-valuemin="0" aria-valuemax="320" style="width: 21.56%;">
								<span class="sr-only">21.56% Filled</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-16">16</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-17">17</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-18">18</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-19">19</time>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-20">20</time>
				<div class="events">
					<div class="event">
						<h4>Mouse0270's 24th Birthday</h4>
						<div class="desc">
							<p style="text-align:center;">Friendships are one of the few things that improve with age<br/>
							The family and friends of <br/>
							Mouse0270 <br/>
							invite you to celebrate his <br/>
							24th Birthday and a lifetime of good friendship</p>
						</div>
						<div class="location"> <span class="glyphicon glyphicon-map-marker"></span> Erie, Pa </div>
						<div class="datetime"> <span class="glyphicon glyphicon-time"></span> 10:00pm - 2:00am </div>
						<div class="attending">
							<img src="https://fbcdn-sphotos-f-a.akamaihd.net/hphotos-ak-xfa1/t1.0-9/417157_4897339837183_626079670_n.jpg" />
						</div>
						<div class="progress">
							<div class="progress-bar" role="progressbar" aria-valuenow="1" aria-valuemin="0" aria-valuemax="336" style="width: 0.29%;">
								<span class="sr-only">0.29% Filled</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-21">21</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-22">22</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-23">23</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-24">24</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-25">25</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-26">26</time>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-27">27</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-28">28</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-29">29</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-30">30</time>
			</div>
			<div class="col-xs-12 calendar-day">
				<time datetime="2014-07-31">31</time>
			</div>
			<div class="col-xs-12 calendar-day calendar-no-current-month">
				<time datetime="2014-08-01">01</time>
			</div>
			<div class="col-xs-12 calendar-day calendar-no-current-month">
				<time datetime="2014-08-02">02</time>
			</div>
		</div>
	</div>
</div>
<!-- 예약 부분 -->
<div class="col-sm-6">
	<h3 class="title text-center"> Reservation </h3>
	<br><br><br>
	<div align="center">
	<!-- 달력 pickers -->
	
    <div class='col-md-6'>
        <div class="form-group">
            <div class='input-group date' id='datetimepicker6'>
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
    <div class='col-md-6'>
        <div class="form-group">
            <div class='input-group date' id='datetimepicker7'>
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
	</div>
	
	<!-- 예약 폼 -->
	<div class="row">
	<!-- <div class="col-lg-8 col-lg-offset-2"> -->
                <div class="col-lg-10 col-lg-offset-1">
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="name">Name</label>
                               	<h4 align="left">Name</h4>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="name">Price</label>
                                <h4 align="left">Price</h4>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="email">Email Address</label>
                                <h4 align="left">Email Address</h4>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="phone">Phone Number</label>
                                <h4 align="left">Phone Number</h4>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="message">Detail</label>
                                <h4 align="left">Detail</h4>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12" align="center">
                                <button type="submit" class="btn btn-success btn-lg">빌리기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
</div>
</div>
</div>
<br><br><br><br>
</body>
</html>