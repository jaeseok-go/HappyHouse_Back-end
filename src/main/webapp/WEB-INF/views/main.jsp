<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ssafy.happy.model.dto.MemberDto"%>

<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
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
		$('#btnClose').click(function(){
			$('#login').hide();
		})
		$('#btn_join').click(function() {
			$('#join').show();
		})
		$('#join_close').click(function() {
			$('#join').hide();
		})
		$('#btn_update').click(function() {
			$('#update').show();
		})
		$('#update_close').click(function(){
			$('#update').hide();
		})
		$('#btnDelete').click(function(){
			$.ajax({
				 url : "deleteInfo",
				 type : "post",
				 error  : function(xhr, status,message){
					 alert("error:"+message);
				 },
				 success : function(data){
					 alert("아이디가 성공적으로 삭제 되었습니다");
				 }
			 });
		})
		$('#btnFind').click(function(){
			$('#find').show();
		})
		$('#btnGetFoundPW').click(function(){
			let id = $('#foundid').val();
			$.ajax({
				url : "findInfo/"+id,
				 type : "get",
				 contentType : "text/json; charset:UTF-8",
				 error  : function(xhr, status,message){
					 alert("error:"+message);
				 },
				 success : function(data){
					 alert(data['userpw']);
				 }
			});
		})
		
		$('#find_close').click(function(){
			$('#find').hide();
		})
	})
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
</style>

	
</head>
<body>
	<div id="found"></div>
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light fixed-top shadow">
		<div class="container">
		<!-- href 부분 고쳐야함 -->
		
			<a class="navbar-brand" href="/happyhouse/">Happy House</a>

		<!-- Main Controller -->
		
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
				<form action="login" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">ID</label> <input type="text"
							class="form-control" id="userId" name="userid"
							placeholder="Enter ID">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" name="userpw"
							id="userPassword" placeholder="Password">
					</div>
					<div class="form-check">
						<button type="submit" class="btn btn-primary" id="btnLogin">login</button>
					</div>
				</form>
						<button type="button" class="btn btn-primary" id="btnClose">close</button>
						<button type="button" class="btn btn-primary" id="btnFind">Find</button>
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
				<form action="join" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">ID</label><br> <input
							type="text" class="form-control" id="userId" placeholder="Enter ID"
							name="userid">
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
							type="password" class="form-control"
							id="userPassword" placeholder="Password">
					</div>
					<div class="form-check">
						<input type="submit" class="btn btn-primary" id="btnJoin"
							value="Join">
					</div>
				</form>
						<button type="button" class="btn btn-primary" id="join_close">close</button>
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
				<form action="updateInfo" method="POST">
					<div class="form-group">
						<label for="exampleInputEmail1">ID</label> 
						<input type="text" class="form-control" id="userid" name = "userid" value="${loginInfo.userid}">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Name</label> <input type="text"
							class="form-control" id="userName" name="username" value="${loginInfo.username}">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="text" class="form-control" name="userpw"
							id="userpw" value="${loginInfo.userpw}">
					</div>

					<div class="form-check">
						<button type="submit" class="btn btn-primary" id="btnUpdate">수정</button>
					</div>
				</form>
						<button type="button" class="btn btn-primary" id="update_close">close</button>
						<button type="button" class="btn btn-primary" id="btnDelete">Delete</button>
			</div>
		</div>
	</div>
	
	<div class="modal" id="find" style="display: none;">
		<div class="modal-content">
			<h2>
				<a href="find"><strong>비번 찾기</strong></a>
			</h2>
			<br />
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<!-- Start form -->
				<form action="findInfo" method="get">
					<div class="form-group">
						<label for="exampleInputEmail1">ID</label> 
						<input type="text" class="form-control" id="foundid" name = "foundid">
					</div>
					<div class="form-check">
						<button type="button" class="btn btn-primary" id="btnGetFoundPW">찾기</button>
					</div>
				</form>
				<button type="button" class="btn btn-primary" id="find_close">close</button>
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
				</select> <input type="search" name="search" size="120">
				<input class="btn btn-danger" type="submit" value="검색">
			</form>
		</div>
		<div id="map" style="width: 100%; height: 600px; margin: auto;"></div>
		<script defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfpdYGfTEMy-VD6cAFgPDN9UTKopY48rc&callback=initMap"></script>
		<script>
			var multi = {
				lat : 37.5012743,
				lng : 127.039585
			};
			var map;
			var markers = [];
			var infoWindow;

			function initMap() {
				map = new google.maps.Map(document.getElementById('map'), {
					center : multi,
					zoom : 15
				});

				infoWindow = new google.maps.InfoWindow;

				const myposition = "img/my_position.png";

				// Geolocation
				infoWindow = new google.maps.InfoWindow;
				if (navigator.geolocation) {
					navigator.geolocation.getCurrentPosition(
							function(position) {
								var pos = {
									lat : position.coords.latitude,
									lng : position.coords.longitude
								};

								var mymarker = {
									coords : pos,
									iconImage : myposition,
									content : '현재위치'
								};
								addMarker(mymarker);

								infoWindow.setPosition(pos);
								infoWindow.setContent('현재 나의 위치.');
								infoWindow.open(map);
								map.setCenter(pos);
							}, function() {
								handleLocationError(true, infoWindow, map
										.getCenter());
							});
				} else {
					handleLocationError(false, infoWindow, map.getCenter());
				}
			}

			function handleLocationError(browserHasGeolocation, infoWindow, pos) {
				infoWindow.setPosition(pos);
				infoWindow
						.setContent(browserHasGeolocation ? 'Error: Geolocation 서비스 실패.'
								: 'Error: Geolocation을 지원하지 않는 브라우저.');
				infoWindow.open(map);
			}

			function addMarker(props) {
				const marker = new google.maps.Marker({
					position : new google.maps.LatLng(
							parseFloat(props.coords.lat),
							parseFloat(props.coords.lng)),
					map : map
				});
				map.setCenter(marker.getPosition());
				map.setZoom(15);

				if (props.iconImage) {
					marker.setIcon(props.iconImage);
				}

				if (props.content) {
					infoWindow = new google.maps.InfoWindow({
						content : props.content
					});

				}

				marker.addListener('click', function() {
					map.setZoom(17);
					map.setCenter(marker.getPosition());
					bounceMarker(marker);
				});
				markers.push(marker);
				setMapOnAll(map);
			}

			function bounceMarker(marker) {
				if (marker.getAnimation() !== null) {
					marker.setAnimation(null);
				} else {
					marker.setAnimation(google.maps.Animation.BOUNCE);
				}
			}

			function deleteMarkers() {
				clearMarkers();
				markers = [];
			}

			function clearMarkers() {
				setMapOnAll(null);
			}

			function setMapOnAll(map) {
				for (let i = 0; i < markers.length; i++) {
					markers[i].setMap(map);
				}
			}
		</script>
		<br>
		<table class="table">
			<thead>
				<tr colspan="3">
					<h4>
						<strong> 추천 매물 </strong>
					</h4>
				</tr>

			</thead>
			<tr>
				<td><img src="./img/평창동삼성.jfif"></td>


				<td><img src="./img/평창동삼성.jfif"></td>


				<td><img src="./img/평창동삼성.jfif"></td>

			</tr>
			<td><p>
				<ul type="none">
					<li><strong>역삼현대아파트</strong></li>
					<li>&nbsp; 거래금액 : 6억 3천만원</li>
					<li>&nbsp; 월세금액 : 5000 / 60</li>
					<li>&nbsp; 건축연도 : 2001년</li>
				</ul>
				</p></td>
			<td><p>
				<ul type="none">
					<li><strong>역삼현대아파트</strong></li>
					<li>&nbsp; 거래금액 : 6억 3천만원</li>
					<li>&nbsp; 월세금액 : 5000 / 60</li>
					<li>&nbsp; 건축연도 : 2001년</li>
				</ul>
				</p></td>
			<td><p>
				<ul type="none">
					<li><strong>역삼현대아파트</strong></li>
					<li>&nbsp; 거래금액 : 6억 3천만원</li>
					<li>&nbsp; 월세금액 : 5000 / 60</li>
					<li>&nbsp; 건축연도 : 2001년</li>
				</ul>
				</p></td>
			<tr>
			</tr>
		</table>

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