<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br><br>
<c:forEach items = "${bList}" var = "list">
	<a href = "${pageContext.request.contextPath}/findBicycleByNo.do?bicycleNo=${list.bicycleNo}">${list.bicycleNo}</a>
</c:forEach>
