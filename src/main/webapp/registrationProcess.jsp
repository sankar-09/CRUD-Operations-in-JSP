<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Process</title>
</head>
<body>
<%
    String firstName = request.getParameter("fname");
    String lastName = request.getParameter("lname");
    String email = request.getParameter("email");
    String userid = request.getParameter("uid");
    String password = request.getParameter("pwd");
    
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
        // Set up the database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/login", "root", "SSR2002#cc99");
        
        // Prepare the SQL statement for insertion
        String sql = "INSERT INTO users (fname, lname, email, uid, pwd) VALUES (?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, firstName);
        stmt.setString(2, lastName);
        stmt.setString(3, email);
        stmt.setString(4, userid);
        stmt.setString(5, password);
        
        // Execute the SQL statement
        stmt.executeUpdate();
        
        // Display a success message
        out.println("<h1>Registration Successful, Click login to continue...<a href=index.html>Login Here</a></h1>");
        
    } catch (Exception e) {
        // Display an error message
        out.println("<h1>Error Occurred</h1>");
        out.println("<p>" + e.getMessage() + "</p>");
    } finally {
        // Close the database connection and statement
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>
</body>
</html>
