package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\" dir=\"ltr\">\n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"utf-8\" />\n");
      out.write("    <title>Login</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"style.css\" />\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n");
      out.write("    <link\n");
      out.write("      href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\"\n");
      out.write("      rel=\"stylesheet\"\n");
      out.write("    />\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js\"></script>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css\">\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.5.1.min.js\"></script>\n");
      out.write("\n");
      out.write("    <style>\n");
      out.write("      @import url(\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap\");\n");
      out.write("\n");
      out.write("      * {\n");
      out.write("        margin: 0;\n");
      out.write("        padding: 0;\n");
      out.write("        box-sizing: border-box;\n");
      out.write("        font-family: \"Poppins\", sans-serif;\n");
      out.write("      }\n");
      out.write("      html,\n");
      out.write("      body {\n");
      out.write("        display: grid;\n");
      out.write("        height: 100%;\n");
      out.write("        width: 100%;\n");
      out.write("        place-items: center;\n");
      out.write("        /* background: -webkit-linear-gradient(left, #a445b2, #fa4299); */\n");
      out.write("      }\n");
      out.write("      ::selection {\n");
      out.write("        /* background: #fa4299; */\n");
      out.write("        color: #fff;\n");
      out.write("      }\n");
      out.write("      .wrapper {\n");
      out.write("        overflow: hidden;\n");
      out.write("        max-width: 390px;\n");
      out.write("        background: #fff;\n");
      out.write("        padding: 30px;\n");
      out.write("        border-radius: 5px;\n");
      out.write("        box-shadow: 0px 15px 20px rgba(0, 0, 0, 0.1);\n");
      out.write("        border-bottom: 6px solid blue;\n");
      out.write("      }\n");
      out.write("      .wrapper .title-text {\n");
      out.write("        display: flex;\n");
      out.write("        width: 200%;\n");
      out.write("      }\n");
      out.write("      .wrapper .title {\n");
      out.write("        width: 50%;\n");
      out.write("        font-size: 20px;\n");
      out.write("        font-weight: 600;\n");
      out.write("        text-align: center;\n");
      out.write("        /* transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55); */\n");
      out.write("      }\n");
      out.write("      .wrapper .slide-controls {\n");
      out.write("        position: relative;\n");
      out.write("        display: flex;\n");
      out.write("        height: 50px;\n");
      out.write("        width: 100%;\n");
      out.write("        overflow: hidden;\n");
      out.write("        margin: 30px 0 10px 0;\n");
      out.write("        justify-content: space-between;\n");
      out.write("        /* border: 1px solid lightgrey; */\n");
      out.write("        border-radius: 5px;\n");
      out.write("      }\n");
      out.write("      .slide-controls .slide {\n");
      out.write("        height: 100%;\n");
      out.write("        width: 100%;\n");
      out.write("        color: #fff;\n");
      out.write("        font-size: 18px;\n");
      out.write("        font-weight: 500;\n");
      out.write("        text-align: center;\n");
      out.write("        line-height: 48px;\n");
      out.write("        cursor: pointer;\n");
      out.write("        z-index: 1;\n");
      out.write("        transition: all 0.6s ease;\n");
      out.write("      }\n");
      out.write("      .slide-controls label.signup {\n");
      out.write("        color: #000;\n");
      out.write("      }\n");
      out.write("      .slide-controls .slider-tab {\n");
      out.write("        position: absolute;\n");
      out.write("        height: 100%;\n");
      out.write("        width: 50%;\n");
      out.write("        left: 0;\n");
      out.write("        z-index: 0;\n");
      out.write("        border-radius: 5px;\n");
      out.write("        background: #0d1449;\n");
      out.write("        /* transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55); */\n");
      out.write("      }\n");
      out.write("      input[type=\"radio\"] {\n");
      out.write("        display: none;\n");
      out.write("      }\n");
      out.write("      #signup:checked ~ .slider-tab {\n");
      out.write("        left: 50%;\n");
      out.write("      }\n");
      out.write("      #signup:checked ~ label.signup {\n");
      out.write("        color: #fff;\n");
      out.write("        cursor: default;\n");
      out.write("        user-select: none;\n");
      out.write("      }\n");
      out.write("      #signup:checked ~ label.login {\n");
      out.write("        color: #000;\n");
      out.write("      }\n");
      out.write("      #login:checked ~ label.signup {\n");
      out.write("        color: #000;\n");
      out.write("      }\n");
      out.write("      #login:checked ~ label.login {\n");
      out.write("        cursor: default;\n");
      out.write("        user-select: none;\n");
      out.write("      }\n");
      out.write("      .wrapper .form-container {\n");
      out.write("        width: 100%;\n");
      out.write("        overflow: hidden;\n");
      out.write("      }\n");
      out.write("      .form-container .form-inner {\n");
      out.write("        display: flex;\n");
      out.write("        width: 200%;\n");
      out.write("      }\n");
      out.write("      .form-container .form-inner form {\n");
      out.write("        width: 50%;\n");
      out.write("        /* transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55); */\n");
      out.write("      }\n");
      out.write("      .form-inner form .field {\n");
      out.write("        height: 50px;\n");
      out.write("        width: 100%;\n");
      out.write("        margin-top: 20px;\n");
      out.write("      }\n");
      out.write("      .form-inner form .field input {\n");
      out.write("        height: 100%;\n");
      out.write("        width: 100%;\n");
      out.write("        outline: none;\n");
      out.write("        padding-left: 15px;\n");
      out.write("        border-radius: 5px;\n");
      out.write("        border: 1px solid lightgrey;\n");
      out.write("        border-bottom-width: 2px;\n");
      out.write("        font-size: 17px;\n");
      out.write("        /* transition: all 0.3s ease; */\n");
      out.write("      }\n");
      out.write("      .form-inner form .field input:focus {\n");
      out.write("        border-color: #0d1449;\n");
      out.write("        /* box-shadow: inset 0 0 3px #fb6aae; */\n");
      out.write("      }\n");
      out.write("      .form-inner form .field input::placeholder {\n");
      out.write("        color: #999;\n");
      out.write("        transition: all 0.3s ease;\n");
      out.write("      }\n");
      out.write("      form .field input:focus::placeholder {\n");
      out.write("        color: #b3b3b3;\n");
      out.write("      }\n");
      out.write("      .form-inner form .pass-link {\n");
      out.write("        margin-top: 5px;\n");
      out.write("      }\n");
      out.write("      .form-inner form .signup-link {\n");
      out.write("        text-align: center;\n");
      out.write("        margin-top: 30px;\n");
      out.write("      }\n");
      out.write("      .form-inner form .pass-link a,\n");
      out.write("      .form-inner form .signup-link a {\n");
      out.write("        color: #0d1449;\n");
      out.write("        text-decoration: none;\n");
      out.write("      }\n");
      out.write("      .form-inner form .pass-link a:hover,\n");
      out.write("      .form-inner form .signup-link a:hover {\n");
      out.write("        text-decoration: underline;\n");
      out.write("      }\n");
      out.write("      form .btn {\n");
      out.write("        height: 50px;\n");
      out.write("        width: 100%;\n");
      out.write("        border-radius: 5px;\n");
      out.write("        position: relative;\n");
      out.write("        overflow: hidden;\n");
      out.write("      }\n");
      out.write("      a{\n");
      out.write("        color: blue !important;\n");
      out.write("      }\n");
      out.write("      form .btn .btn-layer {\n");
      out.write("        height: 100%;\n");
      out.write("        width: 300%;\n");
      out.write("        position: absolute;\n");
      out.write("        left: -100%;\n");
      out.write("        background: #0d1449;\n");
      out.write("        border-radius: 5px;\n");
      out.write("        /* transition: all 0.4s ease;; */\n");
      out.write("      }\n");
      out.write("      /* form .btn:hover .btn-layer {\n");
      out.write("        left: 0;\n");
      out.write("      } */\n");
      out.write("      form .btn input[type=\"submit\"] {\n");
      out.write("        height: 100%;\n");
      out.write("        width: 100%;\n");
      out.write("        z-index: 1;\n");
      out.write("        position: relative;\n");
      out.write("        background: none;\n");
      out.write("        border: none;\n");
      out.write("        color: #fff;\n");
      out.write("        padding-left: 0;\n");
      out.write("        border-radius: 5px;\n");
      out.write("        font-size: 20px;\n");
      out.write("        font-weight: 500;\n");
      out.write("        cursor: pointer;\n");
      out.write("      }\n");
      out.write("      .btn-layer:hover{\n");
      out.write("        background:blue !important;\n");
      out.write("      }\n");
      out.write("    </style>\n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("      ");

         String log=(String)request.getAttribute("NotLogin");
         if(log!=null)
         {
             
      out.write("\n");
      out.write("             <script>\n");
      out.write("                $(document).ready(function(){\n");
      out.write("                        $('#danger-alert-modal').modal('show');\n");
      out.write("                    });\n");
      out.write("             </script>\n");
      out.write("             ");

         }
      
      out.write("\n");
      out.write("    <div class=\"wrapper\">\n");
      out.write("      <div class=\"title-text\">\n");
      out.write("        <div class=\"title login\">Login with Email</div>\n");
      out.write("        <div class=\"title signup\">Login with Username</div>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"form-container\">\n");
      out.write("        <div class=\"slide-controls\">\n");
      out.write("          <input type=\"radio\" name=\"slide\" id=\"login\" checked />\n");
      out.write("          <input type=\"radio\" name=\"slide\" id=\"signup\" />\n");
      out.write("          <label for=\"login\" class=\"slide login\">Email</label>\n");
      out.write("          <label for=\"signup\" class=\"slide signup\">Username</label>\n");
      out.write("          <div class=\"slider-tab\"></div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"form-inner\">\n");
      out.write("            <form action=\"UserLoginCheckerServlet\" class=\"login\" method=\"post\">\n");
      out.write("            <div class=\"field\">\n");
      out.write("                <input type=\"hidden\" value=\"email\" name=\"mode\">\n");
      out.write("                <input type=\"text\" name=\"userid\" onkeyup=\"this.value=removeSpaces(this.value);\" id=\"username\" placeholder=\"Enter Email\" required />\n");
      out.write("            </div>\n");
      out.write("            <div class=\"field\">\n");
      out.write("              <input type=\"password\" name=\"password\" placeholder=\"Password\" required />\n");
      out.write("            </div>\n");
      out.write("            <div class=\"pass-link\">\n");
      out.write("              <a href=\"#\">Forgot password?</a>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"field btn\">\n");
      out.write("                <button class=\"btn-layer\"\n");
      out.write("                type=\"submit\"\n");
      out.write("                value=\"Send\"\n");
      out.write("                class=\"next_btn\"\n");
      out.write("                style=\"color: white; border:none;cursor: pointer;font-size: 18px;\"\n");
      out.write("              >\n");
      out.write("                Login\n");
      out.write("              </button>\n");
      out.write("            </div>\n");
      out.write("                <div><br>\n");
      out.write("              Don't have account? <a href=\"userGetOTP.jsp\">Register</a>\n");
      out.write("            </div>\n");
      out.write("          </form>\n");
      out.write("            <form action=\"UserLoginCheckerServlet\" class=\"signup\" method=\"post\">\n");
      out.write("            <div class=\"field\">\n");
      out.write("                <input type=\"hidden\" value=\"username\" name=\"mode\">\n");
      out.write("              <input type=\"text\" name=\"userid\" placeholder=\"Enter Username\" required />\n");
      out.write("            </div>\n");
      out.write("            <div class=\"field\">\n");
      out.write("              <input type=\"password\" name=\"password\" placeholder=\"Password\" required />\n");
      out.write("            </div>\n");
      out.write("            <div class=\"pass-link\">\n");
      out.write("              <a href=\"#\">Forgot password?</a>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"field btn\">\n");
      out.write("              \n");
      out.write("                <button class=\"btn-layer\"\n");
      out.write("                  type=\"submit\"\n");
      out.write("                  value=\"Send\"\n");
      out.write("                  class=\"next_btn\"\n");
      out.write("                  style=\"color: white;border:none;cursor: pointer; font-size: 18px;\"\n");
      out.write("                >\n");
      out.write("                  Login\n");
      out.write("                </button>\n");
      out.write("              \n");
      out.write("            </div>\n");
      out.write("                <div><br>\n");
      out.write("              Don't have account? <a href=\"userGetOTP.jsp\">Register</a>\n");
      out.write("            </div>\n");
      out.write("          </form>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("<!--Danger Pop-up modal-->\n");
      out.write("    <!-- Danger Alert Modal -->\n");
      out.write("        <div id=\"danger-alert-modal\" class=\"modal fade\" tabindex=\"-1\" role=\"dialog\" aria-hidden=\"true\">\n");
      out.write("            <div class=\"modal-dialog modal-sm\">\n");
      out.write("                <div class=\"modal-content modal-filled bg-danger\">\n");
      out.write("                    <div class=\"modal-body p-4\">\n");
      out.write("                        <div class=\"text-center\">\n");
      out.write("                            <i class=\"dripicons-wrong h1\"></i>\n");
      out.write("                            <h4 class=\"mt-2\">Oh snap!</h4>\n");
      out.write("                            <p class=\"mt-3\">Wrong Username or Password...</p>\n");
      out.write("                            <button type=\"button\" class=\"btn btn-light my-2\" data-bs-dismiss=\"modal\">Retry</button>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div><!-- /.modal-content -->\n");
      out.write("            </div><!-- /.modal-dialog -->\n");
      out.write("        </div><!-- /.modal -->\n");
      out.write("        \n");
      out.write("      <script>\n");
      out.write("                function removeSpaces(string) {\n");
      out.write("       return string.split(' ').join('');\n");
      out.write("      }\n");
      out.write("      </script>\n");
      out.write("      <script type=\"text/javascript\">\n");
      out.write("        $(document).ready(function(){\n");
      out.write("\n");
      out.write("            $(\"#username\").blur(function(){\n");
      out.write("\n");
      out.write("                var username =$(\"#username\").val();\n");
      out.write("\n");
      out.write("                if(username.length >= 3)\n");
      out.write("                {\n");
      out.write("                    $.ajax({\n");
      out.write("                        url:\"check.jsp\",\n");
      out.write("                        type:\"post\",\n");
      out.write("                        data:\"uname=\"+username,\n");
      out.write("                        dataType:\"text\",\n");
      out.write("                        success:function(data)\n");
      out.write("                        {\n");
      out.write("                            $(\"#available\").html(data)\n");
      out.write("                        } \n");
      out.write("                    });\n");
      out.write("                }\n");
      out.write("                else\n");
      out.write("                {\n");
      out.write("                  $(\"#available\").html(\" \");\n");
      out.write("                }\n");
      out.write("\n");
      out.write("           }); \n");
      out.write("\n");
      out.write("        });    \n");
      out.write("        </script>\n");
      out.write("    <script>\n");
      out.write("      const loginText = document.querySelector(\".title-text .login\");\n");
      out.write("      const loginForm = document.querySelector(\"form.login\");\n");
      out.write("      const loginBtn = document.querySelector(\"label.login\");\n");
      out.write("      const signupBtn = document.querySelector(\"label.signup\");\n");
      out.write("      const signupLink = document.querySelector(\"form .signup-link a\");\n");
      out.write("      signupBtn.onclick = () => {\n");
      out.write("        loginForm.style.marginLeft = \"-50%\";\n");
      out.write("        loginText.style.marginLeft = \"-50%\";\n");
      out.write("      };\n");
      out.write("      loginBtn.onclick = () => {\n");
      out.write("        loginForm.style.marginLeft = \"0%\";\n");
      out.write("        loginText.style.marginLeft = \"0%\";\n");
      out.write("      };\n");
      out.write("      signupLink.onclick = () => {\n");
      out.write("        signupBtn.click();\n");
      out.write("        return false;\n");
      out.write("      };\n");
      out.write("    </script>\n");
      out.write("    <script src=\"assets/js/vendor.min.js\"></script>\n");
      out.write("    <script src=\"assets/js/app.min.js\"></script>\n");
      out.write("\n");
      out.write("  </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}