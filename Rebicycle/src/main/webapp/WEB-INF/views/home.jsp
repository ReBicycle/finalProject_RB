<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    
    
    <!-- Header -->
    <header  style="background-image: url('${pageContext.request.contextPath}/resources/img/seoul3.jpg'); background-repeat: no-repeat; background-size: cover; " >
        <div class="container " id="maincontent" tabindex="-1" >
            <div class="row" >
                <div class="col-lg-12" >
                    <div class="intro-text" >
                    <h3 class="name"></h3>
                        <h3>Search for bicycles for you.</h3><br>
                        <span style="color:black">
                        <form action="${pageContext.request.contextPath}/bicycle/bicycle_search_list.do" >
                       <input type="search" name="address" size="30" value="input location"> <input type="date" name="startDate"><input type="date" name="endDate">
                       <input type="submit" value="검색">
                      	</form>
                       </span>
                        
                        <!-- <hr class="star-light"> --><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <!-- <span class="skills">Web Developer - Graphic Artist - User Experience Designer</span> -->
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    

 