function update_click(event){
	console.log(event.currentTarget);
	console.log(event.currentTarget.find("oldfile"));
	
let param={
		contentsno: event.currentTarget.id,
		oldfile: event.currentTarget.oldfile,
		contents: event.currentTarget.name,
		tag: event.currentTarget.tag,
		privacy: event.currentTarget.privacy
		};
	console.log(param);
	let modal = $(".modal_update");
	let mcontents=modal.find("textarea[name='contents']");
	let moldfile=modal.find("input[name='oldfile']");
	let mcontentsno=modal.find("input[name='contentsno']");
	let mtag=modal.find("input[name='tag']");
	let mprivacy=modal.find("select[name='privacy']");
	let moldImg = modal.find("img[id='oldImg']");
	mcontents.val(param.contents);
	moldfile.val(param.oldfile);
	mcontentsno.val(param.contentsno);
	mtag.val(param.tag);
	mprivacy.val(param.privacy);
	moldImg.attr('src','/contents/storage/'+param.oldfile);
	$(".modal_update").show();
}


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