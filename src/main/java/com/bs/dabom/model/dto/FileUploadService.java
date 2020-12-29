package com.bs.dabom.model.dto;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

@Service
public class FileUploadService {
	
		// 리눅스 기준으로 파일 경로를 작성 ( 루트 경로인 /으로 시작한다. )
		// 윈도우라면 workspace의 드라이브를 파악하여 JVM이 알아서 처리해준다.
		// 따라서 workspace가 C드라이브에 있다면 C드라이브에 upload 폴더를 생성해 놓아야 한다.
		private static final String SAVE_PATH = "/upload";
		// C:/upload
		private static final String PREFIX_URL = "resources/feed_img/";
		// 프로젝트의 폴더의 .metadata / ... / 
		
		//String path = servletContext.getRealPath("/") + "resources/image";
		
		
		public String restore(MultipartFile multipartFile, HttpServletRequest request) {
			String url = null;
			
			try {
				// 파일 정보
				String originFilename = multipartFile.getOriginalFilename();
					String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
					Long size = multipartFile.getSize();
					
					// 서버에서 저장 할 파일 이름
					String saveFileName = genSaveFileName(extName);
					
					System.out.println("originFilename : " + originFilename);
					System.out.println("extensionName : " + extName);
					System.out.println("size : " + size);
					System.out.println("saveFileName : " + saveFileName);
					
					writeFile(multipartFile, saveFileName, request);
					url = PREFIX_URL + saveFileName;
					System.out.println("<url로 넘어가는 String은" + url + "입니다.>");
				
			}
			catch (IOException e) {
				// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
				// 편의상 RuntimeException을 던진다.
				// throw new FileUploadException();	
				throw new RuntimeException(e);
			}
			return url;
		}
		
		
		// 현재 시간을 기준으로 파일 이름 생성
		private String genSaveFileName(String extName) {
			String fileName = "";
			
			Calendar calendar = Calendar.getInstance();
			fileName += calendar.get(Calendar.YEAR);
			fileName += calendar.get(Calendar.MONTH);
			fileName += calendar.get(Calendar.DATE);
			fileName += calendar.get(Calendar.HOUR);
			fileName += calendar.get(Calendar.MINUTE);
			fileName += calendar.get(Calendar.SECOND);
			fileName += calendar.get(Calendar.MILLISECOND);
			fileName += extName;
			
			return fileName;
		}
		
		
		// 파일을 실제로 write 하는 메서드
		private boolean writeFile(MultipartFile multipartFile, String saveFileName,  HttpServletRequest request)
									throws IOException{
			boolean result = false;

			byte[] data = multipartFile.getBytes();
			String path = request.getSession().getServletContext().getRealPath("/resources/feed_img");
			// resource/feed_img 폴더의 경로.
			
			FileOutputStream fos = new FileOutputStream(path + "/" + saveFileName);
			System.out.println("이것은" + "/resources/" + saveFileName);
			
			System.out.println(path);
			
			fos.write(data);
			fos.close();
			
			return result;
		}
}
