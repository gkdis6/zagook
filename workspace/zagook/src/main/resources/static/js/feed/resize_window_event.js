window.addEventListener('resize', function (event) {
		const right_sidebar = document.querySelector(".right_container").clientWidth;
		const center_container = document.querySelector(".center_container").clientWidth;
		let window_size = window.innerWidth;
		let total = right_sidebar + center_container;
		if (window_size < total) {
			const left_sidebar = document.getElementsByClassName("left_container")[0];
			left_sidebar.style.display = "none";
		} else if (total < window_size){
			const left_sidebar = document.getElementsByClassName("left_container")[0];
			left_sidebar.style.display = "visible";
		}
	}
);