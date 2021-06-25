<%@page import="COM.Model.childDAO"%>
<%@page import="COM.Model.childDTO"%>
<%@page import="COM.Model.UserDAO"%>

<%@page import="COM.Model.FaqDTO"%>
<%@page import="COM.Model.FaqWriteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="COM.Model.NoticeWriteDAO"%>
<%@page import="COM.Model.NoticeDTO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="COM.Model.UserDTO"%>
<%@page import="java.util.*"%>


<!DOCTYPE HTML>
<!--
	Massively by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Elements Reference - Massively by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>


</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<a href="main.jsp" class="logo">Dodam E</a>
		</header>

		<!-- Nav -->
		<nav id="nav">
			<ul class="links">
				<li><a href="main.jsp">Dodam E</a></li>
				<li><a href="join.jsp">Join</a></li>
				<li><a href="login.jsp">Login</a></li>
				<li><a href="mypage.jsp">My Page</a></li>
				<li><a href="child.jsp">Child Sign Up</a></li>
				<li><a href="faq.jsp">FAQ</a></li>
				<li><a href="board.jsp">Board</a></li>
				<li class="active"><a href="route.jsp">Route</a></li>
			</ul>
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon brands fa-github"><span
						class="label">GitHub</span></a></li>
			</ul>
		</nav>

		<%
		UserDTO info = (UserDTO) session.getAttribute("login_info");
		%>

		<!-- Main -->
		<div id="main" width="826px";heigh="400px">
		<section class="post">
		
								<header class="major">
									<h1><a href="#">Route<br /></a></h1>
								</header>
		
		<div id="map" style="width: 100%; height: 350px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=baabcdaa6e2d28d90ba9f9ace42f8e6c"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			mapOption = {
				center : new kakao.maps.LatLng(35.110974, 126.877459), // 지도의 중심좌표
				level : 4
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwPosition = new kakao.maps.LatLng(35.112171, 126.873735); //인포윈도우 표시 위치입니다

			// 마커를 표시할 위치와 title 객체 배열입니다 
			var positions = [ {
				title : '학교',
				latlng : new kakao.maps.LatLng(35.112171, 126.873735),
			    text : '학교' 

			}, {
				title : '학원',
				latlng : new kakao.maps.LatLng(35.112445, 126.875642)
			}, {
				title : '신호등',
				latlng : new kakao.maps.LatLng(35.111548, 126.876066)
			}, {
				title : '집',
				latlng : new kakao.maps.LatLng(35.110974, 126.877459)
			} ];

<<<<<<< HEAD
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eead32d6ed0b289eaf8fb67836c885d3"></script>
							<h1>스크립트</h1>
						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
							mapOption = {
								center : new kakao.maps.LatLng(35.110974,
										126.877459), // 지도의 중심좌표
								level : 4
							// 지도의 확대 레벨
							};
=======
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = [ "./images/school.png", "./images/piano.png",
					"./images/traffic.png", "./images/house.png" ];
			//var imageSrc = "./img/piano.png"; 
			//var imageSrc = "./img/traffic.png"; 
			//var imageSrc = "./img/school.png"; 
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-IoT-4/Dodam-E.git

			for (var i = 0; i < positions.length; i++) {

				// 마커 이미지의 이미지 크기 입니다
				var imageSize = new kakao.maps.Size(35, 35);

				// 마커 이미지를 생성합니다    
				var markerImage = new kakao.maps.MarkerImage(imageSrc[i],
						imageSize);

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map : map, // 마커를 표시할 지도
					position : positions[i].latlng, // 마커를 표시할 위치
					title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					image : markerImage
				// 마커 이미지 

				});

			}
		</script>
		<br>
<table border="1" id="hhh">
<tr align="center" >
<td >순서</td>
<td>장소이름</td>
<td>위치확인시간</td>
</tr>

<tr align="center" >
<td >1</td>
<td>집</td>
<td>date</td>
</tr>

<tr align="center" >
<td >2</td>
<td>신호등</td>
<td>date</td>
</tr>

</table>

<<<<<<< HEAD
							}
							</script>
							<h1>스크립트</h1>
				</article>
=======
		<!-- Copyright -->
		<div id="copyright">
			<ul>
				<li>&copy; Untitled</li>
				<li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
			</ul>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-IoT-4/Dodam-E.git
			</section>
		</div>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>