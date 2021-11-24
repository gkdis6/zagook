$(document).on("click", "#reset", function () {
	$('#preview-image').css('background-image',
		"url('https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image')");
	$('#ok').attr('disabled',true);
});

$(document).ready(function () {
	$("#create").hide();
});

$("#createBtn").on("click", function (e) {
	if (e.target != 0) {
		$("#createBtn").toggleClass("rotate");
	}
});

function readImage(input) {
	// 인풋 태그에 파일이 있는 경우
	if (input.files && input.files[0]) {
		// 이미지 파일인지 검사 (생략)
		// FileReader 인스턴스 생성

		const reader = new FileReader();
		// 이미지가 로드가 된 경우
		reader.onload = e => {
			$("#preview-image").css('background-image', 'url(\"' + e.target.result + '\")');
		}
		// reader가 이미지 읽도록 하기
		reader.readAsDataURL(input.files[0])
	}
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("filenameMF")
inputImage.addEventListener("change", e => {
	readImage(e.target)
	inputImage.files[0].exifdata = null;
	EXIF.getData(inputImage.files[0], function () {
		var latitude = EXIF.getTag(this, "GPSLatitude");
		var longitude = EXIF.getTag(this, "GPSLongitude");
		if (longitude === undefined || latitude === undefined) {
			document.getElementById("ok").disabled = true;
		} else {
			document.getElementById("ok").disabled = false;
		}
		latitude = latitude[0] + latitude[1] / 60 + latitude[2] / 3600;
		longitude = longitude[0] + longitude[1] / 60 + longitude[2] / 3600;
		document.getElementById("x_site").value = latitude;
		document.getElementById("y_site").value = longitude;
		console.log(latitude);
		console.log(longitude);


	});
})