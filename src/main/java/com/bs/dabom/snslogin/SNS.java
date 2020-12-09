package com.bs.dabom.snslogin;

import org.springframework.util.StringUtils;

import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.Data;

@Data
public class SNS implements SnsUrls {

	private String service;
	private String clientId;
	private String clientSecret;
	private String redirectUrl;
	private DefaultApi20 api20Instance;
	
	public SNS(String service, String clientId, String clientSecret, String redirectUrl) {
		this.service = service;
		this.clientId = clientId;
		this.clientSecret = clientSecret;
		this.redirectUrl = redirectUrl;
		if(StringUtils.pathEquals(service, "naver")) {
			this.api20Instance = NaverAPI20.getInstance();
			
		}else if(StringUtils.pathEquals(service, "google")) {
			this.api20Instance = GoogleApi20.instance();
		}
	}
	
	
}
