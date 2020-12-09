package com.bs.dabom.snslogin;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;

public class SNSLogin {
	private OAuth20Service oauthService;
	
	public SNSLogin (SNS sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiKey(sns.getClientSecret()) 
				.callback(sns.getRedirectUrl())
				.scope("profile")
				.build(sns.getApi20Instance());
	
	}

	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
}
