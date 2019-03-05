<%-- 
    Author     : Laura del Pimo Heredia
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
        <title>Añadir jornada</title>
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
                
                    <h2 style="color: #a57bf2;">¡Partido añadido!</h2></div>
        </div>
        <%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mis_partidos","root", "");
		Statement s = conexion.createStatement();
                
                String fecha = "";
                String hora = "";
                String resultado = "";
                
                if (request.getParameter("fecha").equals("")){
                    fecha = "NULL";
                } else{
                    fecha = "'" + request.getParameter("fecha") + "'";
                }
                
                if (request.getParameter("hora").equals("")){
                    hora = "NULL";
                } else{
                    hora = "'" + request.getParameter("hora") + "'";
                }
                
                if (request.getParameter("resultado").equals("")){
                    resultado = "NULL";
                } else{
                    resultado = "'" + request.getParameter("resultado") + "'";
                }
		
		String add = "INSERT INTO jornada (numero_jornada, equipo_local, equipo_visitante, fecha, hora, resultado) VALUES ('";
		add += request.getParameter("numero_jornada") + "', '" + request.getParameter("equipo_local") + "', '";
                add += request.getParameter("equipo_visitante") + "', " + fecha + ", ";
                add += hora + ", " + resultado + ")";
		
		s.execute(add);
		conexion.close();
	%>
    </body>
</html>
