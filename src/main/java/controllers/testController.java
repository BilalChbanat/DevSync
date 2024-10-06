package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;
import repositories.repo;
import repositories.repoimpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/testController")
public class testController extends HttpServlet {

    private repo userRepository;

    @Override
    public void init() throws ServletException {
        super.init();
        userRepository = new repoimpl(); // Initialize your repo implementation
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> users = userRepository.getAll();

        request.setAttribute("users", users);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}
