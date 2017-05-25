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
</style>    
<br><br><br>

    <div class="container" style="margin-top:40px">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong> Sign in to continue</strong>
					</div>
					<div class="panel-body">
						<form role="form" action="${pageContext.request.contextPath}/login.do" method="POST">
								<div class="row">
									<div class="center-block">
										<img class="profile-img"
											src="https://cdn.pixabay.com/photo/2016/03/31/15/33/contact-1293388_960_720.png?sz=120" alt="">
									</div>
								</div>
								<div class="row">
	
									<div class="col-sm-12 col-md-10  col-md-offset-1 ">

									<form method = "post" action = "${pageContext.request.contextPath}/login.do">
											<div class="form-group">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="glyphicon glyphicon-user"></i>
													</span>
														<input class="form-control" placeholder="Username" name="id" type="text" autofocus>
	
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
									</form>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
					<div class="panel-footer ">
						Don't have an account! <a href="#" onClick=""> Sign Up Here </a>
					</div>
					
                </div>
			</div>
		</div>
	</div>