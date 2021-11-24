function ajax_url_check_myread(url) {
	const criterion_url = "http://localhost:8005/feed/myread";
	if (url == criterion_url || regex_processing_myread(url))
		return true;
	return false;
}

function ajax_url_check_read(url) {
	const criterion_url = "http://localhost:8005/feed/read";
	if (url == criterion_url || regex_processing_read(url))
		return true;
	return false;
}

function ajax_url_check_tag(url) {
	const criterion_url = "http://localhost:8005/feed/tag";
	if (url == criterion_url || regex_processing_tag(url))
		return true;
	return false;
}

function ajax_url_check_friend(url) {
	const criterion_url = "http://localhost:8005/feed/friend";
	if (url == criterion_url || regex_processing_friend(url))
		return true;
	return false;
}

//--------------------------------- regex -------------------------------------

function regex_processing_myread(url) {
	const criterion_url = "http://localhost:8005/feed/myread";
	const parsed_url = url.split("#");
	// only digit
	return common_regex_process(criterion_url, parsed_url);
}

function regex_processing_read(url) {
	const criterion_url = "http://localhost:8005/feed/read";
	const parsed_url = url.split("#");
	// only digit
	return common_regex_process(criterion_url, parsed_url);
}

function regex_processing_tag(url) {
	const criterion_url = "http://localhost:8005/feed/tag";
	const parsed_url = url.split("#");
	// only digit
	return common_regex_process(criterion_url, parsed_url);
}

function regex_processing_friend(url) {
	const criterion_url = "http://localhost:8005/feed/friend";
	const parsed_url = url.split("#");
	// only digit
	return common_regex_process(criterion_url, parsed_url);
}

//-----------------------------------------------------------------------------

function common_regex_process(criterion_url, parsed_url) {
	const regex = /^\d+$/;
	if (parsed_url.length == 2) {
		if (parsed_url[0] == criterion_url && parsed_url[1].search(regex) > -1)
			return true;
	}
	return false;
}