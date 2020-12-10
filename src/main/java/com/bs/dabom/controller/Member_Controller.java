package com.bs.dabom.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.bs.dabom.model.biz.Member_Biz;
import com.bs.dabom.model.dto.Member_Dto;
import com.bs.dabom.snslogin.NaverLoginBo;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

@SessionAttributes("login")
@Controller
public class Member_Controller {

	private final static String K_CLIENT_ID = "5e5790e19b452854db751365c8cd9a9d";
	private final static String K_REDIRECT_URI = "http://localhost:8787/dabom/oauth/kakao/callback.do";

	public static String getAuthorizationUrl(HttpSession session) {
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + K_CLIENT_ID + "&redirect_uri="
				+ K_REDIRECT_URI + "&response_type=code";
		return kakaoUrl;
	}

	@Autowired
	private Member_Biz biz;

	private NaverLoginBo naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBo naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("/login.do")
	public String snsLogin(Model model, HttpSession session) throws Exception {
		String naver_url = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("naver_url", naver_url);
		model.addAttribute("kakao_url",getAuthorizationUrl(session));

		return "login";
	}

	// 에이작스로 구현한 자체 로그인
	@RequestMapping(value = "ajaxlogin.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Boolean> login(@RequestBody Member_Dto dto, HttpServletRequest req, Model model) {

		Member_Dto res = biz.login(dto);
		HttpSession session = req.getSession();
		boolean check = false;
		if (res != null) {
			if (passwordEncoder.matches(dto.getMember_pw(), res.getMember_pw())) {
				session.setAttribute("login", res);
				check = true;

			}
		}
		System.out.println(check);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		return map;
	}

	// 네이버 로그인
	@RequestMapping(value = "auth/naver/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		String member_email = (String) response_obj.get("email");
		String member_name = (String) response_obj.get("name");

		Member_Dto dto = new Member_Dto(member_email, member_name);

		Member_Dto res = null;
		int snsregres = 0;
		if (biz.idChk(member_email) > 0) {
			System.out.println("들어왔!!");
			res = biz.snsLogin(dto);
			System.out.println(res);
			session.setAttribute("login", res); // 세션 생성
			return "redirect:/mainpage.do";
		} else if (biz.idChk(member_email) == 0) {
			System.out.println("들어왔");
			snsregres = biz.snsRegister(dto);
			if (snsregres > 0)
				return "redirect:/login.do";
		}
		return "redirect:/login.do";
	}
	//카카오 로그인 
	@RequestMapping(value = "oauth/kakao/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String kekoLogin(@RequestParam("code") String code,HttpServletRequest req,HttpServletResponse res
			,HttpSession session ) throws Exception{
		
		//결과값을 노드에 담아준다.
		JsonNode  node = getAccessToken(code);
		//액세스 토큰에 사용자의 로그인한 정보가 들어있다.
		JsonNode accessToken = node.get("access_token");
		JsonNode userInfo = getKakaoUserInfo(accessToken);
		
		JsonNode kakao_account = userInfo.path("kakao_account");
		JsonNode properties = userInfo.path("properties");
		
		String member_email = kakao_account.path("email").asText();
		String member_name = properties.path("nickname").asText();
		
		Member_Dto dto = new Member_Dto(member_email, member_name);

		Member_Dto result = null;
		int snsregres = 0;
		if (biz.idChk(member_email) > 0) {
			System.out.println("들어왔zkzk!!");
			
			result = biz.snsLogin(dto);
			System.out.println(result);
			session.setAttribute("login", result); // 세션 생성
			return "redirect:/mainpage.do";
		} else if (biz.idChk(member_email) == 0) {
			System.out.println("들어왔카");
			snsregres = biz.snsRegister(dto);
			if (snsregres > 0)
				return "redirect:/login.do";
		}
		return "redirect:/login.do";
		
	}
	// 회원가입 폼 반환
	@RequestMapping("register.do")
	public String register() {
		return "register";
	}

	// 회원가입 결과 반환
	@RequestMapping("registerres.do")
	public String registerRes(Member_Dto dto) {
		System.out.println(dto);
		dto.setMember_pw(passwordEncoder.encode(dto.getMember_pw()));

		if (biz.register(dto) > 0)
			return "redirect:login.do";
		return "redirect:register.do";
	}

	// 아이디 중복확인 에이작스로
	@PostMapping("idcheck.do")
	public @ResponseBody Map<String, Integer> idchk(@RequestParam("member_id") String id) {
		System.out.println(id);
		int value = biz.idChk(id);

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("value", value);
		return map;
	}

	// 카카오 로그인 설정
	public static JsonNode getAccessToken(String autorize_code) {
		final String RequestUrl = "https://kauth.kakao.com/oauth/token";
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", "5e5790e19b452854db751365c8cd9a9d"));
		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8787/dabom/oauth/kakao/callback.do")); // 리다이렉트 URI
		postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		JsonNode returnNode = null;
		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post); // JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}
		return returnNode;
	}

	public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		// add header
		post.addHeader("Authorization", "Bearer " + accessToken);
		JsonNode returnNode = null;
		try {
			final HttpResponse response = client.execute(post);
			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally { // clear resources 
			
		} return returnNode; 
		}
		
	}


