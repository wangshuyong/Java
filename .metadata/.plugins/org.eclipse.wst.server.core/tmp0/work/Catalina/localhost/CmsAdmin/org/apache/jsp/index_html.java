package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_html extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
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

      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Home</title>\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("<meta name=\"keywords\" content=\"\" />\r\n");
      out.write("<script type=\"application/x-javascript\"> addEventListener(\"load\", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>\r\n");
      out.write("<!-- bootstrap-css -->\r\n");
      out.write("\t<link href=\"web/css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\r\n");
      out.write("<!--// bootstrap-css -->\r\n");
      out.write("<!-- css -->\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"web/css/style.css\" type=\"text/css\" media=\"all\" />\r\n");
      out.write("<!--// css -->\r\n");
      out.write("\t<script src=\"web/js/jquery-1.11.0.min.js\"></script>\r\n");
      out.write("<!--fonts-->\r\n");
      out.write("\t<link href='http://fonts.useso.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>\r\n");
      out.write("\t<link href='http://fonts.useso.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>\r\n");
      out.write("<!--/fonts-->\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<!-- header nav -->\r\n");
      out.write("\t<div class=\"header-nav\">\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"header\">\r\n");
      out.write("\t\t\t\t<div class=\"head-logo\">\r\n");
      out.write("\t\t\t\t\t<a href=\"index.html\"><img src=\"web/images/logo.png\" alt=\"\" /></a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"header-info-right\">\r\n");
      out.write("\t\t\t\t\t<div class=\"header cbp-spmenu-push\">\r\n");
      out.write("\t\t\t\t\t\t<nav class=\"cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right\" id=\"cbp-spmenu-s2\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<a class=\"active\" href=\"index.html\">WHAT WE DO</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"work.html\">OUR WORK</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"clients.html\">CLIENTS</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"team.html\">TEAM</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"offices.html\">OFFICES</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"404.html\">EXPERIMENTS</a>\r\n");
      out.write("\t\t\t\t\t\t</nav>\r\n");
      out.write("\t\t\t\t\t\t<!--script-nav -->\t\r\n");
      out.write("\t\t\t\t\t\t<script>\r\n");
      out.write("\t\t\t\t\t\t\t$(\"span.menu\").click(function(){\r\n");
      out.write("\t\t\t\t\t\t\t\t$(\"ul.navigatoin\").slideToggle(\"300\" , function(){\r\n");
      out.write("\t\t\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"clearfix\"> </div>\r\n");
      out.write("\t\t\t\t\t\t<!-- /script-nav -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"main\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<section class=\"buttonset\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<button id=\"showRightPush\"><img src=\"web/images/menu.png\" /></button>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</section>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<!-- Classie - class helper functions by @desandro https://github.com/desandro/classie -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<script src=\"web/js/classie.js\"></script>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<script>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tvar\tmenuRight = document.getElementById( 'cbp-spmenu-s2' ),\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tshowRightPush = document.getElementById( 'showRightPush' ),\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tbody = document.body;\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tshowRightPush.onclick = function() {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tclassie.toggle( this, 'active' );\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tclassie.toggle( body, 'cbp-spmenu-push-toleft' );\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tclassie.toggle( menuRight, 'cbp-spmenu-open' );\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\tdisableOther( 'showRightPush' );\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t};\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"clearfix\"> </div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("<!--//header nav-->\r\n");
      out.write("<!--banner-->\r\n");
      out.write("<div class=\"banner\">\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t\t<div class=\"banner-info\">\r\n");
      out.write("\t\t\t<h1>We Create <span>Multimedia Content</span> for Business</h1>\r\n");
      out.write("\t\t\t<p>repeat predefined chunks as necessary making this first true generator</p>\r\n");
      out.write("\t\t\t<div class=\"video\">\r\n");
      out.write("\t\t\t\t<a class=\"play-icon popup-with-zoom-anim\" href=\"#small-dialog\">\r\n");
      out.write("\t\t\t\t\t<span> </span>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<!-- pop-up-box -->\r\n");
      out.write("\t\t\t\t\t\t<script type=\"text/javascript\" src=\"web/js/modernizr.custom.min.js\"></script>    \r\n");
      out.write("\t\t\t\t\t\t<link href=\"web/css/popuo-box.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\r\n");
      out.write("\t\t\t\t\t\t<script src=\"web/js/jquery.magnific-popup.js\" type=\"text/javascript\"></script>\r\n");
      out.write("\t\t\t\t\t\t<!--//pop-up-box -->\r\n");
      out.write("\t\t\t\t\t\t<div id=\"small-dialog\" class=\"mfp-hide\">\r\n");
      out.write("\t\t\t\t\t\t\t<iframe src=\"https://player.vimeo.com/video/117842421\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<script>\r\n");
      out.write("\t\t\t\t\t\t\t$(document).ready(function() {\r\n");
      out.write("\t\t\t\t\t\t\t$('.popup-with-zoom-anim').magnificPopup({\r\n");
      out.write("\t\t\t\t\t\t\t\ttype: 'inline',\r\n");
      out.write("\t\t\t\t\t\t\t\tfixedContentPos: false,\r\n");
      out.write("\t\t\t\t\t\t\t\tfixedBgPos: true,\r\n");
      out.write("\t\t\t\t\t\t\t\toverflowY: 'auto',\r\n");
      out.write("\t\t\t\t\t\t\t\tcloseBtnInside: true,\r\n");
      out.write("\t\t\t\t\t\t\t\tpreloader: false,\r\n");
      out.write("\t\t\t\t\t\t\t\tmidClick: true,\r\n");
      out.write("\t\t\t\t\t\t\t\tremovalDelay: 300,\r\n");
      out.write("\t\t\t\t\t\t\t\tmainClass: 'my-mfp-zoom-in'\r\n");
      out.write("\t\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"slide-bar\">\r\n");
      out.write("\t\t<ul>\r\n");
      out.write("\t\t\t<li class=\"active\"><a class=\"loc\" href=\"#\">Location</a></li>\r\n");
      out.write("\t\t\t<li><a class=\"wts-new\" href=\"#\">What's new</a></li>\r\n");
      out.write("\t\t\t<li><a class=\"partner\" href=\"#\">Partners</a></li>\r\n");
      out.write("\t\t\t<li><a class=\"milavo\" href=\"#\">Milavo</a></li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("<!--//banner-->\r\n");
      out.write("<!--footer-->\r\n");
      out.write("<div class=\"footer\">\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t\t<div class=\"footer-grids\">\r\n");
      out.write("\t\t\t<div class=\"footer-left\">\r\n");
      out.write("\t\t\t\t<p>Copyright &copy; 2015.Company name All rights reserved.<a target=\"_blank\" href=\"http://sc.chinaz.com/moban/\">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"footer-right\">\r\n");
      out.write("\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t<li><a class=\"twitter\" href=\"#\"></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a class=\"facebook\" href=\"#\"></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a class=\"sss\" href=\"#\"></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a class=\"vimeo\" href=\"#\"></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a class=\"message\" href=\"#\"></a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"clearfix\"></div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("<!--//footer-->\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
