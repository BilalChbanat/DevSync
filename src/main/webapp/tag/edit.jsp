<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Tag" %>

<html>
<head>
    <title>Edit Tag</title>
    <title>DevSync</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" href="https://imgs.search.brave.com/BPxP56KKsMZnM4ZSZCqvQKQZlWvNGifYz2L_6En8Mzs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMtMDAuaWNvbmR1/Y2suY29tL2Fzc2V0/cy4wMC9kb2xwaGlu/LWVtdS1pY29uLTI1/NngyNTMtbW8wdWFw/eXQucG5n">

</head>

<body class="bg-gray-200">
<%@include file="../includes/header.jsp"   %>
<div class="flex justify-center items-center min-h-screen bg-gray-100 antialiased">
    <div class="container sm:mt-40 my-auto max-w-md border-2 border-gray-200 rounded-[20px] p-3 bg-gray-800">
        <%
            Tag tag = (Tag) request.getAttribute("tag");
        %>
        <div class="text-center m-6">
            <h1 class="text-3xl font-semibold text-gray-100">UPDATE TAG</h1>
            <p class="text-gray-200">this form below can help you to Update Tag by filling the necessary fields </p>
        </div>

        <div class="m-6">
            <form action="tags" method="post" class="mb-4">
                <input type="hidden" name="action" value="update"/>
                <input type="hidden" name="id" value="${tag.id}"/>

                <div class="mb-6">
                    <label for="name" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">Tag name</label>
                    <input type="text" name="name" id="name" value="${tag.name}"  placeholder="Type your name" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500" required>
                </div>
                <a href="tags" type="submit" class="mb-6 cursor-pointer w-full px-3 py-4 text-white bg-red-500 rounded-md hover:bg-red-600 focus:outline-none duration-100 ease-in-out"> Cancel </a>

            </form>

        </div>
    </div>
</div>


</body>
</html>

