/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.39
 * Generated at: 2021-01-01 18:23:52 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("    ");
 response.setHeader("Pragma", "no-cache"); 
    response.setHeader("Cache-Control", "no-cache"); 
    response.setHeader("Cache-Control", "no-store"); 
    response.setDateHeader("Expires", 0L); 
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>다이어트에 봄이왔따</title>\n");
      out.write("<link rel=\"stylesheet\" href=\"resources/css/login.css\">\n");
      out.write("<link rel=\"shortcut icon\" href=\"resources/image/cherry-blossom.png\">\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Song+Myung&display=swap\" rel=\"stylesheet\">\n");
      out.write("<script src=\"//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js\">\n");
      out.write("\t\n");
      out.write("</script>\n");
      out.write("\t<script src=\"https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js\"></script>\n");
      out.write("\n");
      out.write("<link href=\"https://unpkg.com/aos@2.3.1/dist/aos.css\" rel=\"stylesheet\">\n");
      out.write("<script src=\"https://apis.google.com/js/client:platform.js?onload=start\"\n");
      out.write("\tasync defer>\n");
      out.write("\t\n");
      out.write("</script>\n");
      out.write("<script src=\"https://unpkg.com/aos@2.3.1/dist/aos.js\"></script>\n");
      out.write("\n");
      out.write("<script\n");
      out.write("\tsrc=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("\t<div id=\"main-container\">\n");
      out.write("\t\t<div id=\"container-left\">\n");
      out.write("\t\t\t<div id=\"chartdiv\"></div>\n");
      out.write("\t\t\t<div id=\"content\">\n");
      out.write("\t\t\t\t<h1 class=\"ml6\">\n");
      out.write("\t\t\t\t\t<span class=\"text-wrapper\"> <span class=\"letters\"><b style=\"color:#cc0044\">다</b>이어터들에게 <b style=\"color:#cc0044\">봄</b>이왔어요</span>\n");
      out.write("\t\t\t\t\t</span>\n");
      out.write("\t\t\t\t</h1>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div id=\"container-right\" data-aos=\"fade-up\">\n");
      out.write("\t\t\t<div id=\"login-form\">\n");
      out.write("\t\t\t\t<img style=\"width: 100px; height: 100px;\" alt=\"로고\"\n");
      out.write("\t\t\t\t\tsrc=\"resources/image/cherry-blossom.png\">\n");
      out.write("\t\t\t\t<h1>다봄</h1>\n");
      out.write("\t\t\t\t<div class=\"inputarea\">\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"member_id\" name=\"member_id\"\n");
      out.write("\t\t\t\t\t\tplaceholder=\"아이디\" />\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t<div class=\"inputarea\">\n");
      out.write("\t\t\t\t\t<input type=\"password\" id=\"member_pw\" name=\"member_pw\"\n");
      out.write("\t\t\t\t\t\tplaceholder=\"비밀번호\" />\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<table>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td colspan=\"2\" class=\"err\" style=\"padding: 10px 0px;\"></td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td colspan=\"2\"><button onclick=\"login();\" class=\"logbtn\">로그인</button></td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td colspan=\"2\" style=\"text-align: center; margin: 10px;\"><a\n");
      out.write("\t\t\t\t\t\t\thref=\"register.do\">회원가입</a> | <a style =\"pointer : cursor;\" onclick=\"window.open('findpw.do','popup','width=500px,top=300,left=500,height=300px')\">ID/PW찾기</a></td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td colspan=\"2\"><a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${kakao_url}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\"><img\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"width: 200px;\" alt=\"카카오로그인\"\n");
      out.write("\t\t\t\t\t\t\t\tsrc=\"resources/image/kakao.png\"></a></td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td colspan=\"2\"><a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${naver_url}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\"><img\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"width: 200px;\" alt=\"네이버로그인\"\n");
      out.write("\t\t\t\t\t\t\t\tsrc=\"resources/image/naver.PNG\"></a></td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\t\t\t</table>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\n");
      out.write("\t</div>\n");
      out.write("\n");
      out.write("\t<div id=\"footer\">\n");
      out.write("\t\t<div>© 2021 DABOM</div>\n");
      out.write("\t</div>\n");
      out.write("\n");
      out.write("\t<script>\n");
      out.write("\t\tAOS.init({\n");
      out.write("\t\t\tdelay : 300,\n");
      out.write("\n");
      out.write("\t\t});\n");
      out.write("\t</script>\n");
      out.write("\n");
      out.write("\t<script type=\"text/javascript\">\n");
      out.write("\t\t$(function() {\n");
      out.write("\n");
      out.write("\t\t\t$(\".err\").hide();\n");
      out.write("\t\t});\n");
      out.write("\n");
      out.write("\t\tfunction login() {\n");
      out.write("\t\t\tvar memberid = $(\"#member_id\").val().trim();\n");
      out.write("\t\t\tvar memberpw = $(\"#member_pw\").val().trim();\n");
      out.write("\n");
      out.write("\t\t\tvar loginValue = {\n");
      out.write("\t\t\t\t\"member_id\" : memberid,\n");
      out.write("\t\t\t\t\"member_pw\" : memberpw\n");
      out.write("\t\t\t};\n");
      out.write("\n");
      out.write("\t\t\tif (memberid == null || memberid == \"\" || memberpw == null\n");
      out.write("\t\t\t\t\t|| memberpw == \"\") {\n");
      out.write("\t\t\t\t$(\".err\").show();\n");
      out.write("\t\t\t\t$(\".err\").html(\"ID또는 PW를 제대로 입력해주세요!\");\n");
      out.write("\t\t\t\t$(\".err\").css(\"color\", \"red\");\n");
      out.write("\t\t\t\t$(\".err\").css(\"font-size\",\"10pt\");\n");
      out.write("\t\t\t} else {\n");
      out.write("\t\t\t\t$.ajax({\n");
      out.write("\t\t\t\t\ttype : \"post\",\n");
      out.write("\t\t\t\t\turl : \"/dabom/ajaxlogin.do\",\n");
      out.write("\t\t\t\t\tdata : JSON.stringify(loginValue),\n");
      out.write("\t\t\t\t\tcontentType : \"application/json\",\n");
      out.write("\t\t\t\t\tsuccess : function(msg) {\n");
      out.write("\t\t\t\t\t\tif (msg.check == true & msg.del != true) {\n");
      out.write("\t\t\t\t\t\t\tif(msg.role == true){\n");
      out.write("\t\t\t\t\t\t\t\tlocation.href = \"admin.do\"\n");
      out.write("\t\t\t\t\t\t\t} else {\n");
      out.write("\t\t\t\t\t\t\tlocation.href = \"mainpage.do\"\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t}else if(msg.check == true & msg.del ==true){\n");
      out.write("\t\t\t\t\t\t\t$(\".err\").show();\n");
      out.write("\t\t\t\t\t\t\t$(\".err\").html(\"탈퇴한 회원입니다. 재가입 해주세요!\");\n");
      out.write("\t\t\t\t\t\t\t$(\".err\").css(\"color\", \"red\");\n");
      out.write("\t\t\t\t\t\t\t$(\".err\").css(\"font-size\",\"9pt\");\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t}else {\n");
      out.write("\t\t\t\t\t\t\t$(\".err\").show();\n");
      out.write("\t\t\t\t\t\t\t$(\".err\").html(\"ID 혹은 PW가 잘못되었습니다.\");\n");
      out.write("\t\t\t\t\t\t\t$(\".err\").css(\"color\", \"red\");\n");
      out.write("\t\t\t\t\t\t\t$(\".err\").css(\"font-size\",\"10pt\");\n");
      out.write("\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t},\n");
      out.write("\t\t\t\t\terror : function(msg) {\n");
      out.write("\t\t\t\t\t\tconsole.log(msg);\n");
      out.write("\t\t\t\t\t\talert(\"통신 실패\");\n");
      out.write("\t\t\t\t\t}\n");
      out.write("\t\t\t\t});\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t}\n");
      out.write("\t\t\n");
      out.write("\n");
      out.write("\t\tvar textWrapper = document.querySelector('.ml6 .letters');\n");
      out.write("\ttextWrapper.innerHTML = textWrapper.textContent.replace(/\\S/g, \"<span class='letter'>$&</span>\");\n");
      out.write("\n");
      out.write("\t\tanime.timeline({loop: false})\n");
      out.write("\t\t\t  .add({\n");
      out.write("\t\t\t    targets: '.ml6 .letter',\n");
      out.write("\t\t\t    translateY: [\"1.1em\", 0],\n");
      out.write("\t\t\t    translateZ: 0,\n");
      out.write("\t\t\t    duration: 1000,\n");
      out.write("\t\t\t    delay: function(el, i){\n");
      out.write("\t\t\t    \treturn  50 * i;\n");
      out.write("\t\t\t    } \n");
      out.write("\t\t\t  }).add({\n");
      out.write("\t\t\t    targets: '.ml6',\n");
      out.write("\t\t\t    opacity: 1,\n");
      out.write("\t\t\t    duration: 50,\n");
      out.write("\t\t\t    easing: \"easeOutExpo\",\n");
      out.write("\t\t\t    delay: 50\n");
      out.write("\t\t\t  });\n");
      out.write("\t\n");
      out.write("\t</script>\n");
      out.write("\n");
      out.write("\t<!-- 워드클라우드 임포트 코드-->\n");
      out.write("\t<script src=\"https://cdn.amcharts.com/lib/4/core.js\"></script>\n");
      out.write("\t<script src=\"https://cdn.amcharts.com/lib/4/charts.js\"></script>\n");
      out.write("\t<script src=\"https://cdn.amcharts.com/lib/4/plugins/wordCloud.js\"></script>\n");
      out.write("\t<script src=\"https://cdn.amcharts.com/lib/4/themes/animated.js\"></script>\n");
      out.write("\n");
      out.write("\t<script src=\"resources/js/wordcloud.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
