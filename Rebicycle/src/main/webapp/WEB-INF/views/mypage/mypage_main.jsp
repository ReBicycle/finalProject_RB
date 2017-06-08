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
		
			
		$(".dropdown-menu li a").on("click", function(){
			//alert("ss");
			//alert ($("input[id^='rentBicycleNo']").val());
			
				
				var bSize = $("input[id^='rentBicycleNo']").size();
				for(var i = 1; i<=bSize;i++){
					var bicycleNo = $("#rentBicycleNo"+i).val();
	
					//alert("1" + bicycleNo);
					$.ajax({
						type:"get",
						dataType:"json",
						url:"${pageContext.request.contextPath}/getRentByBicycleNo.do?bicycleNo="+bicycleNo,
						success:function(data){
							//data[1]
							var result = "";
							var table = "";
							for(var i = 0; i<data.length;i++){
								//alert(data);
								/* alert("rentNo" + data[i].rentNo);
								alert("빌린사람 id" + data[i].memberVO.id)
								alert("신청시작일" + data[i].calendarVO.startDay);
								alert("신청종료일" + data[i].calendarVO.endDay);
								result += data[i].rentNo + "/" + data[i].memberVO.id + "/" + data[i].calendarVO.startDay + "/" + data[i].calendarVO.endDay;
								 */
								 table += "<tr>"+
									 		"<td>" + data[i].rentNo + "</td>"+
									 		"<td>" + data[i].memberVO.id + "</td>"+
									 		"<td>" + data[i].calendarVO.startDay + "</td>"+
									 		"<td>" + data[i].calendarVO.endDay + "</td>"+
									 		"<td><input type = 'button' id = 'okBtn'  value = '수락' class='btn btn-info' ></td>"+
									 		"<td><input type = 'button' id = 'delBtn' value = '거절' class='btn btn-danger'></td>"+
									 		"</tr>"
			
							}
							
							$("#rentInfo").html(table); 
							
						} //success
					});//ajax
				}
		});//a click
		
		$("#rentInfo").on("click","#okBtn" ,function(){
			if(confirm("수락하시겠습니까?")){
				var rentNo = $("#okBtn").parent().parent().children().eq(0).text();
				location.href = "${pageContext.request.contextPath}/rentOk.do?rentNo="+rentNo;
			}
		});
		
		$(".btn btn-danger").on("click", function(){
			
		});
		
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
                            <img class="thumbnail img-responsive" src="${pageContext.request.contextPath}/resources/upload/member/${requestScope.findVO.picture}" width="300px" height="300px">
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
                    <span class="pull-left">
                        <a href="#" class="btn btn-link" style="text-decoration:none;"><i class="fa fa-fw fa-files-o" aria-hidden="true"></i> Posts</a>
                        <a href="#" class="btn btn-link" style="text-decoration:none;"><i class="fa fa-fw fa-picture-o" aria-hidden="true"></i> Photos <span class="badge">42</span></a>
                        <a href="#" class="btn btn-link" style="text-decoration:none;"><i class="fa fa-fw fa-users" aria-hidden="true"></i> Contacts <span class="badge">42</span></a>
                    </span>
                    <span class="pull-right">
                        <a href="#" class="btn btn-link" style="text-decoration:none;"><i class="fa fa-lg fa-at" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="Mention"></i></a>
                        <a href="#" class="btn btn-link" style="text-decoration:none;"><i class="fa fa-lg fa-envelope-o" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="Message"></i></a>
                        <a href="#" class="btn btn-link" style="text-decoration:none;"><i class="fa fa-lg fa-ban" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="Ignore"></i></a>
                    </span>
                </div>
            </div>
            <hr>
            
            <!-- 등록 자전거 관리 -->
               <div class="panel panel-default">
                <div class="panel-body">
                    <span>
                        <h1 class="panel-title pull-left" style="font-size:30px">등록된 자전거<i class="fa fa-check text-success" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="John Doe is sharing with you"></i></h1>
                        
                        <div class="dropdown pull-right">
                            <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                --등록자전거--
                                <span class="caret"></span>
                            </button>
                           <%--  ${requestScope.bicycleList} --%>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
	                           <c:forEach items="${requestScope.registerList}" var = "bList">
	
		                                <li><a href="${pageContext.request.contextPath}/bicycleModifyForm.do?memberId=${requestScope.findVO.id}&bicycleNo=${bList.bicycleNo}">${bList.bicycleNo}. ${bList.title}</a></li>
		                              
	                       		 </c:forEach>
                       		 </ul>
                        </div>
                    </span>
                    <br><br>
					<hr>
                    <span class="pull-left">
                        <a href="#" class="btn btn-link" style="text-decoration:none;"><i class="fa fa-fw fa-files-o" aria-hidden="true"></i> Posts</a>
                        <a href="#" class="btn btn-link" style="text-decoration:none;"><i class="fa fa-fw fa-picture-o" aria-hidden="true"></i> Photos <span class="badge">42</span></a>
                        <a href="#" class="btn btn-link" style="text-decoration:none;"><i class="fa fa-fw fa-users" aria-hidden="true"></i> Contacts <span class="badge">42</span></a>
                    </span>
                    <span class="pull-right">
                        <a href="#" class="btn btn-link" style="text-decoration:none;"><i class="fa fa-lg fa-at" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="Mention"></i></a>
                        <a href="#" class="btn btn-link" style="text-decoration:none;"><i class="fa fa-lg fa-envelope-o" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="Message"></i></a>
                        <a href="#" class="btn btn-link" style="text-decoration:none;"><i class="fa fa-lg fa-ban" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="Ignore"></i></a>
                    </span>
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
                     <%-- ${requestScope.rentRequestList[0].memberVO.id} --%>
                    
                     	<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
	                           	<c:forEach items="${requestScope.registerList}" var = "registerList" varStatus = "order">

		                             <li><a id = "rentList${order.count}">${registerList.title}</a></li>
		                             <input type = "hidden" id = "rentBicycleNo${order.count}"  value ="${registerList.bicycleNo}">

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
									<th>No</th><th>Id</th><th>startDay</th><th>endDay</th><th>수락</th><th>거절</th>
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
                        
                        <div class="dropdown pull-right">
                            <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                --등록자전거--
                                <span class="caret"></span>
                            </button>
                           <%--  ${requestScope.bicycleList} --%>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
	                           
                       		 </ul>
                        </div>
                    </span>
                    <br><br>
				<div align="left">
					<c:forEach items="${requestScope.rentList}" var = "rList" varStatus="i">
						<a href ="${pageContext.request.contextPath}/findBicycleByNo.do?bicycleNo=${rList.bicycleVO.bicycleNo}&rentNo=${rList.rentNo}"> ${rList.bicycleVO.title}</a><br>                       
	                </c:forEach>
				
				</div>
                </div>
            </div>
            
          
        
        </div>
        

        
    </div>
</div>
    