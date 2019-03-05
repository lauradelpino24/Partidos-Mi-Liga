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
        <title>Eliminar partido</title>
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
                    <li><a href="equipo.jsp" style="color: whitesmoke">Equipos</a></li>
                </ul>
        </nav>
        <div id="container1">
            <div class="panel panel-info" style="background-color: white; text-align: center;">
                
                    <h2 style="color: #a57bf2;">¿Partido cancelado? ¡Eliminado!</h2>
                    <br>
                    <h3 style="color: #a57bf2;">Vuelve a la página de inicio, ahora no aparecerá.</h3>
            </div>
        </div>
            <%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mis_partidos","root", "");
		Statement s = conexion.createStatement();
		
		String delete = "DELETE FROM jornada WHERE numero_jornada = ";
		delete += request.getParameter("id");
		
		s.execute(delete);
		
		conexion.close();
            %>
    </body>
</html>
