<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>DevSync</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" href="https://imgs.search.brave.com/BPxP56KKsMZnM4ZSZCqvQKQZlWvNGifYz2L_6En8Mzs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMtMDAuaWNvbmR1/Y2suY29tL2Fzc2V0/cy4wMC9kb2xwaGlu/LWVtdS1pY29uLTI1/NngyNTMtbW8wdWFw/eXQucG5n">

</head>
<body class="bg-gray-100">
<header class="text-gray-200 body-font bg-gray-800 shadow-lg">
    <div class=" text-gray-200 bg-gray-800 container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
        <a class="flex title-font font-medium items-center text-gray-200 mb-4 md:mb-0 cursor-pointer">
            <img class="w-[2.7rem]" src="https://imgs.search.brave.com/BPxP56KKsMZnM4ZSZCqvQKQZlWvNGifYz2L_6En8Mzs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMtMDAuaWNvbmR1/Y2suY29tL2Fzc2V0/cy4wMC9kb2xwaGlu/LWVtdS1pY29uLTI1/NngyNTMtbW8wdWFw/eXQucG5n" alt="DevSync">
            <span class="ml-3 text-xl">DevSync</span>
        </a>
        <nav  class=" text-gray-200 bg-gray-800 md:ml-auto md:mr-auto flex flex-wrap items-center text-base justify-center">
            <a href="UserServlet" class="mr-5 hover:text-gray-200">User List</a>
            <a href="user/index.jsp" class="mr-5 hover:text-gray-200">New User</a>

        </nav>
        <button class="inline-flex items-center text-gray-200 border-0 py-1 px-3 focus:outline-none hover:bg-[#1E3E62] rounded text-base mt-4 md:mt-0">Login
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
                <path d="M5 12h14M12 5l7 7-7 7"></path>
            </svg>
        </button>
    </div>
</header>

<div class="flex flex-col mt-[5rem] bg-gray-100 ">
    <div class="-m-1.5 overflow-x-auto">
        <div class="p-1.5 min-w-full inline-block align-middle">
            <div class="overflow-hidden flex flex-col justify-center items-center ">
                <table class="bg-gray-800 border rounded-xl shadow-lg shadow-black-500/50 w-[50rem] text-grey-200 divide-y divide-gray-200">
                    <thead class="text-grey-200 bg-gray-800 rounded-xl">
                    <tr class="rounded-xl">
                        <th scope="col" class="py-3 ps-4 rounded-xl">
                            <div class="flex items-center h-5">
                                <input id="hs-table-checkbox-all" type="checkbox" class="border-gray-200 rounded  focus:ring-blue-500">
                                <label for="hs-table-checkbox-all" class="sr-only">Checkbox</label>
                            </div>
                        </th>
                        <th scope="col" class="px-6 py-3 text-start text-xs font-medium text-gray-500 uppercase">Id</th>
                        <th scope="col" class="px-6 py-3 text-start text-xs font-medium text-gray-500 uppercase">Name</th>
                        <th scope="col" class="px-6 py-3 text-start text-xs font-medium text-gray-500 uppercase">Address</th>
                        <th scope="col" class="px-6 py-3 text-end text-xs font-medium text-gray-500 uppercase">Manager</th>
                        <th scope="col" class="px-6 py-3 text-end text-xs font-medium text-gray-500 uppercase"></th>
                        <th scope="col" class="px-6 py-3 text-end text-xs font-medium text-gray-500 uppercase rounded-xl"></th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                    <%
                        try {
                            List<User> users = (List<User>) request.getAttribute("users");

                            if (users != null && !users.isEmpty()) {
                                for (User user : users) {
                    %>
                    <tr>
                        <td class="py-3 ps-4">
                            <div class="flex items-center h-5">
                                <input id="hs-table-checkbox-1" type="checkbox" class="border-gray-200 rounded text-blue-600 focus:ring-blue-500">
                                <label for="hs-table-checkbox-1" class="sr-only">Checkbox</label>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-200"><%= user.getId() %></td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-200"><%= user.getName() %></td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-200"><%= user.getAddress() %></td>
                        <td class="ml-[1rem] px-6 py-4 whitespace-nowrap text-sm text-gray-200"><%= user.getManager() ? "Yes" : "No" %></td>
                        <td class="px-6 py-4 whitespace-nowrap text-end text-sm font-medium">
                            <form action="UserController" method="GET">
                                <input type="hidden" name="action" value="edit" class="cursor-pointer">
                                <input type="hidden" name="id" value="<%= user.getId() %>">

                                <input type="submit" value="Edit" class="inline-flex items-center cursor-pointer gap-x-2 text-sm font-semibold rounded-lg border border-transparent text-blue-600 hover:text-blue-800 focus:outline-none focus:text-blue-800 disabled:opacity-50 disabled:pointer-events-none">
                            </form>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-end text-sm font-medium">
                            <form action="UserController" method="POST">
                                <input type="hidden" name="action" value="delete" class="cursor-pointer">
                                <input type="hidden" name="id" value="<%= user.getId() %>">

                                <input type="submit" value="Delete" class="inline-flex cursor-pointer items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent text-blue-600 hover:text-blue-800 focus:outline-none focus:text-blue-800 disabled:opacity-50 disabled:pointer-events-none" onclick="return confirm('Are you sure you want to delete this user?');">
                            </form>

                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7">No users found.</td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            System.out.println("Error: " + e.getMessage());
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>

