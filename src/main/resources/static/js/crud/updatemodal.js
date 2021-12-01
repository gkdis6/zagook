$("#closeModal").click(function (e) {
$(".modal_update").hide();
});

function checkIn(f) {
	if (f.contents.value == "") {
		alert("내용을 입력하세요");
		f.contents.focus()
		return false;
	}
}
function updatefile() {
	$('#updatefilebtn').hide();
	$('#selectimg').show();
	return false;
}
 function PreviewImage() {
	 // 파일리더 생성
        var preview = new FileReader();
        preview.onload = function (e) {
        // img id 값 
        document.getElementById("img").src = e.target.result;
    };
    // input id 값 
    preview.readAsDataURL(document.getElementById("filenameMF").files[0]);
 };