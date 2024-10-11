<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DevSync - Add New Tag</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" href="https://imgs.search.brave.com/BPxP56KKsMZnM4ZSZCqvQKQZlWvNGifYz2L_6En8Mzs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMtMDAuaWNvbmR1/Y2suY29tL2Fzc2V0/cy4wMC9kb2xwaGlu/LWVtdS1pY29uLTI1/NngyNTMtbW8wdWFw/eXQucG5n">
</head>
<body class="bg-gray-200">
<%@ include file="../includes/header.jsp" %>
<div class="flex justify-center items-center min-h-screen bg-gray-100 antialiased">
    <div class="container sm:mt-40 my-auto max-w-md border-2 border-gray-200 rounded-[20px] p-3 bg-gray-800">
        <div class="text-center m-6">
            <div class="flex justify-between items-center">

                <h1 class="text-3xl font-semibold ">Add a Tag </h1>
                <a class="text-white flex items-center text-blue-700 underline" href="${pageContext.request.contextPath}/tags"> <span class="px-2">Tag List</span>
                    <svg  fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
                    <path d="M5 12h14M12 5l7 7-7 7"></path>
                </svg></a>

            </div>

            <p class="text-gray-200">This form below can help you to add a new Tag by filling in the necessary fields.</p>
        </div>

        <div class="m-6">
            <form action="TagServlet" method="post" class="mb-4">

                <div class="mb-6">
                    <label for="name" class="block mb-2 text-sm text-gray-100 dark:text-gray-400">Tag Name</label>
                    <input type="text" name="name" id="name" placeholder="Type your name" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-indigo-100 focus:border-indigo-300 dark:bg-gray-700 dark:text-white dark:placeholder-gray-500 dark:border-gray-600 dark:focus:ring-gray-900 dark:focus:border-gray-500" required>
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
