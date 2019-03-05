<%-- 
    Author     : Laura del Pino Heredia
--%>
<%@page import="java.util.HashMap"%>
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
            <div class="panel panel-dark" style="background-color: white; text-align: center; margin-bottom: 0;">
                
                <h2 style="color: #a57bf2; margin-top: 1.5vw; margin-bottom: 1.5vw; ">Mis partidos</h2></div>
            <div class="panel panel-dark" style="background-color: #a57bf2; text-align: center; padding: 1vw; margin-top: 0;" >
                <form method="get" action="add.jsp">
		<input type="number" name="numero_jornada" placeholder="numero de jornada" required="required" style=" border: solid 6px white; border-radius: 0.5vw; margin-right: 1vw;">
                <%
	                Class.forName("com.mysql.jdbc.Driver");
	                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mis_partidos", "root", "");
	                Statement s = conexion.createStatement();
	                ResultSet listadoEquipos = s.executeQuery("SELECT id, nombre FROM equipo");
	                
	                out.print("<select name=\"equipo_local\" required=\"required\" style=\" border: solid 6px white; border-radius: 0.5vw; margin-right: 1vw;\" >");
	                
	                while (listadoEquipos.next()){
	                    
	                    out.print("<option value=\"" + listadoEquipos.getString("id") + "\">" + listadoEquipos.getString("nombre") + "</option>");
	                }
	                
	                out.print("</select>");
	                
	                listadoEquipos = s.executeQuery("SELECT id, nombre FROM equipo");
	                
					out.print("<select name=\"equipo_visitante\" required=\"required\" style=\" border: solid 6px white; border-radius: 0.5vw; margin-right: 1vw;\" >");
	                
	                while (listadoEquipos.next()){
	                    
	                    out.print("<option value=\"" + listadoEquipos.getString("id") + "\">" + listadoEquipos.getString("nombre") + "</option>");
	                }
	                
	                out.print("</select>");

                %>
		<input type="date" name="fecha" placeholder="fecha" style=" border: solid 6px white; border-radius: 0.5vw; margin-right: 1vw;">
                <input type="time" name="hora" placeholder="hora" style=" border: solid 6px white; border-radius: 0.5vw; margin-right: 1vw;">
                <input type="text" name="resultado" placeholder="resultado" style=" border: solid 6px white; border-radius: 0.5vw;">
                <a href='add.jsp?id=" + listadoJornadas.getString("numero_jornada") + "'><input class='btn btn-primary btn-sm' type='submit' value='Añadir' style='margin-left: 1vw;'/></a>
                </form>
            </div>
        <%
            //Conexion con la base de datos

            Statement s1 = conexion.createStatement();
            listadoEquipos = s.executeQuery("SELECT id, nombre FROM equipo");
            ResultSet listadoJornadas = s1.executeQuery("SELECT * FROM jornada ORDER BY 1");
            HashMap<String, String> equipos = new HashMap<String, String>();
            
            while (listadoEquipos.next()) {
                
                equipos.put(listadoEquipos.getString("id"), listadoEquipos.getString("nombre"));
            }

        %>
        
            <table class="table table-striped">
                <tr>
                    <th>NUMERO DE JORNADA</th>
                    <th>EQUIPO_LOCAL</th>
                    <th>EQUIPO_VISITANTE</th>
                    <th>FECHA</th>
                    <th>HORA</th>
                    <th>RESULTADO</th>
                </tr>
                <%
	                while (listadoJornadas.next()) { // Generación de tabla con datos de la BBDD
	
	                    out.print("<tr>\n");
	                    out.println("<td>" + listadoJornadas.getString("numero_jornada") + "</td>");
	                    out.println("<td>" + equipos.get(listadoJornadas.getString("equipo_local")) + "</td>");
	                    out.println("<td>" + equipos.get(listadoJornadas.getString("equipo_visitante")) + "</td>");
	                    out.println("<td>" + listadoJornadas.getString("fecha") + "</td>");
	                    out.println("<td>" + listadoJornadas.getString("hora") + "</td>");
	                    out.println("<td>" + listadoJornadas.getString("resultado") + "</td>");
	                    out.print("<td><a href='modify2.jsp?id=" + listadoJornadas.getString("numero_jornada") + "'><input class='btn btn-info btn-sm' type='submit' value='Modificar'/></td>");
	                    out.println("<td><a href='delete.jsp?id=" + listadoJornadas.getString("numero_jornada") + "'><input class='btn btn-danger btn-sm' type='submit' value='Borrar'/></a></td>");
	                    out.print("</tr>\n");
	                }
	                conexion.close();
                %>
                
                
            </table>
        </div>
    </body>
</html>
