package com.project.member;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;


import lombok.Data;

@Data
public class MemberDTO {          
	private String id             ;
	private String password                        ;
	private String mname                         ;
	private String tel                           ;
	private String email                         ;
	private String job                           ;
	private String mdate                         ;
	private String fname                         ;
	private MultipartFile fnameMF			     ;
	private String grade                         ;
	private String social						 ;
	private String introduction;
	
	
}      

                                  