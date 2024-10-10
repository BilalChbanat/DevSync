package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import repositories.user.UserRepository;
import repositories.user.UserRepositoryImpl;
import utils.SessionUtil;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserRepository userRepository;

    public LoginServlet() {
        super();
    }

    @Override
    public void init() throws ServletException {
        userRepository = new UserRepositoryImpl(); // Initialize the repository
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (SessionUtil.isUserLoggedIn(req, resp)) {
            resp.sendRedirect(req.getContextPath() + "/user");
            return;
        }
        req.getRequestDispatcher("/auth/login.jsp").forward(req, resp); // Ensure the path is correct
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("_method");
        if ("DESTROY".equals(method)) {
            req.getSession().invalidate();
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            User user = authenticate(email);
            if (user != null) {
                req.getSession().setAttribute("user", user);
                resp.sendRedirect("tasks");
            } else {
                req.setAttribute("error", "Invalid username or password");
                RequestDispatcher dispatcher = req.getRequestDispatcher("Login.jsp");
                dispatcher.forward(req, resp);
            }
        }
    }

    public User authenticate(String email) {
        // Check if user exists by email
        return userRepository.findByEmail(email);
    }
}
