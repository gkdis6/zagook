<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>기본페이지</title>
<meta charset="utf-8">
<style type="text/css">
	*{
	margin : 0;
	padding : 0;
	}
</style>
</head>
<body>

	<div class="container" id="map" style="width: 100vw; height: 100vh;">
		<div></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=801160086c0950000271359e983c8bf2"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng(33.450701, 126.570667),
				level : 3
			};

			var map = new kakao.maps.Map(container, options);
		</script>

	</div>
</body>
</html>