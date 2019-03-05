package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.oracle.util.Checksums.update
        (Adler32;
import ByteBuffer
        );
import com.oracle.util.Checksums.update
        (Adler32;
import ByteBuffer
        );
import com.oracle.util.Checksums.update
        (Adler32;
import ByteBuffer
        );
import java.sql.*;

public final class index_005f1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <!--Links para usar Bootstrap-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\"  crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css\"  crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js\"  crossorigin=\"anonymous\"></script>\n");
      out.write("        <title>Liga Femenina</title>\n");
      out.write("        <style>\n");
      out.write("\n");
      out.write("            *{\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- NAVBAR -->\n");
      out.write("        <nav class=\"navbar navbar-inverse navbar-fixed-top\">\n");
      out.write("            <div class=\"container-fluid\" style=\"background-color: lightcoral\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <a class=\"navbar-brand\" href=\"index.jsp\" style=\"color: black\">P E L I C L U B</a>\n");
      out.write("                </div>\n");
      out.write("                <ul class=\"nav navbar-nav\">\n");
      out.write("                    <li><a href=\"index.jsp\" style=\"color: black\">Inicio</a></li>\n");
      out.write("                    <li><a href=\"listaSocios.jsp\" style=\"color: black\">Equipos</a></li>\n");
      out.write("                    <li><a href=\"listaPelis.jsp\" style=\"color: black\">Jornadas</a></li>\n");
      out.write("                </ul>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        ");

            //Conexion con la base de datos

            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mis_partidos", "root", "root");
            Statement s = conexion.createStatement();
            ResultSet listado = s.executeQuery("SELECT * FROM jornada");
            String cla = "";
            String update = "";
            boolean con = false;
            // Generar la tabla con datos
            while (listado.next()) { 

                if (con) {
                    cla = "stripped";
                    con = false;
                } else {
                    cla = "stripped2";
                    con = true;
                }

                update += listado.getString("id") + "&titulo=" + listado.getString("titulo")
                        + "&descripcion=" + listado.getString("descripcion") + "&genero="
                        + listado.getString("genero") + "&numerodecapitulos="
                        + listado.getString("numerodecapitulos");

                out.print("<tr class='" + cla + "'>\n");
                out.println("<td>" + listado.getString("id") + "</td>");
                out.println("<td>" + listado.getString("fecha") + "</td>");
                out.println("<td>" + listado.getString("horario") + "</td>");
                out.println("<td>" + listado.getString("resultado") + "</td>");
                out.print("<td><button type='submit' class='mod' onclick='buttonClick(this)'>Modificar</button></td>");
                out.println("<td><a href='delete.jsp?id=" + listado.getString("id") + "'><button type='submit' class='eli'>"
                        + "Eliminar</button></td></a>");
                out.print("</tr>\n");
            }
            conexion.close();
        
      out.write("\n");
      out.write("        <div>\n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("                    <th>ID</th>\n");
      out.write("                    <th>FECHA</th>\n");
      out.write("                    <th>HORARIO</th>\n");
      out.write("                    <th>RESULTADO</th>\n");
      out.write("                </tr>\n");
      out.write("                ");

                    while (listado.next()) {
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print( listado.getInt("Id"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( listado.getDate("Fecha"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( listado.getTime("Horario"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( listado.getString("Resultado"));
      out.write("</td>\n");
      out.write("                    <td>\n");
      out.write("                        <a>Editar</a>\n");
      out.write("                        <a>Eliminar</a>\n");
      out.write("                        <a>Añadir</a>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
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
