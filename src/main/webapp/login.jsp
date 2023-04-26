
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String uid = request.getParameter("uid");
String pwd = request.getParameter("pwd");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "SSR2002#cc99");

// Use a prepared statement with parameterized query to prevent SQL injection
PreparedStatement stmt = con.prepareStatement("select * from users where uid=? and pwd=?");
stmt.setString(1, uid);
stmt.setString(2, pwd);
ResultSet rs = stmt.executeQuery();

if (rs.next()) {
    // User is authenticated
    String welcomeMsg = "Welcome " + rs.getString("fname");
    out.println("<h1>" + welcomeMsg + "</h1>");
    out.println("<h1>Login Successful, Click to know values...<a href=retrieve.jsp>Display the values</a></h1>");
} else {
    // User is not authenticated
    out.println("<h1>Invalid password or username.</h1>");
}

stmt.close();
con.close();
%>

</body>
</html>