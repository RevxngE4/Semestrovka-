package servlet;

import connection.DbCon;
import dao.UserDao;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       response.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("login-email");
            String password = request.getParameter("login-password");

            try {
                UserDao uDao = new UserDao(DbCon.getConnection());
                User user = uDao.userLogin(email, password);
               if (user!= null) {
                   request.getSession().setAttribute("auth", user);
                   request.getSession().setAttribute("userRole", user.getRole());
                   if ("admin".equals(user.getRole())) {
                       response.sendRedirect("adminadd.jsp");
                       return;
                   }
                   response.sendRedirect("index.jsp");
               }else {
                   out.print("user not found");
               }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
