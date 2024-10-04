<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>User List</title>
</head>
<body>
<h1>User List</h1>

<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Phone</th>
        <th>Is Manager</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <%
        try {
            List<User> users = (List<User>) request.getAttribute("users");

            if (users != null && !users.isEmpty()) {
                for (User user : users) {
    %>
    <tr>
        <td><%= user.getId() %></td>
        <td><%= user.getName() %></td>
        <td><%= user.getAddress() %></td>
        <td><%= user.getPhone() %></td>
        <td><%= user.getManager() ? "Yes" : "No" %></td>
        <td><a href="UserController?action=edit&id=<%= user.getId() %>">Edit</a></td>

    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="5">No users found.</td>
    </tr>
    <%
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    %>
    </tbody>
</table>

<a href="index.jsp">Create New User</a>
</body>
</html>

