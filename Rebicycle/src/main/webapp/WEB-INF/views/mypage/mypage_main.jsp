<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      
      
      for(var j = 1;j<=rentListSize;j++){
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
                     
                     
                      table += "<tr>"+
                               "<td>" + data[j].rentNo + "</td>"+
                               "<td>" + data[j].memberVO.id + "</td>"+
                               "<td>" + data[j].calendarVO.startDay + "</td>"+
                               "<td>" + data[j].calendarVO.endDay + "</td>"+
                               "<td><input type = 'button' id = 'okBtn'  value = '수락' class='btn btn-info' ></td>"+
                               "</tr>";
                     
                     
                     dayMap.put("startDay", data[j].calendarVO.startDay.substring(0,10));
                     dayMap.put("endDay", data[j].calendarVO.endDay.substring(0,10));
                     startendDay[j] = dayMap;
                     //alert("ajax Rent"+data[j].calendarVO.startDay);
                     $.ajax({
                           type:"get",
                           data:"bicycleNo="+bicycleNo,
                           dataType:"json",
                           url:"${pageContext.request.contextPath}/dayCheck.do",
                      
                           success:function(data){                  
                               
                              var flag=0;

                                 for(var i=0; i<data.length; i++){
                                    
                                   if(((data[i].startDay<=startendDay[j-1].get("startDay"))&&(startendDay[j-1].get("endDay")<=data[i].endDay))){        
                                      flag=1;
                                    }                                     
                                 }//for-data.length    
                               
                                 checkFailList[j-1]=flag;
                                 if(checkFailList[j-1] == 0){
                                   // alert("dd불가능!!!!!!");
                                    //alert("eee"+$("#rentInfo tr:eq(+"+i+")").children().eq(4).html());
                                    $("#rentInfo tr:eq(+"+(j-1)+")").children().eq(4).html("<input type = 'button' id = 'okBtn'  value = '수락불가' class='btn btn-warning'>");
                                    $("#rentInfo tr:eq(+"+(j-1)+")").children().eq(4).click(function(event){
                                       event.stopPropagation();
                                       event.preventDefault();
                                    });
                                   return;
                                 }else{
                                    
                                    //alert("가능!!!!!");
                                 }
                           } //success                  
                        });//ajax
                     
                     
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
         }
      });
      
      $(".btn btn-danger").on("click", function(){
         
      });
      
      
       function newMap() {
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
   
   
</script>



 <br><br>
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
        
        
        <div style="padding-top:50px;"> </div>
        
        
        <div class="col-lg-3 col-md-3 hidden-sm hidden-xs">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="media">
                        <div align="center">
                            <img class="thumbnail img-responsive" src="${pageContext.request.contextPath}/resources/upload/member/${sessionScope.mvo.picture}" width="300px" height="300px">
                        </div>
                        <div class="media-body">
                            <hr>
                            <h3><strong>${requestScope.findVO.name}</strong></h3>
                            <p>자기소개내용</p>
                            <hr>
                            <h3><strong>Location</strong></h3>
                            <p>${requestScope.findVO.address}</p>
                            <hr>
                            <h3><strong>E-mail</strong></h3>
                            <p>${requestScope.findVO.email}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <div class="col-lg-4 col-xs-12">
            <div class="panel panel-default">
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
                              <c:forEach items="${requestScope.bicycleList}" var = "bList">
   
                                      <li><a href="#">${bList.detail}</a></li>
                                    
                                 </c:forEach>
                              </ul>
                        </div>
                    </span>
                    <br><br>
               <hr>
                   
                </div>
            </div>
            <hr>
            
            <!-- 등록 자전거 관리 -->
               <div class="panel panel-default">
                <div class="panel-body">
                    <span>
                        <h1 class="panel-title pull-left" style="font-size:30px">등록된 자전거<i class="fa fa-check text-success" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="John Doe is sharing with you"></i></h1>
                        
                        <%-- <div class="dropdown pull-right">
                            <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                --등록자전거--
                                <span class="caret"></span>
                            </button>
                            ${requestScope.bicycleList}
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                              <c:forEach items="${requestScope.registerList}" var = "bList">
   
                                      <li><a href="${pageContext.request.contextPath}/bicycle/bicycleModifyForm.do?memberId=${requestScope.findVO.id}&bicycleNo=${bList.bicycleNo}">${bList.bicycleNo}. ${bList.title}</a></li>
                                    
                                 </c:forEach>
                              </ul>
                        </div>  --%>
                    </span>
                   	
                   	
                    <br><br>
					<div align = "left" id = "regieterListView">
						<div>
						<ul>
                              	<c:forEach items="${requestScope.registerList}" var = "bList">
   
                                      <li><a href="${pageContext.request.contextPath}/bicycle/bicycleModifyForm.do?memberId=${requestScope.findVO.id}&bicycleNo=${bList.bicycleNo}">${bList.bicycleNo}. ${bList.title}</a></li>
                                    
                                </c:forEach>
                        </ul>
                        </div>
					</div>
                </div>
            </div>
        </div>
        
        
        
        
        <!-- -------------------------------- -->
        <!-- 요청 리스트 -->
            <div class="col-lg-4 col-xs-12">
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
                      <span align = "center" id = "bicycleInfo">요청 내역</span>
                         <table>
                     <thead>
                        <tr>
                           <th>No</th><th>Id</th><th>startDay</th><th>endDay</th><th>수락</th>
                        </tr>
                     </thead>
                     <tbody id = "rentInfo"></tbody>
                  </table>
                      </div>
                    <br><br>
               
                    
                </div>
            </div>
            <hr>
            
            <!-- 빌린 내역 리스트 -->
               <div class="panel panel-default">
                <div class="panel-body">
                    <span>
                        <h1 class="panel-title pull-left" style="font-size:30px">빌린 내역<i class="fa fa-check text-success" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="John Doe is sharing with you"></i></h1>

                    </span>
                    <br><br>
		            <div align="left" id = "rentListView">
			          <%--  ${requestScope.rentList} --%>
			            <div>
			            	<ul>
				               <c:forEach items="${requestScope.rentList}" var = "rList" varStatus="i">
				                  <li><a href ="${pageContext.request.contextPath}/bicycle/bicycle_findBicycleByNo.do?bicycleNo=${rList.bicycleVO.bicycleNo}&rentNo=${rList.rentNo}"> ${rList.bicycleVO.title}</a></li>                   
				               </c:forEach>
			               </ul>
			            </div>
		            </div>
                </div>
            </div>
            
          
        
        </div>
        

        
    </div>
</div>
    