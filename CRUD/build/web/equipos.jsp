<%-- 
    Author     : Laura
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--Links para usar Bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"  crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"  crossorigin="anonymous"></script>
        <title>MI LIGA</title>
        <style>

            *{
                margin: 0;
                padding: 0;
            }
            
            #container1{
                
                margin-top: 2.5vw;
            }
            
            th, tbody {
                text-align: center;
            }
            

        </style>
    </head>
    <body>
        <div id="container1">
        <!-- NAVBAR -->
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid" style="background-color: #a57bf2">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp" style="color: white"> MI LIGA </a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp" style="color: whitesmoke">Inicio</a></li>
                    <li><a href="equipos.jsp" style="color: whitesmoke">Equipos</a></li>
                </ul>
        </nav>
        <%
            //Conexion con la base de datos

            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mis_partidos", "root", "");
            Statement s = conexion.createStatement();
            Statement s1 = conexion.createStatement();
            ResultSet listadoEquipo = s1.executeQuery("SELECT * FROM equipo");
            HashMap<String, String> equipos = new HashMap<String, String>();
            
            while (listadoEquipo.next()) {
                
                equipos.put(listadoEquipo.getString("id"), listadoEquipo.getString("nombre"));
            }
            
            
        %>
        </div>
            <table class="table table-striped">
                <tr>
                    <th>ID</th>
                    <th>NOMBRE DE EQUIPO</th>
                </tr>
                <%
	                while (listadoEquipo.next()) { // Generación de tabla con datos de la BBDD
	
	                    out.print("<tr>\n");
	                    out.println("<td>" + listadoEquipo.getString("id") + "</td>");
	                    out.println("<td>" + equipos.get(listadoEquipo.getString("nombre de equipo")) + "</td>");
	                    out.print("</tr>\n");
	                }
	                conexion.close();
                %>
                
                
            </table>
    </body>
</html>
