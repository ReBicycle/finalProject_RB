<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>   

 <style>
 #designA :hover { 
 background-color: #153a6d;
 }
 .button{
 background-color: #ffffff;
 }
 </style>
 <!-- dropdown -->
 <style>
li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #ffffff;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
	font: black;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
background-color: #ffffff
}

.dropdown:hover .dropdown-content {
    display: block;
}
.badge-error {
  background-color: #b94a48;
}
.badge-warning {
  background-color: #f89406;
}
.badge-success {
  background-color: #468847;
}
.badge-info {
  background-color: #3a87ad;
}
</style>

<!-- notification --> 
<script type="text/javascript">
  
function notifyMe() {
  if (Notification.permission === "granted") {
    var notification = new Notification("222!");
  }

}
/* Notification.requestPermission().then(function(result) {
  console.log(result);
}); */
function spawnNotification(theBody,theIcon,theTitle) {
	theBody="a";
	theTitle="s";
  var options = {
      body: theBody,
      icon: theIcon
  }
  var n = new Notification(theTitle,options);
}

</script>
<nav class="navbar navbar-inverse">
	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-fixed-top navbar-custom">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<%-- <a class="navbar-brand"
					href="${pageContext.request.contextPath}/home.do">Rebicycle</a> --%>
					<a class="navbar-brand"
					href="${pageContext.request.contextPath}/home.do" style="padding:10px; padding-top:5px; "><img src="${pageContext.request.contextPath}/resources/img/rebicycle_logo33.png" width="70px" style="padding-bottom: ;"></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					
					<c:choose>
						<c:when test="${sessionScope.mvo==null}">
							<li class="page-scroll"><a
								href="${pageContext.request.contextPath}/member/login.do">login</a>
							</li>
							<li style="color: #E8402E" class="page-scroll"><a
								href="${pageContext.request.contextPath}/member/register_member_form.do"><font style="color:#E8402E ">join</font></a>
							</li>
						</c:when>

						<c:otherwise>
							<li class="dropdown"><a id="designA" class="dropdown-toggle"
								data-toggle="dropdown" href="#">${sessionScope.mvo.name} 님
								<span class="caret"></span>
							</a>
								<ul class="dropdown-menu" style="background-color: white;;">
									<li><a
										href="${pageContext.request.contextPath}/member/logout.do">logout</a></li>
									<li><a
										href="${pageContext.request.contextPath}/member/memberModifyForm.do">edit profile</a></li>
									<li><a
										href="${pageContext.request.contextPath}/mypage/mypage_main.do">mypage</a></li>
								</ul></li>
							<li class="page-scroll" ><a
								href="${pageContext.request.contextPath}/bicycle/bicycle_register_form.do"><font style="color:#E8402E ">자전거등록하기</font></a>
							</li>
							
						</c:otherwise>
					</c:choose>


					<li class="page-scroll"><a
						href="${pageContext.request.contextPath}/board_list.do?pageNo=1">board</a>
					</li>
					<li class="page-scroll"><a
						href="${pageContext.request.contextPath}/donation_list.do">donation</a>
					</li>

					<c:if test="${sessionScope.mvo!=null}">
						<li class="dropdown">

							<a href="javascript:void(0)" class="dropbtn">
								<i class="fa fa-bell-o fa-lg" aria-hidden="true"></i>
								<c:if test="${totalRequest.total!=0}">
									<span class="badge badge-error">${totalRequest.total}</span>
								</c:if>	
							</a>
							<div class="dropdown-content">
								<a href="${pageContext.request.contextPath}/mypage/mypage_main.do"><font color="black">Request</font>
								<span class="badge badge-success">${totalRequest.findGetRequest}</span>
								</a> 
								<a href="${pageContext.request.contextPath}/mypage/mypage_main.do"><font color="black">Accept</font>
								<span class="badge badge-info">${totalRequest.findAcceptRequest}</span>
								</a> 
								<a href="${pageContext.request.contextPath}/mypage/mypage_main.do"><font color="black">Refuse</font>
								<span class="badge badge-warning">${totalRequest.findRefuseRequest}</span>
								</a>
							</div>
							</li>
					</c:if>
					


				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
</nav>