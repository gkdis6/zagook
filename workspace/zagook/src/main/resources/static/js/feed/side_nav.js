function openNav() {		
	if (document.getElementById("left_nav").style.width == "0px") {
		document.getElementById("left_nav").style.width = "250px";
		document.getElementById("center_container").style.marginLeft = "250px";
	  	document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}
	else {
		closeNav();
	}
}

function closeNav() {
  	document.getElementById("left_nav").style.width = "0px";
  	document.getElementById("center_container").style.marginLeft = "0px";
  	document.body.style.backgroundColor = "#F5F2B8";
}