<%-- 
    Author     : Laura del Pino Heredia
--%>

<%@page import="java.sql.Statement"%>
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
        <title>Modificar</title>

        <style>
            *{
                margin: 0;
                padding: 0;
            }

            #container1{

                margin-top: 2.5vw;
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
                </ul>
        </nav>
        <div id="container1">
            <div class="panel panel-info" style="background-color: white; text-align: center;">

                
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mis_partidos", "root", "");
                        Statement s = conexion.createStatement();

                        String cambiar = "UPDATE jornada SET numero_jornada";

                        cambiar += "= '" + request.getParameter("numero_jornada") + "', equipo_local = '" + request.getParameter("equipo_local")
                                + "', equipo_visitante = '" + request.getParameter("equipo_visitante") + "', fecha = '" + request.getParameter("fecha")
                                + "', hora = '" + request.getParameter("hora") + "', resultado = '" + request.getParameter("resultado") 
                                + "' WHERE numero_jornada = " + request.getParameter("numero_jornada");
                        
                        s.execute(cambiar);

                        conexion.close();
                        
                        response.sendRedirect("./");

                    %>
            </div>
        </div>
    </body>
</html>
