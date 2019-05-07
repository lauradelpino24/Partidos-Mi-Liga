<%@page import="java.sql.*"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>

<%
  String usuario = request.getParameter("usuario");
  String contrasena = DigestUtils.sha256Hex(request.getParameter("contrasena"));
  String equipo = request.getParameter("equipo");

  //Conexion con la base de datos
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mis_partidos", "root", "");
  Statement s = conexion.createStatement();
  ResultSet listadoUser = s.executeQuery("SELECT count(usuario) FROM usuario WHERE usuario = '" + usuario + "'");
  
    int existeUsuario = 0;

  while (listadoUser.next()) {
    existeUsuario = Integer.parseInt(listadoUser.getString("count(usuario)"));
  }
  
if(existeUsuario > 0){
  
  session.setAttribute("error", "Usuario ya existente.");
  response.sendRedirect("registro.jsp");
}else{
  String sql = "INSERT INTO usuario (usuario, contrasena, id_equipo) VALUES ('" + usuario + "', '" + contrasena + "', '" + equipo +"')";
  s.execute(sql);
  response.sendRedirect("index.jsp");
  
}

%>


