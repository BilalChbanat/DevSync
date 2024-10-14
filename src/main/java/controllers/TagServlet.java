package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Tag;
import repositories.tag.TagRepository;
import repositories.tag.TagRepositoryImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/tags")
public class TagServlet extends HttpServlet {

    private TagRepository tagRepository;

    @Override
    public void init() throws ServletException {
        super.init();
        tagRepository = new TagRepositoryImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("edit".equals(action)) {
            Long id = Long.valueOf(req.getParameter("id"));
            Tag tag = tagRepository.findById(id);
            req.setAttribute("tag", tag);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/tag/edit.jsp");
            dispatcher.forward(req, resp);
        } else if ("create".equals(action)) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/tag/create.jsp"); // Forward to the tag creation form
            dispatcher.forward(req, resp);
        } else {
            List<Tag> tags = tagRepository.findAll();
            req.setAttribute("tags", tags);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/tag/index.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("update".equals(action)) {
            Long id = Long.valueOf(req.getParameter("id"));
            String name = req.getParameter("name");

            Tag tag = new Tag(id, name);
            tagRepository.update(tag);
            resp.sendRedirect(req.getContextPath() + "/tags");
        } else if ("delete".equals(action)) {
            Long id = Long.valueOf(req.getParameter("id"));
            tagRepository.delete(id);
            resp.sendRedirect(req.getContextPath() + "/tags");
        } else {
            String name = req.getParameter("name");
            Tag tag = new Tag(name);
            tagRepository.create(tag);
            resp.sendRedirect(req.getContextPath() + "/tags");
        }
    }
}
