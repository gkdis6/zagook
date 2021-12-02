$("#closeModal").click(function(e) {
	$(".modal_update").hide();
});

function checkIn(f) {
	if (f.contents.value == "") {
		alert("내용을 입력하세요");
		f.contents.focus()
		return false;
	}
}
 function PreviewImage() {
	 // 파일리더 생성
        var preview = new FileReader();
        preview.onload = function (e) {
        // img id 값 
        document.getElementById("oldImg").src = e.target.result;
    };
    // input id 값 
    preview.readAsDataURL(document.getElementById("filenameMF_modal").files[0]);
 };
$("#updatefilebtn").click(function(){
	$('#updatefilebtn').hide();
	$('#selectimg').show();
	// input file에 change 이벤트 부여
const inputImage_modal = document.getElementById("filenameMF_modal");
inputImage_modal.addEventListener("change", e => {
	PreviewImage(e.target)
	console.log(inputImage_modal.files[0]);
	inputImage_modal.files[0].exifdata = null;
	EXIF.getData(inputImage_modal.files[0], function () {
		var latitude = EXIF.getTag(this, "GPSLatitude");
		var longitude = EXIF.getTag(this, "GPSLongitude");
		if (longitude === undefined || latitude === undefined) {
			document.getElementById("updateBtn_modal").disabled = true;
		} else {
			document.getElementById("updateBtn_modal").disabled = false;
		}
		latitude = latitude[0] + latitude[1] / 60 + latitude[2] / 3600;
		longitude = longitude[0] + longitude[1] / 60 + longitude[2] / 3600;
		document.getElementById("x_site_update").value = latitude;
		document.getElementById("y_site_update").value = longitude;
		console.log(latitude);
		console.log(longitude);


	});
})
})
