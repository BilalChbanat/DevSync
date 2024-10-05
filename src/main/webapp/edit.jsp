<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<h1>Edit User</h1>

<%
    User user = (User) request.getAttribute("user");
%>

<form action="UserController" method="post">
    <input type="hidden" name="id" value="${user.id}"/>
    <label>Name:</label>
    <input type="text" name="name" value="${user.name}" required/><br/>

    <label>Address:</label>
    <input type="text" name="address" value="${user.address}" required/><br/>

    <label>Phone:</label>
    <input type="text" name="phone" value="${user.phone}" required/><br/>

    <label>Is Manager:</label>
    <input type="checkbox" name="manager" <%= user.getManager() ? "checked" : "" %>/><br/>

    <input type="hidden" name="action" value="update"/>
    <input type="submit" value="Update User"/>
</form>

<a href="UserController">Cancel</a>
</body>
</html>
