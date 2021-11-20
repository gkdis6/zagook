package com.project.member;

import java.io.File;

public class Member {
	/** 페이지당 출력할 레코드 갯수 */
    public static int RECORD_PER_PAGE = 3;

    // Windows, VMWare, AWS cloud 절대 경로 설정
    public static synchronized String getUploadDir() {
        String path = "";
        String os = System.getProperty("os.name").toLowerCase();
        if (File.separator.equals("\\")) {
            path = "C:/AIstudy/deploy/zagook/member/storage/";
            System.out.println("Windows 10: " + path);
            
        } else if(os.equals("linux")){
        	// System.out.println("Linux");
            path = "/home/ubuntu/deploy/zagook/member/storage/";
        }else {
            System.out.println("mac");
            path = "/Users/sangyongpark/deploy/zagook/member/storage/";
        }
        
        return path;
    }

}
