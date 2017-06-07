<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=f4cd67b2fb4a9926d16fe85ee8ec2a67&libraries=services"></script>
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
	
	  	//삽입될 Form Tag'
	  	var frmTag = "<input type=date name=startDay class=id_startDay id=id_startDay"+stCount+" required=required> <input type=date name=endDay class=id_endDay id=id_endDay"+endCount+" required=required> ";
	  	frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
	  	oCell.innerHTML = frmTag;
	}
	//Row 삭제
	function removeRow() {
		oTbl = document.getElementById("addTable");
		oTbl.deleteRow(oTbl.clickedRowIndex);
	}

	
	function delete_row() {
		var my_tbody = document.getElementById("addTable");
		if (my_tbody.rows.length < 1) return;
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

<div class="container">
<br><br><br>
    <div id="signupbox" style=" margin-top:50px" class="mainbox col-md-7 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">자전거 정보 수정</div>
            </div>
            <div class="panel-body" > 
				<form  class="form-horizontal" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/modifyBicycle.do">
				    <input type="hidden" name="bicycleNo" value="${param.bicycleNo }" />
				    
				    <!-- 사진 -->
				    <div id="div_id_photo" class="form-group required"> 
				        <label for="id_photo" class="control-label col-md-3  requiredField">사진</label> 
				        <div class="controls col-md-8 "> 
				        	<img width="100px" height="90" src="${pageContext.request.contextPath}/resources/upload/bicycle/${bicycleVO.photoVO.photo1 }">
				        	<img width="100px" height="90" src="${pageContext.request.contextPath}/resources/upload/bicycle/${bicycleVO.photoVO.photo2 }">
				        	<img width="100px" height="90" src="${pageContext.request.contextPath}/resources/upload/bicycle/${bicycleVO.photoVO.photo3 }">
							<input type="file" name="file[0]"><br>
							<input type="file" name="file[1]"><br>
							<input type="file" name="file[2]"><br>
				        </div>
				    </div>
				    
				    <!-- Title -->
				    <div id="div_id_title" class="form-group required"> 
				        <label for="id_title" class="control-label col-md-3  requiredField">제목</label> 
				        <div class="controls col-md-8 "> 
				            <input class="input-md textinput textInput form-control" id="id_title" name="title" style="margin-bottom: 10px" type="text" value="${bicycleVO.title }" required="required"/>
				        </div>
				    </div>
				    
				    <!-- 아이디 -->
				    <div id="div_id_memberId" class="form-group required"> 
				        <label for="id_memberId" class="control-label col-md-3  requiredField">아이디</label> 
				        <div class="controls col-md-8 "> 
				            <input class="input-md textinput textInput form-control" id="id_memberId" name="memberId" style="margin-bottom: 10px" type="text" value="${sessionScope.mvo.id }" readonly="readonly"/>
				        </div>
				    </div>
				    
				    <!-- 카테고리 -->
				    <div id="div_id_category" class="form-group required">
				        <label for="id_category"  class="control-label col-md-3  requiredField">종류</label>
				        <div class="controls col-md-8 "  style="margin-bottom: 10px">
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_1" value="1" style="margin-bottom: 10px" <c:if test="${bicycleVO.categoryVO.categoryNo==1 }">checked</c:if> required="required">MTB</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_2" value="2" style="margin-bottom: 10px" <c:if test="${bicycleVO.categoryVO.categoryNo==2 }">checked</c:if> required="required">로드</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_3" value="3" style="margin-bottom: 10px" <c:if test="${bicycleVO.categoryVO.categoryNo==3 }">checked</c:if> required="required">픽시</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_4" value="4" style="margin-bottom: 10px" <c:if test="${bicycleVO.categoryVO.categoryNo==4 }">checked</c:if> required="required">미니벨로</label>				            
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_5" value="5" style="margin-bottom: 10px" <c:if test="${bicycleVO.categoryVO.categoryNo==5 }">checked</c:if> required="required">레코드용</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_6" value="6" style="margin-bottom: 10px" <c:if test="${bicycleVO.categoryVO.categoryNo==6 }">checked</c:if> required="required">어린이용</label>
				            <label class="radio-inline"><input type="radio" name="categoryNo" id="id_category_7" value="7" style="margin-bottom: 10px" <c:if test="${bicycleVO.categoryVO.categoryNo==7 }">checked</c:if> required="required">기타</label><br>
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
							<input type="text" class="input-md emailinput form-control" id="roadAddress" name="roadAddress" placeholder="도로명주소" value="${requestScope.roadAddress }" required="required">
							<input type="text" class="input-md emailinput form-control" id="jibunAddress" name="jibunAddress" placeholder="지번주소" value="${requestScope.jibunAddress }" required="required">
							<input type="text" class="input-md emailinput form-control" id="detailAddress" name="detailAddress" placeholder="상세주소" value="${requestScope.detailAddress }" required="required">
							<input type="hidden" id="lat" name="latitude">
							<input type="hidden" id="lon" name="longitude">
							<span id="guide" style="color:#999"></span>
				        </div>
				    </div>
				    
				    <!-- 구매가 -->
				    <div id="div_id_purchasePrice" class="form-group required">
				        <label for="id_purchasePrice" class="control-label col-md-3  requiredField">구매가</label>
				        <div class="controls col-md-8 ">
				            <input class="input-md emailinput form-control" id="id_purchasePrice" name="purchasePrice" placeholder="구매가를 숫자로 입력하세요" style="margin-bottom: 10px" type="text" value="${bicycleVO.purchasePrice }" required="required"/>
				        </div>     
				    </div>
				    
				    <!-- 대여료 -->
				    <div id="div_id_rentPrice" class="form-group required">
				        <label for="id_rentPrice" class="control-label col-md-3 requiredField">대여료</label>
				        <div class="controls col-md-8 "> 
				            <input class="input-md textinput textInput form-control" id="id_rentPrice" name="rentPrice" placeholder="대여료를 숫자로 입력하세요" style="margin-bottom: 10px" type="text" value="${bicycleVO.rentPrice }" required="required"/>
				        </div>
				    </div>
				    
				    <!-- Detail -->
				    <div id="div_id_detail" class="form-group required">
				         <label for="id_detail" class="control-label col-md-3  requiredField">Detail</label>
				         <div class="controls col-md-8 ">
				            <input class="input-md textinput textInput form-control" id="id_detail" name="detail" placeholder="추가정보를 입력하세요" style="margin-bottom: 10px" type="text" value="${bicycleVO.detail }" required="required"/>
				        </div>
				    </div>

				 	<!-- 달력 날짜 추가 -->
				 	<label for="id_detail" class="control-label col-md-3  requiredField">가능일</label>
					<table id="addTable" align="left">
						<c:forEach items="${possibleDayList }" var="clist" varStatus="order">
						<c:choose>
							<c:when test="${order.count==1 }">
								<tr>
									<td align="left">
										<input type="date" name="startDay" id=id_startDay value="${clist.startDay }" required="required">
										<input type="date" name="endDay" id=id_endDay value="${clist.endDay }" required="required">	
										<input name="addButton" type="button" style="cursor:hand" onClick="insRow()" value="추가">
									</td>	
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td align="left">
										<input type="date" name="startDay" id=id_startDay value="${clist.startDay }" required="required">
										<input type="date" name="endDay" id=id_endDay value="${clist.endDay }" required="required">	
										<input name="addButton" type="button" style="cursor:hand" onClick="insRow()" value="추가">	
										<input type="button" value="삭제" onClick="delete_row()" style="cursor:hand">
									</td>	
								</tr>
							</c:otherwise>
						</c:choose>			
						</c:forEach>
					</table>
				
					<!-- 달력 -->
				    <!-- <div id="div_id_date" class="form-group required"> 
				        <label for="id_date" class="control-label col-md-3  requiredField">시작일</label>
				        <div class="controls col-md-8 "> 
							<input type="date" name="startDay" class="input-md textinput textInput form-control" id="id_detail">
				        </div>
				        <label for="id_date" class="control-label col-md-3  requiredField">종료일</label>
				        <div class="controls col-md-8 ">
							<input type="date" name="endDay" class="input-md textinput textInput form-control" id="id_detail">
				        </div>
				    </div> -->
				    
				    <!-- 달력 안쓰는거 -->
				   <!--  
			        <div class="controls col-md-8 "> 
						<input type="date" name="startDay" class="input-md textinput textInput form-control" id="id_detail">
			        </div>
			        <div class="controls col-md-8 ">
						<input type="date" name="endDay" class="input-md textinput textInput form-control" id="id_detail">
			        </div> -->
				    
				    
				    <div class="form-group"> 
				        <div class="aab controls col-md-4 "></div>
				        <div class="controls col-md-8 ">
				            <input type="submit" name="modify_bicycle" value="수정" class="btn btn-primary btn btn-info" id="submit-id-signup" />
				        </div>
				    </div> 
				</form>
            </div>
        </div>
    </div> 
</div>
