$(document).ready(function () {
	window.addEventListener("scroll", function(event){
        let doc_height = this.document.scrollingElement.scrollHeight;
		let top_height = this.document.scrollingElement.scrollTop;
        let client_height = this.document.scrollingElement.clientHeight;
		console.log(top_height);
        console.log(doc_height);
        let param = {"id": $(id), "x_site" : $(x_site), "y_site" : $(y_site)};
		if (top_height + client_height >= doc_height) {
			process_feed_list(param);
		}
    });
});

const feedService = new getFeedService();
 
function process_feed_list(param) {
    feedService
        .get_feed_list(param)
        .then(list => {
// 받아온 json data에 대한 처리 진행하기
// 몇 개의 데이터를 받아올 것인가? 요청 시 계속 가져오기? -> 거리 계산 후?
// 유저의 현재 x, y 좌표를 기준점으로 받아오기(user id 필수, (x, y)좌표 필수) -> maximum 기준 두기 -> 거리, 시간은 제한두지 않기
// 그럼 여기서 정렬을 어떻게 할 것인가? -> 쿼리문에서 거리 계산 -> rownum을 걸어서 가져오기 -> page 해주기 -> maximum 제한 두기
// front에서 처리해주기
        })
        .catch(err => {
            console.log("Error Msg: " + err);
        });
}