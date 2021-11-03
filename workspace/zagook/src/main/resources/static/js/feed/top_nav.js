window.onload = function() {
	const header_nav = document.getElementsByClassName("container-fluid");
	header_nav[0].style.position = "fixed";
	header_nav[0].style.width = "100%";
	header_nav[0].style.zIndex = "1";

	const body_container = document.getElementsByClassName("body_container");
	console.log(body_container)
	body_container[0].style.position = "relative";
	body_container[0].style.top = "60px";
};