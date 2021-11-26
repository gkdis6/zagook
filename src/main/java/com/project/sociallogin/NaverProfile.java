package com.project.sociallogin;

import lombok.Data;

@Data
public class NaverProfile {

	public String resultcode;
	public String message;
	public Response response;
	
	@Data
	class Response {

		public String id;
		public String email;
		public String name;

	}
}

