<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Display Database Table</title>
</head>
<body>

<h2>Data from Database</h2>

<table border="1" >
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
        </tr>
    </thead>
    <tbody>

<%
    // Database connection details
    String url = "jdbc:mysql://localhost:3306/employee_management";
    String username = "root";
    String password = "amaresh";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the connection
        conn = DriverManager.getConnection(url, username, password);
        out.println("Database connected successfully!<br>");

        // Create a statement
        stmt = conn.createStatement();

        // Execute the query
        String query = "SELECT id, name, email FROM Employee";
        out.println("Executing query: " + query + "<br>");

        rs = stmt.executeQuery(query);

        // Check if ResultSet has data
        if (!rs.isBeforeFirst()) {
            out.println("No data found!<br>");
        } else {
            // Iterate through the result set
            while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
        </tr>
<%
            }
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage() + "<br>");
        e.printStackTrace();
    } finally {
        // Close the resources
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

    </tbody>
</table>

</body>
</html>
