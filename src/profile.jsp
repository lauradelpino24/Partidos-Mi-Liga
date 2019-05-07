<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil de usuario</title>
        <!--Links para usar Bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"  crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"  crossorigin="anonymous"></script>
        <style>

            *{
                margin: 0;
                padding: 0;
            }


        </style>
    </head>
    <body>
        <!-- NAVBAR -->
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid" style="background-color: #a57bf2">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp" style="color: white"> MI LIGA </a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp" style="color: whitesmoke">Inicio</a></li>
                    <li><a href="formulario-login.jsp" style="color: whitesmoke">Iniciar sesión</a></li>

                    <%
                      if (session.getAttribute("usuario") != null) {
                        out.print("<li><a href='profile.jsp' style='color: whitesmoke'>Ver mi perfil</a></li>");
                      }

                      if (session.getAttribute("usuario") != null) {
                        out.print("<li><a href='logout.jsp' style='color: whitesmoke'>Cerrar sesión</a></li>");
                      } else {
                        out.print("<li><a href='registro.jsp' style='color: whitesmoke'>Registro</a></li>");
                      }
                    %>




                </ul>
        </nav>
        <%
          if (session.getAttribute("usuario") == null) {
            session.setAttribute("error", "Debe iniciar sesión para acceder a la página del perfil.");
            response.sendRedirect("formulario-login.jsp");
          }
          //Conexion con la base de datos
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mis_partidos", "root", "");
          Statement s = conexion.createStatement();
          String usuario = session.getAttribute("usuario").toString();
          ResultSet propUsuario = s.executeQuery("SELECT e.nombre, s.estadio FROM usuario u INNER JOIN equipo e ON u.id_equipo=e.id INNER JOIN estadio s ON e.id_estadio=s.id_estadio WHERE u.usuario='" + usuario + "'");

          String id = null;
          String estadio = null;

          while (propUsuario.next()) {
            id = propUsuario.getString("nombre");
            estadio = propUsuario.getString("estadio");
          }
        %>



        <div class="container-fluid" style="margin-top: 4vw; padding-bottom: 18vw; padding-top: 3vw; background-color: gray; color: white; text-align: center;">
            <img src="http://lorempixel.com/200/200/sports">
            <br>
            <div class="container">
                Nombre de usuario: <%= usuario%><br>
                Mi equipo: <%= id%><br>
                Mi estadio: <%= estadio %><br>
            </div>
        </div>


    </body>
</html>