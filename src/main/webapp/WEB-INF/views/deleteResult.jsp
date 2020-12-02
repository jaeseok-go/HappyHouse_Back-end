<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Result</title>
</head>
<body>

	<c:if test="${deleteResult == false}">
		<script type="text/javascript">
			alert('회원 정보 삭제에 실패하였습니다.');
			location.href="main.jsp";
		</script>
	</c:if>
	
	<c:if test="${deleteResult == true}">
		<script type="text/javascript">
			alert('회원 정보 삭제에 성공하였습니다.');
			<%
				session.invalidate();
			%>
			location.href="main.jsp";
		</script>
	</c:if>

</body>
</html>