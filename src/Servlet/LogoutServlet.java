package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies=req.getCookies();

        for(Cookie cookie: cookies){

            cookie.setMaxAge(0);

            cookie.setPath(req.getContextPath());

            resp.addCookie(cookie);

        }
        req.getSession().invalidate();
        resp.sendRedirect(req.getContextPath());
    }
}
