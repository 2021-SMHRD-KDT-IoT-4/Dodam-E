<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}

	#map{
	
	width:100%;
	height:400px;
		
	}
 
</style>


</head>
<body>
<div id="map" ></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eead32d6ed0b289eaf8fb67836c885d3"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.110974, 126.877459), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(35.112171, 126.873735); //인포윈도우 표시 위치입니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '학교', 
        latlng: new kakao.maps.LatLng(35.112171, 126.873735)
    },
    {
        title: '학원', 
        latlng: new kakao.maps.LatLng(35.112445, 126.875642)
    },
    {
        title: '신호등', 
        latlng: new kakao.maps.LatLng(35.111548, 126.876066)
    },
    {
        title: '집',
        latlng: new kakao.maps.LatLng(35.110974, 126.877459)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = ["./images/school.png","./images/piano.png","./images/traffic.png","./images/house.png"];
//var imageSrc = "./img/piano.png"; 
//var imageSrc = "./img/traffic.png"; 
//var imageSrc = "./img/school.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(35, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc[i], imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
    
    var content = '<div class="customoverlay">' +
       '    <span class="title">학교</span>' +

    '</div>';

// 커스텀 오버레이가 표시될 위치입니다 
var position = new kakao.maps.LatLng(35.112171, 126.873735);  

// 커스텀 오버레이를 생성합니다
var customOverlay = new kakao.maps.CustomOverlay({
    map: map,
    position: position,
    content: content,
 //   yAnchor: 1 
});

var content1 = '<div class="customoverlay">' +
'    <span class="title">학원</span>' +

'</div>';

//커스텀 오버레이가 표시될 위치입니다 
var position = new kakao.maps.LatLng(35.112445, 126.875642);  

//커스텀 오버레이를 생성합니다
var customOverlay = new kakao.maps.CustomOverlay({
map: map,
position: position,
content: content1,
//   yAnchor: 1 
});
    
var content2 = '<div class="customoverlay">' +
'    <span class="title">집</span>' +

'</div>';

//커스텀 오버레이가 표시될 위치입니다 
var position = new kakao.maps.LatLng(35.110974, 126.877459);  

//커스텀 오버레이를 생성합니다
var customOverlay = new kakao.maps.CustomOverlay({
map: map,
position: position,
content: content2,
//   yAnchor: 1 
});    
    
    
}
</script>
</body>
</html>