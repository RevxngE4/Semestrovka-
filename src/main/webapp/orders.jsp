<%@ page import="connection.DbCon" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="model.User" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="dao.OrderDao" %>
<%@ page import="model.Order" %><%--
  Created by IntelliJ IDEA.
  model.User: Camilo
  Date: 28/11/2023
  Time: 11:38 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    if (auth != null) {
        request.setAttribute("auth", auth);
        orders = new OrderDao(DbCon.getConnection()).userOrders(auth.getId());
    }else {
        response.sendRedirect("login.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list!= null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<html>
<head>
    <title>Orders Page</title>
    <%@include file="includes/head.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container">
    <div class="card-header my-3">All Orders</div>
    <table class="table table-light">
        <thead>
        <tr>
            <th scope="col">Date</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Quantity</th>
            <th scope="col">Price</th>
            <th scope="col">Cancel</th>
        </tr>
        </thead>
        <tbody>

        <%
            if(orders != null){
                for(Order o:orders){%>
        <tr>
            <td><%=o.getDate() %></td>
            <td><%=o.getName() %></td>
            <td><%=o.getCategory() %></td>
            <td><%=o.getQuantity() %></td>
            <td><%=dcf.format(o.getPrice()) %></td>
            <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
        </tr>
        <%}
        }
        %>

        </tbody>
    </table>
</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>