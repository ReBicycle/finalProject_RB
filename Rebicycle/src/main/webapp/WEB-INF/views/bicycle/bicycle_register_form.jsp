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
					if(data[0]=="없음"){
						info="<font color=red>등록된 자전거 없음</font>";
					} else {
						info+="<font color=blue>최저가 ";
						info+=data[0] + "원 </font>";
						info+="<font color=red>최대가 ";
						info+=data[1] + "원 </font>";
						info+="<font color=green>평균가 ";
						info+=data[2] + "원 </font>";
					}
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
				findGeo();
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

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c4a694f8da8eb3b5725921a457f15461&libraries=services"></script>
<script type="text/javascript">
function findGeo(){
	// 주소-좌표 변환 객체를 생성합니다
   	var geocoder = new daum.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addr2coord($("#roadAddress").val(), function(status, result) {

   		// 정상적으로 검색이 완료됐으면 
		if (status === daum.maps.services.Status.OK) {
			var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
			var latitude=JSON.stringify(coords.hb);
            var longitude=JSON.stringify(coords.gb);
    		//hb:위도 , qb: 경도
    		$("#lat").val(latitude);	
    		$("#lon").val(longitude);
		}
    });   
}
	 
</script>
<script type="text/javascript">
	var oTbl;
	//Row 추가
	function insRow() {
	  	oTbl = document.getElementById("addTable");
	  	var oRow = oTbl.insertRow();
	  	oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
	  	var oCell = oRow.insertCell();
		
	  	var i=0; 
	  	i++;
	  	//삽입될 Form Tag'
	  	var stCount = $(".id_startDay").length;
	  	var endCount = $(".id_endDay").length;
	  	var frmTag = "<input type=date name=startDay class=id_startDay id=id_startDay"+stCount+" required=required> <input type=date name=endDay class=id_endDay id=id_endDay"+endCount+" required=required> ";
	  	oCell.innerHTML = frmTag;
	}
	
	function delete_row() {
		var my_tbody = document.getElementById("addTable");
		if (my_tbody.rows.length-1 <= 1) return;
		my_tbody.deleteRow( my_tbody.rows.length-1 ); // 하단부터 삭제
	}
	
	function frmCheck() {
	  	var frm = document.form;
	  	for( var i = 0; i <= frm.elements.length - 1; i++ ){
	    	if( frm.elements[i].name == "addText[]" ) {
	         	if( !frm.elements[i].value ){
	             	alert("텍스트박스에 값을 입력하세요!");
	             	frm.elements[i].focus();
	             	return;
	          	}
	      	}
	   	}
	}
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#addTable").on("change",".id_endDay",function(){
			var stid = "id_startDay"+$(this).attr('id').substring(9,10);
			var endid = "id_endDay"+$(this).attr('id').substring(9,10);
			var startDate = $("input[id="+stid+"]").val();
	        var startDateArr = startDate.split('-');
	        var endDate = $("input[id="+endid+"]").val();
	        var endDateArr = endDate.split('-');
	                 
	        var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]);
	        var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);
	         
	        if(startDateCompare.getTime() > endDateCompare.getTime()) {
				alert("시작날짜와 종료날짜를 확인해 주세요.");
				$("input[id="+endid+"]").val("연도-월-일");
	        }
		});
		
		$("#addTable").on("click","#checkBtn",function(){
			var stCount = $(".id_startDay").length;
			var stid = "id_startDay";
			var endid = "id_endDay";
			var arr1 = [];
			var arr2 = [];
			var k = 0;
			
			for(var i=0 ; i<stCount-1 ; i++) {
				if($("#"+stid+i).val() > $("#"+endid+(i+1)) || $("#"+endid+i).val() < $("#"+stid+(i+1)).val()){
					arr1[i] = "0";
				} else {
					arr1[i] = "1";
					arr2[k] = i+1;
					k++;
				}
			}
			
			for(var j=0 ; j<arr1.length ; j++) {
				if(arr1[j] == "1") {
					alert("날짜를 제대로 선택해주세요");
					break;
				}
			}
			
			for(var h=0 ; h<arr2.length ; h++) {
				$("#id_startDay"+arr2[h]).val("연도-월-일");
				$("#id_endDay"+arr2[h]).val("연도-월-일");
			}
		});
	});
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
                <div class="panel-title">자전거 등록</div>
            </div>
            <div class="panel-body" > 
				<form  class="form-horizontal" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/registerBicycle.do">
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
				            <input class="input-md textinput textInput form-control" id="id_memberId" name="memberId" style="margin-bottom: 10px" type="text" value="${sessionScope.mvo.id }" readonly="readonly">
				        </div>
				    </div>
				    
				    <!-- 카테고리 -->
				    <div id="div_id_category" class="form-group required">
				        <label for="id_category"  class="control-label col-md-3  requiredField">종류</label>
				        <div class="controls col-md-8 "  style="margin-bottom: 10px">
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_1" value="1" style="margin-bottom: 10px" required="required">MTB</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_2" value="2" style="margin-bottom: 10px" required="required">로드</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_3" value="3" style="margin-bottom: 10px" required="required">픽시</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_4" value="4" style="margin-bottom: 10px" required="required">미니벨로</label>				            
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_5" value="5" style="margin-bottom: 10px" required="required">레코드용</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_6" value="6" style="margin-bottom: 10px" required="required">어린이용</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_7" value="7"  style="margin-bottom: 10px" required="required">기타</label><br>
				            <span id="calResult"></span>
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
							<input type="text" class="input-md emailinput form-control" id="roadAddress" name="roadAddress" placeholder="도로명주소" required="required">
							<input type="text" class="input-md emailinput form-control" id="jibunAddress" name="jibunAddress" placeholder="지번주소" required="required">
							<input type="text" class="input-md emailinput form-control" id="detailAddress" name="detailAddress" placeholder="상세주소" required="required">
							<input type="hidden" id="lat" name="latitude">
							<input type="hidden" id="lon" name="longitude">
							<span id="guide" style="color:#999"></span>
				        </div>
				    </div>
				    
				    <!-- 구매가 -->
				    <div id="div_id_purchasePrice" class="form-group required">
				        <label for="id_purchasePrice" class="control-label col-md-3  requiredField">구매가</label>
				        <div class="controls col-md-8 ">
				            <input class="input-md emailinput form-control" id="id_purchasePrice" name="purchasePrice" placeholder="구매가를 숫자로 입력하세요" style="margin-bottom: 10px" type="text"  required="required"/>
				        </div>     
				    </div>
				    
				    <!-- 대여료 -->
				    <div id="div_id_rentPrice" class="form-group required">
				        <label for="id_rentPrice" class="control-label col-md-3 requiredField">대여료</label>
				        <div class="controls col-md-8 "> 
				            <input class="input-md textinput textInput form-control" id="id_rentPrice" name="rentPrice" placeholder="대여료를 숫자로 입력하세요" style="margin-bottom: 10px" type="text"  required="required"/>
				        </div>
				    </div>
				    
				    <!-- Detail -->
				    <div id="div_id_detail" class="form-group required">
				         <label for="id_detail" class="control-label col-md-3  requiredField">Detail</label>
				         <div class="controls col-md-8 ">
				            <input class="input-md textinput textInput form-control" id="id_detail" name="detail" placeholder="추가정보를 입력하세요" style="margin-bottom: 10px" type="text" required="required"/>
				        </div>
				    </div>

				 	<!-- 달력 날짜 추가 -->
				 	<div id="div_id_date" class="form-group required"> 
					 	<label for="id_addDate" class="control-label col-md-3  requiredField">가능일</label>
					 	<div class="controls col-md-8" align="center">
							<table id="addTable">
								<tr>
									<td align="center">
										<input name="addButton" type="button" style="cursor:hand" onClick="insRow()" value="추가">
										<input type="button" style="cursor:hand" id="checkBtn" value="체크">
										<input type=button value='삭제' onClick='delete_row()' style='cursor:hand'>
									</td>
								</tr>
								<tr>
									<td>
										<input type="date" name="startDay" class="id_startDay" id="id_startDay0"  required="required">
										<input type="date" name="endDay" class="id_endDay" id="id_endDay0"  required="required">
									</td>
								</tr>
							</table>
						</div>
					</div>
				
				    <div class="form-group"> 
				        <div class="aab controls col-md-3 "></div>
				        <div class="controls col-md-8 "><br>
				            <input type="submit" name="register_bicycle" value="등록" class="btn btn-primary btn btn-info" id="submit-id-signup" />
				        </div>
				    </div> 
				</form>
            </div>
        </div>
    </div> 
</div>
