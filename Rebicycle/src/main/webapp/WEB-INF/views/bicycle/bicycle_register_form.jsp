<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	$(document).ready(function(){
		$(":radio[name='categoryNo']").change(function(){
			//alert($(":radio[name='categoryNo']:checked").val());
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
	});
</script>


<div class="container">
    <div id="signupbox" style=" margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">자전거 등록</div>
            </div>
            <div class="panel-body" > 
				<form  class="form-horizontal" method="post" action="${pageContext.request.contextPath }/registerBicycle.do">
				    <%-- <input type="hidden" name="memberId" value="${sessionScope.memberVO.id }" /> --%>
				    
				    <!-- 아이디 -->
				    <div id="div_id_memberId" class="form-group required"> 
				        <label for="id_memberId" class="control-label col-md-4  requiredField">아이디</label> 
				        <div class="controls col-md-8 "> 
				            <input class="input-md textinput textInput form-control" id="id_memberId" name="memberId" style="margin-bottom: 10px" type="text" />
				        </div>
				    </div>
				    
				    <!-- 카테고리 -->
				    <div id="div_id_category" class="form-group required">
				        <label for="id_category"  class="control-label col-md-4  requiredField">종류</label>
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
				        <label for="id_address" class="control-label col-md-4  requiredField">주소</label>
				        <div class="controls col-md-8 ">
				            <input class="input-md  textinput textInput form-control" id="id_address" name="address" placeholder="주소를 입력하세요" style="margin-bottom: 10px" type="text" />
				        </div>
				    </div>
				    
				    <!-- 구매가 -->
				    <div id="div_id_purchasePrice" class="form-group required">
				        <label for="id_purchasePrice" class="control-label col-md-4  requiredField">구매가</label>
				        <div class="controls col-md-8 ">
				            <input class="input-md emailinput form-control" id="id_purchasePrice" name="purchasePrice" placeholder="구매가를 숫자로 입력하세요" style="margin-bottom: 10px" type="text" />
				        </div>     
				    </div>
				    
				    <!-- 대여료 -->
				    <div id="div_id_rentPrice" class="form-group required">
				        <label for="id_rentPrice" class="control-label col-md-4  requiredField">대여료</label>
				        <div class="controls col-md-8 "> 
				            <input class="input-md textinput textInput form-control" id="id_rentPrice" name="rentPrice" placeholder="대여료를 숫자로 입력하세요" style="margin-bottom: 10px" type="text" />
				        </div>
				    </div>
				    
				    <!-- Detail -->
				    <div id="div_id_detail" class="form-group required">
				         <label for="id_detail" class="control-label col-md-4  requiredField">Detail</label>
				         <div class="controls col-md-8 ">
				            <input class="input-md textinput textInput form-control" id="id_detail" name="detail" placeholder="추가정보를 입력하세요" style="margin-bottom: 10px" type="text" />
				        </div>
				    </div>
				    
				    <!-- 달력 -->
				    <div id="div_id_date" class="form-group required"> 
				        <label for="id_date" class="control-label col-md-4  requiredField">시작일</label>
				        <div class="controls col-md-8 "> 
							<input type="date" name="startDate" class="input-md textinput textInput form-control" id="id_detail">
				        </div>
				    </div> 
				    <div id="div_id_date" class="form-group required"> 
				        <label for="id_date" class="control-label col-md-4  requiredField">종료일</label>
				        <div class="controls col-md-8 ">
							<input type="date" name="endDate" class="input-md textinput textInput form-control" id="id_detail">
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