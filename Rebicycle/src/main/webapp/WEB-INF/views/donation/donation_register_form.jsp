<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<script type="text/javascript">
	$(document).ready(function(){
		$(":radio[name='select_address']").change(function(){
			//alert(1);
			if($(":radio[name='select_address']:checked").val()=='userAddress') {
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath }/findAddressById.do",
					data:"memberId="+$("#id_memberId").val(),
					dataType:"json",
					contentType:"application/x-www-form-urlencoded; charset=UTF-8",
					success:function(data){
						var addArr = data.address.split("%");
						$("#roadAddress").val(addArr[0]);
						$("#jibunAddress").val(addArr[1]);
						$("#detailAddress").val(addArr[2]); 
						findGeo();
					}
				});
			} else if ($(":radio[name='select_address']:checked").val()=='newAddress') {
				$("#roadAddress").val("");
				$("#jibunAddress").val("");
				$("#detailAddress").val("");
			}
		});
	});
</script>

<div class="container">
<br><br><br>
    <div id="signupbox" style=" margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">자전거 기부</div>
            </div>
            <div class="panel-body" > 
				<form  class="form-horizontal" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/donation/donation_register.do">
				    <%-- <input type="hidden" name="memberId" value="${sessionScope.memberVO.id }" /> --%>
				    
				    <!-- 사진 -->
				    <div id="div_id_photo" class="form-group required"> 
				        <label for="id_photo" class="control-label col-md-3  requiredField">사진</label> 
				        <div class="controls col-md-8 "> 
							<input type="file" name="file[0]" required="required"><br>
							<input type="file" name="file[1]" required="required"><br>
							<input type="file" name="file[2]" required="required"><br>
				        </div>
				    </div>
				    
				    <!-- Title -->
				    <div id="div_id_title" class="form-group required"> 
				        <label for="id_title" class="control-label col-md-3  requiredField">제목</label> 
				        <div class="controls col-md-8 "> 
				            <input class="input-md textinput textInput form-control" id="id_title" name="title" style="margin-bottom: 10px" type="text" required="required"/>
				        </div>
				    </div>
				    
				    <!-- 아이디 -->
				    <div id="div_id_memberId" class="form-group required"> 
				        <label for="id_memberId" class="control-label col-md-3  requiredField">아이디</label> 
				        <div class="controls col-md-8 "> 
				            <input class="input-md textinput textInput form-control" id="id_memberId" name="donorId" style="margin-bottom: 10px" type="text" value="${sessionScope.mvo.id }"/ readonly="readonly">
				        </div>
				    </div>
				    
				    
				    
				    <!-- 주소 선택 -->
				    <div id="div_id_address" class="form-group required">
				    	<label for="id_address" class="control-label col-md-3  requiredField">주소</label>
				        <div class="controls col-md-8">
				    		<input type="radio" name="select_address" id="userAddress" value="userAddress">사용자 주소&nbsp;&nbsp;&nbsp;
				        	<input type="radio" name="select_address" id="newAddress" value="newAddress">새로운 주소
				        </div>
				    </div>
				    
				    <!-- 주소 -->
				    <div id="div_id_address" class="form-group required">
				        <label for="id_address" class="control-label col-md-3  requiredField"></label>
				        <div class="controls col-md-4">
				        	<input type="text" class="input-md emailinput form-control" id="postcode" placeholder="우편번호">
				        </div>
				        <div class="controls col-md-4">
							<input type="button" class="input-md emailinput form-control" onclick="daumPostcode()" value="우편번호 찾기">
				        </div>
				        <label for="id_address" class="control-label col-md-3  requiredField"></label>
				   	 	<div class="controls col-md-8 ">
				            <!-- <input class="input-md  textinput textInput form-control" id="id_address" name="address" placeholder="주소를 입력하세요" style="margin-bottom: 10px" type="text" /> -->
							<input type="text" class="input-md emailinput form-control" id="roadAddress" name="roadAddress" placeholder="도로명주소" required="required">
							<input type="text" class="input-md emailinput form-control" id="jibunAddress" name="jibunAddress" placeholder="지번주소" required="required">
							<input type="text" class="input-md emailinput form-control" id="detailAddress" name="detailAddress" placeholder="상세주소" required="required">
							<input type="hidden" id="lat" name="latitude">
							<input type="hidden" id="lon" name="longitude">
							<span id="guide" style="color:#999"></span>
				        </div>
				    </div>
				    
				   
				    
				 
				    <!-- Detail -->
				    <div id="div_id_detail" class="form-group required">
				         <label for="id_detail" class="control-label col-md-3  requiredField">Detail</label>
				         <div class="controls col-md-8 ">
				            <input class="input-md textinput textInput form-control" id="id_detail" name="detail" placeholder="추가정보를 입력하세요" style="margin-bottom: 10px" type="text" required="required"/>
				        </div>
				    </div>

				    
				    <div class="form-group"> 
				        <div class="aab controls col-md-4 "></div>
				        <div class="controls col-md-8 "><br>
				            <input type="submit" name="register_bicycle" value="등록" class="btn btn-primary btn btn-info" id="submit-id-signup" />
				        </div>
				    </div> 
				</form>
            </div>
        </div>
    </div> 
</div>

