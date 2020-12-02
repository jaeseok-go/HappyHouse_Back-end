<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Result</title>
</head>
<body>

	<c:if test="${updateResult == false}">
		<script type="text/javascript">
			alert('회원정보수정에 실패하였습니다.');
			location.href="main.jsp";
		</script>
	</c:if>
	
	<c:if test="${updateResult == true}">
		<script type="text/javascript">
			alert('회원정보수정에 성공하였습니다.');
			location.href="main.jsp";
		</script>
	</c:if>

</body>
</html>