<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>

<html>
<head>
    <title>Create User</title>
    <title>DevSync</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" href="https://imgs.search.brave.com/BPxP56KKsMZnM4ZSZCqvQKQZlWvNGifYz2L_6En8Mzs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMtMDAuaWNvbmR1/Y2suY29tL2Fzc2V0/cy4wMC9kb2xwaGlu/LWVtdS1pY29uLTI1/NngyNTMtbW8wdWFw/eXQucG5n">

</head>

<body class="bg-gray-200">
<header class="text-gray-200 body-font bg-gray-800 shadow-lg">
    <div class=" text-gray-200 bg-gray-800 container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
        <a class="flex title-font font-medium items-center text-gray-200 mb-4 md:mb-0 cursor-pointer">
            <img class="w-[2.7rem]" src="https://imgs.search.brave.com/BPxP56KKsMZnM4ZSZCqvQKQZlWvNGifYz2L_6En8Mzs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMtMDAuaWNvbmR1/Y2suY29tL2Fzc2V0/cy4wMC9kb2xwaGlu/LWVtdS1pY29uLTI1/NngyNTMtbW8wdWFw/eXQucG5n" alt="DevSync">
            <span class="ml-3 text-xl">DevSync</span>
        </a>
        <nav  class=" text-gray-200 bg-gray-800 md:ml-auto md:mr-auto flex flex-wrap items-center text-base justify-center">
            <a href="UserServelt" class="mr-5 hover:text-gray-200">User List</a>
            <a href="user/index.jsp" class="mr-5 hover:text-gray-200">New User</a>

        </nav>
        <button class="inline-flex items-center text-gray-200 border-0 py-1 px-3 focus:outline-none hover:bg-[#1E3E62] rounded text-base mt-4 md:mt-0">Login
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
                <path d="M5 12h14M12 5l7 7-7 7"></path>
            </svg>
        </button>
    </div>
</header>

<div class="flex justify-center items-center min-h-screen bg-gray-100 antialiased">
    <div class="container sm:mt-40 my-auto max-w-md border-2 border-gray-200 rounded-[20px] p-3 bg-gray-800">
        <%
            User user = (User) request.getAttribute("user");
        %>
        <div class="text-center m-6">
            <h1 class="text-3xl font-semibold text-gray-100">You want to Update new user?</h1>
            <p class="text-gray-200">this form below can help you to Update new user by filling the necessary fields </p>
        </div>

        <div class="m-6">
            <form action="UserServlet" method="post" class="mb-4">
                <input type="hidden" name="action" value="update"/>
                <input type="hidden" name="id" value="${user.id}"/>

                <div class="mb-6">
                    <label for="name" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">User name</label>
                    <input type="text" name="name" id="name" value="${user.name}"  placeholder="Type your name" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500" required>
                </div>
                <div class="mb-6">
                    <label for="address" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">type your  Address</label>
                    <input type="text" name="address" id="address" value="${user.address}" placeholder="type your adress" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500" required>
                </div>
                <div class="mb-6">
                    <label for="phone" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">type your phone</label>
                    <input type="text" name="phone" id="phone" value="${user.phone}" placeholder="type your phone" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500" required>
                </div>
                <div class="mb-6">
                    <label for="manager" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">Are you a manager ?</label>
                    <input type="checkbox" name="manager" ${user.manager ? 'checked' : ''} id="manager" class="py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring ml-[0.5rem] focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500 justify-left">

                </div>
                <div class="mb-6">
                    <input type="submit" value="SUBMIT" class="cursor-pointer w-full px-3 py-4 text-white bg-teal-500 rounded-md hover:bg-teal-600 focus:outline-none duration-100 ease-in-out">
                </div>
                <a href="UserServlet" type="button" class="mb-6 cursor-pointer w-full px-3 py-4 text-white bg-red-500 rounded-md hover:bg-red-600 focus:outline-none duration-100 ease-in-out"> Cancel </a>

            </form>

        </div>
    </div>
</div>


</body>
</html>

