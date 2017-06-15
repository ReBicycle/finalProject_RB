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
    width: 50%; /* Could be more or less, depending on screen size */
    height: 75%;
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
        <button class="btn success" style="width:100%;margin-bottom:50px; " onclick="document.getElementById('id01').style.display='block'"><h4><strong>사연신청</strong></h4></button>
        <%--modal --%>
        <div id="id01" class="modal" align="center" >
  <form method="post" class="modal-content animate mainbox"  action="${pageContext.request.contextPath}/donation/donation_story_register.do?donationBicycleNo=${requestScope.donationVO.donationBicycleNo}" >
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
				        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="btn btn-primary btn btn-info" style="font-size: 15px;">취소</button>
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
            	<div class="panel-body" align="left" style="margin-left: 50px;"> 
			
				  <c:forEach items="${requestScope.donationVO.storyList }" var="list">
				
					<img src="${pageContext.request.contextPath}/resources/upload/member/${list.photo}" style="width:100px;height:100px;" class="w3-circle">
				  		${list.title}
		
				  </c:forEach> 
				  
                 </div>    
         
        </div>
        
     </div>
     

  </div>