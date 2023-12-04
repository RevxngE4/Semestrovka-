<%@ page import="model.User" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %><%--
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
        response.sendRedirect("index.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list!= null) {
        request.setAttribute("cart_list", cart_list);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Shopping cart Login</title>
    <%@include file="includes/head.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
    <div class="card w-50 mx-auto my-5">
        <div class="card=header text-center">User login</div>
        <div class="card-body">
            <form action="user-login" method="post">
                <div class="form-group">
                <label>Email Address</label>
                    <input type="email" class="form-control" name="login-email" placeholder="Enter Your email" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="Password" class="form-control" name="login-password" placeholder="*******" required>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>
            <p>Don't have an account?<a href="signup.jsp"> Signup</a> </p>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>
</body>
</html>