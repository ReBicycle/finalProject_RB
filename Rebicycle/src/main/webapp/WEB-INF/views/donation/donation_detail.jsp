<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <style>
.demo {cursor:pointer}
</style> 
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
  }
  x[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " w3-opacity-off";
}
</script> 
<script type="text/javascript">
function selectStory(id,no){
	alert(id+" "+no);
	if(confirm("사연을 채택하시겠습니까?")){
		var xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(data){
			if(xhr.status==200&&xhr.readychangestatus==4){
				if(data=="ok")
				alert("채택이 완료되었습니다");
				location.href="${pageContext.request.contextPath}/donation/donation_detail.do?donationBicycleNo="+no;
			}
			
		}
		xhr.open("post","${pageContext.request.contextPath}/donation/selectStory.do");
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send("storyId="+id+"&donationBicycleNo="+no);
	}
	else{
		return false;
	}
	
}
function storyCheck(){
 	var story=document.getElementById('${sessionScope.mvo.id}');
	if(story==null){
		 document.getElementById('id01').style.display='block';
	}else{
		alert("이미 사연이 존재합니다!");
		return false;
	} 
	
}
</script>
<script>
$(document).ready(function(){
	$("#cancleBtn").click(function(){
		$("#storyForm")[0].reset();  
		$("#id01").css("display","none");
	});
	
});
</script>
<style>
.btn {  
    border: none; /* Remove borders */ 
    color: #31708f; /* Add a text color */
    padding: 12px 20px 12px; /* Add some padding */
    cursor: pointer; /* Add a pointer cursor on mouse-over */
    font-weight: bold;
    font-size: 25px;
} 
.success {background-color: #f5f5f5;} 
.success:hover {background-color: #d9cff7;
			color: white;
}
.story:hover{
  opacity: 0.9;
  background-color:#f5f5f5;
}

<%-- 모달css--%>


/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 40%; /* Could be more or less, depending on screen size */
    height:80%; 
}
.close {
    position: absolute;
    right: 20%;  
    top: 10%;
    color: #000;
    font-size: 40px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}
</style>

<div class="container">       
   
<div id="signupbox" style="margin-top:45px;" class="mainbox col-sm-3">

		<div class="panel panel-default">
         <!--    <div class="panel-heading"> 
                <div class="panel-title"><h5>기부자 정보</h5></div>
            </div>  -->
            	<div class="panel-body" > 
       					<div align="center">
       					<h3><strong>기부자 정보</strong></h3>
                            <img class="thumbnail img-responsive" src="${pageContext.request.contextPath}/resources/upload/member/${donationVO.donorPhoto}" width="300px" height="300px">
                        </div> 
                        <hr> 
                        <h3><strong>아이디</strong></h3>
                        <p style="font-size: 15px">${requestScope.donationVO.donorId}</p>
                        <hr>
                        <h3><strong>주소</strong></h3>
                        <p style="font-size: 15px">${donationVO.address }</p>
                        <hr>
                        <h3><strong>기부 수</strong></h3>
                        <p style="font-size: 15px"></p>
       		   </div>    
           </div>
        <c:if test="${sessionScope.mvo.id!=requestScope.donationVO.donorId&&requestScope.donationVO.storyId=='n'}">   
        <button class="btn success" style="width:100%;margin-bottom:50px; " onclick="storyCheck()"><h4><strong>사연신청</strong></h4></button>
        </c:if>
        <c:if test="${requestScope.donationVO.storyId!='n'}">
        	<h4><strong>당첨자</strong> &nbsp;&nbsp;${requestScope.donationVO.storyId}</h4>
        </c:if>
        <%--modal --%>
        <div id="id01" class="modal" align="center" >
  <form method="post" class="modal-content animate mainbox" id="storyForm" action="${pageContext.request.contextPath}/donation/donation_story_register.do?donationBicycleNo=${requestScope.donationVO.donationBicycleNo}" >
    <div class=" panel panel-default" style="height: 100%;">
    <%--내용물영역 --%>
            <div class="panel-heading">
                <div class="panel-title"><h4><strong>사연작성하기</strong></h4></div>
            </div>
            <div class="panel-body">
            	    <!-- Title -->
				    <div id="div_id_title" class="form-group required"> 
				        <label for="id_title" class="control-label col-md-3  requiredField">제목</label> 
				        <div class="controls col-md-8 "> 
				            <input class="input-md textinput textInput form-control" id="id_title" name="title" style="margin-bottom: 30px" type="text" required="required"/>
				        </div>
				    </div>
				    
				    <!-- 아이디 -->
				    <div id="div_id_memberId" class="form-group required"> 
				        <label for="id_memberId" class="control-label col-md-3  requiredField">아이디</label> 
				        <div class="controls col-md-8 "> 
				            <input class="input-md textinput textInput form-control" id="id_memberId" name="id" style="margin-bottom: 30px" type="text" value="${sessionScope.mvo.id }" readonly="readonly">
				        </div>
				    </div>
         	
				    <!-- Detail -->
				    <div id="div_id_detail" class="form-group required">
				         <label for="id_detail" class="control-label col-md-3  requiredField">상세내용</label>
				         <div class="controls col-md-8 ">
				        	<textarea class="input-md textinput textInput form-control" name="detail" placeholder="추가정보를 입력하세요" required="required"  style="margin-bottom: 20px;height:120px;"></textarea>
				        </div>
				    </div>
             </div>
           
   <%--버튼영역 --%>
            <div class="form-group" style="margin-bottom: 30px;"> 
				        <div class="aab controls col-md-12"></div> 
				        <button type="button" id="cancleBtn"  class="btn btn-primary btn btn-info" style="font-size: 15px;">취소</button>
				         <input type="submit" name="register_bicycle" value="등록" class="btn btn-primary btn btn-info" id="submit-id-signup" style="font-size: 15px;"/>
			</div> 
       
    </div>
  </form>
</div>
        <%--modal end --%>
</div> 
      
 
    <div id="signupbox" style="margin-top:45px;" class="mainbox col-sm-9">
        <div class="panel panel-default"> 
            <div class="panel-heading">
                <div class="panel-title" style="color:#31708f"><h5><strong>${donationVO.title }</strong></h5></div>
            </div> 
            	<div class="panel-body" >
            	
            	<div class="w3-content w3-display-container" align="center">
  <img class="mySlides" src="${pageContext.request.contextPath}/resources/upload/donation/${requestScope.donationVO.photoVO.photo1}" style="width:50%">
  <img class="mySlides" src="${pageContext.request.contextPath}/resources/upload/donation/${requestScope.donationVO.photoVO.photo2}" style="width:50%;display: none;">
  <img class="mySlides" src="${pageContext.request.contextPath}/resources/upload/donation/${requestScope.donationVO.photoVO.photo3}" style="width:50%;display: none;">

  <button class="w3-button  w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  <button class="w3-button  w3-display-right" onclick="plusDivs(1)">&#10095;</button>
    <div class="w3-row-padding w3-section">
      <img class="demo w3-opacity w3-hover-opacity-off" src="${pageContext.request.contextPath}/resources/upload/donation/${requestScope.donationVO.photoVO.photo1}" style="width:10%" onclick="currentDiv(1)">
      <img class="demo w3-opacity w3-hover-opacity-off" src="${pageContext.request.contextPath}/resources/upload/donation/${requestScope.donationVO.photoVO.photo2}" style="width:10%" onclick="currentDiv(2)">
      <img class="demo w3-opacity w3-hover-opacity-off" src="${pageContext.request.contextPath}/resources/upload/donation/${requestScope.donationVO.photoVO.photo3}" style="width:10%" onclick="currentDiv(3)">
  </div>
</div>

		<hr style="color:cyan;">
		                              	
		                              <h4><label for="id_date" class="control-label col-md-9  requiredField" align="left">기부자의 말</label></h4><br>
		                              <label for="id_date" class="control-label col-md-9  requiredField" align="left">${donationVO.detail}</label><br><br>
                  </div>    
         
        </div>
        
         <%-- 사연있어요 영역 --%>
        <div class="panel panel-default">
            <div class="panel-heading"> 
                <div class="panel-title" style="color:#31708f;"><h5><strong>사연있어요</strong></h5></div>
            </div>  
            	<div class="panel-body w3-row" align="left" style="margin-left: 50px;max-height: 500px;"> 
			
				  <c:forEach items="${requestScope.donationVO.storyList }" var="list">
				<div class="story w3-half w3-padding" onclick="document.getElementById('${list.id}').style.display='block'"> 
				
					<img src="${pageContext.request.contextPath}/resources/upload/member/${list.photo}" align="left"  width="40%" style="width:100px;height:100px;" class="w3-circle">
				  		<span style="text-align:center;color:#31708f;"  width="60%" >${list.title}</span>
				</div>
				<%--모달내용 --%>
				  <div id="${list.id}" class="modal" align="center" >
				   <span onclick="document.getElementById('${list.id}').style.display='none'" class="close" title="Close Modal" >×</span>
						<div class="modal-content animate mainbox" >
							<div class=" panel panel-default" style="height: 100%;" >
							 		<div class="panel-heading">
                							<div class="panel-title"><strong>${list.id }님의 사연</strong></div>
            						</div>
            						<div class="panel-body">
            					<img src="${pageContext.request.contextPath}/resources/upload/member/${list.photo}" style="width:100px;height:100px;margin-top:10px;margin-bottom:20px;" class="w3-circle">
            						  <!-- Title -->
				    					<div id="div_id_title" class="form-group required" style="margin-bottom: 50px"> 
				       						 <label for="id_title" class="control-label col-md-3  requiredField">제목</label> 
				        					<div class="controls col-md-8 "> 
				            				<span>${list.title}</span>
				       						 </div>
				    					</div>
				    					 <!-- Detail -->
				   						 <div id="div_id_detail" class="form-group required" >
				         						<label for="id_detail" class="control-label col-md-3  requiredField">상세내용</label>
				         						<div class="controls col-md-8 "> 
				        						<textarea class="input-md textinput textInput form-control" name="detail"  required="required"  style="height:170px;" readonly="readonly">${list.detail}</textarea>
				        						
				        						</div>
				    					</div>
				    					<c:if test="${sessionScope.mvo.id==requestScope.donationVO.donorId&&requestScope.donationVO.storyId=='n'}">
				    					<div class="form-group" style="margin-bottom: 30px;"> 
				       						 <div class="aab controls col-md-12"></div>
				        					<button type="button" onclick="selectStory('${list.id}','${param.donationBicycleNo}')" class="btn btn-primary btn btn-info" style="font-size: 15px;">사연채택</button>
										</div> 
				    					</c:if>
				    					
				    					
				    					
            						</div>
						
							</div>
						</div>
				  </div><%--모달 끝 --%>
				  </c:forEach> 
				  
                 </div>    
         
        </div>
        
     </div>
     

  </div>