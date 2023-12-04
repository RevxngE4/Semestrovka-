package servlet;

import connection.DbCon;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/agregarproductosServlet")
@MultipartConfig
public class AgregarProductoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("adminadd.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));

        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();

        String imagePath = "C:\\Users\\Camilo\\Desktop\\Uni\\Programacion\\sems1\\src\\main\\webapp\\product-images" + "\\" + fileName;
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, Paths.get(imagePath), StandardCopyOption.REPLACE_EXISTING);

            Product product = new Product(name, category, price, fileName);

            try (Connection con = DbCon.getConnection()) {
                String sql = "INSERT INTO products (name, category, price, image) VALUES (?,?,?,?)";
                try (PreparedStatement pstmt = con.prepareStatement(sql)) {
                    pstmt.setString(1, product.getName());
                    pstmt.setString(2, product.getCategory());
                    pstmt.setDouble(3, product.getPrice());
                    pstmt.setString(4, product.getImage());
                    pstmt.executeUpdate();
                }
                response.sendRedirect("index.jsp");
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}