<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Result</title>
</head>
<body>
	<c:if test="${joinResult == false}">
		<script type="text/javascript">
			alert('회원가입에 실패하였습니다.');
			location.href="main.jsp";
		</script>
	</c:if>
	
	<c:if test="${joinResult == true}">
		<script type="text/javascript">
			alert('회원가입에 성공하였습니다.');
			location.href="main.jsp";
		</script>
	</c:if>

</body>
</html>