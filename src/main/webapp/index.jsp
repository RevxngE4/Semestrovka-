<%@ page import="connection.DbCon" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="model.User" %>
<%@ page import="dao.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  model.User: Camilo
  Date: 28/11/2023
  Time: 11:38 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }

    ProductDao pd = new ProductDao(DbCon.getConnection());
    List<Product> products = pd.getAllProducts();

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list!= null) {
        request.setAttribute("cart_list", cart_list);
    }

%>

<!DOCTYPE html>
<html>
<head>
    <title>welcome to Shopping!</title>
    <%@include file="includes/head.jsp"%>
</head>
<body>
    <%@include file="includes/navbar.jsp"%>

    <div class="container">
        <div class="card-header my-3">All Products</div>
        <div class="row">
            <%
                if (!products.isEmpty()) {
                    for (Product p : products) {%>
                    <div class="col-md-3">
                    <div class="card w-100" style="width: 18rem;">
                        <img class="card-img-top" src="product-images/<%=p.getImage() %>" alt="Card image cap">
                     <div class="card-body">
                    <h5 class="card-title"><%=p.getName() %></h5>
                    <h6 class="price">Price: $<%= p.getPrice() %></h6>
                    <h6 class="category">Category: <%= p.getCategory() %></h6>
                    <div class="mt-3 d-flex justify-content-between">
                        <a href="add-to-cart?id=<%= p.getId()%>" class="btn btn-primary">Add to Cart</a>
                        <a href="order-now?quantity=1&id=<%= p.getId()%>" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
            </div>
            <% }
                }
            %>
        </div>
    </div>

<%@include file="includes/footer.jsp"%>
</body>
</html>
