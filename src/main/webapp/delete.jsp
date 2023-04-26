<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "login";
String userid = "root";
String password = "SSR2002#cc99";
try {
    Class.forName(driver);
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}
Connection connection = null;
PreparedStatement statement = null;
%>
<html>
<head>
    <title>Delete values</title>
</head>
<body>
    <h1>Delete values</h1>
    <% try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        String sql = "DELETE FROM users WHERE id=?";
        statement = connection.prepareStatement(sql);
        statement.setString(1, id);
        int rowsDeleted = statement.executeUpdate();
        if (rowsDeleted > 0) {
            out.print("Data deleted successfully.");
            
        } else {
            out.print("Failed to delete data.");
            
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %>
</body>
</html>
