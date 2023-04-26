<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%
    String id = request.getParameter("id");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "login";
    String userid = "root";
    String password = "SSR2002#cc99";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    try {
        Class.forName(driver);
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();
        String sql = "select * from users where id='" + id + "'";
        resultSet = statement.executeQuery(sql);
        if (resultSet.next()) {
%>
<html>
<body>
<head>
<link rel="stylesheet" type="text/css" href="demo.css">
</head>
<h1>Update values</h1>

<form method="post" action="update-p.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>"/>

<label for="fname">First Name:</label>
<input type="text" name="fname" value="<%=resultSet.getString("fname") %>"/><br>

<label for="lname">Last Name:</label>
<input type="text" name="lname" value="<%=resultSet.getString("lname") %>"/><br>

<label for="email">Email:</label>
<input type="text" name="email" value="<%=resultSet.getString("email") %>"/><br>

<label for="uid">Username:</label>
<input type="text" name="uid" value="<%=resultSet.getString("uid") %>"/><br>

<label for="pwd">Password:</label>
<input type="password" name="pwd" value="<%=resultSet.getString("pwd") %>"/><br>

<input type="submit" value="Update"/>

</form>
</body>
</html>
<%
        }
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
