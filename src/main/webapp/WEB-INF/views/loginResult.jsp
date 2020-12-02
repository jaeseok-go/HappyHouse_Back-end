<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Result</title>
</head>
<body>
	<c:if test="${empty loginInfo}">
		<script type="text/javascript">
			alert('로그인에 실패하였습니다.');
			location.href="main";
		</script>
	</c:if>
	
	<c:if test="${not empty loginInfo}">
		<script type="text/javascript">
			alert('로그인에 성공하였습니다.');
			location.href="main";
		</script>
	</c:if>
	

</body>
</html>