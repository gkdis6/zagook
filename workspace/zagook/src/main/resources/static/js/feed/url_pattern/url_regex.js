function ajax_url_check_myread(url) {
	const myread_url = "http://localhost:8005/feed/myread";
	if (url == myread_url || regex_processing_myread(url))
		return true;
	return false;
}

function ajax_url_check_read(url) {
	const read_url = "http://localhost:8005/feed/read";
	if (url == read_url || regex_processing_read(url))
		return true;
	return false;
}

function regex_processing_myread(url) {
	const myread_url = "http://localhost:8005/feed/myread";
	const parsed_url = url.split("#");
	// only digit
	const regex = /^\d+$/;
	if (parsed_url.length == 2) {
		if (parsed_url[0] == myread_url && parsed_url[1].search(regex) > -1)
			return true;
	}
	return false;
}
function regex_processing_read(url) {
	const read_url = "http://localhost:8005/feed/read";
	const parsed_url = url.split("#");
	// only digit
	const regex = /^\d+$/;
	if (parsed_url.length == 2) {
		if (parsed_url[0] == read_url && parsed_url[1].search(regex) > -1)
			return true;
	}
	return false;
}
	