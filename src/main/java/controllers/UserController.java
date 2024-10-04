package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;
import repositories.UserRepository;
import repositories.UserRepositoryImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/UserController")
public class UserController extends HttpServlet {

    private UserRepository userRepository;

    @Override
    public void init() throws ServletException {
        super.init();
        userRepository = new UserRepositoryImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            Long id = Long.valueOf(request.getParameter("id"));
            User user = userRepository.findById(id);
            request.setAttribute("user", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/edit.jsp");
            dispatcher.forward(request, response);
        } else {
            List<User> users = userRepository.findAll();
            request.setAttribute("users", users);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/create.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            Long id = Long.valueOf(request.getParameter("id"));
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            boolean manager = request.getParameter("manager") != null;

            User user = new User(id, name, address, phone, manager);
            userRepository.update(user);

            response.sendRedirect("UserController");
        } else {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            boolean manager = request.getParameter("manager") != null;

            User user = new User(name, address, phone, manager);
            userRepository.create(user);

            response.sendRedirect("UserController");
        }
    }
}
