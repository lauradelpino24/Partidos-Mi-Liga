<%-- 
    Document   : registro
    Created on : 03-may-2019, 10:46:24
    Author     : laura
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Links para usar Bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"  crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"  crossorigin="anonymous"></script>
        <title>Registrarse</title>
        <style>
            body{
                background-color: #e5cbf4;
                text-align: center;
            }

            .container{
                padding: 0;
            }

            p.form-title
            {
                font-family: 'Open Sans' , sans-serif;
                font-size: 20px;
                font-weight: 600;
                text-align: center;
                color: black;
                text-transform: uppercase;
                letter-spacing: 4px;
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
                        out.print("<li><a href='logout.jsp' style='color: whitesmoke'>Cerrar sesión</a></li>");
                      } else {
                        out.print("<li><a href='resgitro.jsp' style='color: whitesmoke'>Registro</a></li>");
                      }
                    %>

                </ul>
        </nav>
        <%
          if(session.getAttribute("error") != null ){
            out.print(session.getAttribute("error"));
          }
        %>
        <%
          session.removeAttribute("error");
        %>
<div class="container" style="margin-top: 7vw; padding-top: 2vw; padding-bottom: 2vw;">
    <p class="form-title">
                Registrarse</p>
        <form role="form" action="registro2.jsp">
            <div class="form-group">
                <label for="email">Usuario:</label>
                <input type="text" class="form-control" id="usuario" name="usuario">
            </div>
            <div class="form-group">
                <label for="pwd">Contraseña</label>
                <input type="password" class="form-control" id="contrasena" name="contrasena">
            </div>
            <%
              //Conexion con la base de datos
              Class.forName("com.mysql.jdbc.Driver");
              Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mis_partidos", "root", "");
              Statement s = conexion.createStatement();

              ResultSet listadoEquipos = s.executeQuery("SELECT id, nombre FROM equipo");

              out.print("<select name=\"equipo\" required=\"required\" style=\" border: solid 6px white; border-radius: 0.5vw; margin-right: 1vw;\" >");

              while (listadoEquipos.next()) {

                out.print("<option class='bg-dark' value=\"" + listadoEquipos.getString("id") + "\">" + listadoEquipos.getString("nombre") + "</option>");
              }

              out.print("</select>");
            %>
            <button type="submit" class="btn btn-default">Enviar</button>
        </form>
</div>
    </body>

</html>
