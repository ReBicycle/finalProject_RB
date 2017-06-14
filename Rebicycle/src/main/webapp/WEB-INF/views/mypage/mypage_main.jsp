<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
table {
    border-collapse: collapse;
    width: 100%;
}
th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}
tr:hover{background-color:#f5f5f5}
</style>
<script type="text/javascript">
   $(document).ready(function() {
      $("#reviewForm").click(function(){
         location.href="${pageContext.request.contextPath}/bicycle/bicycle_detail.do?";
      });
      
      //rentList${order.count}
      var rentListSize = $("a[id^='rentList']").size();
       //day N:N - 각각의 startDay , endDay를 담기 위한 배열 선언
      var startendDay=new Array();
      var checkFailList=new Array();

      
      $("#resetList").click(function(){
    	  $.ajax({
              type:"get",
              dataType:"json",
              url:"${pageContext.request.contextPath}/getRentSuccessAll.do?id=${sessionScope.mvo.id}",
              success:function(data){
                 //data[1]
                 var result = "";
                 var table = "";
                 for(var j = 0; j<data.length;j++){
                    
                    
                     table += "<tr>"+
                              "<td>" + data[j].rentNo + "</td>"+
                              "<td>" + data[j].memberVO.id + "</td>"+
                              "<td>" + data[j].calendarVO.startDay + "</td>"+
                              "<td>" + data[j].calendarVO.endDay + "</td>"+
                             
                              "</tr>";
                                         
                    
                    
                 }
                 $("#successInfo").html(table); 
              } //success
           });//ajax
      }); 
      
      $("#resetRentList").click(function(){
     	  $.ajax({
              type:"get",
              dataType:"json",
              url:"${pageContext.request.contextPath}/getRentAll.do?id=${sessionScope.mvo.id}",
              success:function(data){
                 //data[1]
                 var result = "";
                 var table = "";
                 for(var j = 0; j<data.length;j++){
                    
                    
                     table += "<tr>"+
                              "<td>" + data[j].rentNo + "</td>"+
                              "<td>" + data[j].memberVO.id + "</td>"+
                              "<td>" + data[j].calendarVO.startDay + "</td>"+
                              "<td>" + data[j].calendarVO.endDay + "</td>";
                              
                              
                     if(data[j].state == 2){
                        table += "<td><input type = 'button' id = 'noBtn'  value = '수락불가' class='btn btn-warning' ></td>"+
                                  			"</tr>";
                    }else{
                        table += "<td><input type = 'button' id = 'okBtn'  value = '수락' class='btn btn-success' ></td>"+
                        			"</tr>";
                    }
                                         
                    
                    
                 }
                 $("#rentInfo").html(table); 
              } //success
           });//ajax
      });
      for(var j = 1;j<=rentListSize;j++){
    	  
    	 $("#successList"+j).click(function(){
    		//alert("sss"); 
    		 var bicycleNo=$(this).children().val();
            $.ajax({
               type:"get",
               dataType:"json",
               url:"${pageContext.request.contextPath}/getRentSuccess.do?bicycleNo="+bicycleNo,
               success:function(data){
                  //data[1]
                  var result = "";
                  var table = "";
                  for(var j = 0; j<data.length;j++){
                     
                     
                      table += "<tr>"+
                               "<td>" + data[j].rentNo + "</td>"+
                               "<td>" + data[j].memberVO.id + "</td>"+
                               "<td>" + data[j].calendarVO.startDay + "</td>"+
                               "<td>" + data[j].calendarVO.endDay + "</td>"+
                              
                               "</tr>";
                                          
                     
                     
                  }
                  $("#successInfo").html(table); 
               } //success
            });//ajax
    	 });
    	  
    	
    	  
         $("#rentList"+j).click(function(){
            
             
            var bicycleNo=$(this).children().val();
            $.ajax({
               type:"get",
               dataType:"json",
               url:"${pageContext.request.contextPath}/getRentByBicycleNo.do?bicycleNo="+bicycleNo,
               success:function(data){
                  //data[1]
                  var result = "";
                  var table = "";
                  for(var j = 0; j<data.length;j++){
                     var dayMap = newMap();
                     
                      table += 
                    	  	   "<tr>"+
                               "<td>" + data[j].rentNo +"</td>"+
                               "<td>" + data[j].memberVO.id + "</td>"+                                                                                        
                               "<td>" + data[j].calendarVO.startDay + "</td>"+
                               "<td>" + data[j].calendarVO.endDay + "</td>";
                      if(data[j].state == 2){
                    	  table += "<td><input type = 'button' id = 'noBtn'  value = '수락불가' class='btn btn-warning' ></td>"+
                          			"</tr>";
                      }else{
                    	  table += "<td><input type = 'button' id = 'okBtn'  value = '수락' class='btn btn-success' ></td>"+
                			"</tr>";
                      }
                               
                  
                  }
                  
                  $("#rentInfo").html(table); 
               } //success
            });//ajax
            
         });
      }
      
      
      $("#rentInfo").on("click","#okBtn" ,function(){
    	  
         if(confirm("수락하시겠습니까?")){
            var rentNo = $("#okBtn").parent().parent().children().eq(0).text();
           
            location.href = "${pageContext.request.contextPath}/rentOk.do?rentNo="+rentNo;
         	//수락한 자전거를 제외한 나머지 내가 등록한 자전거의 요청을 가능일과 비교
         	
         }
      });
      
      function newMap(){
         var map = {};
              map.value = {};
              map.getKey = function(id) {
                return "k_"+id;
              };
              map.put = function(id, value) {
                var key = map.getKey(id);
                map.value[key] = value;
              };
              map.contains = function(id) {
                var key = map.getKey(id);
                if(map.value[key]) {
                  return true;
                } else {
                  return false;
                }
              };
              map.get = function(id) {
                var key = map.getKey(id);
                if(map.value[key]) {
                  return map.value[key];
                }
                return null;
              };
              map.remove = function(id) {
                var key = map.getKey(id);
                if(map.contains(id)){
                  map.value[key] = undefined;
                }
              };
             
              return map;
            }
           
   });
   
    function toDetail(bicycleNo,rentNo){
  		//alert(bicycleNo + "	TEST!!");
  		//alert(rentNo);
  		 var b = bicycleNo;
  	 	var r = rentNo;
  	 location.href = "${pageContext.request.contextPath}/bicycle/bicycle_findBicycleByNo.do?bicycleNo="+b+"&rentNo="+r;
   }
    
    //<li><a href="${pageContext.request.contextPath}/bicycle/bicycleModifyForm.do?memberId=${requestScope.findVO.id}&bicycleNo=${bList.bicycleNo}">${bList.bicycleNo}. ${bList.title}</a></li>
    
	function toModify(bicycleNo){
 		//alert(memberId + "	TESTTEST");
 		//alert("TEST		" + bicycleNo);
 	 	var m = "${requestScope.findVO.id}";
 	 	var b = bicycleNo;
		location.href = "${pageContext.request.contextPath}/bicycle/bicycleModifyForm.do?memberId="+m+"&bicycleNo="+b;
	}
	
	function toDelete(bicycleNo){
 	 	var b = bicycleNo;
		location.href = "${pageContext.request.contextPath}/bicycle/bicycleDeleteForm.do?bicycleNo="+b;
	}
   
</script>

<style>
	table,th,td{
		text-align:center;
	
	}
</style>

 <br><br>
<<<<<<< HEAD
<div class="mainbody container-fluid">
    <div class="row">
        <div class="navbar-wrapper">
            <div class="container-fluid">
                <div class="navbar navbar-default navbar-static-top" role="navigation">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span
                                    class="icon-bar"></span><span class="icon-bar"></span>
                            </button> 
                            <a class="navbar-brand" href="./ORqmj" style="margin-right:-8px; margin-top:-5px;">
                                <img alt="Brand" src="https://lut.im/7trApsDX08/GeilMRp1FIm4f2p7.png" width="30px" height="30px">
                            </a>
                            <a class="navbar-brand" href="./ORqmj">Project*</a>
                            <i class="brand_network"></i>
                        </div>
                        <div class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
=======
<div class="mainbody container-fluid" align = "center">
<!--  프로필-->
>>>>>>> branch 'master' of https://github.com/ReBicycle/finalProject_RB.git

<<<<<<< HEAD
                                <li><span class="badge badge-important">2</span><a href="#"><i class="fa fa-bell-o fa-lg" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-envelope-o fa-lg" aria-hidden="true"></i></a></li>
                            </ul> 
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <span class="user-avatar pull-left" style="margin-right:8px; margin-top:-5px;">
                                        <img src="https://lut.im/7JCpw12uUT/mY0Mb78SvSIcjvkf.png" class="img-responsive img-circle" title="John Doe" alt="John Doe" width="30px" height="30px">
                                    </span>
                                    <span class="user-name">
                                        ${requestScope.findVO.name}
                                    </span>
                            
                                    <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <div class="navbar-content">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <img src="https://lut.im/7JCpw12uUT/mY0Mb78SvSIcjvkf.png" alt="Alternate Text" class="img-responsive" width="120px" height="120px" />
                                                        <p class="text-center small">
                                                            <a href="./3X6zm">Change Photo</a></p>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <span>John Doe</span>
                                                        <p class="text-muted small">
                                                            example@pods.tld</p>
                                                        <div class="divider">
                                                        </div>
                                                        <a href="./56ExR" class="btn btn-default btn-xs"><i class="fa fa-user-o" aria-hidden="true"></i> Profile</a>
                                                        <a href="#" class="btn btn-default btn-xs"><i class="fa fa-address-card-o" aria-hidden="true"></i> Contacts</a>
                                                        <a href="#" class="btn btn-default btn-xs"><i class="fa fa-cogs" aria-hidden="true"></i> Settings</a>
                                                        <a href="#" class="btn btn-default btn-xs"><i class="fa fa-question-circle-o" aria-hidden="true"></i> Help!</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="navbar-footer">
                                                <div class="navbar-footer-content">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <a href="#" class="btn btn-default btn-sm"><i class="fa fa-unlock-alt" aria-hidden="true"></i> Change Passowrd</a>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <a href="#" class="btn btn-default btn-sm pull-right"><i class="fa fa-power-off" aria-hidden="true"></i> Sign Out</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <div style="padding-top:50px;"> </div>
        
        
        <div class="col-lg-3 col-md-3 hidden-sm hidden-xs">
=======
<div class = "row" style = "padding-left:100px;">
 	<div class="col-lg-3 col-md-3 hidden-sm hidden-xs">
>>>>>>> branch 'master' of https://github.com/ReBicycle/finalProject_RB.git
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="media">
                        <div align="center">
                            <img class="thumbnail img-responsive" src="${pageContext.request.contextPath}/resources/upload/member/${sessionScope.mvo.picture}" width="300px" height="300px">
                        </div>
                        <div class="media-body">
                            <hr>
                            <h3><strong>${requestScope.findVO.name}</strong></h3>
                          
                            <hr>
                            <h3><strong>Location</strong></h3>
                            <c:set var="addr" value="${requestScope.findVO.address}"/>       
							<c:set var="addd" value="${fn:split(addr, '%') }" />
							<c:forEach items="${addd }" var="addd">
								<p style="font-size: 15px">${addd }</p>
							</c:forEach>
                            <hr>
                            <h3><strong>E-mail</strong></h3>
                            <p style="font-size: 15px">${requestScope.findVO.email}</p>
                        </div>
                    </div>
                </div>
            </div>
    </div>

    <div class="col-lg-7 col-md-7 hidden-sm hidden-xs"> 
         		<ul class="nav nav-tabs">
				    <li class="active"><a data-toggle="tab" href="#home">빌려준내역</a></li>
				    <li><a data-toggle="tab" href="#menu1">요청 리스트</a></li>
				    <li><a data-toggle="tab" href="#menu2">빌린 내역</a></li>
				    <li><a data-toggle="tab" href="#menu3">등록 자전거 관리</a></li>
				    
				    
				    
				    
				    
				</ul>
				  
			<div class="tab-content">
        

			        <div id="home" class="tab-pane fade in active">
			            <div class="panel panel-default">
			         	<!-- 빌려준내역 -->
			                <div class="panel-body">
			                    <span>
			                        <h1 class="panel-title pull-left" style="font-size:30px">빌려준내역<i class="fa fa-check text-success" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="John Doe is sharing with you"></i></h1>
			                        
			                        <div class="dropdown pull-right">
			                            <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
			                                --등록자전거--
			                                <span class="caret"></span>
			                            </button>
			                            
			                           <%--  ${requestScope.bicycleList} --%>
			                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
			                            	  <li><a id = "resetList">-----전체-----</a></li>
			                              <c:forEach items="${requestScope.registerList}" var = "registerList" varStatus = "order">
			                           
			                                   <li>
			                                      <a id = "successList${order.count}">${registerList.title}
			                                       <input type = "hidden" id = "successBicycleNo${order.count}"  value ="${registerList.bicycleNo}"></a>
			                                   </li>
			
			                                 </c:forEach>
			                              </ul>
			                        </div>
			                    </span>
			                    <br><br>
			              		<div align = "left" id ="rentView">
			                      
			                         <table>
					                     <thead>
					                        <tr>
					                           <th>No</th><th>Id</th><th>startDay</th><th>endDay</th>
					                        </tr>
					                     </thead>
					                     <tbody id = "successInfo">
					                     	<c:forEach items = "${requestScope.rentSuccessAllList }" var = "rentSuccessAllList">
					                     		<tr>
					                     			<td>${rentSuccessAllList.rentNo }</td>
					                     			<td>${rentSuccessAllList.memberVO.id }</td>
					                     			<td>${rentSuccessAllList.calendarVO.startDay }</td>
					                     			<td>${rentSuccessAllList.calendarVO.endDay }</td>
					                     		</tr> 
					      
					                     	</c:forEach>
					                     </tbody>
			                  		</table>
			                      </div>
			                   
			                </div>
			            </div>
			         </div>   
			            
			        <div id="menu3" class="tab-pane fade">  
			            <!-- 등록 자전거 관리 -->
			               <div class="panel panel-default">
			                <div class="panel-body">
			                    <span>
			                        <h1 class="panel-title pull-left" style="font-size:30px">등록된 자전거 관리<i class="fa fa-check text-success" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="John Doe is sharing with you"></i></h1>
			 
			                    </span>
			                   	
			                   	
			                    <br><br>
								<div align = "left" id = "regieterListView">
									<div>
										<table>
											<thead align = "center">
											<tr>
												<th>No</th><th>Title</th><th>수정</th>
											</tr>
											
											</thead>
												
											<tbody id = "registerTbody">
												<c:forEach items="${requestScope.registerList}" var = "bList">
				   
				                                   <tr>   
				                                   	<td>${bList.bicycleNo}</td>
				                                   	<td> ${bList.title}</td>
				                                   	<td>
				                                   	
				                                   		<input type = "button" id = "modifyBtn" class ="btn btn-success" value = "수정" onclick = "toModify(${bList.bicycleNo})"> 
				                                   		<input type="button" id ="deleteBtn" class="btn btn-warning" value="삭제" onclick="toDelete(${bList.bicycleNo})">
				                                   	<%-- <a href="${pageContext.request.contextPath}/bicycle/bicycleModifyForm.do?memberId=${requestScope.findVO.id}&bicycleNo=${bList.bicycleNo}">수정</a>
				                                   	 --%>
				                                   	</td>
				                                   	
				                                  <%--  <li><a href="${pageContext.request.contextPath}/bicycle/bicycleModifyForm.do?memberId=${requestScope.findVO.id}&bicycleNo=${bList.bicycleNo}">${bList.bicycleNo}. ${bList.title}</a></li> --%>
				                                    </tr>
				                                </c:forEach>
											
											</tbody>
										</table>
									<ul>
			                              	
			                        </ul>
			                        </div>
								</div>
			                </div>
			            </div>
			         </div>
		       
			        <!-- -------------------------------- -->
			        
			        <div id="menu1" class="tab-pane fade">
			        <!-- 요청 리스트 -->
			            <div class="panel panel-default">
			                <div class="panel-body">
			                    <span>
			                        <h1 class="panel-title pull-left" style="font-size:30px">요청 리스트<i class="fa fa-check text-success" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="John Doe is sharing with you"></i></h1>
			                        
			                        <div class="dropdown pull-right">
			                            <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
			                                --등록자전거--
			                                <span class="caret"></span>
			                            </button>
			                     <%-- ${requestScope.[0].memberVO.id} --%>
			                   
			                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
			                         <li><a id = "resetRentList">-----전체-----</a></li>
			                                 <c:forEach items="${requestScope.registerList}" var = "registerList" varStatus = "order">
			                           
			                                   <li>
			                                      <a id = "rentList${order.count}">${registerList.title}
			                                       <input type = "hidden" id = "rentBicycleNo${order.count}"  value ="${registerList.bicycleNo}"></a>
			                                   </li>
			
			                                 </c:forEach>
			                       </ul> 
			                       
			                     </div>
			                    </span>
			                    <br><br>
			                      <div align = "left" id ="rentView">
			                      <span id = "bicycleNoView"></span>
			                         <table>
					                     <thead>
					                        <tr>
					                           <th>No</th><th>Id</th><th>startDay</th><th>endDay</th><th>상태</th>
					                        </tr>
					                     </thead>
					                     
					                     <tbody id = "rentInfo">
					                     	<c:forEach items = "${requestScope.rentRequestAllList}" var = "rentRequestAllList">
					                     		<tr>
					                     			<td>${rentRequestAllList.rentNo }</td>
					                     			<td>${rentRequestAllList.memberVO.id }</td>
					                     			<td>${rentRequestAllList.calendarVO.startDay }</td>
					                     			<td>${rentRequestAllList.calendarVO.endDay }</td>
					                     			
					                     			<c:if test="${rentRequestAllList.state != 2}">
					                     			<td><input type = "button" id = "okBtn"  value = "수락" class="btn btn-success" ></td>
					                     			</c:if>
					                     			<c:if test = "${rentRequestAllList.state == 2}">
					                     			<td><input type = "button" id = "noBtn"  value = "수락불가" class="btn btn-warning" ></td>
					                     			</c:if>
					                     		</tr>
					                     	</c:forEach>
					                     </tbody>
			                  		</table>
			                      </div>
			                    <br><br>
			               
			                    
			                </div>
			            </div>
			         </div>   
			           
			        <div id="menu2" class="tab-pane fade"> 
	            <!-- 빌린 내역 리스트 -->
			            <div class="panel panel-default">
			                <div class="panel-body">
			                    <span>
			                        <h1 class="panel-title pull-left" style="font-size:30px">빌린 내역<i class="fa fa-check text-success" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="John Doe is sharing with you"></i></h1>
			                    </span>
			                    <br><br>
					            <div align="left" id = "rentListView">
						          <%-- ${requestScope.rentList} --%>
						          
						           <div align = "left" id ="rListView">
			                      
			                         <table>
					                     <thead>
					                        <tr>
					                           <th>No</th><th>bicycle Title</th><th>startDay</th><th>endDay</th><th>후기/별점</th>
					                        </tr>
					                     </thead>
					                  	 <tbody>
												<c:forEach items="${requestScope.rentList}" var = "rList" varStatus="i">
				   
				                                   <tr>   
				                                   	<td>${rList.rentNo}</td>
				                                   	<td>${rList.bicycleVO.title }</td>
				                                   	<td>${rList.calendarVO.startDay }</td>
				                                   	<td>${rList.calendarVO.endDay }</td>
				                                   	<c:if test= "${rList.state ==0}">
				                                   		<td><input type = "button" id = "" class ="btn btn-warning" value = "수락대기상태"></td>
				                                   	</c:if>
				                                   	
				                                   	<c:if test = "${rList.state ==1}">
				                                   		<td>
				                                   			<input type = "button" id = "writeBtn" class =" btn btn-success" value = "후기/별점 작성" onclick = "toDetail(${rList.bicycleVO.bicycleNo},${rList.rentNo})">
				                                   			<%-- <a href ="${pageContext.request.contextPath}/bicycle/bicycle_findBicycleByNo.do?bicycleNo=${rList.bicycleVO.bicycleNo}&rentNo=${rList.rentNo}"> 후기별점작성</a>
				                                   			 --%>
				                                   		</td>
				                                   	</c:if>
													<c:if test = "${rList.state ==2}">
				                                   		<td>
				                                   			<input type = "button" class =" btn btn-warning" value = "대여 불가">
				                                   			
				                                   		</td>
				                                   	</c:if>

				                                   	<c:if test="${rList.state == 3}">
				                                   		<td>
				                                   			<input type = "button" id = "" class =" btn btn-success" value = "후기작성 완료">
				                                   			
				                                   		</td>
				                                   	</c:if>	
												
				                                    </tr>
				                                </c:forEach>
											
										</tbody>
			                  		</table>
			                      </div>
						          
					            </div>
			                </div>
			            </div>
	    	</div>
		  </div> 
        
    	</div>
</div>	