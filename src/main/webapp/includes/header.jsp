<%@ page import="models.User" %>
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
        <%
            User user = (User) session.getAttribute("user");
            if (user != null) {
        %>
        <a href="logout" class="inline-flex items-center text-gray-200 border-0 py-1 px-3 focus:outline-none hover:bg-[#1E3E62] rounded text-base mt-4 md:mt-0">Logout
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
                <path d="M5 12h14M12 5l7 7-7 7"></path>
            </svg>
        </a>
        <%
        } else {
        %>
        <a href="LoginServlet" class="inline-flex items-center text-gray-200 border-0 py-1 px-3 focus:outline-none hover:bg-[#1E3E62] rounded text-base mt-4 md:mt-0">Login
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
                <path d="M5 12h14M12 5l7 7-7 7"></path>
            </svg>
        </a>
        <%
            }
        %>
    </div>
</header>
