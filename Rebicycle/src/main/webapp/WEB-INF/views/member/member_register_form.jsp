<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(document).ready(function(){
	var checkResultId="";		
	$("#memberRegisterForm").submit(function(){				
		if(checkResultId==""){
			alert("아이디 중복확인을 하세요");
			return false;
		}		
	});
	

	$(".profile-img").click(function(){
		//document.all.file1.click(); document.all.file2.value=document.all.file1.value'
		//$(“#my_image”).attr(“src”,“second.jpg”);#docum
		//$("#picture").
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
	
	$("#id").keyup(function(){
		var id=$("#id").val().trim();
		if(id.length<4 || id.length>10){
			$("#idCheckView").html("아이디는 4자이상 10자 이하여야 함!").css(
					"background","pink");
			checkResultId="";
			return;
		}			
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/memberIdcheckAjax.do",				
			data:"id="+id,	
			success:function(data){		
				if(data=="fail"){
				$("#idCheckView").html(id+" 사용불가!").css("background","red");
					checkResultId="";
				}else{						
					$("#idCheckView").html(id+" 사용가능!").css(
							"background","yellow");		
					checkResultId=id;
				}					
			}//callback			
		});//ajax
	});//keyup
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
					<form id = "memberRegisterForm" class="form-horizontal" enctype="multipart/form-data" 
					 action="${pageContext.request.contextPath}/memberRegister.do" method="POST">
					
					
						<div class="row">
							<div class="center-block">
							<input type="file" name="picture" id = "picture" style="display: none" value = "http://icons.iconarchive.com/icons/graphicloads/colorful-long-shadow/256/Plus-icon.png"> 

								<abbr title="프로필 이미지를 등록하시려면 클릭해주세요!"><img class="profile-img"
									src="http://icons.iconarchive.com/icons/graphicloads/colorful-long-shadow/256/Plus-icon.png"
									alt=""></abbr>
							</div>
						</div>
						
						<!--  	<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">Your
										Email</label>
									<div class="cols-sm-10">-->
						
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
											<input type="text" class="form-control" name="id" id="id" placeholder="Enter your id" required="required"/>
										
										</div>
									</div>
									
									
									<label for="name" class="cols-sm-2 control-label"></label>
										<div class="input-group">
											<!-- <button style="margin-top: 5px" class = "btn btn-primary btn-md btn-block login-button" value = "중복확인">중복확인</button> -->
											<span id = "idCheckView"></span>
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
														id="password" placeholder="Enter your Password" required="required"/>
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
														id="name" placeholder="Enter your name" required="required"/>
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
												id="phone" placeholder="Enter your phone number" required="required"/>
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
												id="email" placeholder="Enter your Email" required="required"/>
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
												id="address" placeholder="Enter your address" required="required"/>
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
												id="account" placeholder="Enter your account" required="required"/>
										</div>
									</div>
								</div>

								<div class="form-group">
									<input type = "submit" id = "memberRegisterBtn" type="button" class="btn btn-primary btn-lg btn-block login-button" value = "JOIN"/>
								</div>
	
							</div>
						
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
