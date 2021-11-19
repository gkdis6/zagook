function onclickTag(event) {
	openSearchbar();
	let tag_name = event.target.innerText;
	console.log(tag_name.substr(1, tag_name.length));
//	document.getElementById("searchInput").setAttribute("value",)
}