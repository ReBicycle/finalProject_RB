<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     


<style>
	.panel-heading {
    padding: 5px 15px;
}

.panel-footer {
	padding: 1px 15px;
	color: #A0A0A0;
}

.profile-img {
	width: 96px;
	height: 96px;
	margin: 0 auto 10px;
	display: block;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}
.btn-block{
	background-color: #555555;
}
</style>    
<br><br><br>

    <div class="container" style="margin-top:40px; min-height: 450px;">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">
					<div class="panel-body">
						<form role="form" action="${pageContext.request.contextPath}/login.do" method="POST">
								<div class="row">
									<div class="center-block">
										<img class=""
											src="${pageContext.request.contextPath}/resources/img/rebicycle_login.png" alt="" style="width: 300px; opacity: 80%;"align="middle" >
											
									</div>
								</div>
									<br>
									<br>
									<br>
								<div class="row">
	
									<div class="col-sm-12 col-md-10  col-md-offset-1 ">
									
											<div class="form-group">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="glyphicon glyphicon-user"></i>
													</span>
														<input class="form-control" placeholder="id" name="id" type="text" autofocus>
	
												</div>
											</div>
											<div class="form-group">
												<div class="input-group">
													<span class="input-group-addon">
						 									<i class="glyphicon glyphicon-lock"></i>
													</span>
													<input class="form-control" placeholder="Password" name="password" type="password" value="">
												</div>
											</div>
											<div class="form-group">
												<input type="submit" class="btn btn-lg btn-primary btn-block" value="Sign in">
											</div> 
									
									</div>
								</div>
						
						</form>
					</div>
			</div>
		</div>
	</div>
	
