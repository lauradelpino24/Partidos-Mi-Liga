<%-- 
    Document   : modify2
    Created on : 05-mar-2019, 15:52:14
    Author     : Laura
--%>

<%@page import="java.sql.ResultSet"%>
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
            </div>
        </nav>
        <div id="container1">
            <div class="panel panel-dark" style="background-color: white; text-align: center; margin-bottom: 0;">
                <h2 style="color: #a57bf2; margin-top: 1.5vw; margin-bottom: 1.5vw; ">Mis partidos</h2></div>
            <div class="panel panel-dark" style="background-color: #a57bf2; text-align: center; padding: 1vw; margin-top: 0;" >


                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mis_partidos", "root", "");
                    Statement s = conexion.createStatement();
                    Statement s1 = conexion.createStatement();

                    String numero_jornada = request.getParameter("id");
                    String fecha = "";
                    String hora = "";
                    String equipo_local = "";
                    String equipo_visitante = "";
                    String resultado = "";

                    ResultSet listadoAtributosJornada = s1.executeQuery("SELECT fecha, hora, equipo_local, equipo_visitante, resultado FROM jornada WHERE numero_jornada = " + numero_jornada);

                    while (listadoAtributosJornada.next()) {

                        fecha = listadoAtributosJornada.getString("fecha");
                        hora = listadoAtributosJornada.getString("hora");
                        equipo_local = listadoAtributosJornada.getString("equipo_local");
                        equipo_visitante = listadoAtributosJornada.getString("equipo_visitante");
                        resultado = listadoAtributosJornada.getString("resultado");

                        out.print("<form method=\"get\" action=\"modify.jsp\">");
                        out.print("<input name=\"numero_jornada\" type=\"number\" value=\" " + numero_jornada + "\" required=\"required\" style=\"border: solid 6px white; border-radius: 0.5vw; margin-right: 1vw;\">");
                        out.print("<select name=\"equipo_local\" required=\"required\" style=\"border: solid 6px white; border-radius: 0.5vw; margin-right: 1vw;\">");

                        ResultSet listadoEquipos = s.executeQuery("SELECT id, nombre FROM equipo");

                        while (listadoEquipos.next()) {

                            if (listadoEquipos.getString("id").equals(equipo_local)) {

                                out.print("<option value=\"" + listadoEquipos.getString("id") + "\" selected>" + listadoEquipos.getString("nombre") + "</option>");

                            } else {

                                out.print("<option value=\"" + listadoEquipos.getString("id") + "\">" + listadoEquipos.getString("nombre") + "</option>");
                            }
                        }

                        out.print("</select>");
                        out.print("<select name=\"equipo_visitante\" required=\"required\" style=\"border: solid 6px white; border-radius: 0.5vw; margin-right: 1vw;\">");

                        listadoEquipos = s.executeQuery("SELECT id, nombre FROM equipo");

                        while (listadoEquipos.next()) {

                            if (listadoEquipos.getString("id").equals(equipo_visitante)) {

                                out.print("<option value=\"" + listadoEquipos.getString("id") + "\" selected>" + listadoEquipos.getString("nombre") + "</option>");

                            } else {

                                out.print("<option value=\"" + listadoEquipos.getString("id") + "\">" + listadoEquipos.getString("nombre") + "</option>");
                            }
                        }

                        out.print("</select>");
                        out.print("<input name=\"fecha\" type=\"date\" value=\"" + fecha + "\" required=\"required\" style=\"border: solid 6px white; border-radius: 0.5vw; margin-right: 1vw;\">");
                        out.print("<input name=\"hora\" type=\"time\" value=\"" + hora + "\" required=\"required\" style=\"border: solid 6px white; border-radius: 0.5vw; margin-right: 1vw;\">");
                        out.print("<input name=\"resultado\" type=\"text\" value=\"" + resultado + "\" required=\"required\" style=\"border: solid 6px white; border-radius: 0.5vw; margin-right: 1vw;\">");
                        out.print("<input class=\"btn btn-info btn-sm\" type=\"submit\" value=\"Aceptar\">");
                        out.print("<a href=\"../\"><button class=\"btn btn-danger btn-sm\" type=\"button\" style=\"margin-left: 1vw;\">Cancelar</button></a>");
                        out.print("</form>");
                    }

                %>

                </form> 
            </div>
        </div>
    </body>
</html>
