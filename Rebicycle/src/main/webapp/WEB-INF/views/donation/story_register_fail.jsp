<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert("사연이 이미 존재합니다!");
location.href="${pageContext.request.contextPath}/donation/donation_detail.do?donationBicycleNo=${param.donationBicycleNo}"

</script>