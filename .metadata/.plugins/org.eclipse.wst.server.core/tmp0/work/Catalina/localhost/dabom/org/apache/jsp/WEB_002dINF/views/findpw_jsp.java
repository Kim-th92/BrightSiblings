/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.39
 * Generated at: 2021-01-04 20:11:10 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class findpw_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>Insert title here</title>\n");
      out.write("<link rel=\"stylesheet\" href=\"resources/css/findpw.css\">\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("  <h2><span class=\"entypo-key\"></span> 비밀번호 찾기 </h2>\n");
      out.write(" \n");
      out.write("  <span class=\"entypo-user inputUserIcon\">\n");
      out.write("     <i class=\"fa fa-user\"></i>\n");
      out.write("   </span>\n");
      out.write("  <input type=\"text\" class=\"member_id\" placeholder=\"아이디를 입력해 주세요 \t\"/>\n");
      out.write(" \n");
      out.write("  <span class=\"entypo-mail inputPassIcon\">\n");
      out.write("   </span>\n");
      out.write("  <input type=\"text\" style =\"width:300px;  display:inline-block;\" class=\"member_email\"placeholder=\"이메일을 입력해주세요 \"/>  \n");
      out.write("  <button class=\"submit\" onclick=\"namecheck()\"><span >임시비밀번호 발급</span></button>\n");
      out.write("<p style=\"display:none;\" class=\"err\"></p> \n");
      out.write("<input style =\" display:none;\" type=\"text\" class=\"authkey\" placeholder=\"인증번호를 입력해 주세요. \t\"/>\n");
      out.write("  \n");
      out.write("\n");
      out.write("  <span id=\"countdown\"></span>\n");
      out.write("  <div id =\"temppw\"></div>\n");
      out.write("   \n");
      out.write("</body>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("$('document').ready(function(){\n");
      out.write("\t$('.authkey').hide();\n");
      out.write("});\n");
      out.write("\n");
      out.write("$(\".user\").focusin(function(){\n");
      out.write("  $(\".inputUserIcon\").css(\"color\", \"#e74c3c\");\n");
      out.write("}).focusout(function(){\n");
      out.write("  $(\".inputUserIcon\").css(\"color\", \"white\");\n");
      out.write("});\n");
      out.write("\n");
      out.write("$(\".pass\").focusin(function(){\n");
      out.write("  $(\".inputPassIcon\").css(\"color\", \"#e74c3c\");\n");
      out.write("}).focusout(function(){\n");
      out.write("  $(\".inputPassIcon\").css(\"color\", \"white\");\n");
      out.write("});\n");
      out.write("\n");
      out.write("function namecheck(){\n");
      out.write("\tvar member_id = $('.member_id').val().trim();\n");
      out.write("\tvar member_email = $('.member_email').val().trim();\n");
      out.write("\tvar checkValue = {\n");
      out.write("\t\t\t'member_id' : member_id,\n");
      out.write("\t\t\t'member_email' : member_email\n");
      out.write("\t};\n");
      out.write("\t\n");
      out.write("\tif (member_id == null || member_id == \"\" || member_email == null\n");
      out.write("\t\t\t|| member_email == \"\") {\n");
      out.write("\t\t$(\".err\").show();\n");
      out.write("\t\t$(\".err\").html(\"이름 또는 메일을 제대로 입력해 주세요!\");\n");
      out.write("\t\t$(\".err\").css(\"color\", \"red\");\n");
      out.write("\t\t$(\".err\").css(\"font-size\",\"9pt\");\n");
      out.write("\t} else {\n");
      out.write("\t\t$.ajax({\n");
      out.write("\t\t\ttype : \"post\",\n");
      out.write("\t\t\turl : \"findpwcheck.do\",\n");
      out.write("\t\t\tdata : JSON.stringify(checkValue),\n");
      out.write("\t\t\tcontentType : \"application/json\",\n");
      out.write("\t\t\tsuccess : function(msg) {\n");
      out.write("\t\t\t\tif (msg.check == 'true') {\n");
      out.write("\t\t\t\t\t\t$.ajax({\n");
      out.write("\t\t\t\t\t\t\turl:'mailsend.do?member_email='+member_email,\n");
      out.write("\t\t\t\t\t\t\ttype:'GET',\n");
      out.write("\t\t\t\t\t\t\tsuccess:function(data){\n");
      out.write("\t\t\t\t\t\t\t\tconsole.log(data)\n");
      out.write("\t\t\t\t\t\t\t\tif(data.res =='ok'){\n");
      out.write("\t\t\t\t\t\t\t\t\talert('임시비밀번호 정상발급 되었습니다!');\n");
      out.write("\t\t\t\t\t\t\t\t}else{\n");
      out.write("\t\t\t\t\t\t\t\t\talert(\"실패\");\n");
      out.write("\t\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\t\terror:function(err){\n");
      out.write("\t\t\t\t\t\t\t\tconsole.log(err)\n");
      out.write("\t\t\t\t\t\t\t\talert(err);\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t});\t\n");
      out.write("\t\t\t\t\t}else{\n");
      out.write("\t\t\t\t\t\t$(\".err\").show();\n");
      out.write("\t\t\t\t\t\t$(\".err\").html(\"입력하신 정보로 조회된게 없습니다.이름과 이메일을 다시 확인해 주세요. \");\n");
      out.write("\t\t\t\t\t\t$(\".err\").css(\"color\", \"red\");\n");
      out.write("\t\t\t\t\t\t$(\".err\").css(\"font-size\",\"9pt\");\n");
      out.write("\t\t\t\t\t}\n");
      out.write("\t\t\t},\n");
      out.write("\t\t\terror : function(msg) {\n");
      out.write("\t\t\t\tconsole.log(msg);\n");
      out.write("\t\t\t\talert(\"통신 실패\");\n");
      out.write("\t\t\t}\n");
      out.write("\t\t});\n");
      out.write("\t}\n");
      out.write("}\n");
      out.write("\n");
      out.write("</script>\n");
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
