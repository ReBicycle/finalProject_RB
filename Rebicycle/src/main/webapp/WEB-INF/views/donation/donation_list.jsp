<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
.content {
  position: relative;
  padding-left: 10px;
  padding-right: 10px;
}
 
.image {
opacity: 1;
  display: block;
  width: 100%;
  height: auto;
}

.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  transition: .5s ease;
  background-color: #f5f5f5;
}

.content:hover .overlay {
  opacity: 0.9; 
}

.text {
  color: black;
  font-size: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
}
input[type=search] {
    width: 50%;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 15px;
    background-color: white;
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
   
}

/* input[type=search]:focus {
    width: 50%;
} */
.btn {  
    border: none; /* Remove borders */
    color: white; /* Add a text color */
    padding: 12px 20px 12px; /* Add some padding */
    cursor: pointer; /* Add a pointer cursor on mouse-over */
} 

.success {background-color: #153a6d;} 
.success:hover {background-color: #d9edf7;}
</style>
<div class="container" style="margin-top: 50px;margin-bottom: 50px"> 
<div style="margin-top:20px;margin-botton:200px;">
<input type="search" placeholder="Search..">
 <a href="${pageContext.request.contextPath}/donation/donation_register_form.do"><button class="btn success">검색</button></a>
  <a href="${pageContext.request.contextPath}/donation/donation_register_form.do"><button class="btn success">기부하기</button></a>
</div>
	<%--기부 리스트 --%>
    <div class="w3-row" id="listSpace" style="margin-top: 50px;">
   
    <c:forEach items="${requestScope.listVO.donationList}" var="list">
    
    <div class="content w3-half w3-padding" > 
    <a href="${pageContext.request.contextPath}/donation/donation_detail.do?donationBicycleNo=${list.donationBicycleNo}">
     <img src="${pageContext.request.contextPath}/resources/upload/donation/${list.photoVO.photo1}" style="width:70%;"> 
    	 	<div class="overlay">
     		<span class="text" align="left"  width="70%"  >
      										${list.title }<br>
      										
      					</span>
     		</div>
     		</a>
     </div>
  
    </c:forEach>
    
   </div> 
   <%--paging --%>
   <div style="margin-top: 100px;margin-bottom: 10px">
   <c:set value="${requestScope.listVO.pagingBean}" var="pb"/>
   <c:forEach begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup }" var="no">
 		<c:choose>
 		<c:when test="${param.nowPage==no}">
 		${no}
 		</c:when>
 		<c:otherwise>
 		<a href="${pageContext.request.contextPath }/donation/donation_list.do?nowPage=${no}">${no}</a>
 		</c:otherwise> 
 		</c:choose>
   
   </c:forEach>
   
   </div>
  
 
</div>