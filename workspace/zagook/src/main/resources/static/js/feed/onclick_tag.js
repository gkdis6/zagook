function onclickTag(event) {
	openSearchbar();
	let tag_name = event.target.innerText;
	document.getElementById("searchInput").setAttribute("value", tag_name.substr(1, tag_name.length));
	document.getElementById("searchInput").focus();
}