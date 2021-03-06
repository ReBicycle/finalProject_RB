<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script> -->

<script type="text/javascript">

$(document).ready(function(){
	document.getElementById("uploadFile").disabled = true;
	
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
			$("#passwordCheckView").html("password가 일치하지 않습니다!");
			return;
		}else{
			$("#passwordCheckView").html("");
		}
			
	});
	
	$("#fileLabel").click(function(){
		document.getElementById("uploadFile").disabled = false;
	});
	
	$("#uploadFile").on("change", function(){
		readURL(this);
	});
	
	function readURL(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$("#imgView").attr("src", e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	
});//ready
</script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
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
					<strong>회원정보수정</strong>
				</div>
				<div class="panel-body">
					<form id = "memberRegisterForm" class="form-horizontal" enctype="multipart/form-data" action="${pageContext.request.contextPath}/member/memberModify.do" method="POST">
						<div class="row">
							<div class="center-block">
								<abbr title="프로필 이미지를 변경하시려면 클릭해주세요!">
									<img id = "imgView"  class="profile-img" src="${pageContext.request.contextPath}/resources/upload/member/${sessionScope.mvo.picture}" alt="">
								</abbr> 
							</div>
						</div>
						<input type = "hidden" name = "picture" value = "${modifyVO.picture}">
						
						<div class="row">
							<div class="center-block">
								<label id = "fileLabel" for="uploadFile">파일 변경</label> 
								<div id = "fileView"></div>
							 	<input type = "file" id = "uploadFile" name="uploadFile">
							</div>
						</div>
					
						<div class="row">
							<div class="col-sm-12 col-md-10  col-md-offset-1 ">
								<div class="form-group">
									<label for="name" class="cols-sm-2 control-label">Your ID</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon">
											 	<i	class="fa fa-user fa" aria-hidden="true"></i>
											</span> 
											<input type="text" class="form-control" name="id" id="id" value="${modifyVO.id}" readonly="readonly"/>
										</div>
									</div>
								</div>
								
								<!-- 비밀번호 -->
								<div class="form-group">
									<div class = "row"> 
										<div class="col-sm-10 col-md-6">
											<label for="password" class="cols-sm-2 control-label">Password</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-lock fa-lg" aria-hidden="true"></i>
													</span> 
													<input type="password" class="form-control" name="password" id="password" value="${modifyVO.password}" required="required"/>
												</div>
											</div>
										</div>
										<div class="col-sm-10 col-md-6">
											<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-lock fa-lg" aria-hidden="true"></i>
													</span> 
													<input type="password" class="form-control" name="confirm" id="confirm" placeholder="Confirm your Password" required="required"/>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<!-- 비빌번호 체크 span -->
								<div class="form-group">
									<div class="cols-sm-10 col-md-6 col-md-offset-6 ">
										<div class="input-group">
											<span id = "passwordCheckView"></span>
										</div>
									</div>
								</div>
								
								<!-- 이름 / 전화번호 -->
								<div class="form-group">
									<div class = "row"> 
										<div class="col-sm-10 col-md-6">
											<label for="name" class="cols-sm-2 control-label">Your Name</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-users fa" aria-hidden="true"></i>
													</span> 
													<input type="text" class="form-control" name="name" id="name" value="${modifyVO.name}" required="required"/>
												</div>
											</div>
										</div>
										<div class="col-sm-10 col-md-6">
											<label for="phone" class="cols-sm-2 control-label">Your Phone Number</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-phone fa" aria-hidden="true"></i>
													</span> 
													<input type="text" class="form-control" name="phone" id="phone" value="${modifyVO.phone}" required="required"/>
												</div>
											</div>
										</div>
									</div>
								</div>
	
								<!-- 이메일 -->
								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">Your Email</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"> 
												<i class="fa fa-envelope fa" aria-hidden="true"></i>
											</span> 
											<input type="text" class="form-control" name="email" id="email" value="${modifyVO.email}" required="required"/>
										</div>
									</div>
								</div>

								<!-- 주소 -->
								<div class="form-group">
									<label for="address" class="cols-sm-2 control-label">Your Address</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"> 
												<i class="fa fa-edit fa" aria-hidden="true"></i>
											</span> 
											<input type="button" class="input-md emailinput form-control" onclick="daumPostcode()" value="우편번호 찾기">
											<input type="text" class="input-md emailinput form-control" id="postcode" placeholder="우편번호">
 											<input type="text" class="input-md emailinput form-control" id="roadAddress" name="roadAddress"  value="${requestScope.roadAddress }" placeholder="도로명주소">
											<input type="text" class="input-md emailinput form-control" id="jibunAddress" name="jibunAddress" value="${requestScope.jibunAddress }" placeholder="지번주소"><br>
											<input type="text" class="input-md emailinput form-control" id="detailAddress" name="detailAddress" value="${requestScope.detailAddress }" placeholder="상세주소">
											<span id="guide" style="color:#999"></span>
										</div>
									</div>
								</div>

								<!-- 계좌번호 -->
								<div class="form-group">
									<label for="account" class="cols-sm-2 control-label">Your Account</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"> 
											<i class="fa fa-money fa" aria-hidden="true"></i>
											</span> 
											<input type="text" class="form-control" name="account" id="account" value="${modifyVO.account}" required="required"/>
										</div>
									</div>
								</div>
	
								<!-- 정보수정버튼 -->
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

