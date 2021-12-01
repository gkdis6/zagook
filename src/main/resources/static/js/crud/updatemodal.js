$(document).on("click","a.updatebtn",function(){
//	console.log(event.currentTarget.id);
	//let param = {"contentsno": event.currentTarget.id};
let param={
		contentsno: document.getElementById("contentsno").value,
		oldfile: document.getElementById("oldfile").value,
		contents: document.getElementById("contents").value,
		tag: document.getElementById("tag").value,
		privacy: document.getElementById("privacy").value
		};
	console.log(param);
	let modal = $(".modal_update");
	let mcontents=modal.find("textarea[name='contents']");
	let moldfile=modal.find("input[name='oldfile']");
	let mcontentsno=modal.find("input[name='contentsno']");
	let mtag=modal.find("input[name='tag']");
	let mprivacy=modal.find("select[name='privacy']");
	mcontents.val(param.contents);
	moldfile.val(param.oldfile);
	mcontentsno.val(param.contentsno);
	mtag.val(param.tag);
	mprivacy.val(param.privacy);
	var srcname = modal.find("img[id='oldImg']").attr('src');
	console.log(srcname);
	$(".modal_update").show();
})


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