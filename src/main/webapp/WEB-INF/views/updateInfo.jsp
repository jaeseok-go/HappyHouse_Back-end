<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
<meta http-equiv="EXPIRES" content="MON, 22 Jul 2002 11:12:01 GMT">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light fixed-top shadow">
		<div class="container">
			<a class="navbar-brand" href="main.jsp">Happy House</a>

			<ul class="navbar-nav ml-auto">

				<c:if test="${empty loginInfo}">
					<li class="nav-item"><a class="nav-link" id="btn_login">로그인</a></li>
					<li class="nav-item"><a class="nav-link" id="btn_join">회원가입</a></li>
				</c:if>

				<c:if test="${not empty loginInfo}">
					<li class="nav-item"><a class="nav-link" id="welcome"><c:out
								value="${loginInfo}"></c:out>님 환영합니다.</a></li>
								
					<li class="nav-item"><a href="logout.do" class="nav-link" id="btn_logout">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" id="btn_update">내정보</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
	<div class="container" id="update" style="width: 500px; height: 600px;" align="center">
		<div class="">
			<h2>
				<strong>내 정보 수정</strong>
			</h2>
			<br />
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<!-- Start form -->
				<form action="update.do" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1" style="float: left;">ID</label> <input type="text"
							class="form-control" id="userId" name="userid" value="${info.userid}" disabled>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1" style="float: left;">Name</label> <input type="text"
							class="form-control" id="userName" name="username" value="${info.username}">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1" style="float: left;">Password</label> <input
							type="password" class="form-control" name="userpw"
							id="userPassword1" placeholder="비밀번호 입력">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1" style="float: left;">Password</label> <input
							type="password" class="form-control" name="password"
							id="userPassword2" placeholder="비밀번호 확인">
					</div>
					<div class="form-check">
						<input type="submit" class="btn btn-primary" id="btnLogin" value="확인">
						<button type="button" class="btn btn-primary" id="btnClose" onclick="location.href='main.jsp'">close</button>
						<button type="button" class="btn btn-danger" id="btnDelete" onclick="location.href='delete.do'">회원탈퇴</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="container">

		<footer class="navbar navbar-expand-md justify-content-end">
			<div class="row">
				<div class="col-md-12">
					<ul class="navbar-nav">
						<li><a class="nav-link text-secondary" href="#">소개</a></li>
						<li><a class="nav-link text-secondary" href="#">개인정보처리방침</a></li>
						<li><a class="nav-link text-secondary" href="#">이용약관</a></li>
						<li><a class="nav-link text-secondary" href="#">오시는길</a></li>
						<li><label class="nav-link text-secondary">&copy;
								SSAFY Corp.</label></li>
					</ul>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>