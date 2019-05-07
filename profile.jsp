<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                      if(session.getAttribute("usuario") != null){
                        out.print("<li><a href='profile.jsp' style='color: whitesmoke'>Ver mi perfil</a></li>");
                      }
                      
                      if(session.getAttribute("usuario") != null){
                        out.print("<li><a href='logout.jsp' style='color: whitesmoke'>Cerrar sesión</a></li>");
                      }else{
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
        %>

        

        <div class="container-fluid" style="margin-top: 4vw; padding-bottom: 18vw; padding-top: 3vw; background-color: gray; color: white; text-align: center;">
            <img src="http://lorempixel.com/200/200/sports">
            <div class="container">
            Nombre de usuario: <%= session.getAttribute("usuario")%><br>
            Mi equipo: <%= session.getAttribute("id_equipo") %><br>
            Mi estadio: <%= session.getAttribute("id_estadio") %><br>
            </div>
        </div>


    </body>
</html>