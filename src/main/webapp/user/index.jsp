<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DevSync - Add New User</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" href="https://imgs.search.brave.com/BPxP56KKsMZnM4ZSZCqvQKQZlWvNGifYz2L_6En8Mzs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMtMDAuaWNvbmR1/Y2suY29tL2Fzc2V0/cy4wMC9kb2xwaGlu/LWVtdS1pY29uLTI1/NngyNTMtbW8wdWFw/eXQucG5n">
</head>
<body class="bg-gray-200">
<%@ include file="../includes/header.jsp" %>
<div class="flex justify-center items-center min-h-screen bg-gray-100 antialiased">
    <div class="container sm:mt-40 my-auto max-w-md border-2 border-gray-200 rounded-[20px] p-3 bg-gray-800">
        <!-- header -->
        <div class="text-center m-6">
            <h1 class="text-3xl font-semibold text-gray-100">You want to Add a New User?</h1>
            <p class="text-gray-200">This form below can help you to add a new user by filling in the necessary fields.</p>
        </div>

        <div class="m-6">
            <form action="UserServlet" method="post" class="mb-4">
                <div class="mb-6">
                    <label for="name" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">User Name</label>
                    <input type="text" name="name" id="name" placeholder="Type your name" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500" required>
                </div>

                <div class="mb-6">
                    <label for="email" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">E-mail</label>
                    <input type="email" name="email" id="email" placeholder="Type your email" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500" required>
                </div>

                <div class="mb-6">
                    <label for="address" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">Home Address</label>
                    <input type="text" name="address" id="address" placeholder="Type your address" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500" required>
                </div>

                <div class="mb-6">
                    <label for="phone" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">Phone</label>
                    <input type="text" name="phone" id="phone" placeholder="Type your phone number" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500" required>
                </div>

                <div class="mb-6">
                    <label for="password" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">Password</label>
                    <input type="password" name="password" id="password" placeholder="Type your password" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500" required>
                </div>

                <div class="mb-6">
                    <label for="manager" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">Are you a Manager?</label>
                    <input type="checkbox" name="manager" id="manager" class="ml-2 focus:ring-indigo-500 rounded border-gray-300">
                </div>

                <div class="mb-6">
                    <input type="submit" value="SUBMIT" class="cursor-pointer w-full px-3 py-4 text-white bg-teal-500 rounded-md hover:bg-teal-600 focus:outline-none duration-100 ease-in-out">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
