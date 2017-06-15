<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <style>
/* .mySlides {display:none} */
.demo {cursor:pointer}
</style> 
<!-- <script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script> -->
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
</style>

<div class="container">       
   
<div id="signupbox" style="margin-top:45px;" class="mainbox col-sm-3">

		<div class="panel panel-default">
         <!--    <div class="panel-heading"> 
                <div class="panel-title"><h5>기부자 정보</h5></div>
            </div>  -->
            	<div class="panel-body" > 
       					<div align="center">
       					<h5>기부자 정보</h5>
                            <img class="thumbnail img-responsive" src="${pageContext.request.contextPath}/resources/upload/member/${donationVO.donorId}.jpg" width="300px" height="300px">
                        </div>
                        <hr> 
                        <h3><strong>기부자</strong></h3>
                        <p style="font-size: 15px">${requestScope.donationVO.donorId}</p>
                        <hr>
                        <h3><strong>주소</strong></h3>
                        <p style="font-size: 15px">${donationVO.address }</p>
                        <hr>
                        <h3><strong>기부 수</strong></h3>
                        <p style="font-size: 15px"></p>
       		   </div>    
           </div> 
        <button class="btn success" style="width:100%"><h4>사연신청</h4></button>
</div> 
      
 
    <div id="signupbox" style="margin-top:45px;" class="mainbox col-sm-9">
        <div class="panel panel-default"> 
            <div class="panel-heading">
                <div class="panel-title"><h5>${donationVO.title }</h5></div>
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
            	
            	
<%-- <div class="w3-content" style="width:50%;hight:50%;">
  <img class="mySlides" src="${pageContext.request.contextPath}/resources/upload/donation/${requestScope.donationVO.photoVO.photo1}" style="width:100%;display: table;">
  <img class="mySlides" src="${pageContext.request.contextPath}/resources/upload/donation/${requestScope.donationVO.photoVO.photo2}" style="width:100%">
  <img class="mySlides" src="${pageContext.request.contextPath}/resources/upload/donation/${requestScope.donationVO.photoVO.photo3}" style="width:100%">

  <div class="w3-row-padding w3-section">
    <div class="w3-col s4">
      <img class="demo w3-opacity w3-hover-opacity-off" src="${pageContext.request.contextPath}/resources/upload/donation/${requestScope.donationVO.photoVO.photo1}" style="width:90%" onclick="currentDiv(1)">
    </div>
    <div class="w3-col s4">
      <img class="demo w3-opacity w3-hover-opacity-off" src="${pageContext.request.contextPath}/resources/upload/donation/${requestScope.donationVO.photoVO.photo2}" style="width:90%" onclick="currentDiv(2)">
    </div>
    <div class="w3-col s4">
      <img class="demo w3-opacity w3-hover-opacity-off" src="${pageContext.request.contextPath}/resources/upload/donation/${requestScope.donationVO.photoVO.photo3}" style="width:90%" onclick="currentDiv(3)">
    </div>
  </div>
</div> --%>
		<hr style="color:cyan;">
		                              	
		                              <h4><label for="id_date" class="control-label col-md-9  requiredField" align="left">기부자의 말</label></h4><br>
		                              <label for="id_date" class="control-label col-md-9  requiredField" align="left">${donationVO.detail}</label><br><br>
                  </div>    
         
        </div>
        
         
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title"><h5>사연신청</h5></div>
            	</div> 
            	<div class="panel-body" > 
				  <br><br><br><br><br><br>
				  
                  </div>    
         
        </div>
        
     </div>
     
     
     
   
     
     
      
  </div>