<%@page import="java.sql.*"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%

  String usuario = request.getParameter("usuario");
  String contrasena = DigestUtils.sha256Hex(request.getParameter("contrasena"));
  //Conexion con la base de datos
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mis_partidos", "root", "");
  Statement s = conexion.createStatement();
  ResultSet listadoUser = s.executeQuery("SELECT contrasena FROM usuario WHERE usuario = '" + usuario + "'");

  String contrasenaBBDD = null;

  while (listadoUser.next()) {
    contrasenaBBDD = listadoUser.getString("contrasena");
  }

  if (contrasenaBBDD == null || !contrasenaBBDD.equals(contrasena)) {
    session.setAttribute("error", "Usuario o contraseña incorrecta, vuelve a introducir los datos.");
    response.sendRedirect("formulario-login.jsp");
  } else {
    session.setAttribute("usuario", usuario);
    response.sendRedirect("index.jsp");
    //profile.jsp
  }


%>
