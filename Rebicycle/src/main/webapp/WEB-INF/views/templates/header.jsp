<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>   
    	<nav class="navbar navbar-inverse">
    	<!-- Navigation -->
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do">Rebicycle</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <c:choose>
					<c:when test="${sessionScope.mvo==null}">
                    <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/member/member_login.do">login</a>
                    </li>
                    <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/member/member_register_form.do">join</a>
                   </li>
                 
                    
                   
                    </c:when>
                  
                    <c:otherwise>
						
					 <li class="page-scroll">
                      	<a>${sessionScope.mvo.name} 님 로그인</a> 
                     </li>
                      <li class="page-scroll">
						<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
                      </li>
                      
                        <li class="page-scroll">
						<a href="${pageContext.request.contextPath}/memberModifyForm.do">회원정보수정</a>
                      </li>
                       <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/bicycle/bicycle_register_form.do">자전거등록</a>
	                    </li>
	      
	                    
	                    <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/mypage/mypage_main.do">마이페이지</a>
                   		</li>
                     
					</c:otherwise>
					</c:choose> 
					 <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/bicycle/bicycle_map.do">map</a>
                    </li>
                     <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/board/board_list.do">board</a>
                    </li>
                    
                     <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/bicycle/bicycle_search_list_test.do">자전거리스트 테스트</a>
                    </li>                 
                     <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/listViewTest.do">자전거리스트테스트</a>
                    </li>
                    <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/bicycle/selectable.do">달력</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
