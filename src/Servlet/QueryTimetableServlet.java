package Servlet;

import Service.LoginService;
import Service.QueryTimetableService;
import entity.MessageModel;
import entity.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/QueryTimetable")
public class QueryTimetableServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("timetable");
        User u = (User) req.getSession().getAttribute("user");

        String ID = u.getID();
        String semester = req.getParameter("semester");
        String year = req.getParameter("year");


        MessageModel messageModel = QueryTimetableService.QTT(ID, semester, year);

        req.getSession().setAttribute("timetable", messageModel.getObject());
        resp.sendRedirect("main2.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("timetable");
        User u = (User) req.getSession().getAttribute("user");
        String time = req.getParameter("semester");
        String[] timeArray = time.split("-");
        String ID = u.getID();
        String semester = timeArray[1];
        String year = timeArray[0];
//        String semester = req.getParameter("semester");
//        String year = req.getParameter("year");

        //resp.sendRedirect("main2.jsp");

        MessageModel messageModel = QueryTimetableService.QTT(ID, semester, year);

        req.getSession().setAttribute("timetable", messageModel.getObject());
        resp.sendRedirect("main2.jsp");
    }
}
