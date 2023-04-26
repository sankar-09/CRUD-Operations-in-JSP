
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Values</title>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String uid = request.getParameter("uid");
String pwd = request.getParameter("pwd");

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "login";
String userid = "root";
String password = "SSR2002#cc99";

Connection connection = null;
Statement statement = null;
int rowsUpdated = 0;

try {
    Class.forName(driver);
    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
    statement = connection.createStatement();
    String sql = "UPDATE users SET fname='" + fname + "', lname='" + lname + "', email='" + email + "', uid='" + uid + "', pwd='" + pwd + "' WHERE id=" + id;
    rowsUpdated = statement.executeUpdate(sql);
} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (statement != null) {
        statement.close();
    }
    if (connection != null) {
        connection.close();
    }
}

if (rowsUpdated > 0) {
%>
    <h1>User data updated successfully!</h1>
    <a href="retrieve.jsp">Back to your details</a>
<%
} else {
%>
    <h1>Error updating user data!</h1>
<%
}
%>

</body>
</html>