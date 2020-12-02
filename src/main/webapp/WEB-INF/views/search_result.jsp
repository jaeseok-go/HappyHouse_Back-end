<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search_result.jsp</title>
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
<script type="text/javascript">
	$(function() {
		$('#btn_login').click(function() {
			$('#login').show();
		})
		$('#btn_join').click(function() {
			$('#join').show();
		})
		$('#btn_update').click(function() {
			$('#update').show();
		})
	})
	$(document).ready(function(){
		$.get("${pageContext.request.contextPath}/map"
				,{act:$("choice").val(), search:$("#search").val()}
				,function(data, status){
					geocode(data);
				}//function
				, "json"
		);//get
	});
	function geocode(jsonData) {
		let idx = 0;
		$.each(jsonData, function(index, vo) {
			let tmpLat;
			let tmpLng;
			$.get("https://maps.googleapis.com/maps/api/geocode/json"
					,{	key:'AIzaSyAfpdYGfTEMy-VD6cAFgPDN9UTKopY48rc'
						, address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
					}
					, function(data, status) {
						//alert(data.results[0].geometry.location.lat);
						tmpLat = data.results[0].geometry.location.lat;
						tmpLng = data.results[0].geometry.location.lng;
						$("#lat_"+index).text(tmpLat);
						$("#lng_"+index).text(tmpLng);
						addMarker(tmpLat, tmpLng, vo.aptName, vo.jibun);
					}
					, "json"
			);//get
		});//each
	}
</script>
<style type="text/css">
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}

#info {
	height: 115px;
	width: 50%;
}

#info tr {
	height: 120px;
	width: 100%;
}

#info img {
	width: 200px;
	height: 115px;
}
</style>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light fixed-top shadow">
		<div class="container">
			<a class="navbar-brand" href="/happyhouse/">Happy House</a>

			<ul class="navbar-nav ml-auto">

				<c:if test="${empty loginInfo}">
					<li class="nav-item"><a class="nav-link" id="btn_login">로그인</a></li>
					<li class="nav-item"><a class="nav-link" id="btn_join">회원가입</a></li>
					<li class="nav-item"><a href="qna" class="nav-link">QnA</a></li>
				</c:if>

				<c:if test="${not empty loginInfo}">
					<li class="nav-item"><a class="nav-link" id="welcome"><c:out
								value="${loginInfo.userid}"></c:out>님 환영합니다.</a></li>	
					<li class="nav-item"><a href="logout" class="nav-link" id="btn_logout">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" id="btn_update">내정보</a></li>
					<li class="nav-item"><a href="qna" class="nav-link">QnA</a></li>				
				</c:if>
				
			</ul>
		</div>
	</nav>
	<div class="modal" id="login" style="display: none;">
		<div class="modal-content">
			<h2>
				<strong>로그인</strong>
			</h2>
			<br />
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<!-- Start form -->
				<form action="login.do" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">ID</label> <input type="text"
							class="form-control" id="userId" name='userid'
							placeholder="Enter ID">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" name="userpw"
							id="userPassword" placeholder="Password">
					</div>
					<div class="form-check">
						<button type="submit" class="btn btn-primary" id="btnLogin">login</button>
						<button type="button" class="btn btn-primary" id="btnClose"
							onclick="location.href='main.jsp'">close</button>
						<button type="button" class="btn btn-primary" id="btnFind"
							onclick="location.href='find_password.html'">Find</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal" id="join" style="display: none;">
		<div class="modal-content">
			<h2>
				<strong>회원가입</strong>
			</h2>
			<br />
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<!-- Start form -->
				<form action="join.do" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">ID</label><br> <input
							type="text" class="form-control" id="userId"
							style="width: 400px; float: left" placeholder="Enter ID"
							name="userid">
						<button class="btn btn-primary" style="margin-left: 8px">중복체크</button>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Name</label> <input type="text"
							class="form-control" id="userName" placeholder="Enter Name"
							name="username">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" name="userpw"
							id="userPassword" placeholder="Password">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword2">Password Check</label> <input
							type="password" class="form-control" name="password"
							id="userPassword" placeholder="Password">
					</div>
					<div class="form-check">
						<input type="submit" class="btn btn-primary" id="btnJoin"
							value="Join">
						<button type="button" class="btn btn-primary" id="btnClose"
							onclick="location.href='main.jsp'">close</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="modal" id="update" style="display: none;">
		<div class="modal-content">
			<h2>
				<a href="info.do"><strong>내 정보 수정</strong></a>
			</h2>
			<br />
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<!-- Start form -->
				<form action="" method="">
					<div class="form-group">
						<label for="exampleInputEmail1">ID</label> <input type="text"
							class="form-control" id="userId" value="${info.userid}" disabled>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Name</label> <input type="text"
							class="form-control" id="userName" value="${info.username}"
							disabled>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="text" class="form-control" name="password"
							id="userPassword" value="${info.userpw}" disabled>
					</div>

					<div class="form-check">
						<button type="button" class="btn btn-primary" id="btnLogin"
							onclick="location.href='updateInfo.jsp'">수정</button>
						<button type="button" class="btn btn-primary" id="btnClose"
							onclick="location.href='main.jsp'">close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="" align="center" style="margin-top: 60px">
			<form action="search" method="get">
				<select name="choice">
					<option value="apart">아파트 이름</option>
					<option value="dong">동 이름</option>
					<option value="hospital">선별진료소 이름</option>
				</select> <input type="search" name="search" id="search" size="120"
					value="${dong}"> <input class="btn btn-danger"
					type="submit" value="검색">
			</form>
		</div>
		<div id="map"
			style="width: 50%; height: 650px; margin: auto; float: left"></div>
		<script defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfpdYGfTEMy-VD6cAFgPDN9UTKopY48rc&callback=initMap"></script>
		<script>
			var multi = {lat: 37.5665734, lng: 126.978179};
			var map;
			function initMap() {
				map = new google.maps.Map(document.getElementById('map'), {
					center: multi, zoom: 12
				});
// 				var marker = new google.maps.Marker({position: multi, map: map});
			}
			function addMarker(tmpLat, tmpLng, aptName, jibun) {
				var marker = new google.maps.Marker({
					position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
					label: aptName,
					title: aptName
				});
				marker.addListener('click', function() {
					map.setZoom(17);
					map.setCenter(marker.getPosition());
					callHouseDealInfo(jibun);
				});
				marker.setMap(map);
			}
			function callHouseDealInfo(jibun) {
				alert('지번 : '+jibun);
			}
		</script>

		<table class="table" id="info">
			<c:choose>
				<c:when test="${empty searchInfo and empty hospitalInfo}">
					<tr>
						<td>검색결과가 없습니다.</td>
					</tr>
				</c:when>
				<c:when test="${not empty hospitalInfo}">
					<c:forEach items="${hospitalInfo}" var="info">
						<tr>
							<td><img src="./img/평창동삼성.jfif"></td>
							<td>
								<ul type="none">
									<li><strong>${info.hpt_name}</strong></li>
									<li>동 : ${info.dongcode}</li>
									<li>지번 : ${info.hpt_jibun}</li>
									<li>건축년도 : ${info.hpt_buildyear}</li>
								</ul>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach items="${searchInfo}" var="info">
						<tr>
							<td><img src="./img/평창동삼성.jfif"></td>
							<td>
								<ul type="none">
									<li><strong>${info.aptName}</strong></li>
									<li>동 : ${info.dong}</li>
									<li>실거래가 : ${info.dealAmount}</li>
									<li>면적 : ${info.area}</li>
								</ul>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<br>
	<div style="margin-top: 10px; float: left">
		<footer class="navbar navbar-expand-md justify-content-end"
			style="float: clear">
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