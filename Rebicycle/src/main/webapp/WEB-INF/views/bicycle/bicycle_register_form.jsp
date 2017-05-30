<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$(":radio[name='categoryNo']").change(function(){
			$.ajax({
				type:"get",
				dataType:"json",
				url:"${pageContext.request.contextPath }/calculatePrice.do",
				data:"categoryNo="+$(":radio[name='categoryNo']:checked").val(),
				success:function(data){
					var info="";
					info+="<font color=blue>최저가 ";
					info+=data[0] + "원 </font>";
					info+="<font color=red>최대가 ";
					info+=data[1] + "원 </font>";
					info+="<font color=green>평균가 ";
					info+=data[2] + "원 </font>";
					$("#calResult").html(info);
				} //success
			});//ajax
		});
	});//ready
</script>
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


<div class="container">
<br><br><br>
    <div id="signupbox" style=" margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">자전거 등록</div>
            </div>
            <div class="panel-body" > 
				<form  class="form-horizontal" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/registerBicycle.do">
				    <%-- <input type="hidden" name="memberId" value="${sessionScope.memberVO.id }" /> --%>
				    
				    
				    <!-- 사진 -->
				    <div id="div_id_photo" class="form-group required"> 
				        <label for="id_photo" class="control-label col-md-3  requiredField">사진</label> 
				        <div class="controls col-md-8 "> 
							<input type="file" name="file[0]"><br>
							<input type="file" name="file[1]"><br>
							<input type="file" name="file[2]"><br>
				        </div>
				    </div>
				    
				    <!-- 아이디 -->
				    <div id="div_id_memberId" class="form-group required"> 
				        <label for="id_memberId" class="control-label col-md-3  requiredField">아이디</label> 
				        <div class="controls col-md-8 "> 
				            <input class="input-md textinput textInput form-control" id="id_memberId" name="memberId" style="margin-bottom: 10px" type="text" value="${sessionScope.mvo.id }"/>
				        </div>
				    </div>
				    
				    <!-- 카테고리 -->
				    <div id="div_id_category" class="form-group required">
				        <label for="id_category"  class="control-label col-md-3  requiredField">종류</label>
				        <div class="controls col-md-8 "  style="margin-bottom: 10px">
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_1" value="1" style="margin-bottom: 10px">MTB</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_2" value="2" style="margin-bottom: 10px">로드</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_3" value="3" style="margin-bottom: 10px">픽시</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_4" value="4" style="margin-bottom: 10px">레코드용</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_5" value="5" style="margin-bottom: 10px">어린이용</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_6" value="6"  style="margin-bottom: 10px">기타</label><br>
				            <span id="calResult"></span>
				        </div>
				    </div>
				    
				    <!-- 주소 -->
				    <div id="div_id_address" class="form-group required">
				        <label for="id_address" class="control-label col-md-3  requiredField">주소</label>
				        <div class="controls col-md-4">
				        	<input type="text" class="input-md emailinput form-control" id="postcode" placeholder="우편번호">
				        </div>
				        <div class="controls col-md-4">
							<input type="button" class="input-md emailinput form-control" onclick="daumPostcode()" value="우편번호 찾기">
				        </div>
				        <label for="id_address" class="control-label col-md-3  requiredField"></label>
				   	 	<div class="controls col-md-8 ">
				            <!-- <input class="input-md  textinput textInput form-control" id="id_address" name="address" placeholder="주소를 입력하세요" style="margin-bottom: 10px" type="text" /> -->
							<input type="text" class="input-md emailinput form-control" id="roadAddress" placeholder="도로명주소">
							<input type="text" class="input-md emailinput form-control" id="jibunAddress" placeholder="지번주소">
							<input type="text" class="input-md emailinput form-control" id="detailAddress" placeholder="상세주소">
							<span id="guide" style="color:#999"></span>
				        </div>
				    </div>
				    
				    
				    <!-- 구매가 -->
				    <div id="div_id_purchasePrice" class="form-group required">
				        <label for="id_purchasePrice" class="control-label col-md-3  requiredField">구매가</label>
				        <div class="controls col-md-8 ">
				            <input class="input-md emailinput form-control" id="id_purchasePrice" name="purchasePrice" placeholder="구매가를 숫자로 입력하세요" style="margin-bottom: 10px" type="text" />
				        </div>     
				    </div>
				    
				    <!-- 대여료 -->
				    <div id="div_id_rentPrice" class="form-group required">
				        <label for="id_rentPrice" class="control-label col-md-3 requiredField">대여료</label>
				        <div class="controls col-md-8 "> 
				            <input class="input-md textinput textInput form-control" id="id_rentPrice" name="rentPrice" placeholder="대여료를 숫자로 입력하세요" style="margin-bottom: 10px" type="text" />
				        </div>
				    </div>
				    
				    <!-- Detail -->
				    <div id="div_id_detail" class="form-group required">
				         <label for="id_detail" class="control-label col-md-3  requiredField">Detail</label>
				         <div class="controls col-md-8 ">
				            <input class="input-md textinput textInput form-control" id="id_detail" name="detail" placeholder="추가정보를 입력하세요" style="margin-bottom: 10px" type="text" />
				        </div>
				    </div>
				    
				    <!-- 달력 -->
				    <div id="div_id_date" class="form-group required"> 
				        <label for="id_date" class="control-label col-md-3  requiredField">시작일</label>
				        <div class="controls col-md-8 "> 
							<input type="date" name="startDay" class="input-md textinput textInput form-control" id="id_detail">
				        </div>
				    </div> 
				    <div id="div_id_date" class="form-group required"> 
				        <label for="id_date" class="control-label col-md-3  requiredField">종료일</label>
				        <div class="controls col-md-8 ">
							<input type="date" name="endDay" class="input-md textinput textInput form-control" id="id_detail">
				        </div>
				    </div>
				    <!-- 
				    
				    
				    
				    <div id="div_id_catagory" class="form-group required">
				        <label for="id_catagory" class="control-label col-md-4  requiredField"> catagory<span class="asteriskField">*</span> </label>
				        <div class="controls col-md-8 "> 
				             <input class="input-md textinput textInput form-control" id="id_catagory" name="catagory" placeholder="skills catagory" style="margin-bottom: 10px" type="text" />
				        </div>
				    </div> 
				    
				    <div id="div_id_number" class="form-group required">
				         <label for="id_number" class="control-label col-md-4  requiredField"> contact number<span class="asteriskField">*</span> </label>
				         <div class="controls col-md-8 ">
				             <input class="input-md textinput textInput form-control" id="id_number" name="number" placeholder="provide your number" style="margin-bottom: 10px" type="text" />
				        </div> 
				    </div>
				    
				    <div id="div_id_location" class="form-group required">
				        <label for="id_location" class="control-label col-md-4  requiredField"> Your Location<span class="asteriskField">*</span> </label>
				        <div class="controls col-md-8 ">
				            <input class="input-md textinput textInput form-control" id="id_location" name="location" placeholder="Your Pincode and City" style="margin-bottom: 10px" type="text" />
				        </div> 
				    </div> -->
				    
				    <div class="form-group"> 
				        <div class="aab controls col-md-4 "></div>
				        <div class="controls col-md-8 ">
				            <input type="submit" name="register_bicycle" value="등록" class="btn btn-primary btn btn-info" id="submit-id-signup" />
				        </div>
				    </div> 
				</form>
            </div>
        </div>
    </div> 
</div>
