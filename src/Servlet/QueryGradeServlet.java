package Servlet;


import Service.QueryGradeService;

import entity.MessageModel;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/QueryGrade")
public class QueryGradeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("grade");
        User u = (User) req.getSession().getAttribute("user");
        String ID = u.getID();

        String semester = req.getParameter("semester");
        String year = req.getParameter("year");

        MessageModel messageModel = QueryGradeService.QG(ID, semester, year);

        req.getSession().setAttribute("grade", messageModel.getObject());
        resp.sendRedirect("main5.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("grade");
        User u = (User) req.getSession().getAttribute("user");
        String time = req.getParameter("grade");
        String[] timeArray = time.split("-");
        String ID = u.getID();
        String year = timeArray[0];
        String semester = timeArray[1];

        MessageModel messageModel = QueryGradeService.QG(ID, semester, year);

        req.getSession().setAttribute("grade", messageModel.getObject());
        resp.sendRedirect("main5.jsp");
    }
}
