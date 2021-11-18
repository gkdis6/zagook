function openNav() {		
	if (document.getElementById("left_nav").style.width == "50px") {
		document.getElementById("left_nav").style.width = "250px";
		document.getElementById("center_container").style.marginLeft = "250px";
	  	document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
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
  	document.getElementById("center_container").style.marginLeft = "50px";
  	document.body.style.backgroundColor = "#F5F2B8";
  	let child_list = document.getElementById("left_nav").children;
	  	let size = child_list.length;
	  	for (let i = 1; i < size; i++) {
			child_list.item(i).style.display = "none";
	}
}