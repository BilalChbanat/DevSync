<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Tag" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>DevSync - Tag List</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" href="https://imgs.search.brave.com/BPxP56KKsMZnM4ZSZCqvQKQZlWvNGifYz2L_6En8Mzs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMtMDAuaWNvbmR1/Y2suY29tL2Fzc2V0/cy4wMC9kb2xwaGlu/LWVtdS1pY29uLTI1/NngyNTMtbW8wdWFw/eXQucG5n">
</head>
<body class="bg-gray-100">

<%@include file="../includes/header.jsp" %>
<main class="flex flex-col mt-[5rem] bg-gray-100">
    <div class="-m-1.5 overflow-x-auto">
        <div class="p-1.5 min-w-full inline-block align-middle">
            <div class="overflow-hidden flex flex-col justify-center items-center">
                <a href="${pageContext.request.contextPath}/tags?action=create" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-700 rounded">Add new Tag</a>
                <table class="bg-gray-800 border rounded-xl shadow-lg shadow-black-500/50 w-[50rem] text-grey-200 divide-y divide-gray-200">
                    <thead class="text-grey-200 bg-gray-800 rounded-xl">
                    <tr class="rounded-xl">
                        <th scope="col" class="py-3 ps-4 rounded-xl">
                            <div class="flex items-center h-5">
                                <input id="hs-table-checkbox-all" type="checkbox" class="border-gray-200 rounded focus:ring-blue-500">
                                <label for="hs-table-checkbox-all" class="sr-only">Checkbox</label>
                            </div>
                        </th>
                        <th scope="col" class="px-6 py-3 text-start text-xs font-medium text-gray-500 uppercase">Id</th>
                        <th scope="col" class="px-6 py-3 text-start text-xs font-medium text-gray-500 uppercase">Name</th>
                        <th scope="col" class="px-6 py-3 text-end text-xs font-medium text-gray-500 uppercase"></th>
                        <th scope="col" class="px-6 py-3 text-end text-xs font-medium text-gray-500 uppercase rounded-xl"></th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                    <%
                        try {
                            List<Tag> tags = (List<Tag>) request.getAttribute("tags");
                            if (tags != null && !tags.isEmpty()) {
                                for (Tag tag : tags) {
                    %>
                    <tr>
                        <td class="py-3 ps-4">
                            <div class="flex items-center h-5">
                                <input id="hs-table-checkbox-<%= tag.getId() %>" type="checkbox" class="border-gray-200 rounded text-blue-600 focus:ring-blue-500">
                                <label for="hs-table-checkbox-<%= tag.getId() %>" class="sr-only">Checkbox</label>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-200"><%= tag.getId() %></td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-200"><%= tag.getName() %></td>
                        <td class="px-6 py-4 whitespace-nowrap text-end text-sm font-medium">
                            <form action="${pageContext.request.contextPath}/tags" method="GET">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="id" value="<%= tag.getId() %>">
                                <input type="submit" value="Edit" class="inline-flex items-center cursor-pointer gap-x-2 text-sm font-semibold rounded-lg border border-transparent text-blue-600 hover:text-blue-800 focus:outline-none focus:text-blue-800 disabled:opacity-50 disabled:pointer-events-none">
                            </form>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-end text-sm font-medium">
                            <form action="${pageContext.request.contextPath}/tags" method="POST">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%= tag.getId() %>">
                                <input type="submit" value="Delete" class="inline-flex cursor-pointer items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent text-blue-600 hover:text-blue-800 focus:outline-none focus:text-blue-800 disabled:opacity-50 disabled:pointer-events-none" onclick="return confirm('Are you sure you want to delete this tag?');">
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5">No tags found.</td>
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
</main>
</body>
</html>
