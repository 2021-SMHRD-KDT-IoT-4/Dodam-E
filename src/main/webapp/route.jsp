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
var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.110974, 126.877459), // ������ �߽���ǥ
        level: 4 // ������ Ȯ�� ����
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">ū��������</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">��ã��</a></div>', // ���������쿡 ǥ��� �������� HTML ���ڿ��̳� document element�� �����մϴ�
iwPosition = new kakao.maps.LatLng(35.112171, 126.873735); //���������� ǥ�� ��ġ�Դϴ�
 
// ��Ŀ�� ǥ���� ��ġ�� title ��ü �迭�Դϴ� 
var positions = [
    {
        title: '�б�', 
        latlng: new kakao.maps.LatLng(35.112171, 126.873735)
    },
    {
        title: '�п�', 
        latlng: new kakao.maps.LatLng(35.112445, 126.875642)
    },
    {
        title: '��ȣ��', 
        latlng: new kakao.maps.LatLng(35.111548, 126.876066)
    },
    {
        title: '��',
        latlng: new kakao.maps.LatLng(35.110974, 126.877459)
    }
];

// ��Ŀ �̹����� �̹��� �ּ��Դϴ�
var imageSrc = ["./images/school.png","./images/piano.png","./images/traffic.png","./images/house.png"];
//var imageSrc = "./img/piano.png"; 
//var imageSrc = "./img/traffic.png"; 
//var imageSrc = "./img/school.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
    var imageSize = new kakao.maps.Size(35, 35); 
    
    // ��Ŀ �̹����� �����մϴ�    
    var markerImage = new kakao.maps.MarkerImage(imageSrc[i], imageSize); 
    
    // ��Ŀ�� �����մϴ�
    var marker = new kakao.maps.Marker({
        map: map, // ��Ŀ�� ǥ���� ����
        position: positions[i].latlng, // ��Ŀ�� ǥ���� ��ġ
        title : positions[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
        image : markerImage // ��Ŀ �̹��� 
    });
    
    var content = '<div class="customoverlay">' +
       '    <span class="title">�б�</span>' +

    '</div>';

// Ŀ���� �������̰� ǥ�õ� ��ġ�Դϴ� 
var position = new kakao.maps.LatLng(35.112171, 126.873735);  

// Ŀ���� �������̸� �����մϴ�
var customOverlay = new kakao.maps.CustomOverlay({
    map: map,
    position: position,
    content: content,
 //   yAnchor: 1 
});

var content1 = '<div class="customoverlay">' +
'    <span class="title">�п�</span>' +

'</div>';

//Ŀ���� �������̰� ǥ�õ� ��ġ�Դϴ� 
var position = new kakao.maps.LatLng(35.112445, 126.875642);  

//Ŀ���� �������̸� �����մϴ�
var customOverlay = new kakao.maps.CustomOverlay({
map: map,
position: position,
content: content1,
//   yAnchor: 1 
});
    
var content2 = '<div class="customoverlay">' +
'    <span class="title">��</span>' +

'</div>';

//Ŀ���� �������̰� ǥ�õ� ��ġ�Դϴ� 
var position = new kakao.maps.LatLng(35.110974, 126.877459);  

//Ŀ���� �������̸� �����մϴ�
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