<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	$("#memberRegisterForm").submit(function(){				
			
		if($("#email").val().indexOf("@") == -1){
			alert("이메일 형식이 올바르지 않습니다!");
			$("#email").val("");
			$("#email").focus();
			return false;
		}
	});
	
	$("#password").keyup(function(){
		$("#confirm").val("");
		$("#passwordCheckView").html("");
	});
	
	$("#confirm").keyup(function(){
		if($("#confirm").val()!==$("#password").val()){
			//alert("패스워드가 일치하지 않습니다");
			$("#passwordCheckView").html("password가 일치하지 않습니다!");
			return;
		}else{
			$("#passwordCheckView").html("");
		}
			
	});
	
	
	
});//ready
</script>

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
 input[type="file"] { 
/* 파일 필드 숨기기 */ 
	position: absolute; 
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0; 
}
#fileLabel { 
	display: inline-block; 
	padding: .5em .75em;
	 color: #999; 
	 font-size: inherit; 
	 line-height: normal; 
	 vertical-align: middle; 
	 background-color: #fdfdfd; 
	 cursor: pointer; 
	 border: 1px solid #ebebeb; 
	 border-bottom-color: #e2e2e2; 
	 border-radius: .25em; 
 }

</style>

<br>
<br>
<div class="container" style="margin-top: 40px">
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong>JOIN</strong>
				</div>
				<div class="panel-body">
					<form id = "memberRegisterForm" class="form-horizontal" 
					 action="${pageContext.request.contextPath}/memberModify.do" method="POST">
					
					
						<div class="row">
							<div class="center-block">
						
								<abbr title="프로필 이미지를 변경하시려면 클릭해주세요!"><img class="profile-img"
									src="${pageContext.request.contextPath}/resources/upload/member/${modifyVO.picture}"
									alt=""></abbr>
								<input type = "hidden" name = "picture" value = "${modifyVO.picture}">
							
							</div>
						</div>
						
					
						
						<div class="row">
					
							<div class="col-sm-12 col-md-10  col-md-offset-1 ">
						
								<div class="form-group">

										<label for="name" class="cols-sm-2 control-label">Your
										ID</label>
										<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon">
											 <i	class="fa fa-user fa" aria-hidden="true"></i>
											</span> 
											<input type="text" class="form-control" name="id" id="id" value="${modifyVO.id}" readonly="readonly"/>
										
										</div>
									</div>
	
								</div>
								
								
								<div class="form-group">
									<div class = "row"> 
											
										<div class="col-sm-10 col-md-6">
										<label for="password" class="cols-sm-2 control-label">Password</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
														type="password" class="form-control" name="password"
														id="password" value="${modifyVO.password}" required="required"/>
												</div>
											</div>
										</div>
									
									
											
									<div class="col-sm-10 col-md-6">
											
											<label for="confirm" class="cols-sm-2 control-label">Confirm
												Password</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
														type="password" class="form-control" name="confirm"
														id="confirm" placeholder="Confirm your Password" required="required"/>
												</div>
											</div>
											
									</div>
									</div>
									
									
								</div>
								
								<div class="form-group">
									
									<div class="cols-sm-10 col-md-6 col-md-offset-6 ">
										<div class="input-group">
											<span id = "passwordCheckView"></span>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class = "row"> 
											
										<div class="col-sm-10 col-md-6">
											<label for="name" class="cols-sm-2 control-label">Your Name</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-users fa" aria-hidden="true"></i></span> <input
														type="text" class="form-control" name="name"
														id="name" value="${modifyVO.name}" required="required"/>
												</div>
											</div>
										</div>
									
									
											
									<div class="col-sm-10 col-md-6">
											
										<label for="phone" class="cols-sm-2 control-label">Your Phone Number</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-phone fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="phone"
												id="phone" value="${modifyVO.phone}" required="required"/>
										</div>
									</div>
											
									</div>
									</div>
								</div>
	
								
								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">Your
										Email</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="fa fa-envelope fa" aria-hidden="true"></i>
											</span> <input type="text" class="form-control" name="email"
												id="email" value="${modifyVO.email}" required="required"/>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label for="address" class="cols-sm-2 control-label">Your
										Address</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="fa fa-edit fa" aria-hidden="true"></i>
											</span> <input type="text" class="form-control" name="address"
												id="address" value="${modifyVO.address}" required="required"/>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label for="account" class="cols-sm-2 control-label">Your
										Account</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="fa fa-money fa" aria-hidden="true"></i>
											</span> <input type="text" class="form-control" name="account"
												id="account" value="${modifyVO.account}" required="required"/>
										</div>
									</div>
								</div>

								<div class="form-group">
									<input type = "submit" id = "memberRegisterBtn" type="button" class="btn btn-primary btn-lg btn-block login-button" value = "회원정보수정"/>
								</div>
	
							</div>
						
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

