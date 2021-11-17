$(function () {//페이지가 로딩될때
   showList();
    showPage();
});//page loading function end  
 
let replyUL = $(".chat");
let replyPageFooter = $(".panel-footer");
 
let param = "nPage=" + nPage;
    param += "&nowPage=" + nowPage;
    param += "&contentsno=" + contentsno;
    param += "&col=" + colx;
    param += "&word=" + wordx;
 
const replyService = new ReplyService();
 
function showList() {
  replyService
    .getList({ contentsno: contentsno, sno: sno, eno: eno })
    .then(list => {
      let str = ""
 
      for (var i = 0; i < list.length ; i++) {
        str += "<li class='list-group-item' data-rnum='" + list[i].rnum + "'>";
        str += "<div><div class='header'><strong class='primary-font'>" + list[i].id + "</strong>";
        str += "<small class='pull-right text-muted'>" + list[i].regdate + "</small></div>";
        str += replaceAll(list[i].content, '\n', '<br>') + "</div></li>";
      }
 
      replyUL.html(str);
    })
 
}//showList() end
 
function replaceAll(str, searchStr, replaceStr) {
  return str.split(searchStr).join(replaceStr);
}
 
function showPage(){
    replyService
   .getPage(param)
   .then(paging => {
      console.log(paging);
      let str = "<div><small class='text-muted'>" + paging + "</small></div>";
 
      replyPageFooter.html(str);
});
}
let modal = $(".modal");
let modalInputContent = modal.find("input[name='content']");
 
let modalModBtn = $("#modalModBtn");
let modalRemoveBtn = $("#modalRemoveBtn");
let modalRegisterBtn = $("#modalRegisterBtn");

$("#modalCloseBtn").on("click", function (e) {
 
  modal.modal('hide');
});
 
 
$("#addReplyBtn").on("click", function (e) {
  modalInputContent.val("");
  modal.find("button[id !='modalCloseBtn']").hide();
 
  modalRegisterBtn.show();
 
  $(".modal").modal("show");
 
});
 
 
modalRegisterBtn.on("click", function (e) {
 
  if (modalInputContent.val() == '') {
    alert("댓글을 입력하세요")
    return;
  }
 
  let reply = {
    content: modalInputContent.val(),
    id: 'user1',
    contentsno: contentsno
  };
  //alert(reply.contentsno);
  replyService
    .add(reply)
    .then(result => {
 
      //alert(result);
 
      modal.find("input").val("");
      modal.modal("hide");
 
      showList();
      showPage();
 
    }); //end add
 
}); //end modalRegisterBtn.on
 
 
//댓글 조회 클릭 이벤트 처리 
$(".chat").on("click", "li", function (e) {
 
  let rnum = $(this).data("rnum");
 
  //alert(rnum)
  replyService
    .get(rnum)
    .then(reply => {
 
      modalInputContent.val(reply.content);
      modal.data("rnum", reply.rnum);
 
      modal.find("button[id !='modalCloseBtn']").hide();
 
      modalModBtn.show();
      modalRemoveBtn.show();
 
      $(".modal").modal("show");
 
    });
});