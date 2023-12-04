package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/signup")
public class ServletRegistracion extends HttpServlet {
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "andrescamilo4";
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/ecommerce_cart";
    @Override
    public void init() throws ServletException {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery("select * from users");

            String role = "cliente";
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            String sqlInsertUser = "insert into users(name, email, password, role) values('" + name + "', '"  + email + "', '" + password +"', '" + role +"');";
            int affectedRows = statement.executeUpdate(sqlInsertUser);
            if (affectedRows > 0){
                response.sendRedirect("login.jsp");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);

        }
    }

}
