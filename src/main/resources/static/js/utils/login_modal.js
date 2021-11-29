function load_login_modal(){
	var modal = new Modal();
	modal.open({
		url: $(this).data().url
	});
}