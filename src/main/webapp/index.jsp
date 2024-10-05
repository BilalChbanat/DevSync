
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create User</title>
</head>
<body>
<h1>Create New User</h1>
<form action="UserController" method="post">

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br>

    <label for="address">Address:</label>
    <input type="text" id="address" name="address" required><br>

    <label for="phone">Phone:</label>
    <input type="text" id="phone" name="phone" required><br>

    <label for="manager">Is Manager:</label>
    <input type="checkbox" id="manager" name="manager"><br>

    <input type="submit" value="Create User">
</form>

<a href="UserController">Back to User List</a>
</body>
</html>
