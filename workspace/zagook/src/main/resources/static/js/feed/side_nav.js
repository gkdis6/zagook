function openNav() {		
	if (document.getElementById("left_nav").style.width == "50px") {
		document.getElementById("left_nav").style.width = "250px";
		document.getElementById("center_container").style.marginLeft = "300px";
		document.getElementById("nav_click_img_container").style.display = "none";
	  	let child_list = document.getElementById("left_nav").children;
	  	let size = child_list.length;
	  	for (let i = 1; i < size; i++) {
			child_list.item(i).style.display = "block";
		}
	}
	else {
		closeNav();
	}
}

function closeNav() {
  	document.getElementById("left_nav").style.width = "50px";
  	document.getElementById("center_container").style.marginLeft = "0px";
  	let child_list = document.getElementById("left_nav").children;
	  	let size = child_list.length;
	  	for (let i = 1; i < size; i++) {
			child_list.item(i).style.display = "none";
	}
}